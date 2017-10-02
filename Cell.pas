//code by fabian gündel
//date:2011-08-13 22:17
//name: cell.pas
//version: 1.0
unit Cell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls ;

//
// Klasse für die Zellen
//
Type
  TCell = class
  private
    x : integer;
    y : integer;
    color: Tcolor;
  public
    neighbor : integer;
    alive: boolean;
    Constructor Create (xPos: integer; yPos: integer);
    procedure live;
  end;


implementation

uses code;

//
// Zelle erzeugen
//
Constructor TCell.Create(xPos: integer; yPos: integer);
var r: integer;
begin
randomize;
if Form1.RandomCheck.Checked= true then r:= random(2)
else r:= 1;
inherited create;
  x:= xPos;
  y:= yPos;
  neighbor:= 0;
  if r=0 then alive:= true
  else alive:=false;
  color:= clblack;
  live;
end;

//
// Zelle sterben, wieder auferstehen oder leben lassen
//
procedure TCell.live ;
var a: boolean;
begin
a:= alive;
if a = false then color := clblack
  else color:= cllime;

with Form1.FieldImage.Canvas do
  begin
  Brush.Color:= color;
  Pen.Color:= color;
  Rectangle(x,y,x+10,y+10);
  end;
end;


end.
