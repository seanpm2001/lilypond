/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1997--2021 Han-Wen Nienhuys <hanwen@xs4all.nl>

  LilyPond is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  LilyPond is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with LilyPond.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef DIRECTION_HH
#define DIRECTION_HH

#include <algorithm>
#include <cmath>

// a direction on an unspecified axis, represented as {-1, 0, 1}
class Direction final
{
public:
  constexpr Direction () = default;

  // Create a Direction from the sign of the input.

  constexpr explicit Direction (int x)
    : Direction (static_cast<long long> (x)) {}

  constexpr explicit Direction (long x)
    : Direction (static_cast<long long> (x)) {}

  constexpr explicit Direction (long long x)
    : _val (x ? ((x < 0) ? -1 : 1) : 0) {}

  explicit Direction (const double &x)
    : _val ((x != 0.0) ? (std::signbit (x) ? -1 : 1) : 0) {}

  static constexpr Direction negative () { return Direction (-1); }
  static constexpr Direction positive () { return Direction (1); }
  static constexpr Direction zero () { return Direction (0); }

  // Direction is copiable
  Direction (const Direction &) = default;
  Direction &operator =(const Direction &) = default;

  // Implicit conversion to int keeps legacy code working, but it has its
  // quirks.  All of these are true:
  //
  //     Direction (1) == 1
  //     Direction (2) != 2
  //     Direction (2) == 1
  //
  constexpr operator int () const { return _val; }

  // unary minus reverses the direction
  constexpr Direction operator -() const { return Direction (-_val); }

  constexpr Direction operator *(Direction other) const
  {
    return Direction (_val * other._val);
  }

private:
  int _val = 0;
};

/**
   if d > 0: the max operator
   if d < 0: the min operator
*/
template<class T> T minmax (Direction d, T a, T b)
{
  if (d == Direction::positive ())
    return std::max (a, b);
  else
    return std::min (a, b);
}

static constexpr auto UP = Direction::positive ();
static constexpr auto DOWN = Direction::negative ();
static constexpr auto LEFT = Direction::negative ();
static constexpr auto RIGHT = Direction::positive ();
static constexpr auto CENTER = Direction::zero ();
static constexpr auto SMALLER = Direction::negative ();
static constexpr auto BIGGER = Direction::positive ();
static constexpr auto START = Direction::negative ();
static constexpr auto STOP = Direction::positive ();

#endif // DIRECTION_HH
