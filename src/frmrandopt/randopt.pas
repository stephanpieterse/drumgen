unit randopt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, dxCore, dxButtons, ButtonComps;

type
  Tfrmrandopt = class(TForm)
    grpdiffopt: TGroupBox;
    chkaccent: TCheckBox;
    chkwhole: TCheckBox;
    chkhalf: TCheckBox;
    chkquarter: TCheckBox;
    chkeight: TCheckBox;
    chksixteen: TCheckBox;
    chkthirtytwo: TCheckBox;
    sedtmaxpatlength: TSpinEdit;
    sedtmaxacclength: TSpinEdit;
    lblmaxpat: TLabel;
    lblmaxacc: TLabel;
    lblmaxlength: TLabel;
    lblnotes: TLabel;
    sedtmaxsubnotes: TSpinEdit;
    sedtmaxsubdiv: TSpinEdit;
    lblsubdivs: TLabel;
    lblnotespace: TLabel;
    sbtnok: TSquareButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnokClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrandopt: Tfrmrandopt;

implementation

uses GenCode, devcntrl;

{$R *.dfm}

procedure Tfrmrandopt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        frmmain.InUseSub := [];
        frmmain.InUseNotes := [];

             {   if chknone.Checked = true then frmmain.InUseSub := frmmain.InUseSub + [None];
                if chktrip.Checked = true then frmmain.InUseSub := frmmain.InUseSub + [Trip];
                if chkquint.Checked = true then frmmain.InUseSub := frmmain.InUseSub + [Quint];
                if chksex.Checked = true then frmmain.InUseSub := frmmain.InUseSub + [Sex];
                if chksept.Checked = true then frmmain.InUseSub := frmmain.InUseSub + [Sept]; }

                if chkwhole.Checked = true then frmmain.InUseNotes := frmmain.InUseNotes + [Whole];
                if chkhalf.Checked = true then frmmain.InUseNotes := frmmain.InUseNotes + [Half];
                if chkquarter.Checked = true then frmmain.InUseNotes := frmmain.InUseNotes + [Quarter];
                if chkeight.Checked = true then frmmain.InUseNotes := frmmain.InUseNotes + [Eight];
                if chksixteen.Checked = true then frmmain.InUseNotes := frmmain.InUseNotes + [Sixteen];
                if chkthirtytwo.Checked = true then frmmain.InUseNotes := frmmain.InUseNotes + [ThirtyTwo];

        frmmain.enabled := true;
end;

procedure Tfrmrandopt.btnokClick(Sender: TObject);
begin
        frmrandopt.Close;
end;

{procedure Tfrmrandopt.rdbtnlegendClick(Sender: TObject);
begin
        chknone.Checked := true;
        chktrip.Checked := true;
        chkquint.Checked := true;
        chksex.Checked := true;
        chksept.Checked := true;
        chkwhole.Checked := true;
        chkhalf.Checked := true;
        chkquarter.Checked := true;
        chkeight.Checked := true;
        chksixteen.Checked := true;
        chkthirtytwo.Checked := true;
        chkaccent.Checked := true;
        rdbtnlegend.Checked := true;
end;    }

{procedure Tfrmrandopt.rdbtnproClick(Sender: TObject);
begin
        chknone.Checked := true;
        chktrip.Checked := true;
        chkquint.Checked := true;
        chksex.Checked := true;
        chksept.Checked := false;
        chkwhole.Checked := true;
        chkhalf.Checked := true;
        chkquarter.Checked := true;
        chkeight.Checked := true;
        chksixteen.Checked := true;
        chkthirtytwo.Checked := false;
        chkaccent.Checked := true;
        rdbtnpro.Checked := true;
end;   }

{procedure Tfrmrandopt.rdbtnadvancedClick(Sender: TObject);
begin
        chknone.Checked := true;
        chktrip.Checked := true;
        chkquint.Checked := true;
        chksex.Checked := false;
        chksept.Checked := false;
        chkwhole.Checked := true;
        chkhalf.Checked := true;
        chkquarter.Checked := true;
        chkeight.Checked := true;
        chksixteen.Checked := true;
        chkthirtytwo.Checked := false;
        chkaccent.Checked := true;
        rdbtnadvanced.Checked := true;
end;   }

{procedure Tfrmrandopt.rdbtnintermediateClick(Sender: TObject);
begin
        chknone.Checked := true;
        chktrip.Checked := true;
        chkquint.Checked := false;
        chksex.Checked := false;
        chksept.Checked := false;
        chkwhole.Checked := false;
        chkhalf.Checked := true;
        chkquarter.Checked := true;
        chkeight.Checked := true;
        chksixteen.Checked := true;
        chkthirtytwo.Checked := false;
        chkaccent.Checked := true;
        rdbtnintermediate.Checked := true;
end;      }

{procedure Tfrmrandopt.rdbtnamateurClick(Sender: TObject);
begin
        chknone.Checked := true;
        chktrip.Checked := false;
        chkquint.Checked := false;
        chksex.Checked := false;
        chksept.Checked := false;
        chkwhole.Checked := false;
        chkhalf.Checked := true;
        chkquarter.Checked := true;
        chkeight.Checked := true;
        chksixteen.Checked := false;
        chkthirtytwo.Checked := false;
        chkaccent.Checked := true;
        rdbtnamateur.Checked := true;
end;}

{procedure Tfrmrandopt.rdbtnbeginnerClick(Sender: TObject);
begin
        chknone.Checked := true;
        chktrip.Checked := false;
        chkquint.Checked := false;
        chksex.Checked := false;
        chksept.Checked := false;
        chkwhole.Checked := false;
        chkhalf.Checked := false;
        chkquarter.Checked := true;
        chkeight.Checked := true;
        chksixteen.Checked := false;
        chkthirtytwo.Checked := false;
        chkaccent.Checked := false;
        rdbtnbeginner.Checked := true;
end;      }

procedure Tfrmrandopt.FormCreate(Sender: TObject);
begin
        frmrandopt.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
end;

procedure Tfrmrandopt.FormShow(Sender: TObject);
begin
        frmdevcntrl.btnmidistop.Click;
end;

end.
