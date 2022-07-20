unit Unit_Location;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, mmsystem;

type
  TForm_Location = class(TForm)
    ImgBackGround: TImage;
    LabelChoose: TLabel;
    ImgMenu: TImage;
    ImgGarage: TImage;
    ImgClick1Off: TImage;
    ImgClick2Off: TImage;
    ImgClick3Off: TImage;
    ImgClick1On: TImage;
    ImgClick2On: TImage;
    ImgClick3On: TImage;
    LabelYour: TLabel;
    LabelLocation: TLabel;
    ImgDesert: TImage;
    ImgSavannah: TImage;
    ImgBelarus: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure ImgMenuClick(Sender: TObject);
    procedure ImgGarageClick(Sender: TObject);
    procedure ImgClick1OffClick(Sender: TObject);
    procedure ImgClick1OnClick(Sender: TObject);
    procedure ImgClick2OffClick(Sender: TObject);
    procedure ImgClick2OnClick(Sender: TObject);
    procedure ImgClick3OffClick(Sender: TObject);
    procedure ImgClick3OnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Location: TForm_Location;

implementation

{$R *.dfm}

uses Unit_MainMenu, Unit_Garage, Unit_Game;

procedure TForm_Location.ImgClick3OnClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgSavannah.Visible := False;
  ImgDesert.Visible := False;
  ImgBelarus.Visible := False;
  ImgClick3On.Visible := False;
  ImgClick3Off.Visible := True;
end;

procedure TForm_Location.ImgMenuClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  Form_MainMenu.Show;
  Form_Location.Hide;
end;

procedure TForm_Location.ImgGarageClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  Form_Garage.Show;
  Form_Location.Hide;
end;

procedure TForm_Location.ImgClick1OffClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick1Off.Visible := False;
  ImgClick1On.Visible := True;
  if ImgClick1On.Visible = True then
  begin
    ImgDesert.Visible := False;
    ImgBelarus.Visible := False;
    ImgSavannah.Visible := True;
    ImgSavannah.Picture.LoadFromFile('Images\ImgSavannah.png');
    ImgClick2Off.Visible := True;
    ImgClick2On.Visible := False;
    ImgClick3Off.Visible := True;
    ImgClick3On.Visible := False;
  end;
end;

procedure TForm_Location.ImgClick2OffClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick2Off.Visible := False;
  ImgClick2On.Visible := True;
  if ImgClick2On.Visible = True then
  begin
    ImgSavannah.Visible := False;
    ImgBelarus.Visible := False;
    ImgDesert.Visible := True;
    ImgDesert.Picture.LoadFromFile('Images\ImgDesert.png');
    ImgClick3On.Visible := False;
    ImgClick3Off.Visible := True;
    ImgClick1On.Visible := False;
    ImgClick1Off.Visible := True;
  end;
end;

procedure TForm_Location.ImgClick3OffClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick3Off.Visible := False;
  ImgClick3On.Visible := True;
  if ImgClick3On.Visible = True then
  begin
    ImgSavannah.Visible := False;
    ImgDesert.Visible := False;
    ImgBelarus.Visible := True;
    ImgBelarus.Picture.LoadFromFile('Images\ImgBelarus.png');
    ImgClick2On.Visible := False;
    ImgClick2Off.Visible := True;
    ImgClick1On.Visible := False;
    ImgClick1Off.Visible := True;
  end;
end;

procedure TForm_Location.ImgClick1OnClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgSavannah.Visible := False;
  ImgClick1On.Visible := False;
  ImgDesert.Visible := False;
  ImgBelarus.Visible := False;
  ImgClick1Off.Visible := True;

end;

procedure TForm_Location.ImgClick2OnClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgSavannah.Visible := False;
  ImgBelarus.Visible := False;
  ImgDesert.Visible := False;
  ImgClick2On.Visible := False;
  ImgClick2Off.Visible := True;
end;

end.
