unit Unit_Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, mmsystem;

type
  TForm_Settings = class(TForm)
    ImgBackGround: TImage;
    ImgSound: TImage;
    LabelSoundOff: TLabel;
    ImgMenu: TImage;
    LabelReference: TLabel;
    ImgReference: TImage;
    procedure ImgSoundClick(Sender: TObject);
    procedure ImgMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImgReferenceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Settings: TForm_Settings;
  MusicPlay: boolean;

implementation

{$R *.dfm}

uses Unit_MainMenu;

procedure TForm_Settings.ImgSoundClick(Sender: TObject);
begin
  if LabelSoundOff.Caption = 'Sound On' then
  begin
    MusicPlay := true;
  end;
  if LabelSoundOff.Caption = 'Sound Off' then
  begin
    MusicPlay := false;
  end;
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  LabelSoundOff.Width := 170;
  if MusicPlay = true then
  begin
    LabelSoundOff.Caption := 'Sound Off';
    MusicPlay := false;
    Form_MainMenu.MediaPlayer1.Stop;
    ImgSound.Picture.LoadFromFile('Images\ImgSoundOff.png');
    exit;
  end;
  if MusicPlay = false then
  begin
    LabelSoundOff.Caption := 'Sound On';
    MusicPlay := true;
    Form_MainMenu.MediaPlayer1.Play;
    ImgSound.Picture.LoadFromFile('Images\ImgSoundON.png');
    exit;
  end;
end;

procedure TForm_Settings.FormCreate(Sender: TObject);
begin
  LabelSoundOff.Width := 170;
  MusicPlay := true;
end;

procedure TForm_Settings.ImgReferenceClick(Sender: TObject);
begin
  winExec('hh Reference.chm', SW_Restore);
  winHelp(Form_Settings.Handle, 'Reference.chm', HELP_Context, 1)
end;

procedure TForm_Settings.ImgMenuClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  Form_MainMenu.Show;
  Form_Settings.Hide;
end;

end.