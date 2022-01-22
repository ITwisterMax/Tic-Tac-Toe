program Tic_Tac_Toe;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Game},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.CreateForm(TGame, Game);
  Application.Run;
end.
