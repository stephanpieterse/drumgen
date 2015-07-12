unit kit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ExtDlgs, Spin, Menus, ButtonComps;

type
  TVoicing = Record
  Voice : String[50];
  SourceN : Array [1..50] of Byte;
  end;

  TSavedVoicingData = Record
    AreaS : Array[1..10] of TRect;
    HasArea : Array [1..10] of Boolean;
    Voicing : Array[1..2] of TVoicing;
    LastPos : Array[1..2] of TPoint;
    end;
  {TSavedVoicingData = Record
    Areas : Array[1..20,1..8] of TRect;
    NumAreas : Array [1..10] of Integer;
    Voicing : Array[1..2] of TVoicing;
    LastPos : Array[1..2] of TPoint;
    end;
    }

  TSoundAreas = Record
    HasSoundSource : Boolean;
    AreaS : TRect;
    AreaXOnCanvas : Byte;
    end;

 { TSoundAreas = Record
    NumSoundSources : Integer;
    Areas : Array of TRect;
    AreaXOnCanvas : Array of Byte;
    end;  }

  Tfrmkit = class(TForm)
    rddrawrh: TRadioButton;
    rddrawlh: TRadioButton;
    rddrawrf: TRadioButton;
    rddrawlf: TRadioButton;
    imghands: TImage;
    imgfeet: TImage;
    sedtpenwidth: TSpinEdit;
    rdellipse: TRadioButton;
    rdrect: TRadioButton;
    grpdrawopt: TGroupBox;
    clrbox: TColorBox;
    grpboxdesign: TGroupBox;
    lblpenw: TLabel;
    lblpencol: TLabel;
    grphands: TGroupBox;
    grpfeet: TGroupBox;
    cmbassignsound: TComboBox;
    lblassignsound: TLabel;
    vsaver: TSaveDialog;
    vopener: TOpenDialog;
    grpvoicecolor: TGroupBox;
    clrlh: TColorBox;
    clrrf: TColorBox;
    clrlf: TColorBox;
    clrrh: TColorBox;
    lblrhcol: TLabel;
    lblrfcol: TLabel;
    lbllfcol: TLabel;
    lbllhcol: TLabel;
    sbtnok: TSquareButton;
    ebtnreversehands: TEncartaButton;
    ebtnsavehands: TEncartaButton;
    ebtnloadhands: TEncartaButton;
    ebtnvoiceclearhands: TEncartaButton;
    ebtnclearhands: TEncartaButton;
    ebtnsavefeet: TEncartaButton;
    ebtnreversefeet: TEncartaButton;
    ebtnvoiceclearfeet: TEncartaButton;
    ebtnclearfeet: TEncartaButton;
    ebtnloadfeet: TEncartaButton;
    ebtnreloadstd: TEncartaButton;
    ebtnrndvoice: TEncartaButton;
    ebtndesignkit: TEncartaButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rddrawrhClick(Sender: TObject);
    procedure rddrawlhClick(Sender: TObject);
    procedure rddrawrfClick(Sender: TObject);
    procedure rddrawlfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgfeetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imghandsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnsavehandsClick(Sender: TObject);
    procedure btnsavefeetClick(Sender: TObject);
    procedure btnloadhandsClick(Sender: TObject);
    procedure btnloadfeetClick(Sender: TObject);
    procedure btnclearhandsClick(Sender: TObject);
    procedure btnclearfeetClick(Sender: TObject);
    procedure btnreversehandsClick(Sender: TObject);
    procedure btnreversefeetClick(Sender: TObject);
    procedure btndesignkitClick(Sender: TObject);
    procedure imghandsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgfeetMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgfeetMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnenddesignClick(Sender: TObject);
    procedure imghandsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sedtpenwidthChange(Sender: TObject);
    procedure clrboxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnrndvoiceClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure btnvoiceclearhandsClick(Sender: TObject);
    procedure btnvoiceclearfeetClick(Sender: TObject);
    procedure clrrhChange(Sender: TObject);
    procedure clrlhChange(Sender: TObject);
    procedure clrrfChange(Sender: TObject);
    procedure clrlfChange(Sender: TObject);
    procedure cmbassignsoundChange(Sender: TObject);

    procedure ImageMouseUp(X, Y: Integer; imglimbs : TImage; OnCanvas : Byte);
    procedure ImageMouseDown(X, Y: Integer; imglimbs : TImage; CanvN : Byte);
    procedure ReverseImage(imglimbs : TImage);
    procedure Design(Img : TImage; MoPos, NMoPos : TPoint);
    procedure AssignSoundSource(Index : Integer; AssArea : TRect; OnCanvas : Byte);
    procedure UpdateVoicing(Limb : Byte; SX,SY : Integer);
    procedure ApplyVoicings(Limb : Byte; var VoiceStr : String);
    procedure ClearSoundAreas(CanvasN : Byte);
    procedure ReverseSoundAreas(CanvasN : Byte; CanvasI : TImage);
    procedure SaveAll(CanvasN : Byte);
    procedure LoadVoicing(CanvasN : Byte);
    procedure LoadStandardTemplate;
    procedure FileCombine(Disassemble : Boolean; CanvN : Byte);
    procedure btnreloadstdClick(Sender: TObject);
  private
    { Private declarations }
  public
    SourceChars : Array[1..10] of Char;
    SoundAreas : Array[1..10] of TSoundAreas;
    LimbImg : Array[1..2] of TImage;
    Voicings : Array[1..4] of TVoicing;
  end;

var
  frmkit: Tfrmkit;
  VoiceToSave : TSavedVoicingData;
  LastPlace : Array[1..5] of TPoint;
  FirstTime : Array[1..4] of Boolean;
  Select : integer;
  CurCopy, CurCopyF, DesNew, DesOld : TImage;
  DesMode, MPressed : Boolean;
  VoiceImg : Array[1..4] of TImage;
  VSoundList : Array[1..10] of String;
  VSoundIndex : Byte;

implementation

uses GenCode, midi, randopt, playalong, devcntrl;

{$R *.dfm}

procedure Tfrmkit.FileCombine(Disassemble : Boolean; CanvN : Byte);
var
        FileSNew, FileSOld : TFileStream;
        TempStream : TMemoryStream;
        NewBitmap : TBitmap;
        DataSize : Integer;
        SizeRect : TRect;
begin
        TempStream := TMemoryStream.Create;
        if Disassemble = False then
        begin
        FileSNew := TFileStream.Create(vsaver.FileName + '.gdv',fmCreate);
        DataSize := SizeOf(TSavedVoicingData);
        FileSNew.WriteBuffer(DataSize,Sizeof(Integer));
        FileSNew.WriteBuffer(VoiceToSave,DataSize);

        TempStream.Clear;
        LimbImg[CanvN].Picture.Bitmap.SaveToStream(TempStream);
        DataSize := TempStream.Size;
        TempStream.Position := 0;
        FileSNew.WriteBuffer(DataSize,SizeOf(Integer));
        FileSNew.CopyFrom(TempStream,DataSize);

        if CanvN = 1 then
        begin
        TempStream.Clear;
        VoiceImg[1].Picture.Bitmap.SaveToStream(TempStream);
        DataSize := TempStream.Size;
        TempStream.Position := 0;
        FileSNew.WriteBuffer(DataSize,SizeOf(Integer));
        FileSNew.CopyFrom(TempStream,DataSize);

        TempStream.Clear;
        VoiceImg[2].Picture.Bitmap.SaveToStream(TempStream);
        DataSize := TempStream.Size;
        TempStream.Position := 0;
        FileSNew.WriteBuffer(DataSize,SizeOf(Integer));
        FileSNew.CopyFrom(TempStream,DataSize);
        end;

        if CanvN = 2 then
        begin
        TempStream.Clear;
        VoiceImg[3].Picture.Bitmap.SaveToStream(TempStream);
        DataSize := TempStream.Size;
        TempStream.Position := 0;
        FileSNew.WriteBuffer(DataSize,SizeOf(Integer));
        FileSNew.CopyFrom(TempStream,DataSize);

        TempStream.Clear;
        VoiceImg[4].Picture.Bitmap.SaveToStream(TempStream);
        DataSize := TempStream.Size;
        TempStream.Position := 0;
        FileSNew.WriteBuffer(DataSize,SizeOf(Integer));
        FileSNew.CopyFrom(TempStream,DataSize);
        end;

        FileSNew.Free;
        end;

        if Disassemble = True then
        begin
        SizeRect := Rect(0,0,LimbImg[CanvN].Width,LimbImg[CanvN].Height);
        FileSOld := TFileStream.Create(vopener.FileName,fmOpenRead);
        FileSOld.Position := 0;
        FileSOld.ReadBuffer(DataSize,SizeOf(Integer));
        FileSOld.ReadBuffer(VoiceToSave,DataSize);

        TempStream.Clear;
        FileSOld.ReadBuffer(DataSize,SizeOf(Integer));
        TempStream.CopyFrom(FileSOld,DataSize);
        TempStream.SaveToFile('C:\image.bmp');
        NewBitmap := TBitmap.Create;
        NewBitmap.LoadFromFile('C:\image.bmp');
        LimbImg[CanvN].Canvas.CopyRect(SizeRect,NewBitmap.Canvas,SizeRect);
        NewBitmap.Free;
        DeleteFile('C:\image.bmp');

        if CanvN = 1 then
        begin
        TempStream.Clear;
        FileSOld.ReadBuffer(DataSize,SizeOf(Integer));
        TempStream.CopyFrom(FileSOld,DataSize);
        TempStream.SaveToFile('C:\1.bmp');
        NewBitmap := TBitmap.Create;
        NewBitmap.LoadFromFile('C:\1.bmp');
        VoiceImg[1].Canvas.CopyRect(SizeRect,NewBitmap.Canvas,SizeRect);
        NewBitmap.Free;
        DeleteFile('C:\1.bmp');

        TempStream.Clear;
        FileSOld.ReadBuffer(DataSize,SizeOf(Integer));
        TempStream.CopyFrom(FileSOld,DataSize);
        TempStream.SaveToFile('C:\2.bmp');
        NewBitmap := TBitmap.Create;
        NewBitmap.LoadFromFile('C:\2.bmp');
        VoiceImg[2].Canvas.CopyRect(SizeRect,NewBitmap.Canvas,SizeRect);
        NewBitmap.Free;
        DeleteFile('C:\2.bmp');
        end;

        if CanvN = 2 then
        begin
        TempStream.Clear;
        FileSOld.ReadBuffer(DataSize,SizeOf(Integer));
        TempStream.CopyFrom(FileSOld,DataSize);
        TempStream.SaveToFile('C:\1.bmp');
        NewBitmap := TBitmap.Create;
        NewBitmap.LoadFromFile('C:\1.bmp');
        VoiceImg[3].Canvas.CopyRect(SizeRect,NewBitmap.Canvas,SizeRect);
        NewBitmap.Free;
        DeleteFile('C:\1.bmp');

        TempStream.Clear;
        FileSOld.ReadBuffer(DataSize,SizeOf(Integer));
        TempStream.CopyFrom(FileSOld,DataSize);
        TempStream.SaveToFile('C:\2.bmp');
        NewBitmap := TBitmap.Create;
        NewBitmap.LoadFromFile('C:\2.bmp');
        VoiceImg[4].Canvas.CopyRect(SizeRect,NewBitmap.Canvas,SizeRect);
        NewBitmap.Free;
        DeleteFile('C:\2.bmp');
               
        end;

        FileSOld.Free;
        end;
        TempStream.Free;
end;

procedure Tfrmkit.LoadStandardTemplate;
var
        DistX, DistY : integer;
        RectRH, RectLH, RectRF, RectLF : TRect;
begin
        ClearSoundAreas(1);
        DistX := imghands.Width div 2;
        DistY := imghands.Height div 2;
        RectRH := Rect((DistX + 20),(DistY div 2),((DistX * 2) - 20),((DistY div 2) + DistY));
        RectLH := Rect(20,(DistY div 2),(DistX - 20),((DistY div 2) + DistY));
        LimbImg[1].Canvas.Ellipse(RectRH);
        LimbImg[1].Canvas.Ellipse(RectLH);
        AssignSoundSource(1,RectRH,1);
        AssignSoundSource(2,RectLH,1);
        imghands.Canvas.CopyRect(Rect(0,0,ImgHands.Width,ImgHands.Height),LimbImg[1].Canvas,Rect(0,0,ImgHands.Width,ImgHands.Height));

        ClearSoundAreas(2);
        DistX := imgfeet.Width div 2;
        DistY := imgfeet.Height div 2;
        RectRF := Rect((DistX + 50),(DistY div 4),((DistX * 2) - 50),((DistY div 2) + DistY));
        RectLF := Rect(50,(DistY div 4),(DistX - 50),((DistY div 2) + DistY));
        LimbImg[2].Canvas.Rectangle(RectRF);
        LimbImg[2].Canvas.Rectangle(RectLF);
        AssignSoundSource(3,RectRF,2);
        AssignSoundSource(4,RectLF,2);
        imgfeet.Canvas.CopyRect(Rect(0,0,Imgfeet.Width,Imgfeet.Height),LimbImg[2].Canvas,Rect(0,0,Imgfeet.Width,Imgfeet.Height));
end;

procedure Tfrmkit.ImageMouseUp(X, Y: Integer; imglimbs : TImage; OnCanvas : Byte);
var
        h, w : integer;
        AssignRect : TRect;
begin
        if DesMode = True then
        begin
        MPressed := False;
        h := imglimbs.Height;
        w := imglimbs.width;
        DesOld.Canvas.CopyRect(Rect(0,0,w,h),DesNew.Canvas,Rect(0,0,w,h));
        imglimbs.Canvas.CopyRect(Rect(0,0,w,h),DesOld.Canvas,Rect(0,0,w,h));
        AssignRect := Rect(LastPlace[5].X,LastPlace[5].Y,X,Y);
        AssignSoundSource(VSoundIndex,AssignRect,OnCanvas);
        if VSoundIndex <> 0 then
                begin
                if cmbassignsound.ItemIndex <> 0 then
                begin
                cmbassignsound.DeleteSelected;
                cmbassignsound.ItemIndex := 0;
                end;
                end;    
        end;
end;

procedure tfrmkit.ReverseImage(imglimbs : TImage);
var
        x, w, h : integer;
        Srce, Dest : TRect;
begin
        w := imglimbs.width;
        h := imglimbs.height;
        Dest := Rect(0,0,1,h);
        CurCopy.Height := h;
        CurCopy.Width := 1;
        CurCopyF.Height := h;
        CurCopyF.Width := w;
        for x := 1 to w do
        begin
                Srce := Rect(x-1,0,x,h);
                CurCopy.Canvas.CopyRect(Dest,imglimbs.canvas,Srce);
                CurCopyF.Canvas.CopyRect(Rect(w - x,0,w - x + 1,h),CurCopy.Canvas,Dest);
        end;
        imglimbs.Canvas.FillRect(Rect(0,0,w,h));
        imglimbs.canvas.CopyRect(Rect(0,0,w,h),CurCopyF.Canvas,Rect(0,0,w,h));
end;

procedure Tfrmkit.ImageMouseDown(X, Y: Integer; imglimbs : TImage; CanvN : Byte);
var
        h, w : integer;
begin
        h := imglimbs.Height;
        w := imglimbs.Width;
        if DesMode = True then
        begin
        MPressed := True;
        LastPlace[5] := Point(X,Y);
        DesNew.Canvas.FillRect(Rect(0,0,w,h));
        DesOld.Canvas.FillRect(Rect(0,0,w,h));
        DesOld.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[CanvN].Canvas,Rect(0,0,w,h));
        end;

        if DesMode = False then
        if Select > 0 then
        if Firsttime[Select] = True then
        begin
                VoiceImg[Select].canvas.Ellipse(X-5,Y-5,X+5,Y+5);
                Firsttime[Select] := False;
                LastPlace[Select] := Point(X,Y);
                UpdateVoicing(Select,X,Y);
                imglimbs.Canvas.CopyMode := SrcAnd;
                imglimbs.Canvas.CopyRect(Rect(0,0,w,h),VoiceImg[Select].Canvas,Rect(0,0,w,h));
        end
        else
        begin
                VoiceImg[Select].Canvas.PenPos := LastPlace[Select];
                VoiceImg[Select].Canvas.LineTo(X,Y);
                LastPlace[Select] := Point(X,Y);
                UpdateVoicing(Select,X,Y);
                imglimbs.Canvas.CopyMode := SrcAnd;
                imglimbs.Canvas.CopyRect(Rect(0,0,w,h),VoiceImg[Select].Canvas,Rect(0,0,w,h));
        end;
end;

procedure tfrmkit.LoadVoicing(CanvasN : Byte);
var
   x, y : integer;
   FileN : String;
begin
     FileN := vopener.FileName;
             for x := 1 to length(FileN) do
                if vopener.filename[x] = '.' then
                        begin
                        for y := length(FileN) downto x do
                                Delete(FileN,y,1);
                        Break;
                        end;

     if vopener.FileName <> '' then
     begin
             FileCombine(True,CanvasN);

             for x := 1 to 10 do
             begin
                       SoundAreas[x].AreaS := VoiceToSave.AreaS[x];
                       SoundAreas[x].AreaXOnCanvas := CanvasN;
             end;
             if CanvasN = 1 then
             begin
                  Voicings[1] := VoiceToSave.Voicing[1];
                  Voicings[2] := VoiceToSave.Voicing[2];
                  LastPlace[1] := VoiceToSave.LastPos[1];
                  LastPlace[2] := VoiceToSave.LastPos[2];
                  if PointsEqual(LastPlace[1],Point(0,0)) = true then
                        FirstTime[1] := true else FirstTime[1] := false;
                  if PointsEqual(LastPlace[2],Point(0,0)) then
                        FirstTime[2] := true else FirstTime[2] := false;
                  imghands.Canvas.CopyRect(Rect(0,0,imghands.width,imghands.height),LimbImg[1].Canvas,Rect(0,0,imghands.width,imghands.height));
                  imghands.Canvas.CopyRect(Rect(0,0,imghands.width,imghands.height),VoiceImg[1].Canvas,Rect(0,0,imghands.width,imghands.height));
                  imghands.Canvas.CopyRect(Rect(0,0,imghands.width,imghands.height),VoiceImg[2].Canvas,Rect(0,0,imghands.width,imghands.height));
             end;
             if CanvasN = 2 then
             begin
                  Voicings[3] := VoiceToSave.Voicing[1];
                  Voicings[4] := VoiceToSave.Voicing[2];
                  LastPlace[3] := VoiceToSave.LastPos[1];
                  LastPlace[4] := VoiceToSave.LastPos[2];
                  if PointsEqual(LastPlace[3],Point(0,0)) then
                  FirstTime[3] := true else FirstTime[3] := false;
                  if PointsEqual(LastPlace[4],Point(0,0)) then
                  FirstTime[4] := true else FirstTime[4] := false;
                  imgfeet.Canvas.CopyRect(Rect(0,0,imgfeet.width,imgfeet.height),LimbImg[2].Canvas,Rect(0,0,imgfeet.width,imgfeet.height));
                  imgfeet.Canvas.CopyRect(Rect(0,0,imgfeet.width,imgfeet.height),VoiceImg[3].Canvas,Rect(0,0,imgfeet.width,imgfeet.height));
                  imgfeet.Canvas.CopyRect(Rect(0,0,imgfeet.width,imgfeet.height),VoiceImg[4].Canvas,Rect(0,0,imgfeet.width,imgfeet.height));
             end;
     end;
end;

procedure tfrmkit.SaveAll(CanvasN : Byte);
var
   x : integer;
begin
     for x := 1 to 10 do
     begin
     if SoundAreas[x].AreaXOnCanvas = CanvasN then
            VoiceToSave.Areas[x] := SoundAreas[x].AreaS;

     VoiceToSave.HasArea[x] := SoundAreas[x].HasSoundSource;
     end;

     if CanvasN = 1 then
     begin
          VoiceToSave.Voicing[1] := Voicings[1];
          VoiceToSave.Voicing[2] := Voicings[2];
          VoiceToSave.LastPos[1] := LastPlace[1];
          VoiceToSave.LastPos[2] := LastPlace[2];
     end;
     if CanvasN = 2 then
     begin
          VoiceToSave.Voicing[1] := Voicings[3];
          VoiceToSave.Voicing[2] := Voicings[4];
          VoiceToSave.LastPos[1] := LastPlace[3];
          VoiceToSave.LastPos[2] := LastPlace[4];
     end;

     FileCombine(False,CanvasN);
end;

procedure tfrmkit.ReverseSoundAreas(CanvasN : Byte; CanvasI : TImage);
var
   x, AWidth : Integer;
   Temp, New : TRect;
begin
     for x := 1 to 10 do
         if SoundAreas[x].AreaXOnCanvas = CanvasN then
         begin
         Temp := SoundAreas[x].AreaS;
         AWidth := Temp.Right - Temp.Left;
         New := Rect((CanvasI.Width - Temp.Left - AWidth),(Temp.Top),(CanvasI.Width - Temp.Right + AWidth),(Temp.Bottom));
         SoundAreas[x].Areas := New;
         end;
end;

procedure tfrmkit.ClearSoundAreas(CanvasN : Byte);
var
        x, z, CONumSource : integer;
        Temp : Array[1..10] of TSoundAreas;
        MIDICmb : Array[1..10] of TComboBox;
begin
        MIDICmb[1] := frmmidi.cmbsound1;
        MIDICmb[2] := frmmidi.cmbsound2;
        MIDICmb[3] := frmmidi.cmbsound3;
        MIDICmb[4] := frmmidi.cmbsound4;
        MIDICmb[5] := frmmidi.cmbsound5;
        MIDICmb[6] := frmmidi.cmbsound6;
        MIDICmb[7] := frmmidi.cmbsound7;
        MIDICmb[8] := frmmidi.cmbsound8;
        MIDICmb[9] := frmmidi.cmbsound9;
        MIDICmb[10] := frmmidi.cmbsound10;

        for x := 1 to 10 do
        begin
        CONumSource := 0;
                if SoundAreas[x].AreaXOnCanvas <> CanvasN then
                begin
                        CONumSource := CONumSource + 1;
                        Temp[x].AreaS := SoundAreas[x].AreaS;
                end;

        if SoundAreas[x].AreaXOnCanvas = CanvasN then
        begin
                cmbassignsound.Items.Add(MIDICmb[x].Text);
        end;

        for z := 0 to (CONumSource - 1) do
        begin
                SoundAreas[x].AreaS := Temp[x].AreaS;
                if CanvasN = 1 then SoundAreas[x].AreaXOnCanvas := 2;
                if CanvasN = 2 then SoundAreas[x].AreaXOnCanvas := 1;
        end;
        end;
end;

procedure Tfrmkit.ApplyVoicings(Limb : Byte; var VoiceStr : String);
var
        x, CurChar, Reps, NewReps : integer;
        NewVoice : String;
begin
        Reps := 0;
        NewReps := 0;
        if Voicings[Limb].Voice <> '' then
        begin

        NewVoice := VoiceStr;
        for x := 1 to length(NewVoice) do
                if (NewVoice[x] <> 'x') AND (NewVoice[x] <> '-'){ AND (NewVoice[x] <> '.')} then
                NewVoice[x] := 'x';
        frmmain.getpattern(NewVoice,NewVoice); //edt

       // NewVoice := Edt.Text;
        for x := 1 to length(NewVoice) do
                if NewVoice[x] = 'x' then Reps := Reps + 1;

        if Reps Mod Length(Voicings[Limb].Voice) <> 0 then
        repeat
        NewReps := NewReps + Reps;
        until NewReps Mod Length(Voicings[Limb].Voice) = 0;

        for x := 1 to (NewReps - 1) do
        NewVoice := NewVoice + VoiceStr;

        CurChar := 1;
        for x := 1 to length(NewVoice) do
        begin
                if CurChar > Length(Voicings[Limb].Voice) then CurChar := 1;
                if NewVoice[x] = 'x' then
                begin
                        NewVoice[x] := Voicings[Limb].Voice[CurChar];
                        CurChar := CurChar + 1;
                end;
        end;
        VoiceStr := NewVoice;
        frmmain.getpattern(NewVoice,NewVoice); //edt
        VoiceStr := NewVoice;
        end;
end;

procedure Tfrmkit.UpdateVoicing(Limb : Byte; SX,SY : Integer);
var
        x, CanvasN : integer;
        NewVoicing : String;
begin
        CanvasN := 0;
        if (Limb = 1) or (Limb = 2) then CanvasN := 1;
        if (Limb = 3) or (Limb = 4) then CanvasN := 2;
        NewVoicing := Voicings[Limb].Voice;
        for x := 1 to 10 do
        //for y := 0 to SoundAreas[x].NumSoundSources - 1 do
        begin
                if (SX > SoundAreas[x].AreaS.Left) AND (SX < SoundAreas[x].AreaS.Right)
                AND (SY > SoundAreas[x].AreaS.Top) AND (SY < SoundAreas[x].AreaS.Bottom)
                AND (CanvasN = SoundAreas[x].AreaXOnCanvas)
                then
                begin
                NewVoicing := NewVoicing + SourceChars[x];
                Voicings[Limb].SourceN[Length(NewVoicing)] := x;
                end;
        end;
        Voicings[Limb].Voice := NewVoicing;
end;

procedure Tfrmkit.AssignSoundSource(Index : Integer; AssArea : TRect; OnCanvas : Byte);
begin
        if Index > 0 then
        begin
                SoundAreas[Index].HasSoundSource := True;
                SoundAreas[Index].AreaS := AssArea;
                SoundAreas[Index].AreaXOnCanvas := OnCanvas;
        end;
end;

procedure Tfrmkit.Design(Img : TImage; MoPos, NMoPos : TPoint);
var
        h, w : integer;
        CRec : TRect;
begin
        h := Img.Height;
        w := Img.Width;
        CRec := Rect(0,0,w,h);
        DesNew.Canvas.FillRect(CRec);

        if rdellipse.Checked = true then
                DesNew.Canvas.Ellipse(MoPos.X,MoPos.Y,NMoPos.X,NMoPos.Y);

        if rdrect.Checked = true then
                DesNew.Canvas.Rectangle(MoPos.X,MoPos.Y,NMoPos.X,NMoPos.Y);

        Img.Canvas.FillRect(CRec);
        Img.Canvas.CopyMode := cmSrcCopy;
        Img.Canvas.CopyRect(CRec,DesOld.Canvas,CRec);
        Img.Canvas.CopyMode := cmSrcAnd;
        Img.Canvas.CopyRect(CRec,DesNew.Canvas,CRec);
        Img.Canvas.CopyMode := cmSrcCopy;
end;

procedure Tfrmkit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        ApplyVoicings(1,frmmain.LimbPat[1].RhythmPat);
        ApplyVoicings(2,frmmain.LimbPat[2].RhythmPat);
        ApplyVoicings(3,frmmain.LimbPat[3].RhythmPat);
        ApplyVoicings(4,frmmain.LimbPat[4].RhythmPat);
        DesMode := true;
        ebtndesignkit.OnClick(Sender);

        if frmplayalong.showing = true then
        begin
        frmplayalong.enabled := true;
        frmplayalong.OnShow(frmkit);
        end
        else
        frmmain.enabled := true;

        frmmain.Updater([Patterns]);
end;

procedure Tfrmkit.rddrawrhClick(Sender: TObject);
begin
        Select := 1;
end;

procedure Tfrmkit.rddrawlhClick(Sender: TObject);
begin
        Select := 2;
end;

procedure Tfrmkit.rddrawrfClick(Sender: TObject);
begin
        Select := 3;
end;

procedure Tfrmkit.rddrawlfClick(Sender: TObject);
begin
        Select := 4;
end;

procedure Tfrmkit.FormCreate(Sender: TObject);
var
        x, h, w : integer;
begin
        frmkit.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
        CurCopy := TImage.Create(frmkit);
        CurCopyF := TImage.Create(frmkit);
        DesOld := TImage.Create(frmkit);
        DesNew := TImage.Create(frmkit);
        LimbImg[1] := TImage.Create(frmkit);
        LimbImg[2] := TImage.Create(frmkit);
        h := imghands.Height;
        w := imghands.Width;
        DesOld.Height := h;
        DesOld.Width := w;
        DesNew.Height := h;
        DesNew.Width := w;
        LimbImg[1].Width := w;
        LimbImg[2].Width := w;
        LimbImg[1].Height := h;
        LimbImg[2].Height := h;
        DesNew.Canvas.CopyMode := SrcCopy;
        DesMode := False;
        for x := 1 to 4 do
        begin
                Voicings[x].Voice := '';
                LastPlace[x] := Point(0,0);
                Firsttime[x] := True;
                VoiceImg[x] := TImage.Create(frmkit);
                VoiceImg[x].Height := h;
                VoiceImg[x].Width := w;
                VoiceImg[x].Canvas.Pen.Width := 2;
        end;
        VoiceImg[1].Canvas.Pen.Color := clRed;
        VoiceImg[2].Canvas.Pen.Color := clBlue;
        VoiceImg[3].Canvas.Pen.Color := clGreen;
        VoiceImg[4].Canvas.Pen.Color := clYellow;
        imghands.Canvas.FillRect(Rect(0,0,w,h));
        ClearSoundAreas(1);
        imgfeet.Canvas.FillRect(Rect(0,0,w,h));
        ClearSoundAreas(2);

        for x := 1 to 10 do
                SoundAreas[x].HasSoundSource := False;

        LoadStandardTemplate;

        imghands.FreeNotification(frmmain);
        imgfeet.FreeNotification(frmmain);
        limbimg[1].FreeNotification(frmmain);
        limbimg[2].FreeNotification(frmmain);
end;

procedure Tfrmkit.imgfeetMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
        w, h : integer;
begin
        w := imgfeet.Width;
        h := imgfeet.Height;
        if rddrawrf.Checked = true then Select := 3;
        if rddrawlf.Checked = true then Select := 4;
        ImageMouseDown(X,Y,imgfeet,2);
        imgfeet.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[2].Canvas,Rect(0,0,w,h));
end;

procedure Tfrmkit.imghandsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
        w, h : integer;
begin
        w := imghands.Width;
        h := imghands.Height;
        if rddrawrh.Checked = true then Select := 1;
        if rddrawlh.Checked = true then Select := 2;
        ImageMouseDown(X,Y,imghands,1);
        imghands.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[1].Canvas,Rect(0,0,w,h));
end;

procedure Tfrmkit.btnsavehandsClick(Sender: TObject);
begin
        vsaver.FileName := 'Untitled Voicing';
        vsaver.Execute;
        if NOT(vsaver.FileName = 'Untitled Voicing') then
                SaveAll(1);
end;

procedure Tfrmkit.btnsavefeetClick(Sender: TObject);
begin
        vsaver.FileName := 'Untitled Voicing';
        vsaver.Execute;
        if NOT(vsaver.FileName = 'Untitled Voicing') then
                SaveAll(2);
end;

procedure Tfrmkit.btnloadhandsClick(Sender: TObject);
begin
        vopener.FileName := '';
        vopener.Execute;
        if NOT(vopener.FileName = '') then
                LoadVoicing(1);
end;

procedure Tfrmkit.btnloadfeetClick(Sender: TObject);
begin
        vopener.FileName := '';
        vopener.Execute;
        if NOT(vopener.FileName = '') then
                LoadVoicing(2);
end;

procedure Tfrmkit.btnclearhandsClick(Sender: TObject);
begin
        //if btnclearhands.Focused = false then
        //begin
        imghands.Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        LimbImg[1].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        ClearSoundAreas(1);
        Firsttime[1] := true;
        Firsttime[2] := true;
        LastPlace[1] := Point(0,0);
        LastPlace[2] := Point(0,0);
        Voicings[1].Voice := '';
        Voicings[2].Voice := '';
        VoiceImg[1].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        VoiceImg[2].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        {end else
        if MessageDlg('This will clear the hands image, as well as all assigned sound areas and limb voicings. Do you wish to continue?',mtWarning,[mbYes,mbNo],0)
        = mrYes then
        begin
        imghands.Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        LimbImg[1].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        ClearSoundAreas(1);
        Firsttime[1] := true;
        Firsttime[2] := true;
        LastPlace[1] := Point(0,0);
        LastPlace[2] := Point(0,0);
        Voicings[1].Voice := '';
        Voicings[2].Voice := '';
        VoiceImg[1].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        VoiceImg[2].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        end; }
end;

procedure Tfrmkit.btnclearfeetClick(Sender: TObject);
begin
        //if btnclearfeet.Focused = false then
        //begin
        imgfeet.Canvas.FillRect(Rect(0,0,ImgFeet.Width,ImgFeet.Height));
        LimbImg[2].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        ClearSoundAreas(2);
        Firsttime[3] := true;
        Firsttime[4] := true;
        LastPlace[3] := Point(0,0);
        LastPlace[4] := Point(0,0);
        Voicings[3].Voice := '';
        Voicings[4].Voice := '';
        VoiceImg[3].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        VoiceImg[4].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        {end else
        if MessageDlg('This will clear the feet image, as well as all assigned sound areas and limb voicings. Do you wish to continue?',mtWarning,[mbYes,mbNo],0)
        = mrYes then
        begin
        imgfeet.Canvas.FillRect(Rect(0,0,ImgFeet.Width,ImgFeet.Height));
        LimbImg[2].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        ClearSoundAreas(2);
        Firsttime[3] := true;
        Firsttime[4] := true;
        LastPlace[3] := Point(0,0);
        LastPlace[4] := Point(0,0);
        Voicings[3].Voice := '';
        Voicings[4].Voice := '';
        VoiceImg[3].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        VoiceImg[4].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        end; }
end;

procedure Tfrmkit.btnreversehandsClick(Sender: TObject);
begin
        ReverseImage(LimbImg[1]);
        ReverseImage(VoiceImg[1]);
        ReverseImage(VoiceImg[2]);
        ReverseSoundAreas(1,imghands);
        imghands.Canvas.FillRect(Rect(0,0,imghands.Width,imghands.Height));
        imghands.Canvas.CopyRect(Rect(0,0,imghands.Width,imghands.Height),LimbImg[1].Canvas,Rect(0,0,imghands.Width,imghands.Height));
end;

procedure Tfrmkit.btnreversefeetClick(Sender: TObject);
begin
        ReverseImage(LimbImg[2]);
        ReverseImage(VoiceImg[3]);
        ReverseImage(VoiceImg[4]);
        ReverseSoundAreas(2,imgfeet);
        imgfeet.Canvas.FillRect(Rect(0,0,imgfeet.Width,imgfeet.Height));
        imgfeet.Canvas.CopyRect(Rect(0,0,imgfeet.Width,imgfeet.Height),LimbImg[2].Canvas,Rect(0,0,imgfeet.Width,imgfeet.Height));
end;

procedure Tfrmkit.btndesignkitClick(Sender: TObject);
begin
        if DesMode = false then
        begin
                LastPlace[5] := Point(0,0);
                DesOld.Canvas.CopyMode := cmSrcAnd;
                rddrawrh.Enabled := false;
                rddrawlh.Enabled := false;
                rddrawrf.Enabled := false;
                rddrawlf.Enabled := false;
                rddrawrh.Checked := false;
                rddrawlh.Checked := false;
                rddrawrf.Checked := false;
                rddrawlf.Checked := false;
                imghands.Enabled := true;
                imgfeet.Enabled := true;
                grpboxdesign.visible := true;
                DesMode := True;
        end
        else
        begin
                if frmmidi.chkmulti.Checked = true then
                begin
                rddrawrh.Enabled := true;
                rddrawlh.Enabled := true;
                rddrawrf.Enabled := true;
                rddrawlf.Enabled := true;
                end;
                Select := 0;
                DesMode := False;
                grpboxdesign.visible := false;
        end;
end;

procedure Tfrmkit.imghandsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
        w, h : integer;
begin
        w := imghands.Width;
        h := imghands.Height;
        ImageMouseUp(X,Y,LimbImg[1],1);
        imghands.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[1].Canvas,Rect(0,0,w,h));
end;

procedure Tfrmkit.imgfeetMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
        w, h : integer;
begin
        w := imgfeet.Width;
        h := imgfeet.Height;
        ImageMouseUp(X,Y,LimbImg[2],2);
        imgfeet.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[2].Canvas,Rect(0,0,w,h));
end;

procedure Tfrmkit.imgfeetMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
        w, h : integer;
begin
        w := imgfeet.Width;
        h := imgfeet.Height;
        if DesMode = true then
        if MPressed = true then
        begin
        Design(LimbImg[2],LastPlace[5],Point(X,Y));
        imgfeet.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[2].Canvas,Rect(0,0,w,h));
        end;
end;

procedure Tfrmkit.btnenddesignClick(Sender: TObject);
begin
        if frmmidi.chkmulti.Checked = true then
        begin
        rddrawrh.Enabled := true;
        rddrawlh.Enabled := true;
        rddrawrf.Enabled := true;
        rddrawlf.Enabled := true;
        end;
        Select := 0;
        DesMode := False;
        ebtndesignkit.enabled := true;
        grpboxdesign.visible := false;
end;

procedure Tfrmkit.imghandsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
        w, h : integer;
begin
        w := imghands.Width;
        h := imghands.Height;
        if DesMode = true then
        if MPressed = true then
        begin
        Design(LimbImg[1],LastPlace[5],Point(X,Y));
        imghands.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[1].Canvas,Rect(0,0,w,h));
        end;
end;

procedure Tfrmkit.sedtpenwidthChange(Sender: TObject);
begin
        imghands.Canvas.Pen.Width := sedtpenwidth.Value;
        imgfeet.Canvas.Pen.Width := sedtpenwidth.Value;
        DesNew.Canvas.Pen.Width := sedtpenwidth.Value;
end;

procedure Tfrmkit.clrboxChange(Sender: TObject);
begin
        DesNew.Canvas.Pen.Color := clrbox.Selected;
end;

procedure Tfrmkit.FormShow(Sender: TObject);
var
        x : byte;
begin
        frmdevcntrl.btnmidistop.Click;
        if frmmidi.chkmulti.Checked = true then
        begin
        grphands.Enabled := true;
        frmmain.EnabledAsParent(grphands);
        grpfeet.Enabled := true;
        frmmain.EnabledAsParent(grpfeet);
        ebtnrndvoice.Enabled := true;
        ebtndesignkit.Enabled := true;
        grpvoicecolor.Enabled := true;
        frmmain.EnabledAsParent(grpvoicecolor);
                for x := 1 to (cmbassignsound.Items.Count - 1) do
                begin
                VSoundList[x] := cmbassignsound.Items.Strings[x];
                end;   
        end
        else
        begin
        grphands.Enabled := false;
        frmmain.EnabledAsParent(grphands);
        grpfeet.Enabled := false;
        frmmain.EnabledAsParent(grpfeet);
        ebtnrndvoice.Enabled := false;
        ebtndesignkit.Enabled := false;
        grpvoicecolor.Enabled := false;
        frmmain.EnabledAsParent(grpvoicecolor);
        LoadStandardTemplate;
        end;
end;

procedure Tfrmkit.btnrndvoiceClick(Sender: TObject);
var
        X, Y, num, count, curcanv, select, limblr, w, h : integer;
        NoSource : Boolean;
begin
        Randomize;
        for num := 1 to 10 do
        if SoundAreas[num].HasSoundSource = False then
        NoSource := True
        else
        begin
        NoSource := False;
        Break;
        end;
        If NoSource = True then
        MessageDlg('No Sound Sources Exist!',mtInformation,[mbOk],0)
        else
        begin
                for curcanv := 1 to 2 do
                for LimbLR := 1 to 2 do
                begin
                Count := Random(frmrandopt.sedtmaxpatlength.value + 1);
                repeat
                        repeat
                        num := random(10) + 1;
                        until SoundAreas[num].HasSoundSource = True;
                if SoundAreas[num].AreaXOnCanvas = curcanv then
                begin

                X := SoundAreas[num].AreaS.Left + ((SoundAreas[num].AreaS.Right - SoundAreas[num].AreaS.Left) div 2);
                Y := SoundAreas[num].AreaS.Top + ((SoundAreas[num].AreaS.Bottom - SoundAreas[num].AreaS.Top) div 2);

              //  Select := Random(2) + 1;
                Select := LimbLR;
                if curcanv = 2 then Select := Select + 2;
                if Select > 0 then
                        if Firsttime[Select] = True then
                        begin
                        VoiceImg[Select].canvas.Ellipse(X-5,Y-5,X+5,Y+5);
                        Firsttime[Select] := False;
                        LastPlace[Select] := Point(X,Y);
                        UpdateVoicing(Select,X,Y);
                        end
                else
                        begin
                        VoiceImg[select].Canvas.PenPos := LastPlace[Select];
                        VoiceImg[select].Canvas.LineTo(X,Y);
                        LastPlace[Select] := Point(X,Y);
                        UpdateVoicing(Select,X,Y);
                        end;
                end;
                Count := Count - 1;
                until Count <= 0;
                end;
        end;

       {w := imghands.Width;
        h := imghands.Height;

        ImageMouseUp(0,0,LimbImg[1],1);
        imghands.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[1].Canvas,Rect(0,0,w,h));
        ImageMouseUp(0,0,LimbImg[2],2);
        imghands.Canvas.CopyRect(Rect(0,0,w,h),LimbImg[2].Canvas,Rect(0,0,w,h));
        }
end;

procedure Tfrmkit.btnokClick(Sender: TObject);
begin
        frmkit.Close;
end;

procedure Tfrmkit.btnvoiceclearhandsClick(Sender: TObject);
begin
        if MessageDlg('This will clear the voicings for the hands. Do you wish to continue?',mtWarning,[mbYes,mbNo],0)
        = mrYes then
        begin
        Firsttime[1] := true;
        Firsttime[2] := true;
        LastPlace[1] := Point(0,0);
        LastPlace[2] := Point(0,0);
        Voicings[1].Voice := '';
        Voicings[2].Voice := '';
        VoiceImg[1].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        VoiceImg[2].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        end;
end;

procedure Tfrmkit.btnvoiceclearfeetClick(Sender: TObject);
begin
        if MessageDlg('This will clear the voicings for the feet. Do you wish to continue?',mtWarning,[mbYes,mbNo],0)
        = mrYes then
        begin
        Firsttime[3] := true;
        Firsttime[4] := true;
        LastPlace[3] := Point(0,0);
        LastPlace[4] := Point(0,0);
        Voicings[3].Voice := '';
        Voicings[4].Voice := '';
        VoiceImg[3].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        VoiceImg[4].Canvas.FillRect(Rect(0,0,ImgHands.Width,ImgHands.Height));
        end;
end;

procedure Tfrmkit.clrrhChange(Sender: TObject);
begin
        VoiceImg[1].Canvas.Pen.Color := clrrh.Selected;
end;

procedure Tfrmkit.clrlhChange(Sender: TObject);
begin
        VoiceImg[2].Canvas.Pen.Color := clrlh.Selected;
end;

procedure Tfrmkit.clrrfChange(Sender: TObject);
begin
        VoiceImg[3].Canvas.Pen.Color := clrrf.Selected;
end;

procedure Tfrmkit.clrlfChange(Sender: TObject);
begin
        VoiceImg[4].Canvas.Pen.Color := clrlf.Selected;
end;

procedure Tfrmkit.cmbassignsoundChange(Sender: TObject);
var
        x : byte;
begin
        for x := 1 to 10 do
        if cmbassignsound.Text = VSoundList[x] then
        begin
                VSoundIndex := x;
                Break;
        end
                else
                VSoundIndex := 0;
end;

procedure Tfrmkit.btnreloadstdClick(Sender: TObject);
begin
        ebtnclearhands.OnClick(Sender);
        ebtnclearfeet.Onclick(Sender);
        LoadStandardTemplate;
end;

end.
