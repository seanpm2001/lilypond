/*
  translation-property.hh -- declare Translation_property

  source file of the GNU LilyPond music typesetter

  (c)  1997--2000 Han-Wen Nienhuys <hanwen@cs.uu.nl>
*/


#ifndef TRANSLATION_PROPERTY_HH
#define TRANSLATION_PROPERTY_HH

#include "music.hh"
#include "protected-scm.hh"


/**
  Set a property of Translator 
 */
class Translation_property : public Music
{
public:
  String var_str_;
  Protected_scm value_;
  
  VIRTUAL_COPY_CONS(Music);
  
protected:
  virtual void do_print () const;
};

#endif // PROPERTY_HH
