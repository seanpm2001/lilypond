/*
  change-translator.hh -- declare Change_translator

  source file of the GNU LilyPond music typesetter

  (c)  1997--2000 Han-Wen Nienhuys <hanwen@cs.uu.nl>
*/


#ifndef CHANGE_TRANSLATOR_HH
#define CHANGE_TRANSLATOR_HH

#include "music.hh"

class Change_translator : public Music
{
public:
  String change_to_type_str_;
  String change_to_id_str_;
  
protected:
  VIRTUAL_COPY_CONS(Music);
  void do_print () const;
};


#endif // CHANGE_TRANSLATOR_HH
