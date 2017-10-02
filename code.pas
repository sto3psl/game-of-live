//code by fabian gündel
//date:2011-08-13 22:17
//name: code.pas                           
//version: 1.0
unit code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Cell, ComCtrls, Menus, figures;

type
  TForm1 = class(TForm)
    GenLabel: TLabel;
    FieldEdit: TEdit;
    FieldImage: TImage;
    Timer1: TTimer;
    RandomCheck: TCheckBox;
    ButtonStart: TButton;
    ClearButton: TButton;
    FigureBox: TComboBox;
    DrawGroup: TGroupBox;
    SpeedBar: TTrackBar;
    ButtonNext: TButton;
    GenBox: TGroupBox;
    SlowLabel: TLabel;
    FastLabel: TLabel;
    ButtonPause: TButton;
    SizeBox: TGroupBox;
    xEdit: TEdit;
    yEdit: TEdit;
    xLabel: TLabel;
    SizeButton: TButton;
    HeadLabel1: TLabel;
    HeadLabel2: TLabel;
    HeadLabel3: TLabel;
    Label1: TLabel;
    procedure FieldImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FieldImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure GenLabelClick(Sender: TObject);
    procedure RandomCheckClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure FieldImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedBarChange(Sender: TObject);
    procedure ButtonPauseClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure SizeButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Cell: array of array of TCell;
  xMouse,yMouse,xSize,ySize,gen : integer;
  draw : boolean;

implementation

{$R *.dfm}

//
// Größe anpassen
//
procedure Size;
var i,j, Width, Height: integer;
begin
draw:= false;
xSize:= strtoint(Form1.xEdit.Text);
ySize:= strtoint(Form1.yEdit.Text);
setlength(Cell,xSize+1,ySize+1);
Width:=xSize*10;
Height:= ySize*10;

Form1.FieldImage.Width:= Width;
Form1.FieldImage.Height:=Height;

for i:=0 to xSize do
  begin
    for j:=0 to ySize do
    begin
      Cell[i,j]:=TCell.Create(i*10,j*10);
    end;
  end;
  with Form1.Fieldimage.Canvas do
  begin
    Brush.Color:= clblack;
    Rectangle(0,0,Width,Height);
  end;

Form1.SizeBox.Top:=       Form1.FieldImage.Top+Form1.FieldImage.Height+5;
Form1.DrawGroup.Top:=     Form1.FieldImage.Top+Form1.FieldImage.Height+55;
Form1.GenBox.Top:=        Form1.FieldImage.Top+Form1.FieldImage.Height+105;
Form1.ButtonStart.Top:=   Form1.FieldImage.Top+Form1.FieldImage.Height+55;

Form1.Height:= Form1.FieldImage.Height+335;

Form1.FieldImage.Left:= (Form1.Width div 2) - (Form1.FieldImage.Width div 2);
end;


//
// Festlegen der Regeln
//
procedure rules;
var i,j: integer;
begin
  for i:=0 to xSize do
    begin
    for j:=0 to ySize do
      begin
      //
      // Eine tote Zelle mit genau 3 lebenden Nachbarn wird in der nächsten
      // Generation neu geboren.
      //
        if (Cell[i,j].neighbor=3) and (Cell[i,j].alive=false) then
          begin
           Cell[i,j].alive:= true;
           Cell[i,j].live;
          end
      //
      // Lebende Zellen mit weniger als 2 lebenden Nachbarn sterben in der
      // Folgegeneration an Einsamkeit.
      //
        else if (Cell[i,j].neighbor<2) and (Cell[i,j].alive=true) then
           begin
           Cell[i,j].alive:= false;
           Cell[i,j].live;
          end
      //
      // Eine lebende Zelle mit 2 oder 3 lebenden Nachbarn bleibt in der
      // Folgegeneration lebend.
      //
        else if ((Cell[i,j].neighbor=2) or (Cell[i,j].neighbor=3))
                and (Cell[i,j].alive=true) then
           begin
           Cell[i,j].alive:= true;
           Cell[i,j].live;
          end
      //
      // Lebende Zellen mit mehr als 3 Nachbarn sterben in der Folgegeneration
      // an Überbevölkerung.
      //
        else if (Cell[i,j].neighbor>3) and (Cell[i,j].alive=true) then
           begin
           Cell[i,j].alive:= false;
           Cell[i,j].live;
          end;
      end;
    end;
end;


//
//Position der Zellen vereinheitlichen (Beispiel: Mausposition    -> 453.4
//                                                Zellenposition  -> 450.0 )
//
procedure Cposition;
begin
  xMouse:= xMouse div 10;
  xMouse:= trunc(xMouse);
  xMouse:= xMouse*10;

  yMouse:= yMouse div 10;
  yMouse:= trunc(yMouse);
  yMouse:= yMouse*10;
end;

//
// Auslesen der Mausposition
//
procedure TForm1.FieldImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  xMouse:= X;
  yMouse:= Y;

if draw= true then
  begin
    Cposition;
    try
    Cell[xMouse div 10,yMouse div 10].alive:= true;
    Cell[xMouse div 10,yMouse div 10].live;
    except
    end;
  end;
end;

//
// Formular erzeugen mit Zeichenfläche (FieldImage)
//
procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.Position:= poScreenCenter;
gen:=0;
Size;
end;

//
// Zellen selbst einfügen oder löschen
//
procedure TForm1.FieldImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
draw:= true;
if FigureBox.Text= 'Cell' then
begin
  Cposition;
  if Form1.FieldImage.Canvas.Pixels[X,Y]= clblack then
  begin
    Cell[xMouse div 10,yMouse div 10].alive:= true;
  end
  else
  begin
    Cell[xMouse div 10,yMouse div 10].alive:= false;
  end;
  Cell[xMouse div 10,yMouse div 10].live;
end
else if FigureBox.Text= 'f-Pentomino' then
fpentomino
else if FigureBox.Text= 'Glider' then
Glider
else if FigureBox.Text= 'Spaceship (lightweight)' then
LSpaceship
else if FigureBox.Text= 'Spaceship (middleweight)' then
MSpaceship
else if FigureBox.Text= 'Spaceship (heavyweight)' then
HSpaceship
else if FigureBox.Text= 'Gosper Gun' then
GosperGun;
end;

//
// Neue Generation erzeugen
//
procedure generation;
var i,j: integer;
begin
  for i:=0 to xSize-1 do
    begin
    for j:=0 to ySize-1 do
      begin
        Cell[i,j].neighbor:=0;

        try                                              //Exception wenn Feld eines Arrays nicht existiert z.B. Cell[-1,-1]
        if Cell[i-1,j-1].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
        try
        if Cell[i,j-1].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
        try
        if Cell[i+1,j-1].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
        try
        if Cell[i-1,j].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
        try
        if Cell[i+1,j].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
        try
        if Cell[i-1,j+1].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
        try
        if Cell[i,j+1].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
        try
        if Cell[i+1,j+1].alive=true then
          Inc (Cell[i,j].neighbor);
        except
        on EAccessViolation do
        Cell[i,j].neighbor:=Cell[i,j].neighbor;
        end;
      end;
    end;
rules;
Inc(gen);
Form1.FieldEdit.Text:= inttostr (gen);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
generation;
end;

procedure TForm1.GenLabelClick(Sender: TObject);
begin

end;

//
// zufällige Startzivilisation erzeugen
//
procedure TForm1.RandomCheckClick(Sender: TObject);
var i,j:integer;
begin
for i:=0 to xSize do
  begin
    for j:=0 to ySize do
    begin
      Cell[i,j]:=TCell.Create(i*10,j*10);
    end;
  end;
end;

//
// Starten bzw. Stoppen
//
procedure TForm1.ButtonStartClick(Sender: TObject);
begin
if ButtonStart.Caption = 'Start' then
  begin
  Timer1.Enabled:=true;
  ButtonStart.Caption:= 'Stop';
  FigureBox.Enabled:= false;
  RandomCheck.Enabled:= false;
  ClearButton.Enabled:= false;
  SizeButton.Enabled:= false;
  end
else
  begin
  Timer1.Enabled:=false;
  ButtonStart.Caption:= 'Start';
  FigureBox.Enabled:= true;
  RandomCheck.Enabled:= true;
  ClearButton.Enabled:= true;
  SizeButton.Enabled:= true;
  ClearButton.Click;
  end;
end;

//
// Alle Zellen "töten"
//
procedure TForm1.ClearButtonClick(Sender: TObject);
var i,j:integer;
begin
for i:=0 to xSize do
  begin
    for j:=0 to ySize do
    begin
      Cell[i,j].alive:= false;
      Cell[i,j].live;
    end;
  end;
RandomCheck.Checked:= false;
gen:=0;
FieldEdit.Text:= inttostr (gen);
end;

procedure TForm1.FieldImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
draw:= false;
end;

procedure TForm1.SpeedBarChange(Sender: TObject);
begin
if SpeedBar.Position=0 then Timer1.Interval:= 1000;
if SpeedBar.Position=1 then Timer1.Interval:= 900;
if SpeedBar.Position=2 then Timer1.Interval:= 800;
if SpeedBar.Position=3 then Timer1.Interval:= 700;
if SpeedBar.Position=4 then Timer1.Interval:= 600;
if SpeedBar.Position=5 then Timer1.Interval:= 500;
if SpeedBar.Position=6 then Timer1.Interval:= 400;
if SpeedBar.Position=7 then Timer1.Interval:= 300;
if SpeedBar.Position=8 then Timer1.Interval:= 200;
if SpeedBar.Position=9 then Timer1.Interval:= 100;
if SpeedBar.Position=10 then Timer1.Interval:= 50;
end;

procedure TForm1.ButtonPauseClick(Sender: TObject);
begin
if ButtonPause.Caption='Pause' then
  begin
  Timer1.Enabled:=false;
  ButtonPause.Caption:='Run';
  end
else
  begin
  Timer1.Enabled:=true;
  ButtonPause.Caption:= 'Pause';
  end;
end;

procedure TForm1.ButtonNextClick(Sender: TObject);
begin
Timer1.Enabled:= false;
ButtonPause.Caption:='Run';
generation;
end;


procedure TForm1.SizeButtonClick(Sender: TObject);
var x,y : integer;
begin
x:= strtoint (xEdit.Text);
y:= strtoint (yEdit.Text);

if (x<3) or (y<3) or (x>60) or (y>60)
  then
    begin
    ShowMessage('Die Maße müssen zwischen 3x3 und 60x60 liegen!');
    xEdit.Text:= inttostr (xSize);
    yEdit.Text:= inttostr (ySize);
    end
  else Size;
end;

end.
