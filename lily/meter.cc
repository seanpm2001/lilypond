#include "scalar.hh"
#include "molecule.hh"
#include "meter.hh"
#include "paper-def.hh"
#include "lookup.hh"

Meter::Meter (Array<Scalar>a)
  :args (a)
{
  breakable_b_ = true;
}

Molecule*
Meter::brew_molecule_p() const
{
  Atom s = paper()->lookup_l ()->meter (args);
  s.translate_axis (-s.extent()[Y_AXIS].center (), Y_AXIS);
  return new Molecule (Atom (s));
}



IMPLEMENT_IS_TYPE_B1(Meter,Item);
