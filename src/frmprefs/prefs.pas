unit prefs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Midi, Spin, ButtonComps;

type
  Tfrmprefs = class(TForm)
    chkdispcomment: TCheckBox;
    chkrhact: TCheckBox;
    chklhact: TCheckBox;
    chkrfact: TCheckBox;
    chklfact: TCheckBox;
    grpactivelimbs: TGroupBox;
    grpaccentoptions: TGroupBox;
    rdbtnaccshift: TRadioButton;
    rdbtnaccadapt: TRadioButton;
    chkcomplexsubdiv: TCheckBox;
    chkautoaddpatrep: TCheckBox;
    chkshowstathints: TCheckBox;
    lblbeats: TLabel;
    sedtcountin: TSpinEdit;
    chkcount: TCheckBox;
    sbtnok: TSquareButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkrhactClick(Sender: TObject);
    procedure chklhactClick(Sender: TObject);
    procedure chkrfactClick(Sender: TObject);
    procedure chklfactClick(Sender: TObject);
    procedure chkcomplexsubdivClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkshowstathintsClick(Sender: TObject);
    procedure chkcountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprefs: Tfrmprefs;

implementation

uses GenCode, randopt, devcntrl;

{$R *.dfm}

procedure Tfrmprefs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        frmmain.Updater([Patterns]);
        frmmain.enabled := true;
end;

procedure Tfrmprefs.chkrhactClick(Sender: TObject);
begin
        frmmain.LimbPat[1].Active := chkrhact.Checked;
        frmmain.LimbPat[1].Mute := NOT(chkrhact.Checked);
end;

procedure Tfrmprefs.chklhactClick(Sender: TObject);
begin
        frmmain.LimbPat[2].Active := chklhact.Checked;
        frmmain.LimbPat[2].Mute := NOT(chklhact.Checked);
end;

procedure Tfrmprefs.chkrfactClick(Sender: TObject);
begin
        frmmain.LimbPat[3].Active := chkrfact.Checked;
        frmmain.LimbPat[3].Mute := NOT(chkrfact.Checked);
end;

procedure Tfrmprefs.chklfactClick(Sender: TObject);
begin
        frmmain.LimbPat[4].Active := chklfact.Checked;
        frmmain.LimbPat[4].Mute := NOT(chklfact.Checked);
end;

procedure Tfrmprefs.chkcomplexsubdivClick(Sender: TObject);
var
        ChkState : Boolean;
begin
        ChkState := chkcomplexsubdiv.Checked;
        frmmain.sedtsubnotes.Enabled := ChkState;
        frmrandopt.sedtmaxsubnotes.enabled := false;

        if ChkState = False then
        begin
        frmmain.sedtsubnotes.Value := 2;
        frmrandopt.sedtmaxsubnotes.value := 2;
        end;
end;

procedure Tfrmprefs.btnokClick(Sender: TObject);
begin
        frmprefs.Close;
end;

procedure Tfrmprefs.FormCreate(Sender: TObject);
begin
        frmprefs.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
end;

procedure Tfrmprefs.FormShow(Sender: TObject);
begin
        frmdevcntrl.btnmidistop.Click;
end;

procedure Tfrmprefs.chkshowstathintsClick(Sender: TObject);
begin
        frmmain.statbar.AutoHint := chkshowstathints.Checked;
end;

procedure Tfrmprefs.chkcountClick(Sender: TObject);
begin
        sedtcountin.Enabled := chkcount.Checked;
end;

end.
