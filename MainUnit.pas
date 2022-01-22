unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.MPlayer;

//Тип для свойства обработчика хода программы
type
  TEventMoveProgram = function(): Boolean of object;

type
  TGame = class(TForm)
    //Страницы
    Pages: TPageControl;

    //Главное меню
    MainMenu: TTabSheet;
    //Фон 1
    BackGroundImage1: TImage;
    //Музыка
    Music: TMediaPlayer;
    //Заголовок
    Head: TLabel;
    //Кнопка переключения режима 1
    Player: TButton;
    //Кнопка переключения режима 2
    Players: TButton;
    //Справка + опции
    Help: TButton;
    //Выход из игры
    GameExit: TButton;

    //Режим : игрок против программы (далее режим 1)
    PlayerVSProgram: TTabSheet;
    //Фон 2
    BackGroundImage2: TImage;
    //Надпись (режим 1)
    Score1: TLabel;
    //Панель (режим 1)
    PanelForGame1: TPanel;
    //Счет игрока (режим 1)
    PlayerScore: TLabel;
    //Счет программы (режим 1)
    ProgramScore: TLabel;
    //Надпись для счета ходов (режим 1)
    CounterText1: TLabel;
    //Счет ходов (режим 1)
    Counter1: TLabel;
    //Надпись для игр вничью (режим 1)
    GameCountText1: TLabel;
    //Счет игр вничью (режим 1)
    GameCount1: TLabel;
    //Выход в главное меню (режим 1)
    MainMenuExit1: TButton;

    //Режим : игрок против игрока (далее режим 2)
    PlayerVSPlayer: TTabSheet;
    //Фон 3
    BackGroundImage3: TImage;
    //Надпись (режим 2)
    Score2: TLabel;
    //Панель (режим 2)
    PanelForGame2: TPanel;
    //Счет игрока 1 (режим 2)
    Player1Score: TLabel;
    //Счет игрока 2 (режим 2)
    Player2Score: TLabel;
    //Надпись для счета ходов (режим 2)
    CounterText2: TLabel;
    //Счет ходов (режим 2)
    Counter2: TLabel;
    //Надпись для игр вничью (режим 2)
    GameCountText2: TLabel;
    //Счет игр вничью (режим 2)
    GameCount2: TLabel;
    //Выход в главное меню (режим 2)
    MainMenuExit2: TButton;

    //Опции
    HelpPage: TTabSheet;
    //Фон 4
    BackGroundImage4: TImage;
    //Текст заголовка
    Text1: TLabel;
    //Текст выбора сложности
    Text2: TLabel;
    //Текст выбора режима игры за крестик/нолик
    Text3: TLabel;
    //Панель (опции)
    PanelForOptions: TPanel;
    //Первая группа кнопок
    Group1: TGroupBox;
    //Легкая сложность
    Easy: TRadioButton;
    //Нормальная сложность
    Normal: TRadioButton;
    //Тяжелая сложность
    Difficult: TRadioButton;
    //Вторая группа кнопок
    Group2: TGroupBox;
    //Крестик
    X: TRadioButton;
    //Нолик
    O: TRadioButton;
    //Выход в главное меню (опции)
    MainMenuExit3: TButton;

    //Запуск игры
    procedure FormCreate(Sender: TObject);
    //Повтор музыки
    procedure OnNotify(Sender: TObject);
    //Переключение режима 1
    procedure PlayerClick(Sender: TObject);
    //Переключение режима 2
    procedure PlayersClick(Sender: TObject);
    //Запуск опций
    procedure HelpClick(Sender: TObject);
    //Выход из игры
    procedure GameExitClick(Sender: TObject);

    //Нажатие клетки (режим 1)
    procedure ButtonCellClick1(Sender: TObject);
    //Нажатие клетки (режим 2)
    procedure ButtonCellClick2(Sender: TObject);

    //Выход в главное меню (режим 1)
    procedure MainMenuExit1Click(Sender: TObject);

    //Выход в главное меню (режим 2)
    procedure MainMenuExit2Click(Sender: TObject);

    //Запуск опций
    procedure StartHelp(Sender: TObject);
    //Выход в главное меню (опции)
    procedure MainMenuExit3Click(Sender: TObject);

  private
    //Массив игровых кнопок
    ButtonsArray : array [1 .. 9] of TButton;

    //Чем играет игрок
    fPlayerSel: Byte;
    //Чем играет программа
    fProgramSel: Byte;
    //Чем играет игрок 1
    fPlayer1Sel: Byte;
    //Чем играет игрок 2
    fPlayer2Sel: Byte;
    //Количество сыгранных игр
    fCountGames1: Integer;
    //Количество сыгранных игр
    fCountGames2: Integer;
    //Определение уровня сложности
    fOnMoveProgram: TEventMoveProgram;

    //Поставить крестик или нолик
    procedure SetSign(cBtn: TButton; cSign: Integer);

    //Уровни сложности
    function MoveProgramDefault(): Boolean;
    function MoveProgramLevel1(): Boolean;
    function MoveProgramLevel2(): Boolean;
    function MoveProgramLevel3(): Boolean;

    //Для изменения полей класса
    property OnMoveProgram: TEventMoveProgram read fOnMoveProgram write fOnMoveProgram;

  public
    //Старт режима 1
    procedure StartGame1();
    //Старт режима 2
    procedure StartGame2();

    //Рестарт игры (режим 1)
    procedure RestartGame1(cCode: Integer = 0);
    //Рестарт игры (режим 2)
    procedure RestartGame2(cCode: Integer = 0);

    //Проверка завершения игры
    function CheckEnd(): Integer;
    //Ход программы
    procedure MoveProgram();

    //Для изменения полей класса
    property PlayerSel: Byte read fPlayerSel write fPlayerSel;
    property Player1Sel: Byte read fPlayer1Sel write fPlayer1Sel;
    property Player2Sel: Byte read fPlayer2Sel write fPlayer2Sel;
    property ProgramSel: Byte read fProgramSel write fProgramSel;
    property CountGames1: Integer read fCountGames1 write fCountGames1;
    property CountGames2: Integer read fCountGames2 write fCountGames2;
  end;

var
  //Форма
  Game: TGame;
  //Определяем, кто ходит
  TempPlayer : Boolean;

implementation

{$R *.dfm}

const
  //Массив с комбинациями
  IdolArray : array [1 .. 8, 1 .. 3] of Byte = (
    (1, 2, 3), // 1 - горизонтальная линия
    (4, 5, 6), // 2 - горизонтальная линия
    (7, 8, 9), // 3 - горизонтальная линия
    (1, 4, 7), // 1 - вертикальная линия
    (2, 5, 8), // 2 - вертикальная линия
    (3, 6, 9), // 3 - вертикальная линия
    (1, 5, 9), // 1 - диагональная линия
    (3, 5, 7) // 2 - диагональная линия
    );

//Алгоритмы режима 1 и 2
procedure TGame.MoveProgram;
var
  i : Integer;
begin
  //Ход программы
  if Assigned(OnMoveProgram) then OnMoveProgram;

  i := CheckEnd;
  if i <> 0 then
    RestartGame1(i);
end;

function TGame.MoveProgramDefault: Boolean;
var
  WinV1, WinV2, i, Sum: Integer;
begin
  //Проверки выигрышных комбинаций
  Result := False;
  WinV1 := -1;
  WinV2 := -1;
  for i := 1 to 8 do
  begin
    //Считаем сумму
    Sum := ButtonsArray[IdolArray[i, 1]].Tag
      + ButtonsArray[IdolArray[i, 2]].Tag
      + ButtonsArray[IdolArray[i, 3]].Tag;

    //У программы есть выигрышная позиция
    if ProgramSel * 2 = Sum then
      begin
        WinV1 := i;
        Break;
      end
    //У игрока есть выигрышная позиция
    else if PlayerSel * 2 = Sum then WinV2 := i;
  end;

  //Если у программы нет выигрышной позиции, пробуем испортить игру сопернику
  if WinV1 < 0 then WinV1 := WinV2;
  if WinV1 > 0 then
    for i := 1 to 3 do
      if ButtonsArray[IdolArray[WinV1, i]].Tag = 0 then
        begin
          SetSign(ButtonsArray[IdolArray[WinV1, i]], ProgramSel);
          Result := True;
          Exit;
        end;

  //Проверка на пустую центральную клетку
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
  //Загадаем случайное число от 1 до 27
  r := 1 + Random(27);
  k := 0;

  //Найдём нашу свободную клетку и сделаем ход
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
  //Ход нормальным уровнем
  Result := MoveProgramDefault();
  //Ход на удачу
  if not Result then
    Result := MoveProgramLevel1();
end;

function TGame.MoveProgramLevel3: Boolean;
var
  i, Sum : Integer;
const
  TempArray : array [1 .. 4] of Byte = (1, 3, 7, 9);
begin
  //Ход тяжелым уровнем
  Sum := 0;
  for i := 1 to 9 do
    Sum := Sum + ButtonsArray[i].Tag;

  //Мешаем игроку
  if Sum = PlayerSel * 2 + ProgramSel then
    if (ButtonsArray[1].Tag + ButtonsArray[5].Tag + ButtonsArray[9].Tag = Sum)
    or (ButtonsArray[7].Tag + ButtonsArray[5].Tag + ButtonsArray[3].Tag = Sum) then
      begin
        //Ходим не туда
        SetSign(ButtonsArray[2], ProgramSel);
        Result := True;
        Exit;
      end;

  //Первый ход, иногда в угол, а не в центр
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

  //Программа ходила первой не в центр, игрок пошёл в центр
  if (Sum = PlayerSel + ProgramSel) and (ButtonsArray[5].Tag = PlayerSel) then
    for i := 1 to 4 do
      if ButtonsArray[TempArray[i]].Tag = ProgramSel then
        begin
          SetSign(ButtonsArray[TempArray[5 - i]], ProgramSel);
          Result := True;
          Exit;
        end;

  Result := MoveProgramDefault();
  //Проверим угловые
  if not Result then
    for i := 1 to 4 do
      if ButtonsArray[TempArray[i]].Tag = 0 then
        begin
          SetSign(ButtonsArray[TempArray[i]], ProgramSel);
          Result := True;
          Break;
        end;

  //Ход на удачу
  if not Result then
    Result := MoveProgramLevel1();
end;

procedure TGame.SetSign(cBtn: TButton; cSign: Integer);
begin
  //Рисуем на клетке крестик или нолик
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
            Caption := 'Х';
            Tag := 10;
          end;
      end;
    end;
end;

procedure TGame.ButtonCellClick1(Sender: TObject);
var
  i, j : Integer;
begin
  //Обработчик нажатия клетки игроком
  if TButton(Sender).Tag > 0 then Exit;

  SetSign(TButton(Sender), PlayerSel);

  //Пересчет количества ходов
  j := StrToInt(Trim(Counter1.Caption));
  inc(j);
  Counter1.Caption := IntToStr(j) + ' ';

  //Рестарт игры или ход программы
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
  //Обработчик нажатия клетки игроком
  if TButton(Sender).Tag > 0 then Exit;

  if TempPlayer then SetSign(TButton(Sender), Player2Sel)
  else SetSign(TButton(Sender), Player1Sel);

  //Пересчет количества ходов
  j := StrToInt(Trim(Counter2.Caption));
  if not TempPlayer then inc(j);
  Counter2.Caption := IntToStr(j) + ' ';

  //Рестарт игры или ход программы
  i := CheckEnd;
  if i <> 0 then
    RestartGame2(i)
  else
    TempPlayer := not TempPlayer;
end;

function TGame.CheckEnd: Integer;
var
  //Счетчик и сумма
  i, Sum: Integer;
  //Признак того, что игра завершена
  IsEnd: Boolean;
begin
  //Локальный признак завершения игры
  IsEnd := True;

  //Метод проверки завершения игры
  for i := 1 to 8 do
  begin
    //Cчитаем сумму
    Sum := ButtonsArray[IdolArray[i, 1]].Tag
    + ButtonsArray[IdolArray[i, 2]].Tag
    + ButtonsArray[IdolArray[i, 3]].Tag;

    case Sum of
      //Победа ноликов
      3:
        begin
          Result := 1;
          Exit;
        end;
      //Победа крестиков
      30:
        begin
          Result := 10;
          Exit;
        end;
      //Все клетки заняты
      12:
        Continue;
      //Все клетки заняты
      21:
        Continue;
      else
        IsEnd := False;
    end;
  end;

  if IsEnd then
    //Игра окончена
    Result := -1
  else
    //Игра продолжается
    Result := 0;
end;

procedure TGame.RestartGame1(cCode: Integer);
var
  i : Integer;
begin
  //Количество сыгранных игр
  inc(fCountGames1);

  //Обработка причины окончания игры и пересчет статистики
  case cCode of
    -1:
        begin
          //Пересчет игр вничью
          ShowMessage('Раунд сыгран вничью...');
          i := StrToInt(Trim(GameCount1.Caption));
          inc(i);
          GameCount1.Caption := IntToStr(i) + ' ';
        end;
     1:
        begin
          //Пересчет побед ноликов
          if O.Checked then
            begin
              ShowMessage('Раунд выиграл игрок...');
              i := StrToInt(Trim(PlayerScore.Caption));
              inc(i);
              PlayerScore.Caption := IntToStr(i) + ' ';
            end
          else
            begin
              ShowMessage('Раунд выиграла программа...');
              i := StrToInt(Trim(ProgramScore.Caption));
              inc(i);
              ProgramScore.Caption := IntToStr(i) + ' ';
            end;
        end;
    10:
        begin
          //Пересчет побед крестиков
          if X.Checked then
            begin
              ShowMessage('Раунд выиграл игрок...');
              i := StrToInt(Trim(PlayerScore.Caption));
              inc(i);
              PlayerScore.Caption := IntToStr(i) + ' ';
            end
          else
            begin
              ShowMessage('Раунд выиграла программа...');
              i := StrToInt(Trim(ProgramScore.Caption));
              inc(i);
              ProgramScore.Caption := IntToStr(i) + ' ';
            end;
        end;
  end;

  //Обнуление количества ходов
  Counter1.Caption := '0 ';

  //Начинаем новую игру
  StartGame1;
end;

procedure TGame.RestartGame2(cCode: Integer);
var
  i : Integer;
begin
  //Количество сыгранных игр
  inc(fCountGames2);

  //Обработка причины окончания игры и пересчет статистики
  case cCode of
    -1:
        begin
          //Пересчет игр вничью
          ShowMessage('Раунд сыгран вничью...');
          i := StrToInt(Trim(GameCount2.Caption));
          inc(i);
          GameCount2.Caption := IntToStr(i) + ' ';
        end;
     1:
        begin
          ShowMessage('Раунд выиграл игрок 2...');
          i := StrToInt(Trim(Player2Score.Caption));
          inc(i);
          Player2Score.Caption := IntToStr(i) + ' ';
        end;
    10:
        begin
          ShowMessage('Раунд выиграл игрок 1...');
          i := StrToInt(Trim(Player1Score.Caption));
          inc(i);
          Player1Score.Caption := IntToStr(i) + ' ';
        end;
  end;

  //Обнуление количества ходов
  Counter2.Caption := '0 ';

  //Начинаем новую игру
  StartGame2;
end;


//Главное меню
procedure TGame.FormCreate(Sender: TObject);
begin
  //Воспроизведение мелодии
  Music.Play;

  //Cкрываем закладки
  MainMenu.TabVisible := False;
  PlayerVSProgram.TabVisible := False;

  //Устанавливаем главную страницу
  Pages.ActivePage := MainMenu;

  //Назначим игроку крестик, программе - нолик
  PlayerSel := 10;
  ProgramSel := 1;

  //Стандартный уровень сложности и режим игры
  X.Checked := True;
  Easy.Checked := True;

  //Инициализируем генератор случайных чисел
  Randomize;
end;

procedure TGame.OnNotify(Sender: TObject);
begin
  //Повторение мелодии
  with Music do
  if NotifyValue = nvSuccessful then
    begin
      Notify := True;
      Play;
    end;
end;

procedure TGame.PlayerClick(Sender: TObject);
begin
  //Переход в режим игрок против программы
  Pages.ActivePage := PlayerVSProgram;

  //Счетчик игр
  CountGames1 := 1;

  //Анализ сложности
  if Easy.Checked then
    OnMoveProgram := MoveProgramLevel1;
  if Normal.Checked then
    OnMoveProgram := MoveProgramLevel2;
  if Difficult.Checked then
    OnMoveProgram := MoveProgramLevel3;

  //Обнуление статистики
  PlayerScore.Caption := '0 ';
  ProgramScore.Caption := '0 ';
  GameCount1.Caption := '0 ';
  Counter1.Caption := '0 ';

  //Запуск игры
  StartGame1;
end;

procedure TGame.PlayersClick(Sender: TObject);
begin
  //Переход в режим игрок против игрока
  Pages.ActivePage := PlayerVSPlayer;

  //Счетчик игр
  CountGames2 := 1;

  //Обнуление статистики
  Player1Score.Caption := '0 ';
  Player2Score.Caption := '0 ';
  GameCount2.Caption := '0 ';
  Counter2.Caption := '0 ';

  //Запуск игры
  StartGame2;
end;

procedure TGame.HelpClick(Sender: TObject);
begin
  //Переход в опции
  Pages.ActivePage := HelpPage;
end;

procedure TGame.GameExitClick(Sender: TObject);
begin
  //Закрываем игру
  Game.Close;
end;


//Режим 1
procedure TGame.StartGame1;
var
  //Счетчик и размер игрового поля
  i, Area: Integer;

const
  //Размер кнопки
  Button_Size = 60;
  //Толщина линий сетки
  Grid_Width = 2;

begin
  //Определяем, кто чем играет
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

  //Размер игрового поля
  Area := Button_Size * 3 + Grid_Width * 2;
  with PanelForGame1 do
    begin
      ClientWidth := Area;
      ClientHeight := Area;

      //Координаты игрового поля
      Top := 152;
      Left := 15;
    end;

  //Размер кнопки (с учетом отступа)
  Area := Button_Size + Grid_Width;

  //Создание и отрисовка игрового поля
  for i := 1 to 9 do
  begin
    ButtonsArray[i] := TButton.Create(self);
    with ButtonsArray[i] do
      begin
        //Определим размеры
        Height := Button_Size;
        Width := Button_Size;

        //Определим координаты
        Left := Area * ((i - 1) mod 3);
        Top := Area * ((i - 1) div 3);

        //Присвоим обработчик нажатия кнопки
        onClick := ButtonCellClick1;

        //Разместим на игровом поле
        Parent := PanelForGame1;
      end;

    //Стандартное наполнение полей
    ButtonsArray[i].Caption := '';
    ButtonsArray[i].Tag := 0;
  end;

  //Покажем игровое поле
  Pages.ActivePage := PlayerVSProgram;

  //Определяем, кто ходит первый
  if CountGames1 mod 2 = 0 then MoveProgram;
end;

procedure TGame.MainMenuExit1Click(Sender: TObject);
begin
  //Переход в главное меню
  Pages.ActivePage := MainMenu;
end;


//Режим 2
procedure TGame.StartGame2;
var
  //Счетчик и размер игрового поля
  i, Area : Integer;

const
  //Размер кнопки
  Button_Size = 60;
  //Толщина линий сетки
  Grid_Width = 2;

begin
  //Определяем, кто чем играет
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

  //Размер игрового поля
  Area := Button_Size * 3 + Grid_Width * 2;
  with PanelForGame2 do
    begin
      ClientWidth := Area;
      ClientHeight := Area;

      //Координаты игрового поля
      Top := 152;
      Left := 15;
    end;

  //Размер кнопки (с учетом отступа)
  Area := Button_Size + Grid_Width;

  //Создание и отрисовка игрового поля
  for i := 1 to 9 do
  begin
    ButtonsArray[i] := TButton.Create(self);
    with ButtonsArray[i] do
      begin
        //Определим размеры
        Height := Button_Size;
        Width := Button_Size;

        //Определим координаты
        Left := Area * ((i - 1) mod 3);
        Top := Area * ((i - 1) div 3);

        TempPlayer := False;
        onClick := ButtonCellClick2;

        //Разместим на игровом поле
        Parent := PanelForGame2;
      end;

    //Стандартное наполнение полей
    ButtonsArray[i].Caption := '';
    ButtonsArray[i].Tag := 0;
  end;

  //Покажем игровое поле
  Pages.ActivePage := PlayerVSPlayer;
end;

procedure TGame.MainMenuExit2Click(Sender: TObject);
begin
  //Переход в главное меню
  Pages.ActivePage := MainMenu;
end;


//Опции
procedure TGame.StartHelp(Sender: TObject);
begin
  //Устанавливаем фокус
  MainMenuExit3.SetFocus;
end;

procedure TGame.MainMenuExit3Click(Sender: TObject);
begin
  //Переход в главное меню
  Pages.ActivePage := MainMenu;
end;

end.
