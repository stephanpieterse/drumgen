unit midi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdGlobal, Math, ComCtrls, ExtCtrls, ButtonComps;

type
  Tfrmmidi = class(TForm)
    barmidivoln: TTrackBar;
    barmidivola: TTrackBar;
    lblmidivoln: TLabel;
    lblmidivola: TLabel;
    cmbsound1: TComboBox;
    edtsound1: TEdit;
    edtsound2: TEdit;
    cmbsound2: TComboBox;
    cmbsound3: TComboBox;
    cmbsound4: TComboBox;
    cmbsound5: TComboBox;
    edtsound3: TEdit;
    edtsound4: TEdit;
    edtsound5: TEdit;
    edtsound6: TEdit;
    cmbsound6: TComboBox;
    edtsound7: TEdit;
    edtsound8: TEdit;
    cmbsound7: TComboBox;
    cmbsound8: TComboBox;
    imgsound1: TImage;
    imgsound2: TImage;
    imgsound3: TImage;
    imgsound4: TImage;
    imgsound5: TImage;
    imgsound6: TImage;
    imgsound7: TImage;
    imgsound8: TImage;
    grpboxmulti: TGroupBox;
    grpmidiout: TGroupBox;
    lstmidiout: TListBox;
    grpmidiin: TGroupBox;
    lstmidiin: TListBox;
    chkmulti: TCheckBox;
    edtsound9: TEdit;
    edtsound10: TEdit;
    imgsound9: TImage;
    imgsound10: TImage;
    cmbsound9: TComboBox;
    cmbsound10: TComboBox;
    lblmidivolgrace: TLabel;
    barmidivolgrace: TTrackBar;
    lblopen: TLabel;
    barmidigraceopen: TTrackBar;
    lbltight: TLabel;
    lblgraceopen: TLabel;
    lblrhins: TLabel;
    lbllhins: TLabel;
    lblrfins: TLabel;
    lbllfins: TLabel;
    sbtnok: TSquareButton;
    ebtnrefreshmidiin: TEncartaButton;
    ebtnrefreshmidiout: TEncartaButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure barmidivolnChange(Sender: TObject);
    procedure barmidivolaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbsound1Change(Sender: TObject);
    procedure cmbsound2Change(Sender: TObject);
    procedure cmbsound3Change(Sender: TObject);
    procedure cmbsound4Change(Sender: TObject);
    procedure cmbsound5Change(Sender: TObject);
    procedure cmbsound6Change(Sender: TObject);
    procedure cmbsound7Change(Sender: TObject);
    procedure cmbsound8Change(Sender: TObject);
    procedure edtsound1Exit(Sender: TObject);
    procedure edtsound2Exit(Sender: TObject);
    procedure edtsound3Exit(Sender: TObject);
    procedure edtsound4Exit(Sender: TObject);
    procedure edtsound5Exit(Sender: TObject);
    procedure edtsound6Exit(Sender: TObject);
    procedure edtsound7Exit(Sender: TObject);
    procedure edtsound8Exit(Sender: TObject);
    procedure btnrefreshmidioutClick(Sender: TObject);
    procedure btnrefreshmidiinClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure chkmultiClick(Sender: TObject);
    procedure edtsound9Exit(Sender: TObject);
    procedure edtsound10Exit(Sender: TObject);
    procedure cmbsound9Change(Sender: TObject);
    procedure cmbsound10Change(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure ErrorCheckerMultiSound(Edt : TEdit);
    procedure DrawLegend;
  private
    { Private declarations }
  public
    modevsfound, midevsfound : boolean;
    LegendImage : TImage;
  end;

var
  frmmidi: Tfrmmidi;
  MsgVolA, MsgVolN : Integer;
  MsgMulti : Array[1..10] of Integer;

implementation
uses GenCode, Kit, MMSystem, devcntrl;
{$R *.dfm}

procedure Tfrmmidi.DrawLegend;
var
        NotesUsed, CurNote, x : Byte;
        SoundNames : Array[1..10] of String[80];
        SoundImg : Array[1..10] of TImage;
        NewNoteRect, NoteRect : TRect;
        NoteUsed : Array[1..10] of Boolean;
begin
        for x := 1 to 10 do
                NoteUsed[x] := False;

        NotesUsed := 4;
        for x := 1 to 4 do
                NoteUsed[x] := True;
        if edtsound5.Text <> '?' then begin NotesUsed := NotesUsed + 1; NoteUsed[5] := True end;
        if edtsound6.Text <> '?' then begin NotesUsed := NotesUsed + 1; NoteUsed[6] := True end;
        if edtsound7.Text <> '?' then begin NotesUsed := NotesUsed + 1; NoteUsed[7] := True end;
        if edtsound8.Text <> '?' then begin NotesUsed := NotesUsed + 1; NoteUsed[8] := True end;
        if edtsound9.Text <> '?' then begin NotesUsed := NotesUsed + 1; NoteUsed[9] := True end;
        if edtsound10.Text <> '?' then begin NotesUsed := NotesUsed + 1; NoteUsed[10] := True end;

        NoteRect := Rect(0,0,17,17);

        for x := 1 to 10 do
        begin
                SoundImg[x] := TImage.Create(frmmidi);
                SoundImg[x].Height := 17;
                SoundImg[x].Width := 17;
        end;

        SoundImg[1].Canvas.CopyRect(NoteRect,imgsound1.Canvas,NoteRect);
        SoundImg[2].Canvas.CopyRect(NoteRect,imgsound2.Canvas,NoteRect);
        SoundImg[3].Canvas.CopyRect(NoteRect,imgsound3.Canvas,NoteRect);
        SoundImg[4].Canvas.CopyRect(NoteRect,imgsound4.Canvas,NoteRect);
        SoundImg[5].Canvas.CopyRect(NoteRect,imgsound5.Canvas,NoteRect);
        SoundImg[6].Canvas.CopyRect(NoteRect,imgsound6.Canvas,NoteRect);
        SoundImg[7].Canvas.CopyRect(NoteRect,imgsound7.Canvas,NoteRect);
        SoundImg[8].Canvas.CopyRect(NoteRect,imgsound8.Canvas,NoteRect);
        SoundImg[9].Canvas.CopyRect(NoteRect,imgsound9.Canvas,NoteRect);
        SoundImg[10].Canvas.CopyRect(NoteRect,imgsound10.Canvas,NoteRect);

        SoundNames[1] := cmbsound1.Text;
        SoundNames[2] := cmbsound2.Text;
        SoundNames[3] := cmbsound3.Text;
        SoundNames[4] := cmbsound4.Text;
        SoundNames[5] := cmbsound5.Text;
        SoundNames[6] := cmbsound6.Text;
        SoundNames[7] := cmbsound7.Text;
        SoundNames[8] := cmbsound8.Text;
        SoundNames[9] := cmbsound9.Text;
        SoundNames[10] := cmbsound10.Text;

        LegendImage := TImage.Create(frmmidi);
        LegendImage.Height := (20 * NotesUsed) + 40;
        LegendImage.Width := 180;

        for x := 1 to 10 do
        begin
                if NoteUsed[x] = True then
                begin
                        NewNoteRect := Rect(5,20*x,23,(20*x)+17);
                        LegendImage.Canvas.TextOut(30,20*x,SoundNames[x]);
                        LegendImage.Canvas.CopyRect(NewNoteRect,SoundImg[x].Canvas,NoteRect);
                end;
        end;

       // LegendImage.Picture.SaveToFile('C:\Test.bmp');

        for x := 1 to 10 do
                SoundImg[x].Free;

        //LegendImage.Free
end;

procedure Tfrmmidi.ErrorCheckerMultiSound(Edt : TEdit);
var
        LoadedS : Char;
begin
        LoadedS := Edt.Text[1];
        if LoadedS = '' then Edt.Text := '?';
        if Edt <> edtsound1 then if LoadedS = edtsound1.Text then LoadedS := '?';
        if Edt <> edtsound2 then if LoadedS = edtsound2.Text then LoadedS := '?';
        if Edt <> edtsound3 then if LoadedS = edtsound3.Text then LoadedS := '?';
        if Edt <> edtsound4 then if LoadedS = edtsound4.Text then LoadedS := '?';
        if Edt <> edtsound5 then if LoadedS = edtsound5.Text then LoadedS := '?';
        if Edt <> edtsound6 then if LoadedS = edtsound6.Text then LoadedS := '?';
        if Edt <> edtsound7 then if LoadedS = edtsound7.Text then LoadedS := '?';
        if Edt <> edtsound8 then if LoadedS = edtsound8.Text then LoadedS := '?';
        if NOT(LoadedS In ['a'..'z']) then LoadedS := '?';
        Edt.Text := LoadedS;
end;

procedure Tfrmmidi.FormClose(Sender: TObject; var Action: TCloseAction);
var
        x : byte;
begin
        if chkmulti.Checked = false then
        begin
                frmmain.nt1.Caption := 'x';
                frmmain.nt1.Visible := true;

                frmmain.MidiCompCmd[1,1] := MsgMulti[1] + MsgVolN + StrToInt('$99');
                frmmain.MidiCompCmd[2,1] := MsgMulti[2] + MsgVolN + StrToInt('$99');
                frmmain.MidiCompCmd[3,1] := MsgMulti[3] + MsgVolN + StrToInt('$99');
                frmmain.MidiCompCmd[4,1] := MsgMulti[4] + MsgVolN + StrToInt('$99');

                frmmain.MidiCompCmd[1,2] := MsgMulti[1] + MsgVolA + StrToInt('$99');
                frmmain.MidiCompCmd[2,2] := MsgMulti[2] + MsgVolA + StrToInt('$99');
                frmmain.MidiCompCmd[3,2] := MsgMulti[3] + MsgVolA + StrToInt('$99');
                frmmain.MidiCompCmd[4,2] := MsgMulti[4] + MsgVolA + StrToInt('$99');

                for x := 1 to 10 do
                frmmain.AllowedCharsA[x] := 'x';
        end;

        if chkmulti.Checked = true then
        begin
                if edtsound1.Text[1] <> '?' then begin frmmain.nt1.Caption := edtsound1.text[1] + ' - ' + cmbsound1.Text; frmmain.nt1.Visible := true; end else frmmain.nt1.Visible := false;
                if edtsound2.Text[1] <> '?' then begin frmmain.nt2.Caption := edtsound2.text[1] + ' - ' + cmbsound2.Text; frmmain.nt2.Visible := true; end else frmmain.nt2.Visible := false;
                if edtsound3.Text[1] <> '?' then begin frmmain.nt3.Caption := edtsound3.text[1] + ' - ' + cmbsound3.Text; frmmain.nt3.Visible := true; end else frmmain.nt3.Visible := false;
                if edtsound4.Text[1] <> '?' then begin frmmain.nt4.Caption := edtsound4.text[1] + ' - ' + cmbsound4.Text; frmmain.nt4.Visible := true; end else frmmain.nt4.Visible := false;
                if edtsound5.Text[1] <> '?' then begin frmmain.nt5.Caption := edtsound5.text[1] + ' - ' + cmbsound5.Text; frmmain.nt5.Visible := true; end else frmmain.nt5.Visible := false;
                if edtsound6.Text[1] <> '?' then begin frmmain.nt6.Caption := edtsound6.text[1] + ' - ' + cmbsound6.Text; frmmain.nt6.Visible := true; end else frmmain.nt6.Visible := false;
                if edtsound7.Text[1] <> '?' then begin frmmain.nt7.Caption := edtsound7.text[1] + ' - ' + cmbsound7.Text; frmmain.nt7.Visible := true; end else frmmain.nt7.Visible := false;
                if edtsound8.Text[1] <> '?' then begin frmmain.nt8.Caption := edtsound8.text[1] + ' - ' + cmbsound8.Text; frmmain.nt8.Visible := true; end else frmmain.nt8.Visible := false;
                if edtsound9.Text[1] <> '?' then begin frmmain.nt9.Caption := edtsound9.text[1] + ' - ' + cmbsound9.Text; frmmain.nt9.Visible := true; end else frmmain.nt9.Visible := false;
                if edtsound10.Text[1] <> '?' then begin frmmain.nt10.Caption := edtsound10.text[1] + ' - ' + cmbsound10.Text; frmmain.nt10.Visible := true; end else frmmain.nt10.Visible := false;

                frmmain.AllowedCharsA[1] := edtsound1.text[1];
                frmmain.AllowedCharsA[2] := edtsound2.text[1];
                frmmain.AllowedCharsA[3] := edtsound3.text[1];
                frmmain.AllowedCharsA[4] := edtsound4.text[1];
                frmmain.AllowedCharsA[5] := edtsound5.text[1];
                frmmain.AllowedCharsA[6] := edtsound6.text[1];
                frmmain.AllowedCharsA[7] := edtsound7.text[1];
                frmmain.AllowedCharsA[8] := edtsound8.text[1];
                frmmain.AllowedCharsA[9] := edtsound9.text[1];
                frmmain.AllowedCharsA[10] := edtsound10.text[1];

                for x := 1 to 10 do
                        begin
                        frmmain.MidiCompCmd[x,1] := MsgMulti[x] + MsgVolN + StrToInt('$99');
                        frmmain.MidiCompCmd[x,2] := MsgMulti[x] + MsgVolA + StrToInt('$99');
                        end;

                x := 1;
                frmkit.cmbassignsound.Enabled := true;
                frmkit.cmbassignsound.Items.Clear;
                frmkit.cmbassignsound.Items.Add('No Sound');
                if edtsound1.Text <> '?' then begin frmkit.SourceChars[x] := edtsound1.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound1.Text); x := x + 1; end;
                if edtsound2.Text <> '?' then begin frmkit.SourceChars[x] := edtsound2.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound2.Text); x := x + 1; end;
                if edtsound3.Text <> '?' then begin frmkit.SourceChars[x] := edtsound3.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound3.Text); x := x + 1; end;
                if edtsound4.Text <> '?' then begin frmkit.SourceChars[x] := edtsound4.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound4.Text); x := x + 1; end;
                if edtsound5.Text <> '?' then begin frmkit.SourceChars[x] := edtsound5.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound5.Text); x := x + 1; end;
                if edtsound6.Text <> '?' then begin frmkit.SourceChars[x] := edtsound6.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound6.Text); x := x + 1; end;
                if edtsound7.Text <> '?' then begin frmkit.SourceChars[x] := edtsound7.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound7.Text); x := x + 1; end;
                if edtsound8.Text <> '?' then begin frmkit.SourceChars[x] := edtsound8.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound8.Text); x := x + 1; end;
                if edtsound9.Text <> '?' then begin frmkit.SourceChars[x] := edtsound9.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound9.Text); x := x + 1; end;
                if edtsound10.Text <> '?' then begin frmkit.SourceChars[x] := edtsound10.text[1]; frmkit.cmbassignsound.Items.Add(cmbsound10.Text); end;
                frmkit.cmbassignsound.ItemIndex := 0;
        end
        else
                frmkit.cmbassignsound.Enabled := false;

        DrawLegend;        
        frmmain.Enabled := true;
end;

procedure Tfrmmidi.barmidivolnChange(Sender: TObject);
begin
        MsgVolN := StrToInt('$' + IntToHex(barmidivoln.Position,2) + '0000');
        barmidivola.Min := barmidivoln.Position;
        barmidivolgrace.max := barmidivoln.position - 1;
end;

procedure Tfrmmidi.barmidivolaChange(Sender: TObject);
begin
        MsgVolA := StrToInt('$' + IntToHex(barmidivola.Position,2) + '0000');
end;

procedure Tfrmmidi.FormCreate(Sender: TObject);
begin
        frmmidi.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
        frmmain.imglistsymbols.Draw(frmmidi.imgsound1.Canvas,0,0,0,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound2.Canvas,0,0,1,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound3.Canvas,0,0,2,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound4.Canvas,0,0,3,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound5.Canvas,0,0,4,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound6.Canvas,0,0,5,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound7.Canvas,0,0,6,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound8.Canvas,0,0,7,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound9.Canvas,0,0,8,true);
        frmmain.imglistsymbols.Draw(frmmidi.imgsound10.Canvas,0,0,9,true);
        MsgVolN := StrToInt('$' + IntToHex(barmidivoln.Position,2) + '0000');
        MsgVolA := StrToInt('$' + IntToHex(barmidivola.Position,2) + '0000');
        chkmulti.checked := false;
        cmbsound1.OnChange(Sender);
        cmbsound2.OnChange(Sender);
        cmbsound3.OnChange(Sender);
        cmbsound4.OnChange(Sender);
        cmbsound5.OnChange(Sender);
        cmbsound6.OnChange(Sender);
        cmbsound7.OnChange(Sender);
        cmbsound8.OnChange(Sender);
        cmbsound9.OnChange(Sender);
        cmbsound10.OnChange(Sender);
end;

procedure Tfrmmidi.cmbsound1Change(Sender: TObject);
begin
        MsgMulti[1] := StrToInt('$' + IntToHex(cmbsound1.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound2Change(Sender: TObject);
begin
        MsgMulti[2] := StrToInt('$' + IntToHex(cmbsound2.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound3Change(Sender: TObject);
begin
        MsgMulti[3] := StrToInt('$' + IntToHex(cmbsound3.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound4Change(Sender: TObject);
begin
        MsgMulti[4] := StrToInt('$' + IntToHex(cmbsound4.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound5Change(Sender: TObject);
begin
        MsgMulti[5] := StrToInt('$' + IntToHex(cmbsound5.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound6Change(Sender: TObject);
begin
        MsgMulti[6] := StrToInt('$' + IntToHex(cmbsound6.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound7Change(Sender: TObject);
begin
        MsgMulti[7] := StrToInt('$' + IntToHex(cmbsound7.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound8Change(Sender: TObject);
begin
        MsgMulti[8] := StrToInt('$' + IntToHex(cmbsound8.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound9Change(Sender: TObject);
begin
        MsgMulti[9] := StrToInt('$' + IntToHex(cmbsound9.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.cmbsound10Change(Sender: TObject);
begin
        MsgMulti[10] := StrToInt('$' + IntToHex(cmbsound10.ItemIndex + 35,2) + '00');
end;

procedure Tfrmmidi.edtsound1Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound1);
end;

procedure Tfrmmidi.edtsound2Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound2);
end;

procedure Tfrmmidi.edtsound3Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound3);
end;

procedure Tfrmmidi.edtsound4Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound4);
end;

procedure Tfrmmidi.edtsound5Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound5);
end;

procedure Tfrmmidi.edtsound6Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound6);
end;

procedure Tfrmmidi.edtsound7Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound7);
end;

procedure Tfrmmidi.edtsound8Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound8);
end;

procedure Tfrmmidi.edtsound9Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound9);
end;

procedure Tfrmmidi.edtsound10Exit(Sender: TObject);
begin
        ErrorCheckerMultiSound(edtsound10);
end;

procedure Tfrmmidi.btnrefreshmidioutClick(Sender: TObject);
var
        x : integer;
        midicaps : MidiOutCaps;
begin
        lstmidiout.Clear;
        if MidiOutGetNumDevs = 0 then
        begin
                if MessageDlg('No MIDI Output Devices found! Features requiring MIDI Output will be disabled.',mtInformation,[mbOK],0) = mrOK then
                modevsfound := false
        end
        else
        begin
                for x := 0 to MidiOutGetNumDevs - 1 do
                begin
                MidiOutGetDevCaps(x,@midicaps,sizeof(midicaps));
                lstmidiout.Items.Add(midicaps.szPname);
                end;
        modevsfound := true;
        lstmidiout.ItemIndex := 0;
        end;

        frmdevcntrl.btnmidiplay.flat := NOT(modevsfound);
end;

procedure Tfrmmidi.btnrefreshmidiinClick(Sender: TObject);
var
        x : integer;
        midicaps : MidiInCaps;
begin
        lstmidiin.Clear;
        if MidiOutGetNumDevs = 0 then
        begin
                if MessageDlg('No MIDI Input Devices found! Features requiring MIDI Input will be disabled.',mtInformation,[mbOK],0) = mrOK then
                midevsfound := false;
        end
        else
        begin
                for x := 0 to MidiInGetNumDevs - 1 do
                begin
                MidiInGetDevCaps(x,@midicaps,sizeof(midicaps));
                lstmidiin.Items.Add(midicaps.szPname);
                end;
        midevsfound := true;
        lstmidiin.ItemIndex := 0;
        end;
end;

procedure Tfrmmidi.btnokClick(Sender: TObject);
begin
        frmmidi.Close;
end;

procedure Tfrmmidi.chkmultiClick(Sender: TObject);
begin
        frmkit.ebtnclearhands.OnClick(Sender);
        frmkit.ebtnclearfeet.OnClick(Sender);

        lblrhins.Enabled := not(lblrhins.Enabled);
        lbllhins.Enabled := not(lbllhins.Enabled);
        lblrfins.Enabled := not(lblrfins.Enabled);
        lbllfins.Enabled := not(lbllfins.Enabled);
end;

procedure Tfrmmidi.FormShow(Sender: TObject);
begin
        frmdevcntrl.btnmidistop.Click;
end;

end.
