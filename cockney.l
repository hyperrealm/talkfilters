/* GNU Talkfilters
   Copyright (C) 1998-2003 Free Software Foundation, Inc.

   This file is part of GNU Talkfilters

   GNU Talkfilters is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2, or (at
   your option) any later version.

   This software is distributed in the hope that it will be amusing, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this software; see the file COPYING.  If not, write to the
   Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
*/

%option prefix="cockney_yy"
%option outfile="lex.yy.c"
%option noyywrap
%option nowarn

/*
 * ken:
 * will turn English into Cockney, featuring (dubious) rhyming slang for a lot
 * of computer terminology.
 * 
 * Written by Stephen K Mulrine <smulrine%cs.strath.ac.uk@nsfnet-relay.ac.uk>
 * Make copies if you want etc.etc.
 * 
 * Contacted author in June 2001, asked him to clarify the license, he replied
 * with some improvements and placed the program in the public domain.
 *         -- Edward Betts <edward@debian.org> Mon, 11 Jun 2001 12:04:29 +0100
 * 
 * ken is named after Ken the Chirpy Cockney Character from the Viz Comic (tm),
 * who speaks somewhat like that.
 */


%e 3000
%p 6000
%n 1000
%k 500
%a 4000
%o 2000

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

WB      [\n\t ]
WC	[A-Za-z'0-9]
NW	[^A-Za-z'0-9]
EOT	\4

%s NIW INW

%%

<NIW,INITIAL>{

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Tt]alk/{NW}		gtf_puts_case("go on");
[Tt]alked/{NW}		gtf_puts_case("went on");
[Tt]alking/{NW}		gtf_puts_case("goin' on");
[Aa]s{WB}soon/{NW}	gtf_puts_case("soon");
[Gg]oing{WB}to/{NW}	gtf_puts_case("gonna");
[Aa]{WB}try/{NW}	gtf_puts_case("a go");
[Oo][Kk]"."		|
[Ff]ine/{NW}		gtf_puts_case("not so bad");
Take/{NW}		gtf_puts_case("'Ave");
take/{NW}		gtf_puts_case("'ave");
Take{WB}a{WB}look/{NW}	|
Look/{NW}		gtf_puts_case("'Ave a look");
take{WB}a{WB}look/{NW}	|
look/{NW}		gtf_puts_case("'ave a look");
[Hh]onestly/{NW}	|
[Ss]eriously/{NW}	gtf_puts_case("straight up");
seam/{NW}		gtf_puts_case("join");
[Gg]ood/{NW}		{ if(gtf_random(3) == 0)
			    gtf_puts_case("right good");
			  else
			    gtf_echo();
			}
[Ll]end{WB}me/{NW}	gtf_puts_case("borrow us");
[Ll]end/{NW}		gtf_puts_case("borrow");
[Gg]ive{WB}me/{NW}	gtf_puts_case("give us");
[Gg]ive{WB}up/{NW}	gtf_puts_case("give over");
[Pp]ut{WB}it/{NW}	gtf_puts_case("stick it");
[Pp]ut{WB}those/{NW}	gtf_puts_case("stick those");
[Pp]ut{WB}them/{NW}	gtf_puts_case("stick 'em");
[Dd]iscussion		gtf_puts_case("chat"); BEGIN(INW);
[Tt]ry({WB}it)?/{NW}	gtf_puts_case("give it a go");
[Oo]ur/{NW}		gtf_puts_case("us");
[Ss]aw/{NW}		gtf_puts_case("seen");
[Ss]ee/{NW}		gtf_puts_case("spot");
[Ss]ees/{NW}		gtf_puts_case("spots");
[Aa]{WB}lot/{NW}	gtf_puts_case("a bit");
[Ll]ots{WB}of/{NW}	gtf_puts_case("a bit a'");
[Aa]nyway/{NW}		gtf_puts_case("any road, so");
[Aa]nyhow/{NW}		gtf_puts_case("any road");
Around/{NW}		gtf_puts_case("'Round");
around/{NW}		gtf_puts_case("'round");
[Pp]ants/{NW}		gtf_puts_case("kegs");
[Cc]lothes/{NW}		gtf_puts_case("kit");
[Ss]occer/{NW}		|
[Ff]ootball/{NW}	gtf_puts_case("footie");
[Yy](ou{WB}|')all/{NW}	gtf_puts_case("you lot");
[Nn]ude/{NW}		gtf_puts_case("buff");
[Nn]aked/{NW}		gtf_puts_case("stark bloody naked");
[Pp]laying({WB}around)?/{NW} |
[Hh]aving{WB}fun/{NW}	gtf_puts_case("messing");
[Cc]lassy/{NW}		gtf_puts_case("posh");
[Gg]et/{NW}		gtf_puts_case("cop");
[Gg]etting/{NW}		gtf_puts_case("copping");
[Gg]et{WB}me/{NW}	gtf_puts_case("get us");
[Dd]own/{NW}		gtf_puts_case("dahn");
[Dd]ownstairs/{NW}	gtf_puts_case("down the apples and pears");
[Ee]yes/{NW}		gtf_puts_case("mince pies");
[Pp]erhaps/{NW}		gtf_puts_case("peraps");
[Ss]tairs/{NW}		gtf_puts_case("apples and pears");
[Tt]own/{NW}		gtf_puts_case("tahn");
[Uu]pstairs/{NW}	gtf_puts_case("up the apples and pears");
[Pp]olice/{NW}		|
[Cc]ops/{NW}		|
[Pp]olice(wo)?men/{NW}	gtf_puts_case("bobbies");
[Cc]op/{NW}		|
[Pp]olice(wo)?man/{NW}	gtf_puts_case("bobby");
[Ss]uit/{NW}		gtf_puts_case("whistle and flute");
[Pp]rofessional		|
[Ee]xpert		gtf_puts_case("ace"); BEGIN(INW);
[Ll]ove			gtf_puts_case("luv"); BEGIN(INW);
[Cc]lean		gtf_puts_case("tidy"); BEGIN(INW);
[Mm]outh/{NW}		gtf_puts_case("North and South");
[Ff]ace/{NW}		gtf_puts_case("boat race");
[Tt]rouble/{NW}		gtf_puts_case("Barney Rubble");
[Ww]ife/{NW}		{ switch(gtf_random(2))
			    {
			    case 0: gtf_puts_case("trouble and strife"); break;
			    case 1: gtf_puts_case("ole lady"); break;
		 	    }
			}
[Rr]oad/{NW}		gtf_puts_case("frog and toad");
[Pp]ub/{NW}		gtf_puts_case("rub-a-dub");
[Pp]ubs/{NW}		gtf_puts_case("rub-a-dubs");
[Bb]ar/{NW}		gtf_puts_case("boozer");
[Bb]ars/{NW}		gtf_puts_case("boozers");
[Hh]usband/{NW}		gtf_puts_case("ole man");
[Pp]arty		gtf_puts_case("knees-up");
[Pp]arties/{NW}		gtf_puts_case("knees-ups");
[Mm]y/{NW}		gtf_puts_case("me");
[Yy]ou/{NW}		gtf_puts_case("yer");
[Yy]ou({WB}are|r)?	gtf_puts_case("yor");
[Yy]ou({WB}a|')re/{NW}	gtf_puts_case("yor");
[Tt]hose/{NW}		gtf_puts_case("them");
[Tt]he/{NW}		{ switch(gtf_random(5))
			    {
		            case 0: gtf_puts_case("the bleedin'"); break;
			    case 1: gtf_puts_case("the bloody"); break;
			    case 2: gtf_puts_case("the bloomin'"); break;
			    case 3: gtf_puts_case("the chuffin'"); break;
			    default: gtf_echo();
			    }
			}
[Tt]his			gtf_echo(); BEGIN(INW);
[Tt]hat			gtf_echo(); BEGIN(INW);
[Tt]hus/{NW}		|
[Hh]ence/{NW}		gtf_puts_case("so");
[Tt]han			gtf_echo(); BEGIN(INW);
[Ww]ho			gtf_echo(); BEGIN(INW);
old/{NW}		gtf_puts_case("ole");
to/{NW}			gtf_puts("ter");
[Ww]hat			gtf_puts_case("wot"); BEGIN(INW);
[Ww]as/{NW}		gtf_puts_case("were");
[Aa]ren't{WB}you/{NW}	gtf_puts_case("Aintcha ");
[Aa]ren't/{NW}		|
[Aa]re{WB}not/{NW}	|
[Ii]s({WB}no|n')t/{NW}	gtf_puts_case("Ain't");
[Ww]hat({WB}i|')s{WB}that/{NW} gtf_puts_case("wossat");
[Ww]hat({WB}i|')s/{NW}	gtf_puts_case("woss");
[Ww]hat({WB}a|')re{WB}you(r)?/{NW} |
[Ww]hat{WB}you({WB}a|')re/{NW}     |
[Ww]hat{WB}do{WB}you(r)?/{NW} gtf_puts_case("wotcher");
[Ww]atch{WB}it/{NW}	gtf_puts_case("wotchit");
[Ii]({WB}a|')m/{NW}	{ switch(gtf_random(2))
			  { case 0: gtf_puts_case("I'm bloody well"); break;
			    default: gtf_echo();
                          }
			}
[Ww]hat{WB}is{WB}th	gtf_puts_case("Woss"); BEGIN(INW);
[Ww]hat{WB}you({WB}a|')re/{NW} gtf_puts_case("wotcher");
[Ww]hat{WB}(are|do){WB}you(r)?	gtf_puts_case("wotcher");
H[aeu]llo/{NW}		gtf_puts_case("'Allo");
h[aeu]llo/{NW}		gtf_puts_case("'allo");
[Ww]hat			gtf_puts_case("wot"); BEGIN(INW);
[Ww]ere/{NW}		gtf_puts_case("was");
[Bb]other		gtf_puts_case("ars"); BEGIN(INW);
[Bb]oys/{NW}		gtf_puts_case("fellas");
[Mm]other		gtf_puts_case("Muvver"); BEGIN(INW);
[Mm]om			gtf_puts_case("mum"); BEGIN(INW);
[Aa]rrest		|
[Ss]teal		|
[Bb]ust			gtf_puts_case("nick"); BEGIN(INW);
[Ss]tole(n)?/{NW}	|
[Hh]andcuffed/{NW}	gtf_puts_case("nicked");
[Hh]ell/{NW}		gtf_puts_case("hell fire");
[Uu]neployed/{NW}	gtf_puts_case("on dole");
[Rr]ude/{NW}		|
[Ss]assy/{NW}		|
[Ii]mpudent/{NW}	gtf_puts_case("cheeky");
[Tt]elephone/{NW}	|
[Pp]hone/{NW}		gtf_puts_case("dog and bone");
[Pp]erson		gtf_puts_case("bloke"); BEGIN(INW);
[Pp]eople		gtf_puts_case("blokes"); BEGIN(INW);
([Aa]n{WB})?[Aa]merican/{NW} |
[Yy]ank(ee)?/{NW}	gtf_puts_case("a septic tank"); BEGIN(INW);
[Oo]ld{WB}man/{NW}	|
[Gg]entleman/{NW}	gtf_puts_case("geezer"); BEGIN(INW);
[Oo]ld{WB}men/{NW}	|
[Gg]entlemen/{NW}	gtf_puts_case("geezers"); BEGIN(INW);
[Gg]uy			gtf_puts_case("lad"); BEGIN(INW);
[Ss]omeone/{NW}		gtf_puts_case("some bloke");
[Ss]omebody/{NW}	gtf_puts_case("some geezer");
[Oo]ther		gtf_puts_case("uvver"); BEGIN(INW);
[Aa]nother		gtf_puts_case("aunuvver"); BEGIN(INW);
[Hh]i/{NW}		gtf_puts_case("oi");
[Ww]ow/{NW}		|
[Yy]ay/{NW}		|
[Yy]ahoo/{NW}		gtf_puts_case("cor");
[Hh]oora(y|h)/{NW}	|
[Yy]eehaw/{NW}		|
[Gg]eez/{NW}		|
[Gg]osh/{NW}		|
[Gg]olly/{NW}		gtf_puts_case("blimey");
[Hh]ey/{NW}		{ switch(gtf_random(2))
			  { case 0: gtf_puts_case("eh, up"); break;
			    case 1: gtf_puts_case("oi"); break;
			  }
			}
[Cc]ow/{NW}		gtf_puts_case("cah");
[Ss]tate{WB}of{WB}the{WB}art/{NW} gtf_puts_case("top o' the range");
[Ff]ather		gtf_puts_case("favver"); BEGIN(INW);
[Rr]ather/{NW}		gtf_puts_case("ravver");
[Ww]eather		gtf_puts_case("wevver"); BEGIN(INW);
[Ll]eather/{NW}		gtf_puts_case("Levver");
[Ww]ither/{NW}		gtf_puts_case("wivver");
[Ee]ither/{NW}		gtf_puts_case("eever");
[Ss]mart		gtf_puts_case("keen"); BEGIN(INW);
[Ww]ith			gtf_puts_case("wiv"); BEGIN(INW);
[Aa]nything/{NW}	gtf_puts_case("anyfink");
[Ss]omething/{NW}	gtf_puts_case("sumfink");
[Nn]othing/{NW}		gtf_puts_case("nuffink");
[Ee]verything/{NW}	gtf_puts_case("evryfink");
[Vv]ery/{NW}		|
[Rr]eally/{NW}		gtf_puts_case("right");
[Bb]other/{NW}		gtf_puts_case("bovver");
[Dd]umb			gtf_puts_case("daft"); BEGIN(INW);
[Cc]ool{WB}it/{NW}	|
[Cc]hill{WB}out/{NW}	gtf_puts_case("don't get a benny on");
[Ii]mmoral		|
[Cc]rude		gtf_puts_case("naughty"); BEGIN(INW);
[Pp]rofanity/{NW}	gtf_puts_case("naughty language");
[Ss]wear{WB}word	gtf_puts_case("naughty word"); BEGIN(INW);
[Gg]et{WB}over/{NW}	gtf_puts_case("grow out");
[Gg]ot{WB}over/{NW}	gtf_puts_case("grew out");
[Gg]otten{WB}over/{NW}	gtf_puts_case("grown out");
[Ss]uppose/{NW}		gtf_puts_case("s'pose");
[Kk]ind{WB}of/{NW}	gtf_puts_case("sort of");
[Dd]oesn't/{NW}		gtf_puts_case("don't");
[Gg]uitar(s)?/{NW}	|
[Dd]rum(s)?/{NW}	|
[Tt]rumpet(s)?/{NW}	|
[Vv]iolin(s)?/{NW}	|
[Cc]larinet(s)?/{NW}	|
[Tt]rombone(s)?/{NW}	|
[Oo]boe(s)?/{NW}	|
[Ff]lute(s)?/{NW}	|
[Tt]uba(s)?/{NW}	gtf_puts_case("spoons");
[Pp]iano/{NW}		gtf_puts_case("joanna");

[Dd]ata			gtf_puts_case("Info"); BEGIN(INW);
[Dd]irectory/{NW}	gtf_puts_case("Lockup");
[Dd]irectories/{NW}	gtf_puts_case("Lockups");
[Pp]rocess		{ switch(gtf_random(2))
			  {
			  case 0: gtf_puts_case("Queen Bess"); break;
			  case 1: gtf_puts_case("Rudolf 'Ess"); break;
			  }
			}
[Cc]omputer		gtf_puts_case("French Tutor"); BEGIN(INW);
[Bb]yte			gtf_puts_case("Jimmy White"); BEGIN(INW);
[Ff]iles		gtf_puts_case("Nobby Stiles"); BEGIN(INW);
[Ff]ile			gtf_puts_case("Royal Mile"); BEGIN(INW);
[Ll]anguage		gtf_puts_case("'Am Sandwich"); BEGIN(INW);
[Zz]ero			gtf_puts_case("Emperor Nero"); BEGIN(INW);
[Jj]ob			gtf_puts_case("Uncle Bob"); BEGIN(INW);
[Ss]hell		gtf_puts_case("Bow Bell"); BEGIN(INW);
[Ss]ave			gtf_puts_case("Chas'n'Dave"); BEGIN(INW);
[Ll]oad			gtf_puts_case("Old Kent Road"); BEGIN(INW);
[Mm]ouse		gtf_puts_case("Doll's 'Ouse"); BEGIN(INW);
[Bb]uffer		gtf_puts_case("Sausage Stuffer"); BEGIN(INW);
[Kk]eyboard		gtf_puts_case("Henry Ford"); BEGIN(INW);
[Mm]anual		gtf_puts_case("Cocker Spaniel"); BEGIN(INW);
[Ss]creen		gtf_puts_case("James Dean"); BEGIN(INW);
[Pp]rinter		gtf_puts_case("'Arold Pinter"); BEGIN(INW);
[Pp]lotter		gtf_puts_case("Pansy Potter"); BEGIN(INW);
[Cc]ompiler		gtf_puts_case("Martin Tyler"); BEGIN(INW);
[Ss]tring		gtf_puts_case("Emperor Ming"); BEGIN(INW);
[Bb]rain		gtf_puts_case("Michael Caine"); BEGIN(INW);
[Pp][Aa][Ss][Cc][Aa][Ll]/{NW} { switch(gtf_random(2))
			   {
			   case 0: gtf_puts_case("Pall Mall"); break;
			   case 1: gtf_puts_case("Roald Dahl"); break;
			   }
			 }
[Aa][Ll][Gg][Oo][Ll]/{NW} gtf_puts_case("Johnny Ball");
[Ff][Oo][Rr][Tt][Rr][Aa][Nn]/{NW} gtf_puts_case("Manfred Mann");
[Cc][Oo][Bb][Oo][Ll]/{NW} gtf_puts_case("Albert Hall");
C/{NW}			{ switch(gtf_random(4))
			    {
			    case 0: gtf_puts_case("Bruce Lee"); break;
			    case 1: gtf_puts_case("Circus Flea"); break;
			    case 2: gtf_puts_case("Bumble Bee"); break;
			    case 3: gtf_puts_case("Door Key"); break;
			    }
			}
[Jj]ava/{NW}		gtf_puts_case("Wot a palavah");
[Ww][aA][pP]/{NW}	gtf_puts_case("Pony and trap");
[Ll]oon(e)?y		|
[Ff]ruitcake		|
[Nn]utcase		gtf_puts_case("nutter"); BEGIN(INW);
[Bb]ook			gtf_puts_case("butcher's hook"); BEGIN(INW);
[Ss]topped/{NW}		gtf_puts_case("'Ad the mockers put on");
[Ss]topping/{NW}	gtf_puts_case("Putting the mockers on");
stops/{NW}		gtf_puts_case("puts the mockers on");
[Ss]top/{NW}		gtf_puts_case("put the mockers on");
[Ll]ondoner		gtf_puts_case("Cockney"); BEGIN(INW);
[Hh]			gtf_puts_case("'"); BEGIN(INW);
[Mm]ini(ature)?		|
[Tt]iny			|
[Ll]ittle		|
[Ss]mall		gtf_puts_case("wee"); BEGIN(INW);
[Mm]oney/{NW}		gtf_puts_case("brass");
[Pp]al/{NW}		|
[Bb]uddy/{NW}		gtf_puts_case("mate");
[Pp]als/{NW}		gtf_puts_case("mates");
[Ff]riend		{ switch(gtf_random(3))
			    {
			    case 0: gtf_puts_case("mucker"); break;
			    case 1: gtf_puts_case("mate"); break;
			    case 2: gtf_puts_case("china"); break;
		            }
			  BEGIN(INW);
			}
[Ww]oman/{NW}		{ switch(gtf_random(4))
			  { case 0: gtf_puts_case("bint"); break;
			    case 1: gtf_puts_case("cow"); break;
			    case 2: gtf_puts_case("lass"); break;
			    case 3: gtf_puts_case("tart"); break;
			  }
			}
[Ww]omen/{NW}		{ switch(gtf_random(4))
			  { case 0: gtf_puts_case("bints"); break;
			    case 1: gtf_puts_case("cows"); break;
			    case 2: gtf_puts_case("ruddy ladies"); break;
			    case 3: gtf_puts_case("tarts"); break;
			  }
			}
[Tt]hing		{ switch(gtf_random(2))
                          { case 0: gtf_puts_case("fink");
			    case 1: gtf_puts_case("bugger");
			  }
			  BEGIN(INW);
			}
[Dd]evil		|
[Rr]ascal		|
[Aa]sshole		|
[Dd]ork			|
[Dd]olt			|
[Nn]erd			|
[Ii]diot		{ switch(gtf_random(6))
			  { case 0: gtf_puts_case("bog eyes"); break;
			    case 1: gtf_puts_case("poof"); break;
			    case 2: gtf_puts_case("git"); break;
			    case 3: gtf_puts_case("fairy"); break;
			    case 4: gtf_puts_case("tosser"); break;
			    case 5: gtf_puts_case("divvy"); break;
			  }
			  BEGIN(INW);
			}
[Bb]e{WB}quiet/{NW}	|
[Ss]hut{WB}up/{NW}	{ switch(gtf_random(2))
			  { case 0: gtf_puts_case("shut it"); break;
			    default: gtf_puts_case("Button it"); break;
			  }
			}
[Aa]l(l{WB})?right/{NW}	{ switch(gtf_random(3))
			  { case 0: gtf_puts_case("arright"); break;
			    case 1: gtf_puts_case("awright"); break;
			    case 2: gtf_puts_case("right"); break;
			  }
			}
[Cc]igarette		gtf_puts_case("fag"); BEGIN(INW);
[Gg]oing/{NW}		gtf_puts_case("gahn");
[Bb]ring		|
[Ss]ting		|
[Ss]wing		|
[CcFfSs]ling		|
[BbKkMmPpRrSsWw]ing	gtf_echo(); BEGIN(INW);
[Tt]here		|
[Tt]hey			|
[Tt]his			|
[Tt]hat			gtf_echo(); BEGIN(INW);
Th			gtf_puts("F"); BEGIN(INW);
[Mm]r"."/{NW}		gtf_puts("Guvnor");
[Ww]hy			|
[Ww]here		| gtf_echo(); BEGIN(INW);
[Ww]h			gtf_puts_case("W"); BEGIN(INW);
[Oo]f/{NW}		gtf_puts_case("o'");

{WC}			{ BEGIN(INW); gtf_echo(); }

}

<INW>{

[Aa]{WB}h	gtf_puts_case("an '");
aw		gtf_puts_case("or");

ing/{NW}	gtf_puts_case("in'"); BEGIN(NIW);
"."		{ switch(gtf_random(32))
		    {
		    case 0:
		      gtf_puts_case(". I'll get out me spoons.");
		      break;
		    case 1:
		      gtf_puts_case(". Yer can't 'ave a knees-up wivout a joanna.");
		      break;
		    case 2:
		      gtf_puts_case(". Cor blimey guv, would I lie to you.");
		      break;
		    case 3:
		      gtf_puts_case(". I'll make us all a nice cup a' tea.");
		      break;
		    case 4:
		      gtf_puts_case(", do wot Guvnor!");
		      break;
		    case 5:
		      gtf_puts_case(", right?");
		      break;
		    case 6:
		      gtf_puts_case(". Right.");
		      break;
		    case 7:
		    case 8:
		      gtf_puts_case(", i'n it?");
		      break;
		    default:
		      gtf_echo();
		    }
		  BEGIN(NIW);
		}
"?"		{ if(gtf_random(3) == 0)
		    gtf_puts(", isit?");
		  else
		    {
		    switch(gtf_random(4))
		      {
		      case 0: gtf_puts(", then"); break;
		      case 1: gtf_puts(", eh"); break;
		      case 2: gtf_puts(", then, eh"); break;
		      }	      
		    switch(gtf_random(6))
		      {
		      case 0: gtf_puts(", mate?"); break;
		      case 1: gtf_puts(", guv?"); break;
		      case 2: gtf_puts(", squire?"); break;
		      case 3: gtf_puts(", luv?"); break;
		      default: gtf_echo();
		      }
		    }
		}
,		{ if(gtf_random(3) == 0)
		    gtf_puts(", right,");
		  else
		    gtf_echo();
		}
!		{ switch(gtf_random(7))
		    {
		    case 0: gtf_puts_case("! Blimey!"); break;
		    case 1: gtf_puts_case("! Struth!"); break;
		    case 2: gtf_puts_case("! Right!"); break;
		    case 3: gtf_puts_case(", guv!"); break;
		    case 4: gtf_puts_case("! Honest, guv!"); break;
		    case 5: gtf_puts_case("! Oi!"); break;
		    case 6: gtf_puts_case(", mate!"); break;
		    default: gtf_echo();
		    }
		}

{NW}		BEGIN(NIW); unput(yytext[0]);

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_cockney(const char *input, char *buf, size_t bufsz)
  {
  gtf_databuf_t buffer;
  YY_BUFFER_STATE _yybuf;

  gtf_strbuf_init(&buffer, buf, bufsz);
  _yybuf = yy_scan_string(input);
  yylex(&buffer);
  yy_delete_buffer(_yybuf);
  gtf_reset();

  return(buffer.overflow);
  }

int __gtf_filter_cockney(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_cockney(input, buf, bufsz));
}

#else /* LIBRARY_MODE */

int main(int argc, char **argv)
  {
  gtf_parse_args();
  gtf_random_seed();

  yylex(NULL);

  return(EXIT_SUCCESS);
  }

#endif /* LIBRARY_MODE */

/* end of source file */
