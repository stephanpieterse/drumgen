unit devcntrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, dxCore, dxContainer, ButtonComps, ExtCtrls;

type
  Tfrmdevcntrl = class(TForm)
    grpmidiopts: TdxContainer;
    btnmidipause: TSpeedButton;
    btnmidiplay: TSpeedButton;
    btnmidistop: TSpeedButton;
    btnmetroclick: TSpeedButton;
    sedttempo: TSpinEdit;
    procedure btnmidiplayClick(Sender: TObject);
    procedure sedttempoChange(Sender: TObject);
    procedure btnmidistopClick(Sender: TObject);
    procedure btnmidipauseClick(Sender: TObject);
    procedure btnmetroclickClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PlayMIDIData(PData : Pointer);
    procedure ClearPlayAlongCanvas(PData : Pointer);
    procedure LoadTempImages;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdevcntrl: Tfrmdevcntrl;
// Stores the ID of the thread used to play MIDI messages.
  IDMIDIThread : DWORD;
// ID of the thread used to clear the PlayAlong Canvasses.
  IDClearThread : DWORD;
  pPlayMidi, pClearCanvas : Pointer;
  Images : Array[1..4] of TImage;

implementation

uses GenCode, midi, MMSystem, playalong, kit, metro;

{$R *.dfm}

procedure Tfrmdevcntrl.ClearPlayAlongCanvas(PData : Pointer);
var
        CnvSize : TRect;
        ShrtCell, ShrtWidth, SleepTime : Integer;
begin
        ShrtCell := 1;
        ShrtWidth := 1000;
        if frmmain.VGrid[1].CellWidth < ShrtWidth then begin ShrtWidth := frmmain.VGrid[1].CellWidth; ShrtCell := 1; end;
        if frmmain.VGrid[2].CellWidth < ShrtWidth then begin ShrtWidth := frmmain.VGrid[2].CellWidth; ShrtCell := 2; end;
        if frmmain.VGrid[3].CellWidth < ShrtWidth then begin ShrtWidth := frmmain.VGrid[3].CellWidth; ShrtCell := 3; end;
        if frmmain.VGrid[4].CellWidth < ShrtWidth then ShrtCell := 4;

        SleepTime := (frmmain.VGrid[ShrtCell].MIDITime[1] div 4);
        CnvSize := Rect(0,0,frmplayalong.imgplayhands.Width,frmplayalong.imgplayhands.Height);
        if frmplayalong.chkshowvoice.Checked = false then
        repeat
        Sleep(SleepTime);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayhands.Width,frmplayalong.imgplayhands.Height);
        frmplayalong.imgplayhands.Canvas.CopyRect(CnvSize,Images[1].Canvas,CnvSize);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayfeet.Width,frmplayalong.imgplayfeet.Height);
        frmplayalong.imgplayfeet.Canvas.CopyRect(CnvSize,Images[2].Canvas,CnvSize);
        until MIDIOnNow = False
        else
        repeat
        Sleep(SleepTime);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayhands.Width,frmplayalong.imgplayhands.Height);
        frmplayalong.imgplayhands.Canvas.CopyRect(CnvSize,Images[3].Canvas,CnvSize);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayfeet.Width,frmplayalong.imgplayfeet.Height);
        frmplayalong.imgplayfeet.Canvas.CopyRect(CnvSize,Images[4].Canvas,CnvSize);
        until MIDIOnNow = False;
        {repeat
        Sleep(SleepTime);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayhands.Width,frmplayalong.imgplayhands.Height);
        frmplayalong.imgplayhands.Canvas.CopyRect(CnvSize,frmkit.LimbImg[1].Canvas,CnvSize);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayfeet.Width,frmplayalong.imgplayfeet.Height);
        frmplayalong.imgplayfeet.Canvas.CopyRect(CnvSize,frmkit.LimbImg[2].Canvas,CnvSize);
        until MIDIOnNow = False
        else
        repeat
        Sleep(SleepTime);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayhands.Width,frmplayalong.imgplayhands.Height);
        frmplayalong.imgplayhands.Canvas.CopyRect(CnvSize,frmkit.imghands.Canvas,CnvSize);
      //  CnvSize := Rect(0,0,frmplayalong.imgplayfeet.Width,frmplayalong.imgplayfeet.Height);
        frmplayalong.imgplayfeet.Canvas.CopyRect(CnvSize,frmkit.imgfeet.Canvas,CnvSize);
        until MIDIOnNow = False;   }
end;

procedure Tfrmdevcntrl.PlayMIDIData(PData : Pointer);
var
        CurMidiPos : Byte;
        SrcNum : Byte;
        UMsg : Integer;
        UTime : Integer;
begin
        CurMidiPos := StartPos;
        repeat
        UMsg := frmmain.MIDIArray[CurMidiPos].Msg;
        UTime := frmmain.MIDIArray[CurMidiPos].Time;
        //frmplayalong.Highlight(UMsg);
        Sleep(UTime);

        for SrcNum := 1 to 10 do
        begin
        if (UMsg = frmmain.MIDICompCmd[SrcNum,2]) then
        begin
                frmplayalong.imgplayhands.Canvas.Brush.Color := frmplayalong.clrboxacc.Selected;
                frmplayalong.imgplayfeet.Canvas.Brush.Color := frmplayalong.clrboxacc.Selected;
                if frmkit.SoundAreas[SrcNum].HasSoundSource = True then
                        if frmkit.SoundAreas[SrcNum].AreaXOnCanvas = 1 then
                        frmplayalong.imgplayhands.Canvas.Ellipse(frmkit.SoundAreas[SrcNum].AreaS)
                        else
                        if frmkit.SoundAreas[SrcNum].AreaXOnCanvas = 2 then
                        frmplayalong.imgplayfeet.Canvas.Ellipse(frmkit.SoundAreas[SrcNum].AreaS);
                Break;
        end;
        if (UMsg = frmmain.MIDICompCmd[SrcNum,1]) then
        begin
                frmplayalong.imgplayhands.Canvas.Brush.Color := frmplayalong.clrboxnorm.Selected;
                frmplayalong.imgplayfeet.Canvas.Brush.Color := frmplayalong.clrboxnorm.Selected;
                if frmkit.SoundAreas[SrcNum].HasSoundSource = True then
                        if frmkit.SoundAreas[SrcNum].AreaXOnCanvas = 1 then
                        frmplayalong.imgplayhands.Canvas.Ellipse(frmkit.SoundAreas[SrcNum].AreaS)
                        else
                        if frmkit.SoundAreas[SrcNum].AreaXOnCanvas = 2 then
                        frmplayalong.imgplayfeet.Canvas.Ellipse(frmkit.SoundAreas[SrcNum].AreaS);
                Break;
        end;
        end; // End FOR 1 to 10

        midiOutShortMsg(hMid,UMsg);
        CurMidiPos := CurMidiPos + 1;
        if CurMidiPos >= HighMIDIArr then CurMidiPos := 1;
        
        until MIDIOnNow = False;
end;

procedure tfrmdevcntrl.LoadTempImages;
var
        CnvSize : TRect;
        x : Byte;
begin
        for x := 1 to 4 do
                Images[x].Free;
                
        for x := 1 to 4 do
        begin
                Images[x] := TImage.Create(frmdevcntrl);
                Images[x].Height := frmkit.imghands.Height;
                Images[x].Width := frmkit.imghands.Width;
        end;

        CnvSize := Rect(0,0,frmkit.imghands.width,frmkit.imghands.height);
        images[1].Canvas.CopyRect(CnvSize,frmkit.limbimg[1].Canvas,CnvSize);
        images[2].Canvas.CopyRect(CnvSize,frmkit.limbimg[2].Canvas,CnvSize);
        images[3].Canvas.CopyRect(CnvSize,frmkit.imghands.Canvas,CnvSize);
        images[4].Canvas.CopyRect(CnvSize,frmkit.imghands.Canvas,CnvSize);
end;

procedure Tfrmdevcntrl.btnmidiplayClick(Sender: TObject);
var
        GlyphImg : TBitmap;
begin
        if btnmidiplay.Flat = false then
        begin
        GlyphImg := TBitmap.Create;
        GlyphImg.Height := 16;
        GlyphImg.Width := 16;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,19,true);
        btnmidipause.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,27,true);
        btnmidiplay.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,21,true);
        btnmidistop.Glyph := GlyphImg;
        GlyphImg.Free;

        frmmain.Updater([Patterns]);
        midiOutOpen(@hMid,frmmidi.lstmidiout.ItemIndex,0,0,CALLBACK_NULL);
        midiOutShortMsg(hMid,$000000C9);
        MIDIOnNow := True;
        CreateThread(nil,0,pPlayMidi,nil,0,IDMIDIThread);
        CreateThread(nil,0,pClearCanvas,nil,0,IDClearThread);
        btnmidiplay.flat := true;
        btnmidistop.flat := false;
        btnmidipause.flat := false;
        frmmain.pulser.enabled := true;
        frmmain.scrolltimer.Enabled := true;
        end;
end;


procedure Tfrmdevcntrl.sedttempoChange(Sender: TObject);
begin
        btnmidistop.Click;
        frmmetro.edtbpm.Value := sedttempo.Value;
       // frmmetro.edtbpm.OnChange(Sender);
        //frmmain.Updater([Times]);
end;

procedure Tfrmdevcntrl.btnmidistopClick(Sender: TObject);
var
        GlyphImg : TBitmap;
begin
        if btnmidistop.Flat = false then
        begin
        GlyphImg := TBitmap.Create;
        GlyphImg.Height := 16;
        GlyphImg.Width := 16;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,26,true);
        btnmidipause.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,20,true);
        btnmidiplay.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,28,true);
        btnmidistop.Glyph := GlyphImg;
        GlyphImg.Free;

        btnmidiplay.flat := false;
        btnmidistop.flat := true;
        btnmidipause.flat := true;
        frmmain.pulser.enabled := false;
        MIDIOnNow := False;
        midiOutClose(hMid);
        CountPos := 0;
        frmmain.shpbar.Left := metrogrid.Left;
        frmmain.scrolltimer.Enabled := false;
        frmmain.scrlbarimgnotes.Position := 0;
        end;
end;

procedure Tfrmdevcntrl.btnmidipauseClick(Sender: TObject);
var
        GlyphImg : TBitmap;
begin
        if btnmidipause.Flat = false then
        begin
        GlyphImg := TBitmap.Create;
        GlyphImg.Height := 16;
        GlyphImg.Width := 16;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,26,true);
        btnmidipause.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,20,true);
        btnmidiplay.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,28,true);
        btnmidistop.Glyph := GlyphImg;
        GlyphImg.Free;

        btnmidiplay.flat := false;
        btnmidistop.flat := true;
        btnmidipause.flat := true;
        frmmain.pulser.enabled := false;
        frmmain.scrolltimer.Enabled := false;
        MIDIOnNow := False;
        midiOutClose(hMid);
        end;
end;

procedure Tfrmdevcntrl.btnmetroclickClick(Sender: TObject);
var
        GlyphImg : TBitmap;
begin
        frmmetro.chksound.Checked := NOT(frmmetro.chksound.Checked);
        GlyphImg := TBitmap.Create;
        GlyphImg.Height := 16;
        GlyphImg.Width := 16;
        if frmmetro.chksound.Checked = false then
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,23,true)
        else
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,24,true);
        btnmetroclick.Glyph := GlyphImg;
        GlyphImg.Free;
end;

procedure Tfrmdevcntrl.FormCreate(Sender: TObject);
var
        GlyphImg : TBitmap;
begin
        pPlayMidi := @tfrmdevcntrl.playmididata;
        pClearCanvas := @tfrmdevcntrl.clearplayalongcanvas;

        frmdevcntrl.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
        GlyphImg := TBitmap.Create;
        GlyphImg.Height := 16;
        GlyphImg.Width := 16;
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,24,true);
        btnmetroclick.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,26,true);
        btnmidipause.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,20,true);
        btnmidiplay.Glyph := GlyphImg;
        GlyphImg.Canvas.FillRect(Rect(0,0,16,16));
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,28,true);
        btnmidistop.Glyph := GlyphImg;
        GlyphImg.Free;

        LoadTempImages;

        btnmidiplay.flat := false;
        btnmidistop.flat := true;
        btnmidipause.flat := true;
        frmdevcntrl.Visible := true;
end;

procedure Tfrmdevcntrl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        frmmain.DeviceControls1.Checked := false;
end;

end.
