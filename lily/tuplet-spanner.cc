/*
  plet-spanner.cc -- implement Tuplet_spanner

  source file of the GNU LilyPond music typesetter

  (c)  1997--2000 Jan Nieuwenhuizen <janneke@gnu.org>
*/

#include "beam.hh"
#include "box.hh"
#include "debug.hh"
#include "lookup.hh"
#include "molecule.hh"
#include "paper-column.hh"
#include "paper-def.hh"
#include "tuplet-spanner.hh"
#include "stem.hh"
#include "note-column.hh"
#include "dimensions.hh"
#include "group-interface.hh"
#include "directional-element-interface.hh"



Tuplet_spanner::Tuplet_spanner ()
{
  set_elt_property ("beams", SCM_EOL);
  set_elt_property ("columns", SCM_EOL);  
}

/*
  TODO. 
 */
Molecule*
Tuplet_spanner::do_brew_molecule_p () const
{
  Molecule* mol_p = new Molecule;

  // Default behaviour: number always, bracket when no beam!
  bool par_beam = to_boolean (get_elt_property ("parallel-beam"));
  bool bracket_visibility = !par_beam;
  bool number_visibility = true;
  SCM visibility_sym =get_elt_property ("tuplet-visibility");
  if (gh_number_p (visibility_sym))
    {
      /*
	ARG. Fixme.
       */
      
      /* Property values:
	 0       show nothing
	 1       show number
	 2       show (number and bracket)-if-no-beam
	 3       show number, and bracket-if-no-beam
	 4       show number, and bracket
      */
      int value = gh_scm2int ((visibility_sym));
      bracket_visibility = (value == 4 || (value > 1 && !par_beam));
      number_visibility = (value > 2 || value == 1 || 
			   (value == 2 && !par_beam));
    }
  
  if (gh_pair_p (get_elt_property ("columns")))
    {
      Link_array<Note_column> column_arr=
	Group_interface__extract_elements (this, (Note_column*)0, "columns");
	
      Real ncw = column_arr.top ()->extent(X_AXIS).length ();
      Real w = spanner_length () + ncw;


      Real staff_space = paper_l ()->get_var ("interline");
      Direction dir = directional_element (this).get ();
      Real dy = gh_scm2double (get_elt_property ("delta-y"));
      SCM number = get_elt_property ("text");
      if (gh_string_p (number))
	{

	  Molecule
	    num (lookup_l ()->text ("italic",
				    ly_scm2string (number), paper_l ()));
	  num.align_to (X_AXIS, CENTER);
	  num.translate_axis (w/2, X_AXIS);
	  num.align_to (Y_AXIS, CENTER);
	  num.translate_axis (dir * staff_space, Y_AXIS);
	
	  num.translate_axis (dy/2, Y_AXIS);

	  mol_p->add_molecule (num);
	}
      
      Real thick = paper_l ()->get_var ("tuplet_thick");
      if (bracket_visibility)      
	{
	  Real gap = paper_l () -> get_var ("tuplet_spanner_gap");
	
	  mol_p->add_molecule (lookup_l ()->tuplet_bracket (dy, w, thick, gap, staff_space, dir));
	}

      mol_p->translate_axis (dir * staff_space, Y_AXIS);
    }
  return mol_p;
}
  
void
Tuplet_spanner::do_add_processing ()
{
  if (gh_pair_p (get_elt_property ("columns")))
    {
      Link_array<Note_column> column_arr=
	Group_interface__extract_elements (this, (Note_column*)0, "columns");
      
      set_bounds (LEFT, column_arr[0]);
      set_bounds (RIGHT, column_arr.top ());  
    }
}

/*
  use first -> last note for slope, and then correct for disturbing
  notes in between.  */
void
Tuplet_spanner::calc_position_and_height (Real *offset, Real * dy) const
{
  Link_array<Note_column> column_arr=
    Group_interface__extract_elements (this, (Note_column*)0, "columns");

  
  Direction d = directional_element (this).get ();
  *dy = column_arr.top ()->extent (Y_AXIS) [d]
    - column_arr[0]->extent (Y_AXIS) [d];

  *offset = - d * infinity_f;
  
  Real x0 = column_arr[0]->hpos_f ();
  Real x1 = column_arr.top ()->hpos_f ();
  for (int i = 0; i < column_arr.size ();  i++)
    {
      Real notey = column_arr[i]->extent (Y_AXIS)[d];
      Real x = column_arr[i]->hpos_f () - x0;
      Real tuplety =  *dy * x / (x1 -x0);

      if (notey * d > (*offset + tuplety) * d)
	*offset = notey - tuplety; 
    }
}

void
Tuplet_spanner::do_post_processing ()
{

  Link_array<Note_column> column_arr=
    Group_interface__extract_elements (this, (Note_column*)0, "columns");

  if (!column_arr.size ())
    {
      set_elt_property ("transparent", SCM_BOOL_T);
      set_empty (X_AXIS);
      set_empty (Y_AXIS);
    }

  Direction d =   directional_element (this).get ();
  if (!d)
    {
      d = UP;
      directional_element (this).set (d);

    }
  Real dy, offset;

  calc_position_and_height (&offset, &dy);
  set_elt_property ("delta-y", gh_double2scm (dy));

  translate_axis (offset, Y_AXIS);
  
  if (scm_ilength (get_elt_property ("beams")) == 1)
    {
      SCM bs = get_elt_property ("beams");
      Score_element *b = unsmob_element (gh_car (bs));
      Beam * beam_l = dynamic_cast<Beam*> (b);
      if (!broken_b () 
	  && spanned_drul_[LEFT]->column_l () == beam_l->spanned_drul_[LEFT]->column_l ()
	  && spanned_drul_[RIGHT]->column_l () == beam_l->spanned_drul_[RIGHT]->column_l ())
	set_elt_property ("parallel-beam", SCM_BOOL_T);
    }
}


Direction
Tuplet_spanner::get_default_dir () const
{
  Direction d = UP;
  SCM dir_sym =get_elt_property ("dir-forced");
  if (gh_number_p (dir_sym))
    {
      d= to_dir (dir_sym);
      if (d != CENTER)
	return d;
    }

  for (SCM s = get_elt_property ("columns"); gh_pair_p (s); s = gh_cdr (s))
    {
      Score_element * sc = unsmob_element (gh_car (s));
      Note_column * nc = dynamic_cast<Note_column*> (sc);
      if (nc->dir () < 0) 
	{
	  d = DOWN;
	  break;
	}
    }
  
  return d;
}

void
Tuplet_spanner::add_beam (Beam *b)
{
  add_dependency (b);
  Group_interface gi (this, "beams");
  gi.add_element (b);
}

void
Tuplet_spanner::add_column (Note_column*n)
{
  Group_interface gi (this, "columns");
  gi.add_element (n);

  add_dependency (n);
}


