/*
  score-grav.cc -- implement Score_engraver

  source file of the GNU LilyPond music typesetter

  (c)  1997--2000 Han-Wen Nienhuys <hanwen@cs.uu.nl>
*/
#include "debug.hh"
#include "dimension-cache.hh"
#include "line-of-score.hh"
#include "item.hh"
#include "score-engraver.hh"
#include "paper-score.hh"
#include "musical-request.hh"
#include "paper-column.hh"
#include "command-request.hh"
#include "paper-def.hh"

Score_engraver::Score_engraver()
{
  scoreline_l_ =0;
  command_column_l_ =0;
  musical_column_l_ =0;
  breaks_i_ =0;
  pscore_p_ = 0;
}
 
void
Score_engraver::prepare (Moment w)
{
  Global_translator::prepare (w);
  set_columns (new Paper_column (w),  new Paper_column (w));

  command_column_l_->set_elt_property ("breakable", SCM_BOOL_T);
  post_move_processing();
}

void
Score_engraver::finish()
{
  if ((breaks_i_%8))
    progress_indication ("[" + to_str ( breaks_i_) + "]");
   
  check_removal();
  removal_processing();
}

/*
  use start/finish?
 */
void
Score_engraver::do_creation_processing ()
{
  scoreline_l_ = pscore_p_->line_l_;

  scoreline_l_->set_bounds(LEFT, command_column_l_);
  
  command_column_l_->set_elt_property ("breakable", SCM_BOOL_T);

  Engraver_group_engraver::do_creation_processing();
}


void
Score_engraver::do_removal_processing()
{
  Engraver_group_engraver::do_removal_processing();
  scoreline_l_->set_bounds(RIGHT,command_column_l_);
  command_column_l_->set_elt_property ("breakable", SCM_BOOL_T);

  typeset_all ();
  set_columns (0,0);
}

void
Score_engraver::process()
{
  process_requests();
  do_announces();
  pre_move_processing();
  check_removal();
}

void
Score_engraver::announce_element (Score_element_info info)
{
  announce_info_arr_.push (info);
  info.origin_trans_l_arr_.push (this);
  pscore_p_->typeset_element (info.elem_l_);
}

/* All elements are propagated to the top upon announcement. If
   something was created during one run of
   Engraver_group_engraver::do_announces, then
   announce_info_arr_.size() will be nonzero again
*/
/* junkme? Done by Engraver_group_engraver::do_announces ()?
 */
   
void
Score_engraver::do_announces()
{
  while (announce_info_arr_.size()) 
    Engraver_group_engraver::do_announces();
}


void
Score_engraver::typeset_element (Score_element *elem_p)
{
  elem_p_arr_.push (elem_p);
}


void
Score_engraver::typeset_all()
{
  for  (int i =0; i < elem_p_arr_.size(); i++) 
    {
      Score_element * elem_p = elem_p_arr_[i];
      elem_p->add_processing ();

      
      if (Spanner *s = dynamic_cast <Spanner *> (elem_p))
	{
	    /*
	    do something sensible if spanner not 
	    spanned on 2 items.
	   */
	  Direction d = LEFT;
	  do {
	    if (!s->spanned_drul_[d])
	      {
		s->set_bounds(d, command_column_l_);
		::warning (_f ("unbound spanner `%s'", classname(s)));
	      }
	  } while (flip(&d) != LEFT);
	}
      else 
	{
	  Item *item_p = dynamic_cast <Item *> (elem_p);

	  if (!item_p->parent_l (X_AXIS))
	    {
	      bool br = to_boolean (item_p->remove_elt_property ("breakable"));
	      if (br)
		command_column_l_->add_element(item_p);
	      else
		musical_column_l_->add_element(item_p);
	    }
	}
      if (!elem_p->parent_l(Y_AXIS))
	scoreline_l_->add_element (elem_p);
    }
  elem_p_arr_.clear();
}

void
Score_engraver::do_pre_move_processing()
{
  if (to_boolean (command_column_l_->get_elt_property ("breakable")))
    {
      breaks_i_ ++;
      if (! (breaks_i_%8))
	progress_indication ("[" + to_str ( breaks_i_) + "]");
    }
  // this generates all items.
  Engraver_group_engraver::do_pre_move_processing();
  
  typeset_all();
}

void
Score_engraver::set_columns (Paper_column *new_command_l, 
			     Paper_column *new_musical_l)
{
  if (command_column_l_ && command_column_l_->linked_b()) 
    {
      pscore_p_->add_column (command_column_l_);
      scoreline_l_->add_column (command_column_l_);
    }
  else 
    command_column_l_ =0;

  if (new_command_l) 
    command_column_l_ = new_command_l;

  if (musical_column_l_ && musical_column_l_->linked_b()) 
    {
      pscore_p_->add_column (musical_column_l_);
      scoreline_l_->add_column (musical_column_l_);      
    }
  else 
    musical_column_l_ = 0;
  
  if (new_musical_l) 
    {
      musical_column_l_ = new_musical_l;
    }
}

Staff_info
Score_engraver::get_staff_info() const
{
  Staff_info inf = Engraver_group_engraver::get_staff_info();

  inf.command_l_ = command_column_l_;
  inf.musical_l_ = musical_column_l_;
  
  return inf;
}

Music_output*
Score_engraver::get_output_p ()
{
  Music_output * o = pscore_p_;
  pscore_p_=0;
  return o;
}

bool
Score_engraver::do_try_music (Music*r)
{
  bool gotcha = Engraver_group_engraver::do_try_music (r);  

  if (!gotcha)
    {
      if (Break_req* b = dynamic_cast<Break_req *> (r))
	{
	  gotcha = true;


	  SCM pen = command_column_l_->get_elt_property  ("penalty");
	  Real total_penalty = gh_number_p (pen)
	    ? gh_scm2double(pen)
	    : 0.0;

	  total_penalty += b->penalty_f_;
	  if (b->penalty_f_ > 10000.0) //  ugh. arbitrary.
	    forbid_breaks ();

	  command_column_l_->set_elt_property ("penalty",
					       gh_double2scm (total_penalty));
	}
    }
   return gotcha;
}

void
Score_engraver::forbid_breaks ()
{
  /*
    result is junked.
   */
  command_column_l_->remove_elt_property ("breakable");
}

ADD_THIS_TRANSLATOR(Score_engraver);

void
Score_engraver::do_add_processing ()
{
  Translator_group::do_add_processing ();
  assert (dynamic_cast<Paper_def *> (output_def_l_));
  assert (!daddy_trans_l_);
  pscore_p_ = new Paper_score;
  pscore_p_->paper_l_ = dynamic_cast<Paper_def*>(output_def_l_);
}

