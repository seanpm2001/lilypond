#include "misc.hh"
#include "notehead.hh"
#include "dimen.hh" 
#include "debug.hh"
#include "paper-def.hh"
#include "lookup.hh"
#include "molecule.hh"
#include "musical-request.hh"



Notehead::Notehead(int ss)
{
    x_dir = 0;
    staff_size=ss;
    position = 0;
    balltype = 0;
    dots = 0;
    extremal = 0;
    rest_b_ = false;
}

void
Notehead::set_rhythmic(Rhythmic_req*r_req_l)
{
    balltype = r_req_l->duration_.type_i_;
    dots = r_req_l->duration_.dots_i_;
}
    
IMPLEMENT_STATIC_NAME(Notehead);

void
Notehead::do_print()const
{
#ifndef NPRINT
    if (rest_b_)
	mtor << "REST! ";
    mtor << "balltype "<< balltype << ", position = "<< position
	 << "dots " << dots;
#endif
}


int
Notehead::compare(Notehead *const  &a, Notehead * const &b)
{
    return a->position - b->position;
}

Molecule*
Notehead::brew_molecule_p() const return out;
{
    Paper_def *p = paper();

    Real dy = p->internote();
    Symbol s;
    if (!rest_b_)
	s = p->lookup_l()->ball(balltype);
    else 
	s = p->lookup_l()->rest(balltype);
    
    out = new Molecule(Atom(s));
    if (dots) {
	Symbol d = p->lookup_l()->dots(dots);
	Molecule dm;
	dm.add(Atom(d));
	if (!(position %2))
	    dm.translate(Offset(0,dy));
	out->add_right(dm);
    }
    out->translate(Offset(x_dir * p->note_width(),0));
    bool streepjes = (position<-1)||(position > staff_size+1);
    
    if (rest_b_ && balltype > 2)
	streepjes = false;
    
    if (streepjes) {
	int dir = sign(position);
	int s =(position<-1) ? -((-position)/2): (position-staff_size)/2;
	Symbol str = p->lookup_l()->streepjes(s);
	Molecule sm;
	sm.add(Atom(str));
	if (position % 2)
	    sm.translate(Offset(0,-dy* dir));
	out->add(sm);	    
    }
    
    out->translate(Offset(0,dy*position));
}

