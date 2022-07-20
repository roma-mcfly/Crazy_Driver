unit Unit_Game;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, mmsystem, Vcl.MPlayer;

type
  TForm_Game = class(TForm)
    Timer1: TTimer;
    ImgRoad2: TImage;
    Timer3: TTimer;
    ImgRoad1: TImage;
    TimerCarRed: TTimer;
    TimerCarRedFast: TTimer;
    TimerCarBlue: TTimer;
    ImgShoot: TImage;
    TimerPoliceCar: TTimer;
    ImgShieldBonus: TImage;
    LabelShield: TLabel;
    TimerRoad: TTimer;
    TimerCoins: TTimer;
    LabelCoinsNum: TLabel;
    ImgCoinIcon: TImage;
    TimerCoinIcon: TTimer;
    ImgPit: TImage;
    ImgBrake: TImage;
    BtnReplay: TButton;
    ImgPoliceCar: TImage;
    ImgCarBlue: TImage;
    ImgCarRed: TImage;
    ImgCarRedFast: TImage;
    ImgCoins: TImage;
    ImgCoin5: TImage;
    ImgCoin10: TImage;
    ImgCoin15: TImage;
    ImgFrame: TImage;
    LabelScoreName: TLabel;
    LabelScoreNum: TLabel;
    ImgHP1: TImage;
    ImgHP2: TImage;
    ImgHP3: TImage;
    ImgPlayer: TImage;
    ImgBoom: TImage;
    ImgTank: TImage;
    ImgDestroy: TImage;
    ImgShield: TImage;
    MediaPlayer1: TMediaPlayer;
    ImgMaxSpeed: TImage;
    LabelMaxSpeed: TLabel;
    ImgDefaultSettings: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TimerCarRedTimer(Sender: TObject);
    procedure TimerCarRedFastTimer(Sender: TObject);
    procedure TimerCarBlueTimer(Sender: TObject);
    procedure TimerPoliceCarTimer(Sender: TObject);
    procedure TimerRoadTimer(Sender: TObject);
    procedure ImgDestroyClick(Sender: TObject);
    procedure TimerCoinsTimer(Sender: TObject);
    procedure TimerCoinIconTimer(Sender: TObject);
    procedure BtnReplayClick(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Game: TForm_Game;
  score, score2, a, a1, a2, n, t, g, c1, c2, c11, c22, w, sh1, sh2, p, x, cn5,
    cn10, cn15, bullet, sh, ShieldNum, boomtimer, CoinScore, Brake,
    DestroyTimer, MusicGame, hh, ss1: integer;
  k: Boolean;
  m: Boolean;
  ShieldTimer: Boolean;
  MusicPlayGame: Boolean;
  ShootTimer: Boolean;
  PoliceTimer: Boolean;
  boom: Boolean;
  t1: Boolean;
  t2: Boolean;
  t3: Boolean;
  s1: Boolean;
  s11: Boolean;
  s2: Boolean;
  s22: Boolean;
  Tank: Boolean;
  Coin5: Boolean;
  Coin10: Boolean;
  Coin15: Boolean;
  cc: Boolean;
  pit: Boolean;
  pp: Boolean;
  gg: Boolean;
  dd: Boolean;
  ss: Boolean;
  ShieldBonus: Boolean;

implementation

{$R *.dfm}

uses Unit_MainMenu, Unit_Location, Unit_Menu, Unit_Enter, Unit_Garage,
  Unit_Settings;

// доделать нормальную смену пользователя
procedure TForm_Game.BtnReplayClick(Sender: TObject);
begin
  Form_Menu.ImgFrame.Visible := false;
  Form_Menu.LabelFinalScore.Visible := false;
  Form_Menu.LabelScore.Visible := false;
  LabelScoreNum.Caption := inttostr(0);
  LabelCoinsNum.Caption := inttostr(0);
  Timer1.Enabled := true;
  Timer3.Enabled := true;
  TimerCarRed.Enabled := true;
  TimerCarRedFast.Enabled := true;
  TimerPoliceCar.Enabled := false;
  TimerRoad.Enabled := true;
  TimerCoins.Enabled := true;
  ImgHP1.Visible := true;
  ImgHP2.Visible := true;
  ImgHP3.Visible := true;
  ImgTank.Visible := false;
  ImgShieldBonus.Visible := false;
  ImgBrake.Visible := false;
  ImgShield.Visible := false;
  LabelShield.Visible := false;
  pp := false;
  gg := false;
  ImgBoom.Picture.LoadFromFile('Images\ImgBoom.png');
  boomtimer := 0;
  n := 0;
  hh := 0;
  ss1 := 0;
  t1 := false;
  t2 := false;
  t3 := false;
  s1 := false;
  s11 := false;
  ss := true;
  s2 := false;
  s22 := false;
  k := false;
  boom := false;
  Tank := false;
  MusicPlayGame := true;
  ShootTimer := false;
  PoliceTimer := false;
  ShieldTimer := false;
  ShieldBonus := false;
  Coin5 := false;
  Coin10 := false;
  Coin15 := false;
  cc := false;
  pit := false;
  dd := false;
  t := 0;
  g := 0;
  x := 0;
  w := 0;
  c1 := 0;
  c11 := 0;
  c2 := 0;
  c22 := 0;
  p := 0;
  sh := 0;
  sh1 := 0;
  sh2 := 0;
  cn5 := 0;
  cn10 := 0;
  cn15 := 0;
  Brake := 0;
  CoinScore := 0;
  score := 0;
  DestroyTimer := 0;
  bullet := 0;
  MusicGame := 0;
  ShieldNum := 0;
  ImgPlayer.Top := 441;
  ImgPoliceCar.Top := -220;
  ImgPoliceCar.Left := 169;
  ImgPlayer.Top := 432;
  ImgPlayer.Left := 169;
  ImgMaxSpeed.Visible := false;
  LabelMaxSpeed.Visible := false;
  begin
    if ((Form_Garage.ImgCitroen.Visible = false) and
      (Form_Garage.ImgDelorean.Visible = false) and
      (Form_Garage.ImgBugatti.Visible = false) and
      (Form_MainMenu.ImgClickEasyOn.Visible = false) and
      (Form_MainMenu.ImgClickNormalOn.Visible = false) and
      (Form_MainMenu.ImgClickHardOn.Visible = false)) then
    begin
      ImgDefaultSettings.Visible := true;
    end
    else
      ImgDefaultSettings.Visible := false;
  end;
  if (Form_MainMenu.ImgClickEasyOn.Visible = true) and
    (Form_MainMenu.ImgClickNormalOn.Visible = false) and
    (Form_MainMenu.ImgClickHardOn.Visible = false) then
  begin
    Form_Game.TimerRoad.Interval := 25;
    Form_Game.TimerCarRed.Interval := 25;
    Form_Game.TimerCarRedFast.Interval := 25;
    Form_Game.TimerCarBlue.Interval := 25;
    Form_Game.TimerPoliceCar.Interval := 25;
    Form_Game.TimerCoins.Interval := 25;
  end;
  if (Form_MainMenu.ImgClickNormalOn.Visible = true) and
    (Form_MainMenu.ImgClickEasyOn.Visible = false) and
    (Form_MainMenu.ImgClickHardOn.Visible = false) then
  begin
    Form_Game.TimerRoad.Interval := 20;
    Form_Game.TimerCarRed.Interval := 20;
    Form_Game.TimerCarRedFast.Interval := 20;
    Form_Game.TimerCarBlue.Interval := 20;
    Form_Game.TimerPoliceCar.Interval := 20;
    Form_Game.TimerCoins.Interval := 20;
  end;
  if (Form_MainMenu.ImgClickHardOn.Visible = true) and
    (Form_MainMenu.ImgClickEasyOn.Visible = false) and
    (Form_MainMenu.ImgClickNormalOn.Visible = false) then
  begin
    Form_Game.TimerRoad.Interval := 18;
    Form_Game.TimerCarRed.Interval := 18;
    Form_Game.TimerCarRedFast.Interval := 18;
    Form_Game.TimerCarBlue.Interval := 18;
    Form_Game.TimerPoliceCar.Interval := 18;
    Form_Game.TimerCoins.Interval := 18;
  end;
  if (Form_MainMenu.ImgClickNormalOn.Visible = false) and
    (Form_MainMenu.ImgClickEasyOn.Visible = false) and
    (Form_MainMenu.ImgClickHardOn.Visible = false) then
  begin
    Form_Game.TimerRoad.Interval := 20;
    Form_Game.TimerCarRed.Interval := 20;
    Form_Game.TimerCarRedFast.Interval := 20;
    Form_Game.TimerCarBlue.Interval := 20;
    Form_Game.TimerPoliceCar.Interval := 20;
    Form_Game.TimerCoins.Interval := 20;
  end;
  randomize;
  ImgPit.Top := -300;
  a := Random(100);
  case a of
    0 .. 33:
      begin
        ImgPit.Left := 77;
      end;
    34 .. 67:
      begin
        ImgPit.Left := 167
      end;
    68 .. 100:
      begin
        ImgPit.Left := 256;
      end;
  end;
  ImgCarRedFast.Top := 890;
  a := Random(100);
  case a of
    0 .. 33:
      begin
        ImgCarRedFast.Left := 77;
      end;
    34 .. 67:
      begin
        ImgCarRedFast.Left := 167
      end;
    68 .. 100:
      begin
        ImgCarRedFast.Left := 256;
      end;
  end;
  ImgCarBlue.Top := 700;
  a1 := Random(100);
  case a1 of
    0 .. 33:
      begin
        ImgCarBlue.Left := 77;
      end;
    34 .. 67:
      begin
        ImgCarBlue.Left := 167;
      end;
    68 .. 100:
      begin
        ImgCarBlue.Left := 256;
      end;
  end;
  ImgCarRed.Top := 1000;
  a2 := Random(100);
  case a1 of
    0 .. 33:
      begin
        ImgCarRed.Left := 77;
      end;
    34 .. 67:
      begin
        ImgCarRed.Left := 167;
      end;
    68 .. 100:
      begin
        ImgCarRed.Left := 256;
      end;
  end;
  ImgCoin5.Top := -300;
  a := Random(100);
  case a of
    0 .. 33:
      begin
        ImgCoin5.Left := 81;
      end;
    34 .. 67:
      begin
        ImgCoin5.Left := 171
      end;
    68 .. 100:
      begin
        ImgCoin5.Left := 260;
      end;
  end;
  ImgCoin10.Top := -1000;
  a1 := Random(100);
  case a1 of
    0 .. 33:
      begin
        ImgCoin10.Left := 81;
      end;
    34 .. 67:
      begin
        ImgCoin10.Left := 171;
      end;
    68 .. 100:
      begin
        ImgCoin10.Left := 260;
      end;
  end;
  ImgCoin15.Top := -1500;
  a2 := Random(100);
  case a1 of
    0 .. 33:
      begin
        ImgCoin15.Left := 81;
      end;
    34 .. 67:
      begin
        ImgCoin15.Left := 171;
      end;
    68 .. 100:
      begin
        ImgCoin15.Left := 260;
      end;
  end;
  if ((ImgCarRed.Left = 77) and (ImgCarRedFast.Left = 77) and
    (ImgCarBlue.Left = 77)) then
  begin
    a := Random(100);
    case a of
      0 .. 49:
        begin
          ImgCarRed.Left := 167;
        end;
      50 .. 100:
        begin
          ImgCarRed.Left := 256;
        end;
    end;
  end;

  if ((ImgCarRed.Left = 167) and (ImgCarRedFast.Left = 167) and
    (ImgCarBlue.Left = 167)) then
  begin
    a := Random(100);
    case a of
      0 .. 49:
        begin
          ImgCarBlue.Left := 77;
        end;
      50 .. 100:
        begin
          ImgCarBlue.Left := 256;
        end;
    end;
  end;

  if ((ImgCarRed.Left = 256) and (ImgCarRedFast.Left = 256) and
    (ImgCarBlue.Left = 256)) then
  begin
    a := Random(100);
    case a of
      0 .. 49:
        begin
          ImgCarRedFast.Left := 77;
        end;
      50 .. 100:
        begin
          ImgCarRedFast.Left := 167;
        end;
    end;
  end;

  if ((ImgCarRedFast.Left + ImgCarRedFast.width > ImgCarBlue.Left) and
    (ImgCarRedFast.Left < ImgCarBlue.Left + ImgCarBlue.width) and
    (ImgCarRedFast.Top + ImgCarRedFast.Height = ImgCarBlue.Top - 40) and
    (s1 = false)) then
  begin
    s1 := true;
  end;

  if ((ImgCarRedFast.Left + ImgCarRedFast.width > ImgCarRed.Left) and
    (ImgCarRedFast.Left < ImgCarRed.Left + ImgCarRed.width) and
    (ImgCarRedFast.Top + ImgCarRedFast.Height = ImgCarRed.Top - 30) and
    (s1 = false)) then
  begin
    s1 := true;
  end;

  if ((ImgCarRed.Left + ImgCarRed.width > ImgCarBlue.Left) and
    (ImgCarRed.Left < ImgCarBlue.Left + ImgCarBlue.width) and
    (ImgCarRed.Top + ImgCarRed.Height = ImgCarBlue.Top - 20) and (s2 = false))
  then
  begin
    s2 := true;
  end;

  if ((ImgCarRed.Left + ImgCarRed.width > ImgCarRedFast.Left) and
    (ImgCarRed.Left < ImgCarRedFast.Left + ImgCarRedFast.width) and
    (ImgCarRed.Top + ImgCarRed.Height = ImgCarRedFast.Top - 20) and (s2 = false))
  then
  begin
    s2 := true;
  end;
  Form_Menu.Hide;
end;

procedure TForm_Game.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    TimerCoins.Enabled := false;
    Form_Menu.Show;
    Timer1.Enabled := false;
    Timer3.Enabled := false;
    TimerCarRed.Enabled := false;
    TimerCarRedFast.Enabled := false;
    TimerCarBlue.Enabled := false;
    TimerRoad.Enabled := false;
    ImgDestroy.Visible := false;
    Form_Menu.ImgPlay.Visible := true;
    Form_Menu.LabelPlay.Visible := true;
    Form_Menu.ImgFrame.Visible := true;
    Form_Menu.LabelFinalScore.Visible := true;
    Form_Menu.LabelScore.Visible := true;
    Form_Menu.LabelScore.Caption := inttostr(score + CoinScore);
    Form_Enter.ADOTable1.Open;
    Form_Enter.ADOTable1.First;
    while not(Form_Enter.ADOTable1.Eof) do
    begin
      if Form_Enter.ADOTable1.Fields[1].AsString = Form_MainMenu.LabelUser.Caption
      then
      begin
        if Form_Enter.ADOTable1.Fields[6].AsInteger > (score + CoinScore) then
        begin
          Form_Enter.ADOTable1.Close;
          exit;
        end;
        if Form_Enter.ADOTable1.Fields[6].AsInteger < (score + CoinScore) then
        begin
          Form_Enter.ADOTable1.edit;
          Form_Enter.ADOTable1.Fields[6].AsInteger := (score + CoinScore);
          Form_MainMenu.LabelScoreNum.Caption := inttostr(score + CoinScore);
          Form_Enter.ADOTable1.Post;
          Form_Enter.ADOTable1.Close;
          exit;
        end
      end
      else
        Form_Enter.ADOTable1.Next;
    end;
  end;

  if (Key = #13) and (ShieldNum = 1) then
  begin
    k := true;
    sh := 0;
    ImgShieldBonus.Visible := false;
    LabelShield.Visible := false;
    LabelShield.Caption := inttostr(0);
    ShieldNum := 0;
  end;

  if (Key = #13) and (ShieldNum = 2) then
  begin
    k := true;
    sh := 1;
    ShieldNum := 1;
  end;

  if (Key = #13) and (ShieldNum = 3) then
  begin
    k := true;
    sh := 2;
    ShieldNum := 2;
  end;
  if (getasynckeystate($20) <> 0) and (ShootTimer = true) and (Tank = true) and
    (ImgDestroy.Visible = false) then
  begin
    ImgShoot.Visible := true;
    ImgShoot.Left := ImgPlayer.Left + 28;
    ImgShoot.Top := ImgPlayer.Top - 15;
    ImgShoot.Picture.LoadFromFile('Images\ImgBullet.png');
    sndPlaySound('Music\SoundShoot.wav', SND_NODEFAULT or SND_ASYNC);
  end;
end;

procedure TForm_Game.ImgDestroyClick(Sender: TObject);
begin
  sndPlaySound('Music\SoundClick.wav', SND_NODEFAULT Or SND_ASYNC);
  Timer1.Enabled := true;
  Timer3.Enabled := true;
  TimerCarRed.Enabled := true;
  TimerCarRedFast.Enabled := true;
  TimerCarBlue.Enabled := true;
  TimerRoad.Enabled := true;
  TimerCoins.Enabled := true;
  ImgDestroy.Visible := false;
  sh1 := 0;
  sh2 := 0;
  cc := true;
end;

procedure TForm_Game.MediaPlayer1Notify(Sender: TObject);
begin
  with MediaPlayer1 do
    if NotifyValue = nvSuccessful then
    begin
      Notify := true;
      Play;
    end;
end;

procedure TForm_Game.Timer1Timer(Sender: TObject);
begin
  randomize;
  if getasynckeystate($25) <> 0 then
  begin
    if (ImgPlayer.Left < 82) then
    begin
    end
    else
    begin
      if Form_Garage.ImgCitroen.Visible = true then
      begin
        ImgPlayer.Left := ImgPlayer.Left - 5;
      end;
      if Form_Garage.ImgDelorean.Visible = true then
      begin
        ImgPlayer.Left := ImgPlayer.Left - 8;
      end;
      if (Form_Garage.ImgBugatti.Visible = true) or
        ((Form_Garage.ImgCitroen.Visible = false) and
        (Form_Garage.ImgDelorean.Visible = false) and
        (Form_Garage.ImgBugatti.Visible = false)) then
        ImgPlayer.Left := ImgPlayer.Left - 10;
    end;
  end;

  if getasynckeystate($27) <> 0 then
  begin
    if (ImgPlayer.Left > 254) then
    begin
    end
    else
    begin
      if Form_Garage.ImgCitroen.Visible = true then
      begin
        ImgPlayer.Left := ImgPlayer.Left + 5;
      end;
      if Form_Garage.ImgDelorean.Visible = true then
      begin
        ImgPlayer.Left := ImgPlayer.Left + 8;
      end;
      if (Form_Garage.ImgBugatti.Visible = true) or
        ((Form_Garage.ImgCitroen.Visible = false) and
        (Form_Garage.ImgDelorean.Visible = false) and
        (Form_Garage.ImgBugatti.Visible = false)) then
        ImgPlayer.Left := ImgPlayer.Left + 10;
    end;
  end;

  if (getasynckeystate($26) <> 0) and (pit = false) then
  begin
    if Form_Garage.ImgCitroen.Visible = true then
    begin
      ImgPlayer.Top := ImgPlayer.Top - 5;
      if ImgPlayer.Top < 5 then
        ImgPlayer.Top := ImgPlayer.Top + 5;
    end;
    if Form_Garage.ImgDelorean.Visible = true then
    begin
      ImgPlayer.Top := ImgPlayer.Top - 8;
      if ImgPlayer.Top < 5 then
        ImgPlayer.Top := ImgPlayer.Top + 8;
    end;
    if (Form_Garage.ImgBugatti.Visible = true) or
      ((Form_Garage.ImgCitroen.Visible = false) and
      (Form_Garage.ImgDelorean.Visible = false) and
      (Form_Garage.ImgBugatti.Visible = false)) then
      ImgPlayer.Top := ImgPlayer.Top - 10;
    if ImgPlayer.Top < 5 then
      ImgPlayer.Top := ImgPlayer.Top + 10;
  end;

  if (getasynckeystate($28) <> 0) and (pit = false) then
  begin
    if Form_Garage.ImgCitroen.Visible = true then
    begin
      ImgPlayer.Top := ImgPlayer.Top + 5;
      if ImgPlayer.Top + 154 > Form_Game.Height then
        ImgPlayer.Top := ImgPlayer.Top - 5;
    end;
    if Form_Garage.ImgDelorean.Visible = true then
    begin
      ImgPlayer.Top := ImgPlayer.Top + 8;
      if ImgPlayer.Top + 154 > Form_Game.Height then
        ImgPlayer.Top := ImgPlayer.Top - 8;
    end;
    if (Form_Garage.ImgBugatti.Visible = true) or
      ((Form_Garage.ImgCitroen.Visible = false) and
      (Form_Garage.ImgDelorean.Visible = false) and
      (Form_Garage.ImgBugatti.Visible = false)) then
      ImgPlayer.Top := ImgPlayer.Top + 10;
    if ImgPlayer.Top + 154 > Form_Game.Height then
      ImgPlayer.Top := ImgPlayer.Top - 10;
  end;

  if n = 1 then
  begin
    ImgHP1.Visible := false;
  end;

  if n = 2 then
  begin
    ImgHP2.Visible := false;
  end;

  if n = 3 then
  begin
    Form_Game.MediaPlayer1.Stop;
    ImgHP3.Visible := false;
    ImgShield.Visible := false;
    ImgMaxSpeed.Visible := false;
    LabelMaxSpeed.Visible := false;
    ImgCoins.Visible := false;
    sndPlaySound('Music\SoundGameOver.wav', SND_NODEFAULT Or SND_ASYNC);
    Timer1.Enabled := false;
    Timer3.Enabled := false;
    TimerCarRed.Enabled := false;
    TimerCarRedFast.Enabled := false;
    TimerCarBlue.Enabled := false;
    TimerRoad.Enabled := false;
    TimerCoins.Enabled := false;
    Form_Menu.ImgFrame.Visible := true;
    Form_Menu.LabelFinalScore.Visible := true;
    Form_Menu.LabelScore.Visible := true;
    Form_Menu.LabelScore.Caption := inttostr(score + CoinScore);
    Form_Menu.ImgPlay.Visible := false;
    Form_Menu.LabelPlay.Visible := false;
    Form_Menu.Show;
    Form_Enter.ADOTable1.Open;
    Form_Enter.ADOTable1.First;
    while not(Form_Enter.ADOTable1.Eof) do
    begin
      if Form_Enter.ADOTable1.Fields[1].AsString = Form_MainMenu.LabelUser.Caption
      then
      begin
        if Form_Enter.ADOTable1.Fields[6].AsInteger > (score + CoinScore) then
        begin
          Form_Enter.ADOTable1.Close;
          exit;
        end;
        if Form_Enter.ADOTable1.Fields[6].AsInteger < (score + CoinScore) then
        begin
          Form_Enter.ADOTable1.edit;
          Form_Enter.ADOTable1.Fields[6].AsInteger := (score + CoinScore);
          Form_MainMenu.LabelScoreNum.Caption := inttostr(score + CoinScore);
          Form_Enter.ADOTable1.Post;
          Form_Enter.ADOTable1.Close;
          exit;
        end
      end
      else
        Form_Enter.ADOTable1.Next;
    end;
  end;

  if ((ImgCarRedFast.Left + ImgCarRedFast.width > ImgCarBlue.Left) and
    (ImgCarRedFast.Left < ImgCarBlue.Left + ImgCarBlue.width) and
    (ImgCarRedFast.Top + ImgCarRedFast.Height = ImgCarBlue.Top - 30) and
    (s1 = false)) then
  begin
    s1 := true;
  end;

  if ((ImgCarRedFast.Left + ImgCarRedFast.width > ImgCarRed.Left) and
    (ImgCarRedFast.Left < ImgCarRed.Left + ImgCarRed.width) and
    (ImgCarRedFast.Top + ImgCarRedFast.Height = ImgCarRed.Top - 30) and
    (s1 = false)) then
  begin
    s1 := true;
  end;

  if ((ImgCarRed.Left + ImgCarRed.width > ImgCarBlue.Left) and
    (ImgCarRed.Left < ImgCarBlue.Left + ImgCarBlue.width) and
    (ImgCarRed.Top + ImgCarRed.Height = ImgCarBlue.Top - 30) and (s2 = false))
  then
  begin
    s2 := true;
  end;

  if ((ImgCarRed.Left + ImgCarRed.width > ImgCarRedFast.Left) and
    (ImgCarRed.Left < ImgCarRedFast.Left + ImgCarRedFast.width) and
    (ImgCarRed.Top + ImgCarRed.Height = ImgCarRedFast.Top - 30) and (s2 = false))
  then
  begin
    s2 := true;
  end;

  if ((ImgCarRedFast.Top + ImgCarRedFast.Height > ImgCarBlue.Top - 100) and
    (ImgCarRedFast.Top + ImgCarRedFast.Height > ImgCarRed.Top - 100) and
    (ImgCarRedFast.Left <> ImgCarRed.Left) and
    (ImgCarRedFast.Left <> ImgCarBlue.Left) and
    (ImgCarRed.Left <> ImgCarBlue.Left) and (s1 = false) and (s2 = false) and
    (s11 = false)) then
  begin
    s11 := true;
  end;

  if ((ImgCarRedFast.Left + ImgCarRedFast.width > ImgPlayer.Left) and
    (ImgCarRedFast.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgCarRedFast.Top + ImgCarRedFast.Height > ImgPlayer.Top) and
    (ImgCarRedFast.Top < ImgPlayer.Top + ImgPlayer.Height) and (k = false)) then
  begin
    sndPlaySound('Music\SoundCrash.wav', SND_NODEFAULT Or SND_ASYNC);
    boom := true;
    k := true;
    inc(n);
    ImgCarRedFast.Top := 620;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgCarRedFast.Left := 77;
        end;
      34 .. 67:
        begin
          ImgCarRedFast.Left := 167
        end;
      68 .. 100:
        begin
          ImgCarRedFast.Left := 256;
        end;
    end;
  end;
  if ((ImgCarBlue.Left + ImgCarBlue.width > ImgPlayer.Left) and
    (ImgCarBlue.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgCarBlue.Top + ImgCarBlue.Height > ImgPlayer.Top) and
    (ImgCarBlue.Top < ImgPlayer.Top + ImgPlayer.Height) and (k = false)) then
  begin
    sndPlaySound('Music\SoundCrash.wav', SND_NODEFAULT Or SND_ASYNC);
    boom := true;
    k := true;
    inc(n);
    ImgCarBlue.Top := 620;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgCarBlue.Left := 77;
        end;
      34 .. 67:
        begin
          ImgCarBlue.Left := 167
        end;
      68 .. 100:
        begin
          ImgCarBlue.Left := 256;
        end;
    end;
  end;
  if ((ImgCarRed.Left + ImgCarRed.width > ImgPlayer.Left) and
    (ImgCarRed.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgCarRed.Top + ImgCarRed.Height > ImgPlayer.Top) and
    (ImgCarRed.Top < ImgPlayer.Top + ImgPlayer.Height) and (k = false)) then
  begin
    sndPlaySound('Music\SoundCrash.wav', SND_NODEFAULT Or SND_ASYNC);
    boom := true;
    k := true;
    inc(n);
    ImgCarRed.Top := 620;
    case a of
      0 .. 33:
        begin
          ImgCarRed.Left := 77;
        end;
      34 .. 67:
        begin
          ImgCarRed.Left := 167
        end;
      68 .. 100:
        begin
          ImgCarRed.Left := 256;
        end;
    end;
  end;

  if ((ImgPoliceCar.Left + ImgPoliceCar.width > ImgPlayer.Left) and
    (ImgPoliceCar.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgPoliceCar.Top + ImgPoliceCar.Height > ImgPlayer.Top) and
    (ImgPoliceCar.Top < ImgPlayer.Top + ImgPlayer.Height) and (k = false)) then
  begin
    sndPlaySound('Music\SoundCrash.wav', SND_NODEFAULT Or SND_ASYNC);
    boom := true;
    k := true;
    inc(n);
  end;

  if k = true then
  begin
    ImgShield.Picture.LoadFromFile('Images\ImgShield.png');
    ImgShield.Visible := true;
    ImgShield.Top := ImgPlayer.Top + 40;
    ImgShield.Left := ImgPlayer.Left + 10;
    inc(t);
    if t = 60 then
    begin
      ImgShield.Visible := false;
      k := false;
      t := 0;
    end;
  end;

  if s1 = true then
  begin
    inc(c1);
    if c1 = 70 then
    begin
      c1 := 0;
      s1 := false;
    end;
  end;

  if s2 = true then
  begin
    inc(c2);
    if c2 = 60 then
    begin
      c2 := 0;
      s2 := false;
    end;
  end;

  if s11 = true then
  begin
    inc(c11);
    if c11 = 90 then
    begin
      c11 := 0;
      s11 := false;
    end;
  end;

  if boom = false then
  begin
    ImgBoom.Visible := false;
  end;
  if boom = true then
  begin
    ImgBoom.Visible := true;
    ImgBoom.Top := ImgPlayer.Top - 10;
    ImgBoom.Left := ImgPlayer.Left - 10;
    if boomtimer = 20 then
    begin
      boom := false;
      boomtimer := 0;
    end;
  end;

  if ((score = 25) and (cc = false) and (PoliceTimer = false)) then
  begin
    ImgDestroy.Picture.LoadFromFile('Images\ImgFrameDestroy.png');
    ImgDestroy.Visible := true;
    ImgDestroy.Left := 100;
    ImgDestroy.Top := 200;
    Timer1.Enabled := false;
    Timer3.Enabled := false;
    TimerCarRed.Enabled := false;
    TimerCarRedFast.Enabled := false;
    TimerCarBlue.Enabled := false;
    TimerRoad.Enabled := false;
    TimerCoins.Enabled := false;
    pp := true;
  end;

  if ((pp = true) and (PoliceTimer = false)) then
  begin
    ImgPoliceCar.Top := ImgPoliceCar.Top + 4;
    Timer3.Enabled := false;
    TimerCarRed.Enabled := false;
    TimerCarRedFast.Enabled := false;
    TimerCarBlue.Enabled := false;
    TimerCoins.Enabled := false;
    ImgCarRedFast.Top := 890;
    ImgCarBlue.Top := 700;
    ImgCarRed.Top := 1000;
    if ((ImgCarRed.Left = 77) and (ImgCarRedFast.Left = 77) and
      (ImgCarBlue.Left = 77)) then
    begin
      a := Random(100);
      case a of
        0 .. 49:
          begin
            ImgCarRed.Left := 167;
          end;
        50 .. 100:
          begin
            ImgCarRed.Left := 256;
          end;
      end;
    end;

    if ((ImgCarRed.Left = 167) and (ImgCarRedFast.Left = 167) and
      (ImgCarBlue.Left = 167)) then
    begin
      a := Random(100);
      case a of
        0 .. 49:
          begin
            ImgCarBlue.Left := 77;
          end;
        50 .. 100:
          begin
            ImgCarBlue.Left := 256;
          end;
      end;
    end;

    if ((ImgCarRed.Left = 256) and (ImgCarRedFast.Left = 256) and
      (ImgCarBlue.Left = 256)) then
    begin
      a := Random(100);
      case a of
        0 .. 49:
          begin
            ImgCarRedFast.Left := 7;
          end;
        50 .. 100:
          begin
            ImgCarRedFast.Left := 167;
          end;
      end;
    end;

    ImgCoin5.Top := -300;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgCoin5.Left := 81;
        end;
      34 .. 67:
        begin
          ImgCoin5.Left := 171
        end;
      68 .. 100:
        begin
          ImgCoin5.Left := 260;
        end;
    end;
    ImgCoin10.Top := -1000;
    a1 := Random(100);
    case a1 of
      0 .. 33:
        begin
          ImgCoin10.Left := 81;
        end;
      34 .. 67:
        begin
          ImgCoin10.Left := 171;
        end;
      68 .. 100:
        begin
          ImgCoin10.Left := 260;
        end;
    end;
    ImgCoin15.Top := -1500;
    a2 := Random(100);
    case a1 of
      0 .. 33:
        begin
          ImgCoin15.Left := 81;
        end;
      34 .. 67:
        begin
          ImgCoin15.Left := 171;
        end;
      68 .. 100:
        begin
          ImgCoin15.Left := 260;
        end;
    end;
    ImgPit.Top := -600;
    a2 := Random(100);
    case a1 of
      0 .. 33:
        begin
          ImgPit.Left := 77;
        end;
      34 .. 67:
        begin
          ImgPit.Left := 167;
        end;
      68 .. 100:
        begin
          ImgPit.Left := 256;
        end;
    end;
    ShootTimer := true;
    Tank := true;
  end;

  if Tank = true then
  begin
    ImgTank.Picture.LoadFromFile('Images\ImgTank.png');
    ImgTank.Visible := true;
    ImgTank.Left := ImgPlayer.Left + 4;
    ImgTank.Top := ImgPlayer.Top - 20;
  end;

  if TimerCoins.Enabled = false then
  begin
    ImgCoins.Visible := false;
    Coin5 := false;
    Coin10 := false;
    Coin15 := false;
  end;

  if ImgPoliceCar.Top = 60 then
  begin
    PoliceTimer := true;
    ImgPoliceCar.Left := ImgPoliceCar.Left - 2;
  end;

  if (ImgPoliceCar.Left < ImgRoad1.Left + 77) or
    (ImgPoliceCar.Left < ImgRoad2.Left + 77) then
  begin
    ImgPoliceCar.Top := 80;
  end;

  if ImgPoliceCar.Top = 80 then
  begin
    ImgPoliceCar.Left := ImgPoliceCar.Left + 2;
  end;

  if (ImgPoliceCar.Left + ImgPoliceCar.width > ImgRoad1.Left + ImgRoad1.width -
    87) or (ImgPoliceCar.Left + ImgPoliceCar.width > ImgRoad2.Left +
    ImgRoad1.width - 87) then
  begin
    ImgPoliceCar.Top := 100;
  end;

  if ImgPoliceCar.Top = 100 then
  begin
    ImgPoliceCar.Left := ImgPoliceCar.Left - 2;
  end;

  if (getasynckeystate($20) <> 0) and (ShootTimer = true) and (Tank = true) and
    (ImgDestroy.Visible = false) then
  begin
  end;
  ImgShoot.Top := ImgShoot.Top - 10;

  if ((ImgPoliceCar.Left + ImgPoliceCar.width > ImgShoot.Left) and
    (ImgPoliceCar.Left < ImgShoot.Left + ImgShoot.width) and
    (ImgPoliceCar.Top + ImgPoliceCar.Height > ImgShoot.Top) and
    (ImgPoliceCar.Top < ImgShoot.Top + ImgShoot.Height)) then
  begin
    ImgShoot.Visible := false;
    pp := false;
    gg := true;
    TimerCarRed.Enabled := true;
    TimerCarRedFast.Enabled := true;
    TimerCarBlue.Enabled := true;
    TimerCoins.Enabled := true;
    Tank := false;
    ImgTank.Visible := false;
    ImgPit.Visible := true;
    dd := true;
    ImgPoliceCar.Top := -220;
    a2 := Random(100);
    case a1 of
      0 .. 33:
        begin
          ImgPoliceCar.Left := 80;
        end;
      34 .. 67:
        begin
          ImgPoliceCar.Left := 169;
        end;
      68 .. 100:
        begin
          ImgPoliceCar.Left := 253;
        end;
    end;
    if (dd = true) and (hh < 1) and (LabelScoreNum.Caption = inttostr(25)) then
    begin
      sh1 := 1;
      inc(ShieldNum);
      inc(sh);
      dd := false;
    end;
    if (dd = true) and (hh < 1) then
    begin
      inc(ShieldNum);
      inc(sh);
      dd := false;
    end;
    Timer3.Enabled := true;
  end;

  if sh1 = 1 then
  begin
    ImgDestroy.Picture.LoadFromFile('Images\ImgFrameShield.png');
    ImgDestroy.Visible := true;
    ImgDestroy.Left := 100;
    ImgDestroy.Top := 200;
    Timer1.Enabled := false;
    Timer3.Enabled := false;
    TimerCarRed.Enabled := false;
    TimerCarRedFast.Enabled := false;
    TimerCarBlue.Enabled := false;
    TimerRoad.Enabled := false;
    TimerCoins.Enabled := false;
  end;

  if sh2 = 1 then
  begin
    ImgDestroy.Picture.LoadFromFile('Images\ImgFrame3Shield.png');
    ImgDestroy.Visible := true;
    ImgDestroy.Left := 100;
    ImgDestroy.Top := 200;
    Timer1.Enabled := false;
    Timer3.Enabled := false;
    TimerCarRed.Enabled := false;
    TimerCarRedFast.Enabled := false;
    TimerCarBlue.Enabled := false;
    TimerRoad.Enabled := false;
    TimerCoins.Enabled := false;
  end;

  if sh = 1 then
  begin
    ImgShieldBonus.Visible := true;
    LabelShield.Visible := true;
    LabelShield.Caption := inttostr(1);
  end;
  if sh = 2 then
  begin
    ImgShieldBonus.Visible := true;
    LabelShield.Visible := true;
    LabelShield.Caption := inttostr(2);
  end;
  if sh = 3 then
  begin
    ImgShieldBonus.Visible := true;
    LabelShield.Visible := true;
    LabelShield.Caption := inttostr(3);
  end;
  if sh = 4 then
  begin
    sh2 := 1;
    sh := 3;
    ShieldNum := 3;
  end;

  if ImgPoliceCar.Top = -220 then
  begin
    inc(p);
    if p = 100 then
    begin
      PoliceTimer := false;
      p := 0;
    end;
  end;
  if (ImgCarRedFast.Top > Form_Game.Height) then
  begin
    ImgCarRedFast.Top := -500;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgCarRedFast.Left := 77;
        end;
      34 .. 67:
        begin
          ImgCarRedFast.Left := 167
        end;
      68 .. 100:
        begin
          ImgCarRedFast.Left := 256;
        end;
    end;

    if (ImgCarBlue.Top > Form_Game.Height) then
    begin
      ImgCarBlue.Top := -150;
      a := Random(100);
      case a of
        0 .. 33:
          begin
            ImgCarBlue.Left := 77;
          end;
        34 .. 67:
          begin
            ImgCarBlue.Left := 167;
          end;
        68 .. 100:
          begin
            ImgCarBlue.Left := 256;
          end;
      end;

      if (ImgCarRed.Top > Form_Game.Height) then
      begin
        ImgCarRed.Top := -300;
        a := Random(100);
        case a of
          0 .. 33:
            begin
              ImgCarRed.Left := 77;
            end;
          34 .. 67:
            begin
              ImgCarRed.Left := 167;
            end;
          68 .. 100:
            begin
              ImgCarRed.Left := 256;
            end;
        end;

        if ((ImgCarRed.Left = 77) and (ImgCarRedFast.Left = 77) and
          (ImgCarBlue.Left = 77)) then
        begin
          a := Random(100);
          case a of
            0 .. 49:
              begin
                ImgCarRed.Left := 167;
              end;
            50 .. 100:
              begin
                ImgCarRed.Left := 256;
              end;
          end;
        end;

        if ((ImgCarRed.Left = 167) and (ImgCarRedFast.Left = 167) and
          (ImgCarBlue.Left = 167)) then
        begin
          a := Random(100);
          case a of
            0 .. 49:
              begin
                ImgCarBlue.Left := 77;
              end;
            50 .. 100:
              begin
                ImgCarBlue.Left := 256;
              end;
          end;
        end;

        if ((ImgCarRed.Left = 256) and (ImgCarRedFast.Left = 256) and
          (ImgCarBlue.Left = 256)) then
        begin
          a := Random(100);
          case a of
            0 .. 49:
              begin
                ImgCarRedFast.Left := 77;
              end;
            50 .. 100:
              begin
                ImgCarRedFast.Left := 167;
              end;
          end;
        end;
      end;
    end;
  end;
  if boom = true then
  begin
    inc(boomtimer);
  end;
end;

procedure TForm_Game.Timer3Timer(Sender: TObject);
begin
  if gg = true then
  begin
    inc(hh);
    if hh = 25 then
    begin
      hh := 0;
      pp := true;
      gg := false;
    end;
  end;
  if ss = true then
  begin
    inc(ss1);
    if ss1 = 35 then
    begin
      TimerRoad.Interval := TimerRoad.Interval - 1;
      TimerCarRed.Interval := TimerCarRed.Interval - 1;
      TimerCarBlue.Interval := TimerCarBlue.Interval - 1;
      TimerCoins.Interval := TimerCoins.Interval - 1;
      ss1 := 0;
    end;
  end;
  if TimerRoad.Interval = 11 then
  begin
    ImgMaxSpeed.Visible := true;
    LabelMaxSpeed.Visible := true;
    ss := false;
  end;
  inc(score);
  LabelScoreNum.Caption := inttostr(score);
  if ShieldTimer = true then
  begin
    inc(sh);
  end;
end;

procedure TForm_Game.TimerCarBlueTimer(Sender: TObject);
begin
  ImgCarBlue.Top := ImgCarBlue.Top + 4;
  if TimerRoad.Interval < 20 then
  begin
    ImgCarBlue.Top := ImgCarBlue.Top + 5;
  end;
end;

procedure TForm_Game.TimerCarRedFastTimer(Sender: TObject);
begin
  if (s1 = true) or (s11 = true) then
  begin
    ImgCarRedFast.Top := ImgCarRedFast.Top + 2;
  end
  else
    ImgCarRedFast.Top := ImgCarRedFast.Top + 7;
end;

procedure TForm_Game.TimerCarRedTimer(Sender: TObject);
begin
  if s2 = true then
  begin
    ImgCarRed.Top := ImgCarRed.Top + 2;
  end
  else
    ImgCarRed.Top := ImgCarRed.Top + 6;
end;

procedure TForm_Game.TimerCoinIconTimer(Sender: TObject);
begin
  inc(x);
  if x = 1 then
  begin
    ImgCoinIcon.Picture.LoadFromFile('Images\ImgCoin-1.png');
  end;

  if x = 2 then
  begin
    ImgCoinIcon.Picture.LoadFromFile('Images\ImgCoin-2.png');
  end;

  if x = 3 then
  begin
    ImgCoinIcon.Picture.LoadFromFile('Images\ImgCoin-3.png');
  end;

  if x = 4 then
  begin
    ImgCoinIcon.Picture.LoadFromFile('Images\ImgCoin-4.png');
  end;

  if x = 5 then
  begin
    ImgCoinIcon.Picture.LoadFromFile('Images\ImgCoin-5.png');
  end;

  if x = 6 then
  begin
    ImgCoinIcon.Picture.LoadFromFile('Images\ImgCoin-1.png');
    x := 0;
  end;

  if x > 6 then
  begin
    x := 0;
  end;
end;

procedure TForm_Game.TimerCoinsTimer(Sender: TObject);
begin
  randomize;
  ImgCoin5.Top := ImgCoin5.Top + 6;
  ImgCoin10.Top := ImgCoin10.Top + 6;
  ImgCoin15.Top := ImgCoin15.Top + 6;
  ImgPit.Top := ImgPit.Top + 4;

  if ((ImgCoin5.Left + ImgCoin5.width > ImgPlayer.Left) and
    (ImgCoin5.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgCoin5.Top + ImgCoin5.Height > ImgPlayer.Top) and
    (ImgCoin5.Top < ImgPlayer.Top + ImgPlayer.Height) and (Coin5 = false)) then
  begin
    sndPlaySound('Music\SoundCoins.wav', SND_NODEFAULT Or SND_ASYNC);
    ImgCoin5.Top := ImgCoin5.Top - 1500;
    CoinScore := CoinScore + 5;
    LabelCoinsNum.Caption := inttostr(CoinScore);
    Coin5 := true;
  end;
  if ((ImgCoin10.Left + ImgCoin10.width > ImgPlayer.Left) and
    (ImgCoin10.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgCoin10.Top + ImgCoin10.Height > ImgPlayer.Top) and
    (ImgCoin10.Top < ImgPlayer.Top + ImgPlayer.Height) and (Coin10 = false))
  then
  begin
    sndPlaySound('Music\SoundCoins.wav', SND_NODEFAULT Or SND_ASYNC);
    ImgCoin10.Top := ImgCoin10.Top - 3500;
    CoinScore := CoinScore + 10;
    LabelCoinsNum.Caption := inttostr(CoinScore);
    Coin10 := true;
  end;
  if ((ImgCoin15.Left + ImgCoin15.width > ImgPlayer.Left) and
    (ImgCoin15.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgCoin15.Top + ImgCoin15.Height > ImgPlayer.Top) and
    (ImgCoin15.Top < ImgPlayer.Top + ImgPlayer.Height) and (Coin15 = false))
  then
  begin
    sndPlaySound('Music\SoundCoins.wav', SND_NODEFAULT Or SND_ASYNC);
    ImgCoin15.Top := ImgCoin15.Top - 10500;
    CoinScore := CoinScore + 15;
    LabelCoinsNum.Caption := inttostr(CoinScore);
    Coin15 := true;
  end;
  if ((ImgPit.Left + ImgPit.width > ImgPlayer.Left) and
    (ImgPit.Left < ImgPlayer.Left + ImgPlayer.width) and
    (ImgPit.Top + ImgPit.Height > ImgPlayer.Top) and
    (ImgPit.Top < ImgPlayer.Top + ImgPlayer.Height) and (pit = false)) then
  begin
    sndPlaySound('Music\SoundPit.wav', SND_NODEFAULT or SND_ASYNC);
    ImgPit.Top := ImgPit.Top - 1500;
    pit := true;
  end;

  if Coin5 = true then
  begin
    ImgCoins.Picture.LoadFromFile('Images\ImgCoins5.png');
    ImgCoins.Visible := true;
    inc(cn5);
    if cn5 = 40 then
    begin
      ImgCoins.Visible := false;
      Coin5 := false;
      cn5 := 0;
    end;
  end;

  if Coin10 = true then
  begin
    ImgCoins.Picture.LoadFromFile('Images\ImgCoins10.png');
    ImgCoins.Visible := true;
    inc(cn10);
    if cn10 = 40 then
    begin
      ImgCoins.Visible := false;
      Coin10 := false;
      cn10 := 0;
    end;
  end;

  if Coin15 = true then
  begin
    ImgCoins.Picture.LoadFromFile('Images\ImgCoins15.png');
    ImgCoins.Visible := true;
    inc(cn15);
    if cn15 = 40 then
    begin
      ImgCoins.Visible := false;
      Coin15 := false;
      cn15 := 0;
    end;
  end;

  if (ImgCoin5.Top > Form_Game.Height) then
  begin
    ImgCoin5.Top := -1000;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgCoin5.Left := 81;
        end;
      34 .. 67:
        begin
          ImgCoin5.Left := 171
        end;
      68 .. 100:
        begin
          ImgCoin5.Left := 260;
        end;
    end;
  end;

  if (ImgCoin10.Top > Form_Game.Height) then
  begin
    ImgCoin10.Top := -3000;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgCoin10.Left := 81;
        end;
      34 .. 67:
        begin
          ImgCoin10.Left := 171;
        end;
      68 .. 100:
        begin
          ImgCoin10.Left := 260;
        end;
    end;
  end;

  if (ImgCoin15.Top > Form_Game.Height) then
  begin
    ImgCoin15.Top := -10000;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgCoin15.Left := 81;
        end;
      34 .. 67:
        begin
          ImgCoin15.Left := 171;
        end;
      68 .. 100:
        begin
          ImgCoin15.Left := 260;
        end;
    end;
  end;

  if (ImgPit.Top > Form_Game.Height) then
  begin
    ImgPit.Top := -1000;
    a := Random(100);
    case a of
      0 .. 33:
        begin
          ImgPit.Left := 77;
        end;
      34 .. 67:
        begin
          ImgPit.Left := 167
        end;
      68 .. 100:
        begin
          ImgPit.Left := 256;
        end;
    end;
  end;

end;

procedure TForm_Game.TimerPoliceCarTimer(Sender: TObject);
begin
  ImgPoliceCar.Top := ImgPoliceCar.Top + 4;
end;

procedure TForm_Game.TimerRoadTimer(Sender: TObject);
begin
  ImgRoad1.Top := ImgRoad1.Top + 4;
  ImgRoad2.Top := ImgRoad2.Top + 4;
  if (ImgRoad1.Top > Form_Game.Height) then
  begin
    ImgRoad1.Top := -600;
  end;

  if (ImgRoad2.Top > Form_Game.Height) then
  begin
    ImgRoad2.Top := -600;
  end;
  if pit = true then
  begin
    ImgBrake.Picture.LoadFromFile('Images\ImgBrake.png');
    ImgBrake.Visible := true;
    inc(Brake);
    if Brake = 80 then
    begin
      ImgBrake.Visible := false;
      pit := false;
      Brake := 0;
    end;
  end;
end;

end.
