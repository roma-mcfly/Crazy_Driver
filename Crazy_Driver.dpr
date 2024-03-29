program Crazy_Driver;

uses
  Vcl.Forms,
  Unit_Game in 'Unit_Game.pas' {Form_Game},
  Unit_MainMenu in 'Unit_MainMenu.pas' {Form_MainMenu},
  Unit_Garage in 'Unit_Garage.pas' {Form_Garage},
  Unit_Location in 'Unit_Location.pas' {Form_Location},
  Unit_Settings in 'Unit_Settings.pas' {Form_Settings},
  Unit_Menu in 'Unit_Menu.pas' {Form_Menu},
  Unit_Enter in 'Unit_Enter.pas' {Form_Enter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Enter, Form_Enter);
  Application.CreateForm(TForm_MainMenu, Form_MainMenu);
  Application.CreateForm(TForm_Game, Form_Game);
  Application.CreateForm(TForm_Garage, Form_Garage);
  Application.CreateForm(TForm_Location, Form_Location);
  Application.CreateForm(TForm_Settings, Form_Settings);
  Application.CreateForm(TForm_Menu, Form_Menu);
  Application.Run;
end.
