unit MainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    TrayIcon1: TTrayIcon;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ClassOperatorsImpl;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  SystemNow: TSystemDateTime;
  ANow1,
  ANow: TDateTime;
  Before, After, s: string;
  tzi: TTimeZoneInformation;
begin
  ANow1 := Now;
  SystemNow := ANow1;  // Place breakpoint on this line
//  ANow := SystemNow;
  GetTimeZoneInformation(tzi);
  Before := FormatDateTime('ddd mm yyyy hh:nn:ss', ANow1);
  After :=  FormatDateTime('ddd mm yyyy hh:nn:ss', SystemNow);
  TrayIcon1.BalloonHint := Format('Before: %s After: %s'#13'ToString: %s', [Before, After, string(SystemNow)]);
  TrayIcon1.BalloonTitle := 'Hello world';
  TrayIcon1.ShowBalloonHint;
end;

end.
