/*
  request-iter.hh -- declare Request_chord_iterator

  source file of the GNU LilyPond music typesetter

  (c)  1997--2000 Han-Wen Nienhuys <hanwen@cs.uu.nl>
*/


#ifndef REQUEST_ITER_HH
#define REQUEST_ITER_HH

#include "music-iterator.hh"

/**
   Walk through a Request_chord
 */
class Request_chord_iterator : public Music_iterator {
  Request_chord * elt_l () const;
  /**
     cache elt_l ()->length_mom ().
   */
  Moment elt_length_mom_;
  bool last_b_;
  Cons<Music>* cursor_;

public:
  Request_chord_iterator ();
  

protected:
  virtual void do_process_and_next (Moment);
  virtual Moment next_moment() const;
  virtual void construct_children();
  virtual bool ok() const;
  virtual void do_print() const;
};


#endif // REQUEST_ITER_HH
