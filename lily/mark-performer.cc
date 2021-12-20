/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 2021 Daniel Eble <nine.fierce.ballads@gmail.com>

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

#include "audio-item.hh"
#include "context.hh"
#include "mark-engraver.hh"
#include "performer.hh"
#include "stream-event.hh"
#include "translator.icc"

class Mark_performer final : public Performer
{
public:
  TRANSLATOR_DECLARATIONS (Mark_performer);

private:
  void process_music ();
};

Mark_performer::Mark_performer (Context *c)
  : Performer (c)
{
}

void
Mark_performer::process_music ()
{
  SCM text = Mark_engraver::get_current_mark_text (context ());
  if (!scm_is_null (text))
    {
      // We could change get_current_mark_text () to give us this event too,
      // since it has to look it up internally.  It's not a big deal.
      SCM ev_scm = get_property (context (), "currentMarkEvent");
      auto *const ev = unsmob<Stream_event> (ev_scm);
      announce<Audio_text> (ev, Audio_text::MARKER, text);
    }
}

void
Mark_performer::boot ()
{
}

ADD_TRANSLATOR (Mark_performer,
                /* doc */
                R"(
This performer emits MIDI markers for rehearsal, segno, and coda marks, and
section labels.  The MIDI markers are derived from markup that is generated as
in the @code{Mark_@/engraver}.
                )",

                /* create */
                R"(

                )",

                /* read */
                R"(
currentMarkEvent
                )",

                /* write */
                R"(

                )");
