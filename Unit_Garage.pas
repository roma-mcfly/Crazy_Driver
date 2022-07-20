unit Unit_Garage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, mmsystem;

type
  TForm_Garage = class(TForm)
    ImgBackGround: TImage;
    LabelChoose: TLabel;
    LabelYour: TLabel;
    LabelCar: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ImgLocation: TImage;
    ImgMenu: TImage;
    ImgClick1Off: TImage;
    ImgClick1On: TImage;
    ImgClick2Off: TImage;
    ImgClick2On: TImage;
    ImgClick3Off: TImage;
    ImgClick3On: TImage;
    ImgBugatti: TImage;
    ImgCitroen: TImage;
    ImgDelorean: TImage;
    ImgFrameBugatti: TImage;
    ImgFrameCitroen: TImage;
    ImgFrameDelorean: TImage;
    procedure ImgClick1OffClick(Sender: TObject);
    procedure ImgClick1OnClick(Sender: TObject);
    procedure ImgClick2OffClick(Sender: TObject);
    procedure ImgClick2OnClick(Sender: TObject);
    procedure ImgClick3OffClick(Sender: TObject);
    procedure ImgClick3OnClick(Sender: TObject);
    procedure ImgMenuClick(Sender: TObject);
    procedure ImgLocationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Garage: TForm_Garage;

implementation

{$R *.dfm}

uses Unit_MainMenu, Unit_Location;

procedure TForm_Garage.ImgLocationClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  Form_Location.Show;
  Form_Garage.Hide;
end;

procedure TForm_Garage.ImgClick1OffClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick1Off.Visible := False;
  ImgClick1On.Visible := True;
  if ImgClick1On.Visible = True then
  begin
    ImgBugatti.Visible := True;
    ImgBugatti.Picture.LoadFromFile('Images\ImgBugattiGR.png');
    ImgFrameBugatti.Visible := True;
    ImgFrameBugatti.Picture.LoadFromFile('Images\ImgFrameBugatti.png');
    ImgClick2On.Visible := False;
    ImgClick2Off.Visible := True;
    ImgClick3On.Visible := False;
    ImgClick3Off.Visible := True;
  end;
  if ImgBugatti.Visible = True then
  begin
    ImgFrameCitroen.Visible := False;
    ImgFrameDelorean.Visible := False;
    ImgCitroen.Visible := False;
    ImgDelorean.Visible := False;
  end;
end;

procedure TForm_Garage.ImgClick2OffClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick2Off.Visible := False;
  ImgClick2On.Visible := True;
  if ImgClick2On.Visible = True then
  begin
    ImgCitroen.Visible := True;
    ImgCitroen.Picture.LoadFromFile('Images\ImgCitroenGR.png');
    ImgFrameCitroen.Visible := True;
    ImgFrameCitroen.Picture.LoadFromFile('Images\ImgFrameCitroen.png');
    ImgClick1On.Visible := False;
    ImgClick1Off.Visible := True;
    ImgClick3On.Visible := False;
    ImgClick3Off.Visible := True;
  end;
  if ImgCitroen.Visible = True then
  begin
    ImgFrameBugatti.Visible := False;
    ImgFrameDelorean.Visible := False;
    ImgBugatti.Visible := False;
    ImgDelorean.Visible := False;
  end;
end;

procedure TForm_Garage.ImgClick3OffClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick3Off.Visible := False;
  ImgClick3On.Visible := True;
  if ImgClick3On.Visible = True then
  begin
    ImgDelorean.Visible := True;
    ImgDelorean.Picture.LoadFromFile('Images\ImgDeloreanGR.png');
    ImgFrameDelorean.Visible := True;
    ImgFrameDelorean.Picture.LoadFromFile('Images\ImgFrameDelorean.png');
    ImgClick2On.Visible := False;
    ImgClick2Off.Visible := True;
    ImgClick1On.Visible := False;
    ImgClick1Off.Visible := True;
  end;
  if ImgDelorean.Visible = True then
  begin
    ImgFrameBugatti.Visible := False;
    ImgFrameCitroen.Visible := False;
    ImgBugatti.Visible := False;
    ImgCitroen.Visible := False;
  end;

end;

procedure TForm_Garage.ImgClick1OnClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick1On.Visible := False;
  ImgClick1Off.Visible := True;
  ImgBugatti.Visible := False;
  ImgFrameBugatti.Visible := False;
  ImgFrameCitroen.Visible := False;
  ImgFrameDelorean.Visible := False;
end;

procedure TForm_Garage.ImgClick2OnClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick2On.Visible := False;
  ImgClick2Off.Visible := True;
  ImgCitroen.Visible := False;
  ImgFrameBugatti.Visible := False;
  ImgFrameCitroen.Visible := False;
  ImgFrameDelorean.Visible := False;
end;

procedure TForm_Garage.ImgClick3OnClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  ImgClick3On.Visible := False;
  ImgClick3Off.Visible := True;
  ImgDelorean.Visible := False;
  ImgFrameBugatti.Visible := False;
  ImgFrameCitroen.Visible := False;
  ImgFrameDelorean.Visible := False;
end;

procedure TForm_Garage.ImgMenuClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  Form_MainMenu.Show;
  Form_Garage.Hide;
end;

end.
