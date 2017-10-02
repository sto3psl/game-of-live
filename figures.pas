//code by fabian gündel
//date:2011-08-13 22:17
//name: figures.pas
//version: 1.0

unit figures;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls ;

  procedure fpentomino;
  procedure glider;
  procedure LSpaceship;
  procedure MSpaceship;
  procedure HSpaceship;
  procedure GosperGun;

implementation

uses code;

procedure CellIndex (x: integer; y:integer);
begin
try
Cell[x,y].alive:= true;
Cell[x,y].live;
except
end;
end;

//
//Glider
//
procedure glider;
var x,y : integer;
begin
x:= xMouse div 10;
y:= yMouse div 10;

CellIndex(x,y);
CellIndex(x+1,y+1);
CellIndex(x+1,y+2);
CellIndex(x,y+2);
CellIndex(x-1,y+2);
end;

//
// f-Pentomino
//
procedure fpentomino;
var x,y : integer;
begin
x:= xMouse div 10;
y:= yMouse div 10;

CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x,y+1);
CellIndex(x,y+2);
CellIndex(x-1,y+1);
end;

//
//Spaceship (lightweight)
//
procedure LSpaceship;
var x,y : integer;
begin
x:= xMouse div 10;
y:= yMouse div 10;

CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x+2,y);
CellIndex(x+3,y);
CellIndex(x+3,y+1);
CellIndex(x+3,y+2);
CellIndex(x-1,y+1);
CellIndex(x-1,y+3);
CellIndex(x+2,y+3);
end;

//
//Spaceship (middleweight)
//
procedure MSpaceship;
var x,y : integer;
begin
x:= xMouse div 10;
y:= yMouse div 10;

CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x+2,y);
CellIndex(x+3,y);
CellIndex(x+4,y);
CellIndex(x+4,y+1);
CellIndex(x+4,y+2);
CellIndex(x+3,y+3);
CellIndex(x-1,y+1);
CellIndex(x-1,y+3);
CellIndex(x+1,y+4);
end;

//
//Spaceship (heavyweight)
//
procedure HSpaceship;
var x,y : integer;
begin
x:= xMouse div 10;
y:= yMouse div 10;

CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x+2,y);
CellIndex(x+3,y);
CellIndex(x+4,y);
CellIndex(x+5,y);
CellIndex(x+5,y+1);
CellIndex(x+5,y+2);
CellIndex(x+4,y+3);
CellIndex(x-1,y+1);
CellIndex(x-1,y+3);
CellIndex(x+1,y+4);
CellIndex(x+2,y+4);
end;

procedure square(x:integer; y:integer);
begin
CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x,y+1);
CellIndex(x+1,y+1);
end;

procedure sixblocks(x:integer; y:integer);
begin
CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x+1,y+1);
CellIndex(x-1,y+1);
CellIndex(x-1,y+2);
CellIndex(x,y+2);
end;

procedure sglider(x:integer; y:integer);
begin
CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x+2,y+1);
CellIndex(x,y+1);
CellIndex(x,y+2);
end;

procedure sglider2(x:integer; y:integer);
begin
CellIndex(x,y);
CellIndex(x+1,y);
CellIndex(x+2,y);
CellIndex(x,y+1);
CellIndex(x+1,y+2);
end;


procedure GosperGun;
var x,y : integer;
begin
x:= xMouse div 10;
y:= yMouse div 10;

square(x,y);
sixblocks(x+9,y);
Sixblocks(x+23,y-2);
square(x+34,y-2);
sglider(x+16,y+2);
sglider(x+35,y+5);
sglider2(x+24,y+10);

end;
end.
