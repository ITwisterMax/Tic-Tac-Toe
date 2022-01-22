unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.MPlayer;

//��� ��� �������� ����������� ���� ���������
type
  TEventMoveProgram = function(): Boolean of object;

type
  TGame = class(TForm)
    //��������
    Pages: TPageControl;

    //������� ����
    MainMenu: TTabSheet;
    //��� 1
    BackGroundImage1: TImage;
    //������
    Music: TMediaPlayer;
    //���������
    Head: TLabel;
    //������ ������������ ������ 1
    Player: TButton;
    //������ ������������ ������ 2
    Players: TButton;
    //������� + �����
    Help: TButton;
    //����� �� ����
    GameExit: TButton;

    //����� : ����� ������ ��������� (����� ����� 1)
    PlayerVSProgram: TTabSheet;
    //��� 2
    BackGroundImage2: TImage;
    //������� (����� 1)
    Score1: TLabel;
    //������ (����� 1)
    PanelForGame1: TPanel;
    //���� ������ (����� 1)
    PlayerScore: TLabel;
    //���� ��������� (����� 1)
    ProgramScore: TLabel;
    //������� ��� ����� ����� (����� 1)
    CounterText1: TLabel;
    //���� ����� (����� 1)
    Counter1: TLabel;
    //������� ��� ��� ������ (����� 1)
    GameCountText1: TLabel;
    //���� ��� ������ (����� 1)
    GameCount1: TLabel;
    //����� � ������� ���� (����� 1)
    MainMenuExit1: TButton;

    //����� : ����� ������ ������ (����� ����� 2)
    PlayerVSPlayer: TTabSheet;
    //��� 3
    BackGroundImage3: TImage;
    //������� (����� 2)
    Score2: TLabel;
    //������ (����� 2)
    PanelForGame2: TPanel;
    //���� ������ 1 (����� 2)
    Player1Score: TLabel;
    //���� ������ 2 (����� 2)
    Player2Score: TLabel;
    //������� ��� ����� ����� (����� 2)
    CounterText2: TLabel;
    //���� ����� (����� 2)
    Counter2: TLabel;
    //������� ��� ��� ������ (����� 2)
    GameCountText2: TLabel;
    //���� ��� ������ (����� 2)
    GameCount2: TLabel;
    //����� � ������� ���� (����� 2)
    MainMenuExit2: TButton;

    //�����
    HelpPage: TTabSheet;
    //��� 4
    BackGroundImage4: TImage;
    //����� ���������
    Text1: TLabel;
    //����� ������ ���������
    Text2: TLabel;
    //����� ������ ������ ���� �� �������/�����
    Text3: TLabel;
    //������ (�����)
    PanelForOptions: TPanel;
    //������ ������ ������
    Group1: TGroupBox;
    //������ ���������
    Easy: TRadioButton;
    //���������� ���������
    Normal: TRadioButton;
    //������� ���������
    Difficult: TRadioButton;
    //������ ������ ������
    Group2: TGroupBox;
    //�������
    X: TRadioButton;
    //�����
    O: TRadioButton;
    //����� � ������� ���� (�����)
    MainMenuExit3: TButton;

    //������ ����
    procedure FormCreate(Sender: TObject);
    //������ ������
    procedure OnNotify(Sender: TObject);
    //������������ ������ 1
    procedure PlayerClick(Sender: TObject);
    //������������ ������ 2
    procedure PlayersClick(Sender: TObject);
    //������ �����
    procedure HelpClick(Sender: TObject);
    //����� �� ����
    procedure GameExitClick(Sender: TObject);

    //������� ������ (����� 1)
    procedure ButtonCellClick1(Sender: TObject);
    //������� ������ (����� 2)
    procedure ButtonCellClick2(Sender: TObject);

    //����� � ������� ���� (����� 1)
    procedure MainMenuExit1Click(Sender: TObject);

    //����� � ������� ���� (����� 2)
    procedure MainMenuExit2Click(Sender: TObject);

    //������ �����
    procedure StartHelp(Sender: TObject);
    //����� � ������� ���� (�����)
    procedure MainMenuExit3Click(Sender: TObject);

  private
    //������ ������� ������
    ButtonsArray : array [1 .. 9] of TButton;

    //��� ������ �����
    fPlayerSel: Byte;
    //��� ������ ���������
    fProgramSel: Byte;
    //��� ������ ����� 1
    fPlayer1Sel: Byte;
    //��� ������ ����� 2
    fPlayer2Sel: Byte;
    //���������� ��������� ���
    fCountGames1: Integer;
    //���������� ��������� ���
    fCountGames2: Integer;
    //����������� ������ ���������
    fOnMoveProgram: TEventMoveProgram;

    //��������� ������� ��� �����
    procedure SetSign(cBtn: TButton; cSign: Integer);

    //������ ���������
    function MoveProgramDefault(): Boolean;
    function MoveProgramLevel1(): Boolean;
    function MoveProgramLevel2(): Boolean;
    function MoveProgramLevel3(): Boolean;

    //��� ��������� ����� ������
    property OnMoveProgram: TEventMoveProgram read fOnMoveProgram write fOnMoveProgram;

  public
    //����� ������ 1
    procedure StartGame1();
    //����� ������ 2
    procedure StartGame2();

    //������� ���� (����� 1)
    procedure RestartGame1(cCode: Integer = 0);
    //������� ���� (����� 2)
    procedure RestartGame2(cCode: Integer = 0);

    //�������� ���������� ����
    function CheckEnd(): Integer;
    //��� ���������
    procedure MoveProgram();

    //��� ��������� ����� ������
    property PlayerSel: Byte read fPlayerSel write fPlayerSel;
    property Player1Sel: Byte read fPlayer1Sel write fPlayer1Sel;
    property Player2Sel: Byte read fPlayer2Sel write fPlayer2Sel;
    property ProgramSel: Byte read fProgramSel write fProgramSel;
    property CountGames1: Integer read fCountGames1 write fCountGames1;
    property CountGames2: Integer read fCountGames2 write fCountGames2;
  end;

var
  //�����
  Game: TGame;
  //����������, ��� �����
  TempPlayer : Boolean;

implementation

{$R *.dfm}

const
  //������ � ������������
  IdolArray : array [1 .. 8, 1 .. 3] of Byte = (
    (1, 2, 3), // 1 - �������������� �����
    (4, 5, 6), // 2 - �������������� �����
    (7, 8, 9), // 3 - �������������� �����
    (1, 4, 7), // 1 - ������������ �����
    (2, 5, 8), // 2 - ������������ �����
    (3, 6, 9), // 3 - ������������ �����
    (1, 5, 9), // 1 - ������������ �����
    (3, 5, 7) // 2 - ������������ �����
    );

//��������� ������ 1 � 2
procedure TGame.MoveProgram;
var
  i : Integer;
begin
  //��� ���������
  if Assigned(OnMoveProgram) then OnMoveProgram;

  i := CheckEnd;
  if i <> 0 then
    RestartGame1(i);
end;

function TGame.MoveProgramDefault: Boolean;
var
  WinV1, WinV2, i, Sum: Integer;
begin
  //�������� ���������� ����������
  Result := False;
  WinV1 := -1;
  WinV2 := -1;
  for i := 1 to 8 do
  begin
    //������� �����
    Sum := ButtonsArray[IdolArray[i, 1]].Tag
      + ButtonsArray[IdolArray[i, 2]].Tag
      + ButtonsArray[IdolArray[i, 3]].Tag;

    //� ��������� ���� ���������� �������
    if ProgramSel * 2 = Sum then
      begin
        WinV1 := i;
        Break;
      end
    //� ������ ���� ���������� �������
    else if PlayerSel * 2 = Sum then WinV2 := i;
  end;

  //���� � ��������� ��� ���������� �������, ������� ��������� ���� ���������
  if WinV1 < 0 then WinV1 := WinV2;
  if WinV1 > 0 then
    for i := 1 to 3 do
      if ButtonsArray[IdolArray[WinV1, i]].Tag = 0 then
        begin
          SetSign(ButtonsArray[IdolArray[WinV1, i]], ProgramSel);
          Result := True;
          Exit;
        end;

  //�������� �� ������ ����������� ������
  if ButtonsArray[5].Tag = 0 then
    begin
      SetSign(ButtonsArray[5], ProgramSel);
      Result := True;
    end;
end;

function TGame.MoveProgramLevel1: Boolean;
var
  i, r, k: Integer;
begin
  //�������� ��������� ����� �� 1 �� 27
  r := 1 + Random(27);
  k := 0;

  //����� ���� ��������� ������ � ������� ���
  while k < r do
    for i := 1 to 9 do
      if ButtonsArray[i].Tag = 0 then
        begin
          inc(k);
          if k = r then
            begin
              SetSign(ButtonsArray[i], ProgramSel);
              Break;
            end;
        end;

  Result := True;
end;

function TGame.MoveProgramLevel2: Boolean;
begin
  //��� ���������� �������
  Result := MoveProgramDefault();
  //��� �� �����
  if not Result then
    Result := MoveProgramLevel1();
end;

function TGame.MoveProgramLevel3: Boolean;
var
  i, Sum : Integer;
const
  TempArray : array [1 .. 4] of Byte = (1, 3, 7, 9);
begin
  //��� ������� �������
  Sum := 0;
  for i := 1 to 9 do
    Sum := Sum + ButtonsArray[i].Tag;

  //������ ������
  if Sum = PlayerSel * 2 + ProgramSel then
    if (ButtonsArray[1].Tag + ButtonsArray[5].Tag + ButtonsArray[9].Tag = Sum)
    or (ButtonsArray[7].Tag + ButtonsArray[5].Tag + ButtonsArray[3].Tag = Sum) then
      begin
        //����� �� ����
        SetSign(ButtonsArray[2], ProgramSel);
        Result := True;
        Exit;
      end;

  //������ ���, ������ � ����, � �� � �����
  Randomize;
  if Sum = 0 then
  begin
    i := Random(99);
    if i mod 2 = 0 then
      begin
        i := 1 + Random(3);
        SetSign(ButtonsArray[TempArray[i]], ProgramSel);
        Result := True;
        Exit;
      end;
  end;

  //��������� ������ ������ �� � �����, ����� ����� � �����
  if (Sum = PlayerSel + ProgramSel) and (ButtonsArray[5].Tag = PlayerSel) then
    for i := 1 to 4 do
      if ButtonsArray[TempArray[i]].Tag = ProgramSel then
        begin
          SetSign(ButtonsArray[TempArray[5 - i]], ProgramSel);
          Result := True;
          Exit;
        end;

  Result := MoveProgramDefault();
  //�������� �������
  if not Result then
    for i := 1 to 4 do
      if ButtonsArray[TempArray[i]].Tag = 0 then
        begin
          SetSign(ButtonsArray[TempArray[i]], ProgramSel);
          Result := True;
          Break;
        end;

  //��� �� �����
  if not Result then
    Result := MoveProgramLevel1();
end;

procedure TGame.SetSign(cBtn: TButton; cSign: Integer);
begin
  //������ �� ������ ������� ��� �����
  with cBtn do
    begin
      Font.Size := 26;
      Font.Style := [fsBold];
      Font.Name := 'Times New Roman';
      case cSign of
        1:
          begin
            Caption := '0';
            Tag := 1;
          end;
        10:
          begin
            Caption := '�';
            Tag := 10;
          end;
      end;
    end;
end;

procedure TGame.ButtonCellClick1(Sender: TObject);
var
  i, j : Integer;
begin
  //���������� ������� ������ �������
  if TButton(Sender).Tag > 0 then Exit;

  SetSign(TButton(Sender), PlayerSel);

  //�������� ���������� �����
  j := StrToInt(Trim(Counter1.Caption));
  inc(j);
  Counter1.Caption := IntToStr(j) + ' ';

  //������� ���� ��� ��� ���������
  i := CheckEnd;
  if i <> 0 then
    RestartGame1(i)
  else
    MoveProgram;
end;

procedure TGame.ButtonCellClick2(Sender: TObject);
var
  i, j : Integer;
begin
  //���������� ������� ������ �������
  if TButton(Sender).Tag > 0 then Exit;

  if TempPlayer then SetSign(TButton(Sender), Player2Sel)
  else SetSign(TButton(Sender), Player1Sel);

  //�������� ���������� �����
  j := StrToInt(Trim(Counter2.Caption));
  if not TempPlayer then inc(j);
  Counter2.Caption := IntToStr(j) + ' ';

  //������� ���� ��� ��� ���������
  i := CheckEnd;
  if i <> 0 then
    RestartGame2(i)
  else
    TempPlayer := not TempPlayer;
end;

function TGame.CheckEnd: Integer;
var
  //������� � �����
  i, Sum: Integer;
  //������� ����, ��� ���� ���������
  IsEnd: Boolean;
begin
  //��������� ������� ���������� ����
  IsEnd := True;

  //����� �������� ���������� ����
  for i := 1 to 8 do
  begin
    //C������ �����
    Sum := ButtonsArray[IdolArray[i, 1]].Tag
    + ButtonsArray[IdolArray[i, 2]].Tag
    + ButtonsArray[IdolArray[i, 3]].Tag;

    case Sum of
      //������ �������
      3:
        begin
          Result := 1;
          Exit;
        end;
      //������ ���������
      30:
        begin
          Result := 10;
          Exit;
        end;
      //��� ������ ������
      12:
        Continue;
      //��� ������ ������
      21:
        Continue;
      else
        IsEnd := False;
    end;
  end;

  if IsEnd then
    //���� ��������
    Result := -1
  else
    //���� ������������
    Result := 0;
end;

procedure TGame.RestartGame1(cCode: Integer);
var
  i : Integer;
begin
  //���������� ��������� ���
  inc(fCountGames1);

  //��������� ������� ��������� ���� � �������� ����������
  case cCode of
    -1:
        begin
          //�������� ��� ������
          ShowMessage('����� ������ ������...');
          i := StrToInt(Trim(GameCount1.Caption));
          inc(i);
          GameCount1.Caption := IntToStr(i) + ' ';
        end;
     1:
        begin
          //�������� ����� �������
          if O.Checked then
            begin
              ShowMessage('����� ������� �����...');
              i := StrToInt(Trim(PlayerScore.Caption));
              inc(i);
              PlayerScore.Caption := IntToStr(i) + ' ';
            end
          else
            begin
              ShowMessage('����� �������� ���������...');
              i := StrToInt(Trim(ProgramScore.Caption));
              inc(i);
              ProgramScore.Caption := IntToStr(i) + ' ';
            end;
        end;
    10:
        begin
          //�������� ����� ���������
          if X.Checked then
            begin
              ShowMessage('����� ������� �����...');
              i := StrToInt(Trim(PlayerScore.Caption));
              inc(i);
              PlayerScore.Caption := IntToStr(i) + ' ';
            end
          else
            begin
              ShowMessage('����� �������� ���������...');
              i := StrToInt(Trim(ProgramScore.Caption));
              inc(i);
              ProgramScore.Caption := IntToStr(i) + ' ';
            end;
        end;
  end;

  //��������� ���������� �����
  Counter1.Caption := '0 ';

  //�������� ����� ����
  StartGame1;
end;

procedure TGame.RestartGame2(cCode: Integer);
var
  i : Integer;
begin
  //���������� ��������� ���
  inc(fCountGames2);

  //��������� ������� ��������� ���� � �������� ����������
  case cCode of
    -1:
        begin
          //�������� ��� ������
          ShowMessage('����� ������ ������...');
          i := StrToInt(Trim(GameCount2.Caption));
          inc(i);
          GameCount2.Caption := IntToStr(i) + ' ';
        end;
     1:
        begin
          ShowMessage('����� ������� ����� 2...');
          i := StrToInt(Trim(Player2Score.Caption));
          inc(i);
          Player2Score.Caption := IntToStr(i) + ' ';
        end;
    10:
        begin
          ShowMessage('����� ������� ����� 1...');
          i := StrToInt(Trim(Player1Score.Caption));
          inc(i);
          Player1Score.Caption := IntToStr(i) + ' ';
        end;
  end;

  //��������� ���������� �����
  Counter2.Caption := '0 ';

  //�������� ����� ����
  StartGame2;
end;


//������� ����
procedure TGame.FormCreate(Sender: TObject);
begin
  //��������������� �������
  Music.Play;

  //C������� ��������
  MainMenu.TabVisible := False;
  PlayerVSProgram.TabVisible := False;

  //������������� ������� ��������
  Pages.ActivePage := MainMenu;

  //�������� ������ �������, ��������� - �����
  PlayerSel := 10;
  ProgramSel := 1;

  //����������� ������� ��������� � ����� ����
  X.Checked := True;
  Easy.Checked := True;

  //�������������� ��������� ��������� �����
  Randomize;
end;

procedure TGame.OnNotify(Sender: TObject);
begin
  //���������� �������
  with Music do
  if NotifyValue = nvSuccessful then
    begin
      Notify := True;
      Play;
    end;
end;

procedure TGame.PlayerClick(Sender: TObject);
begin
  //������� � ����� ����� ������ ���������
  Pages.ActivePage := PlayerVSProgram;

  //������� ���
  CountGames1 := 1;

  //������ ���������
  if Easy.Checked then
    OnMoveProgram := MoveProgramLevel1;
  if Normal.Checked then
    OnMoveProgram := MoveProgramLevel2;
  if Difficult.Checked then
    OnMoveProgram := MoveProgramLevel3;

  //��������� ����������
  PlayerScore.Caption := '0 ';
  ProgramScore.Caption := '0 ';
  GameCount1.Caption := '0 ';
  Counter1.Caption := '0 ';

  //������ ����
  StartGame1;
end;

procedure TGame.PlayersClick(Sender: TObject);
begin
  //������� � ����� ����� ������ ������
  Pages.ActivePage := PlayerVSPlayer;

  //������� ���
  CountGames2 := 1;

  //��������� ����������
  Player1Score.Caption := '0 ';
  Player2Score.Caption := '0 ';
  GameCount2.Caption := '0 ';
  Counter2.Caption := '0 ';

  //������ ����
  StartGame2;
end;

procedure TGame.HelpClick(Sender: TObject);
begin
  //������� � �����
  Pages.ActivePage := HelpPage;
end;

procedure TGame.GameExitClick(Sender: TObject);
begin
  //��������� ����
  Game.Close;
end;


//����� 1
procedure TGame.StartGame1;
var
  //������� � ������ �������� ����
  i, Area: Integer;

const
  //������ ������
  Button_Size = 60;
  //������� ����� �����
  Grid_Width = 2;

begin
  //����������, ��� ��� ������
  if X.Checked then
    begin
      PlayerSel := 10;
      ProgramSel := 1;
    end
  else
    begin
      PlayerSel := 1;
      ProgramSel := 10;
    end;

  //������ �������� ����
  Area := Button_Size * 3 + Grid_Width * 2;
  with PanelForGame1 do
    begin
      ClientWidth := Area;
      ClientHeight := Area;

      //���������� �������� ����
      Top := 152;
      Left := 15;
    end;

  //������ ������ (� ������ �������)
  Area := Button_Size + Grid_Width;

  //�������� � ��������� �������� ����
  for i := 1 to 9 do
  begin
    ButtonsArray[i] := TButton.Create(self);
    with ButtonsArray[i] do
      begin
        //��������� �������
        Height := Button_Size;
        Width := Button_Size;

        //��������� ����������
        Left := Area * ((i - 1) mod 3);
        Top := Area * ((i - 1) div 3);

        //�������� ���������� ������� ������
        onClick := ButtonCellClick1;

        //��������� �� ������� ����
        Parent := PanelForGame1;
      end;

    //����������� ���������� �����
    ButtonsArray[i].Caption := '';
    ButtonsArray[i].Tag := 0;
  end;

  //������� ������� ����
  Pages.ActivePage := PlayerVSProgram;

  //����������, ��� ����� ������
  if CountGames1 mod 2 = 0 then MoveProgram;
end;

procedure TGame.MainMenuExit1Click(Sender: TObject);
begin
  //������� � ������� ����
  Pages.ActivePage := MainMenu;
end;


//����� 2
procedure TGame.StartGame2;
var
  //������� � ������ �������� ����
  i, Area : Integer;

const
  //������ ������
  Button_Size = 60;
  //������� ����� �����
  Grid_Width = 2;

begin
  //����������, ��� ��� ������
  if CountGames2 mod 2 = 0 then
    begin
      Player1Sel := 1;
      Player2Sel := 10;
    end
  else
    begin
      Player1Sel := 10;
      Player2Sel := 1;
    end;

  //������ �������� ����
  Area := Button_Size * 3 + Grid_Width * 2;
  with PanelForGame2 do
    begin
      ClientWidth := Area;
      ClientHeight := Area;

      //���������� �������� ����
      Top := 152;
      Left := 15;
    end;

  //������ ������ (� ������ �������)
  Area := Button_Size + Grid_Width;

  //�������� � ��������� �������� ����
  for i := 1 to 9 do
  begin
    ButtonsArray[i] := TButton.Create(self);
    with ButtonsArray[i] do
      begin
        //��������� �������
        Height := Button_Size;
        Width := Button_Size;

        //��������� ����������
        Left := Area * ((i - 1) mod 3);
        Top := Area * ((i - 1) div 3);

        TempPlayer := False;
        onClick := ButtonCellClick2;

        //��������� �� ������� ����
        Parent := PanelForGame2;
      end;

    //����������� ���������� �����
    ButtonsArray[i].Caption := '';
    ButtonsArray[i].Tag := 0;
  end;

  //������� ������� ����
  Pages.ActivePage := PlayerVSPlayer;
end;

procedure TGame.MainMenuExit2Click(Sender: TObject);
begin
  //������� � ������� ����
  Pages.ActivePage := MainMenu;
end;


//�����
procedure TGame.StartHelp(Sender: TObject);
begin
  //������������� �����
  MainMenuExit3.SetFocus;
end;

procedure TGame.MainMenuExit3Click(Sender: TObject);
begin
  //������� � ������� ����
  Pages.ActivePage := MainMenu;
end;

end.
