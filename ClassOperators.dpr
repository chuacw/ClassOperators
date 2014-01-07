program ClassOperators;

uses
  Forms,
  MainFormImpl in 'MainFormImpl.pas' {Form1},
  ClassOperatorsImpl in 'ClassOperatorsImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
