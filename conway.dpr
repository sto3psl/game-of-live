program conway;

uses
  Forms,
  code in 'code.pas' {Form1},
  Cell in 'Cell.pas',
  figures in 'figures.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Conway''s Game of Life';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
