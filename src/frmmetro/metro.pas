unit metro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ComCtrls, DateUtils, Buttons,
  ButtonComps;

type
  Tfrmmetro = class(TForm)
    pnlmetro: TPanel;
    lblinterval: TLabel;
    lblbpm: TLabel;
    edtbpm: TSpinEdit;
    chksound: TCheckBox;
    chkboxline: TCheckBox;
    grppulse: TGroupBox;
    lbltempo: TLabel;
    btntempotap: TButton;
    lblint: TLabel;
    tmrtest: TTimer;
    btnquarter: TSpeedButton;
    btnwhole: TSpeedButton;
    btnhalf: TSpeedButton;
    btneight: TSpeedButton;
    btnsixteen: TSpeedButton;
    btn32: TSpeedButton;
    tmrsubdiv: TTimer;
    grpsubdiv: TGroupBox;
    sedtmsubs: TSpinEdit;
    lblmsubs: TLabel;
    chksother: TCheckBox;
    edtspattern: TEdit;
    edtmpattern: TEdit;
    chkmother: TCheckBox;
    barmetrovols: TTrackBar;
    lblmetrovols: TLabel;
    lblsubdivnote: TLabel;
    cmbsubdiv: TComboBox;
    barmetrovola: TTrackBar;
    lblmetrovola: TLabel;
    lblmetrovoln: TLabel;
    barmetrovoln: TTrackBar;
    lblaccentnote: TLabel;
    cmbaccent: TComboBox;
    cmbnormal: TComboBox;
    lblnormnote: TLabel;
    btnswhole: TSpeedButton;
    btnshalf: TSpeedButton;
    btnsquarter: TSpeedButton;
    btnseigth: TSpeedButton;
    btnssixteen: TSpeedButton;
    btns32: TSpeedButton;
    imgmcurnotep: TImage;
    imgmcurnotes: TImage;
    sbtnok: TSquareButton;
    ebtnmetrotest: TEncartaButton;
    ebtnmetroreset: TEncartaButton;
    procedure chkmotherClick(Sender: TObject);
    procedure edtbpmchange(Sender: TObject);
    procedure chkboxlineClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnmetroresetClick(Sender: TObject);
    procedure btnmetrotestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbaccentChange(Sender: TObject);
    procedure cmbnormalChange(Sender: TObject);
    procedure btntempotapClick(Sender: TObject);
    procedure barmetrovolaChange(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure chksoundClick(Sender: TObject);
    procedure tmrtestTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtmpatternExit(Sender: TObject);
    procedure sedtmsubsChange(Sender: TObject);
    procedure btnquarterClick(Sender: TObject);
    procedure btnwholeClick(Sender: TObject);
    procedure btnhalfClick(Sender: TObject);
    procedure btneightClick(Sender: TObject);
    procedure btnsixteenClick(Sender: TObject);
    procedure btn32Click(Sender: TObject);
    procedure barmetrovolnChange(Sender: TObject);
    procedure barmetrovolsChange(Sender: TObject);
    procedure cmbsubdivChange(Sender: TObject);
    procedure tmrsubdivTimer(Sender: TObject);
    procedure chksotherClick(Sender: TObject);
    procedure edtspatternExit(Sender: TObject);
    procedure btns32Click(Sender: TObject);
    procedure btnssixteenClick(Sender: TObject);
    procedure btnseigthClick(Sender: TObject);
    procedure btnsquarterClick(Sender: TObject);
    procedure btnshalfClick(Sender: TObject);
    procedure btnswholeClick(Sender: TObject);

    procedure MetroPatternPulse;
    procedure MetroPatternSubdivision;
    procedure timermain(PData : Pointer);
    procedure timersubdiv(PData : Pointer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmetro: Tfrmmetro;
  TestOn : Boolean;
  MsgAcc, MsgNorm, MsgSubDiv : Integer;
  LastTime : TDateTime;
  MPatCPos, SPatCPos : Byte;
  ThrdMainTimer, ThrdSubDivTimer : DWORD;
  TimerOn : Boolean;
  pTimeMain, pTimeSub : Pointer;

implementation

uses GenCode, MMSystem, midi, devcntrl;

{$R *.dfm}

procedure tfrmmetro.timermain(PData : Pointer);
var
        SleepTime : Cardinal;
begin
        SleepTime := frmmetro.tmrtest.Interval;
        repeat
        CountPos := CountPos + 1;
        if CountPos >= Counts then begin CountPos := 0; BarCount := BarCount + 1; end;
        if BarCount >= frmmain.sedta.value then BarCount := 0;

        if frmmetro.chksound.Checked = false then
        if frmmetro.chkmother.Checked = true then
               frmmetro.MetroPatternPulse else
        if CountPos = 0 then
        midiOutShortMsg(hMid,frmmain.MidiMetro[1]) else
        midiOutShortMsg(hMid,frmmain.MidiMetro[2]);
        Sleep(SleepTime);
        until TimerOn = false;
end;

procedure tfrmmetro.timersubdiv(PData : Pointer);
var
        SleepTime : Cardinal;
begin
        SleepTime := frmmetro.tmrsubdiv.interval;
        repeat
        if frmmetro.chksound.Checked = false then
        if frmmetro.chksother.Checked = true then
               frmmetro.MetroPatternSubdivision else
        midiOutShortMsg(hMid,frmmain.MidiMetro[3]);
        Sleep(SleepTime);
        until TimerOn = false;
end;

procedure tfrmmetro.MetroPatternPulse;
var
        lenp : Byte;
        pattern : string;
begin
        pattern := edtmpattern.Text;
        lenp := length(pattern);

        if mpatcpos > lenp then mpatcpos := 1;
                if pattern[mpatcpos] = 'X' then
                midiOutShortMsg(hMid,MsgAcc);
                if pattern[mpatcpos] = 'x' then
                midiOutShortMsg(hMid,MsgNorm);
        mpatcpos := mpatcpos + 1;
end;

procedure tfrmmetro.MetroPatternSubdivision;
var
        lenp : Byte;
        pattern : string;
begin
        pattern := edtspattern.Text;
        lenp := length(pattern);

        if spatcpos > lenp then spatcpos := 1;
                if pattern[spatcpos] = 'X' then
                midiOutShortMsg(hMid,MsgSubDiv);
                if pattern[spatcpos] = 'x' then
                midiOutShortMsg(hMid,MsgSubDiv);
        spatcpos := spatcpos + 1;
end;

procedure Tfrmmetro.chkmotherClick(Sender: TObject);
begin
        edtmpattern.Enabled := chkmother.Checked;
end;

procedure Tfrmmetro.edtbpmChange(Sender: TObject);
begin
        frmdevcntrl.sedttempo.Value := edtbpm.Value;
        frmmain.Updater([Patterns,Times]);
end;

procedure Tfrmmetro.chkboxlineClick(Sender: TObject);
begin
        if chkboxline.Checked = false then
        frmmain.shpbar.Visible := false
        else frmmain.shpbar.Visible := true;
end;

procedure Tfrmmetro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        if TestOn = True then ebtnmetrotest.OnClick(Sender);
        frmmain.Enabled := true;
end;

procedure Tfrmmetro.btnmetroresetClick(Sender: TObject);
begin
        if MessageDlg('Restore default Metronome Settings?',mtWarning,[mbYes,mbNo],0)
        = mrYes then
        begin
        edtbpm.Value := 100;
        frmmain.metroy := 1;
        frmmain.metrox := 2;
        chkmother.Checked := false;
        edtmpattern.Text := '';
        barmetrovoln.Position := 64;
        cmbnormal.ItemIndex := 42;
        cmbaccent.ItemIndex := 41;
        cmbsubdiv.ItemIndex := 40;
        mpatcpos := 1;
        end;
end;

procedure Tfrmmetro.btnmetrotestClick(Sender: TObject);
begin
        if TestOn = False then
        begin
        TestOn := True;
        midiOutOpen(@hMid,frmmidi.lstmidiout.ItemIndex,0,0,CALLBACK_NULL);
        midiOutShortMsg(hMid,$000000C9);
        CountPos := -1;
        Barcount := 0;
        ebtnmetrotest.Caption := 'STOP';
        frmmain.Updater([Times]);
        TimerOn := True;
        beginthread(nil,0,pTimeMain,nil,0,ThrdMainTimer);
        beginthread(nil,0,pTimeSub,nil,0,ThrdSubDivTimer);
        //tmrtest.Enabled := true;
        //tmrsubdiv.Enabled := true;
        //tmrtest.OnTimer(frmmetro);
        //tmrsubdiv.OnTimer(frmmetro);
        end
        else
        begin
        TestOn := False;
        ebtnmetrotest.Caption := 'TEST';
        midiOutClose(hMid);
        tmrtest.Enabled := false;
        tmrsubdiv.Enabled := false;
        mpatcpos := 1;
        TimerOn := False;
        end;
end;

procedure Tfrmmetro.FormCreate(Sender: TObject);
begin
        pTimeMain := @tfrmmetro.timermain;
        pTimeSub := @tfrmmetro.timersubdiv;

        frmmetro.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
        TestOn := False;
        LastTime := Now;
        mpatcpos := 1;
        spatcpos := 1;
end;

procedure Tfrmmetro.cmbaccentChange(Sender: TObject);
begin
        MsgAcc := StrToInt('$' + IntToHex(cmbaccent.ItemIndex + 35,2));
        MsgAcc := StrToInt('$' + IntToHex(barmetrovola.Position,2) + IntToHex(MsgAcc,2) + '99');
        frmmain.MidiMetro[1] := MsgAcc;
end;

procedure Tfrmmetro.cmbnormalChange(Sender: TObject);
begin
        MsgNorm := StrToInt('$' + IntToHex(cmbnormal.ItemIndex + 35,2));
        MsgNorm := StrToInt('$' + IntToHex(barmetrovoln.Position,2) + IntToHex(MsgNorm,2) + '99');
        frmmain.MidiMetro[2] := MsgNorm;
end;

procedure Tfrmmetro.btntempotapClick(Sender: TObject);
var
        Interval : Integer;
        NewTime : TDateTime;
begin
        if TestOn = True then ebtnmetrotest.OnClick(Sender);
        NewTime := Now;
        Interval := MillisecondsBetween(NewTime,LastTime);
        edtbpm.Value :=  60000 div Interval;
        LastTime := Now;
end;

procedure Tfrmmetro.barmetrovolaChange(Sender: TObject);
begin
        MsgAcc := StrToInt('$' + IntToHex(cmbaccent.ItemIndex + 35,2));
        frmmain.MidiMetro[1] := StrToInt('$' + IntToHex(barmetrovola.Position,2) + IntToHex(MsgAcc,2) + '99');
end;

procedure Tfrmmetro.btnokClick(Sender: TObject);
begin
        frmmetro.Close;
end;

procedure Tfrmmetro.chksoundClick(Sender: TObject);
var
        GlyphImg : TBitmap;
begin
        GlyphImg := TBitmap.Create;
        GlyphImg.Height := 16;
        GlyphImg.Width := 16;
        if chksound.Checked = false then
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,23,true)
        else
        frmmain.imglist.Draw(GlyphImg.Canvas,0,0,24,true);
        frmdevcntrl.btnmetroclick.Glyph := GlyphImg;
        GlyphImg.Free;
end;

procedure Tfrmmetro.tmrtestTimer(Sender: TObject);
begin
        CountPos := CountPos + 1;
        if CountPos >= Counts then begin CountPos := 0; BarCount := BarCount + 1; end;
        if BarCount >= frmmain.sedta.value then BarCount := 0;

        if chksound.Checked = false then
        if chkmother.Checked = true then
               MetroPatternPulse else
        if CountPos = 0 then
        midiOutShortMsg(hMid,frmmain.MidiMetro[1]) else
        midiOutShortMsg(hMid,frmmain.MidiMetro[2]);
end;

procedure Tfrmmetro.FormShow(Sender: TObject);
begin
        ebtnmetrotest.Enabled := frmmidi.modevsfound;
        frmdevcntrl.btnmidistop.Click;
end;

procedure Tfrmmetro.edtmpatternExit(Sender: TObject);
var
        pattern : String;
        x, lenp : Byte;
begin
        pattern := edtmpattern.Text;
        if length(pattern) = 0 then pattern := 'x';
        lenp := length(pattern);
        for x := 1 to lenp do
                if (pattern[x] <> 'X') AND (pattern[x] <> 'x') AND (pattern[x] <> '-')
                then pattern[x] := 'x';

        edtmpattern.Text := pattern;
end;

procedure Tfrmmetro.sedtmsubsChange(Sender: TObject);
begin
        frmmain.metrox := sedtmsubs.Value;
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnquarterClick(Sender: TObject);
begin
        frmmain.metroy := 1;
        imgmcurnotep.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnwholeClick(Sender: TObject);
begin
        frmmain.metroy := (1/4);
        imgmcurnotep.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnhalfClick(Sender: TObject);
begin
        frmmain.metroy := (1/2);
        imgmcurnotep.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btneightClick(Sender: TObject);
begin
        frmmain.metroy := (2);
        imgmcurnotep.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnsixteenClick(Sender: TObject);
begin
        frmmain.metroy := (4);
        imgmcurnotep.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btn32Click(Sender: TObject);
begin
        frmmain.metroy := (8);
        imgmcurnotep.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.barmetrovolnChange(Sender: TObject);
begin
        MsgNorm := StrToInt('$' + IntToHex(cmbnormal.ItemIndex + 35,2));
        frmmain.MidiMetro[2] := StrToInt('$' + IntToHex(barmetrovoln.Position,2) + IntToHex(MsgNorm,2) + '99');
        barmetrovola.Min := barmetrovoln.Position;
end;

procedure Tfrmmetro.barmetrovolsChange(Sender: TObject);
begin
        MsgSubDiv := StrToInt('$' + IntToHex(cmbsubdiv.ItemIndex + 35,2));
        frmmain.MidiMetro[3] := StrToInt('$' + IntToHex(barmetrovols.Position,2) + IntToHex(MsgSubDiv,2) + '99');
end;

procedure Tfrmmetro.cmbsubdivChange(Sender: TObject);
begin
        MsgSubDiv := StrToInt('$' + IntToHex(cmbsubdiv.ItemIndex + 35,2));
        MsgSubDiv := StrToInt('$' + IntToHex(barmetrovols.Position,2) + IntToHex(MsgSubDiv,2) + '99');
        frmmain.MidiMetro[3] := MsgSubDiv;
end;

procedure Tfrmmetro.tmrsubdivTimer(Sender: TObject);
begin
        if chksound.Checked = false then
        if chksother.Checked = true then
               MetroPatternSubdivision else
        midiOutShortMsg(hMid,frmmain.MidiMetro[3]);
end;

procedure Tfrmmetro.chksotherClick(Sender: TObject);
begin
        edtspattern.enabled := chksother.Checked;
end;

procedure Tfrmmetro.edtspatternExit(Sender: TObject);
var
        pattern : String;
        x, lenp : Byte;
begin
        pattern := edtspattern.Text;
        if length(pattern) = 0 then pattern := 'x';
        lenp := length(pattern);
        for x := 1 to lenp do
                if (pattern[x] <> 'x') AND (pattern[x] <> '-')
                then pattern[x] := 'x';

        edtspattern.Text := pattern;
end;

procedure Tfrmmetro.btns32Click(Sender: TObject);
begin
        frmmain.metrosy := (8);
        imgmcurnotes.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnssixteenClick(Sender: TObject);
begin
        frmmain.metrosy := (4);
        imgmcurnotes.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnseigthClick(Sender: TObject);
begin
        frmmain.metrosy := (2);
        imgmcurnotes.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnsquarterClick(Sender: TObject);
begin
        frmmain.metrosy := (1);
        imgmcurnotes.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnshalfClick(Sender: TObject);
begin
        frmmain.metrosy := (1/2);
        imgmcurnotes.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

procedure Tfrmmetro.btnswholeClick(Sender: TObject);
begin
        frmmain.metrosy := (1/4);
        imgmcurnotes.canvas.CopyRect(Rect(0,0,16,16),(Sender as TSpeedButton).Glyph.Canvas,Rect(0,0,16,16));
        frmmain.Updater([Times]);
end;

end.
