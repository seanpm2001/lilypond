// vim:sw=2 makeprg=g++\ -g\ bow.cc\ -o\ bow
#include <iostream.h>
#define PT
// #define STAFFHEIGHT 16.0
#define STAFFHEIGHT 20.0

#define UP 1
#define DOWN (-1)

// mmm
#define STANDALONE

#include <math.h>

typedef void *Paper_def;

bool experimental_features_global_b = true;
//bool experimental_features_global_b = false;

#include "bezier.hh"

#if 0
#include "offset.cc"
#include "interval.cc"
#endif

#include "misc.cc"
#include "bezier.cc"

struct Point
{
  Real x, y;
};

void
out (Bezier_bow& b)
{
  cout << "save dx,dy,x,y;\n";
  for (int i = 0; i < 4; i++)
      cout << "z" << i + 1 << " = (" << b.control_[i].x ()
	<< ", " << b.control_[i].y () << ");\n";
  for (int i = 1; i < 3; i++)
      cout << "z" << i + 4 << " = (" << b.return_[i].x ()
	<< ", " << b.return_[i].y () << ");\n";
#if 0
  cout << "pickup pencircle scaled 0.5pt#;\n";
  cout << "draw z2--z3; draw (50,0)-- 0.5[z2,z3];\n";
#endif
  cout << "pickup pencircle scaled 4pt#;\n";
  for (int i = 0; i < 4; i++)
    cout << "drawdot z" << i + 1 << ";\n";
  cout << "path boogje;\n";
#if 0
  cout << "pickup pencircle scaled 0.4pt#;\n";
  cout << "boogje=z1..controls z2 and z3..z4..controls z5 and z6..cycle;\n";
  cout << "filldraw boogje;\n";
#else
  cout << "pickup pencircle scaled 1.6pt#;\n";
  cout << "boogje=z1..controls z2 and z3..z4;\n";
  cout << "draw boogje;\n";
  cout << "pickup pencircle scaled 0.4pt#;\n";
  cout << "boogje:=z4..controls z5 and z6..z1;\n";
  cout << "draw boogje;\n";
#endif
  cout << "showit; shipit;clearit;" << endl;
}

void
bow (Point* points, int n, int d)
{
  Array<Offset> notes;
  for (int i = 0; i < n; i++)
    notes.push (Offset (points[i].x, points[i].y));
#if 1
  cout << "pickup pencircle scaled 8pt#;\n";
#else
  cout << "pickup pencircle scaled 2pt#;\n";
#endif
  for (int i = 0; i < n; i++)
    cout << "drawdot (" << notes[i].x () << ", " << notes[i].y () << ");\n";
  Bezier_bow b (0);
  b.set (notes, d);
  b.calc ();
  out (b);
  return;
}

int
main ()
{
  //cout.unsetf(ios::scientific);
  cout.setf(ios::fixed);
#if 1
  bow ((Point[6]){ 0,0, 20,0, 40,0, 60,0, 80,0, 100,1 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,0, 40,30, 60,30, 80,0, 100,1 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,0, 40,0, 60,0, 80,10, 100,1 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,0, 40,0, 60,0, 80,40, 100,1 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,0, 40,0, 60,40, 80,0, 100,1 }, 6, 1);
  bow ((Point[6]){ 0,10, 20,20, 40,0, 60,40, 80,20, 100,50 }, 6, 1);
  bow ((Point[6]){ 0,10, 20,20, 40,0, 60,40, 80,20, 100,50 }, 6, -1);
  bow ((Point[6]){ 0,10, 20,20, 40,0, 60,40, 80,20, 100,100 }, 6, -1);
  bow ((Point[9]){ 0,0, 20,0, 40,-80, 60,0, 80,0, 100,0, 120,0, 140,0, 160,-1 }, 9, -1);
  bow ((Point[9]){ 0,0, 40,0, 80,180, 120,0, 160,0, 200,0, 240,0, 280,0, 320,1 }, 9, 1);
  bow ((Point[9]){ 
  {0, 0}, 
  {19.10645980317711, 1}, 
  {29.402919606354207, 28}, 
  {55.389379409531308, 1}, 
  {73.530839212708514, 1}, 
  {91.672299015885727, 1}, 
  {111.35901367452229, 1}, 
  {131.04572833315891, 1}, 
  {145.76744299179552, 0}
  }, 
  9, 1);
  bow ((Point[6]){ 0,0, 20,0, 40,0, 60,0, 80,0, 100,40 }, 6, 1);
  bow ((Point[2]){ 0,0, 20,0 }, 2, 1);
  bow ((Point[2]){ 0,0, 20,-10 }, 2, 1);
  bow ((Point[6]){ 0,0, 20,0, 40,0, 60,0, 80,0, 100,100 }, 6, 1);

  bow ((Point[6]){ 0,0, 20,-10, 40,20, 60,-20, 80,20, 100,0 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,-10, 40,20, 60,-20, 80,20, 100,0 }, 6, -1);
  bow ((Point[6]){ 0,0, 20,20, 40,0, 60,40, 80,20, 100,50 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,20, 40,0, 60,40, 80,20, 100,50 }, 6, -1);
  bow ((Point[6]){ 0,0, 20,20, 40,0, 60,40, 80,20, 100,100 }, 6, -1);

  bow ((Point[6]){ 0,-10, 20,-20, 40,0, 60,-40, 80,-20, 100,-50 }, 6, 1);

  bow ((Point[6]){ 0,10, 20,20, 40,0, 60,40, 80,20, 100,50 }, 6, -1);
#endif

#if 1
  //clipping

  bow ((Point[6]){ 0,0, 20,60, 40,0, 60,0, 80,0, 100,1 }, 6, 1);

  bow ((Point[6]){ 0,1, 20,0, 40,0, 60,0, 80,60, 100,0 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,20, 40,40, 60,60, 80,140, 100,100 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,20, 40,40, 60,60, 80,20, 100,100 }, 6, -1);
  bow ((Point[6]){ 0,0, 20,-20, 40,-40, 60,-60, 80,-20, 100,-100 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,-20, 40,-40, 60,-60, 80,-140, 100,-100 }, 6, -1);
  bow ((Point[7]){ 0,0, 20,40, 100,0, 150,0, 200,0, 280,40, 300,0 }, 7, 1);
  bow ((Point[7]){ 0,0, 20,-40, 100,0, 150,0, 200,0, 280,-40, 300,0 }, 7, -1);
  bow ((Point[7]){ 0,20, 20,40, 100,0, 150,0, 200,0, 280,40, 300,20 }, 7, 1);
  bow ((Point[3]){ 0,0, 10,10, 20,-20 }, 3, 1);

  bow ((Point[4]){ 0,0, 33,100, 75,0, 100,100 }, 4, -1);
  bow ((Point[4]){ 0,0, 33,-100, 75,0, 100,-100 }, 4, 1);
#endif

#if 1
  // infeasible

  bow ((Point[6]){ 0,0, 20,20, 40,40, 60,60, 80,140, 100,100 }, 6, 1);
  bow ((Point[6]){ 0,0, 20,-40, 40,0, 60,20, 80,20, 100,40 }, 6, -1);
  bow ((Point[6]){ 0,0, 20,-20, 40,-20, 60,-20, 80,-80, 100,-40 }, 6, -1);
  bow ((Point[6]){ 0,0, 20,-20, 40,-40, 60,-60, 80,-140, 100,-100 }, 6, -1);
  bow ((Point[6]){ 0,0, 20,20, 40,40, 60,60, 80,140, 100,100 }, 6, 1);
#endif

  cout << "\\end" << endl;

  return 0;
}

