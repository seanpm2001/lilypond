/*
  dots.cc -- implement Dots

  source file of the GNU LilyPond music typesetter

  (c)  1997--2000 Han-Wen Nienhuys <hanwen@cs.uu.nl>
*/

#include "dots.hh"
#include "molecule.hh"
#include "paper-def.hh"
#include "lookup.hh"
#include "staff-symbol-referencer.hh"
#include "directional-element-interface.hh"

Dots::Dots ()
{
  set_elt_property ("dot-count", gh_int2scm (0));
}

void
Dots::do_post_processing ()
{
  SCM d= get_elt_property ("dot-count");
  if (!gh_number_p (d) || !gh_scm2int (d))
    {
      set_elt_property ("transparent", SCM_BOOL_T);
      set_empty (X_AXIS);
      set_empty (Y_AXIS);
    }
  else
    {
      if (!directional_element (this).get ())
	directional_element (this).set (UP);

      Staff_symbol_referencer_interface si (this);
      int p = int (si.position_f ());
      if (!(p % 2))
	si.set_position (p  + directional_element (this).get ());
    }
}
Molecule* 
Dots::do_brew_molecule_p () const
{
  Molecule *out = new Molecule;
  Molecule fill = lookup_l ()->fill (Box (Interval (0,0),
					  Interval (0,0)));
  out->add_molecule (fill);

  Molecule d = lookup_l ()->afm_find (String ("dots-dot"));

  Real dw = d.dim_[X_AXIS].length ();
  d.translate_axis (-dw, X_AXIS);


  for (int i = gh_scm2int (get_elt_property ("dot-count")); i--; )
    {
      d.translate_axis (2*dw,X_AXIS);
      out->add_molecule (d);
    }

  return out;
}



