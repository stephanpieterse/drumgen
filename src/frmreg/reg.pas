unit reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Psock, NMsmtp;

type
  TRegStats = record
        UserName : String[255];
        UserMail : String[255];
        UserOrg : String[255];
        ProgVer : Integer;
        ProgName : String[255];
        DefaultName : String[255];
  end;

  Tfrmreg = class(TForm)
    btnok: TButton;
    btnactivate: TButton;
    edtregcode: TEdit;
    edtlicenceid: TEdit;
    lbllicenceid: TLabel;
    lblregcode: TLabel;
    btnregister: TButton;
    edtemail: TEdit;
    edtname: TEdit;
    lblname: TLabel;
    lblemail: TLabel;
    lblnote: TLabel;
    smtpserver: TNMSMTP;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure btnactivateClick(Sender: TObject);
    procedure btnregisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreg: Tfrmreg;

implementation

uses GenCode, devcntrl;

{$R *.dfm}

procedure Tfrmreg.FormCreate(Sender: TObject);
begin
        frmreg.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
end;

procedure Tfrmreg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        frmmain.enabled := true;
end;

procedure Tfrmreg.FormShow(Sender: TObject);
begin
        frmdevcntrl.btnmidistop.click;
end;

procedure Tfrmreg.btnokClick(Sender: TObject);
begin
        frmreg.Close;
end;

procedure Tfrmreg.btnactivateClick(Sender: TObject);
begin
        Sleep(25);
        if frmmain.regcode.CheckRegistered = false then
        frmmain.regcode.DoRegistration(edtlicenceid.text,'',edtregcode.Text,edtemail.Text)
        else
        MessageDlg('You are already registered!',mtWarning,[mbOk],0);

        if frmmain.regcode.CheckExpired = true then
        MessageDlg('Your code has expired.',mtWarning,[mbOk],0);
        Sleep(Random(1000));
end;

procedure Tfrmreg.btnregisterClick(Sender: TObject);
var
        DatFile : File of TRegStats;
        RegData : TRegStats;
begin
        MessageDlg('Please e-mail the generated file to me, and your details will be sent to you shortly.',mtInformation,[mbOk],0);
        RegData.UserName := edtname.Text;
        RegData.UserOrg := frmmain.regcode.LicenseID;
        RegData.UserMail := edtemail.Text;
        RegData.ProgVer := 6022;
        RegData.ProgName := Application.ExeName;
        RegData.DefaultName := 'DrumGen';
        AssignFile(DatFile,'C:\Regdata.rgd');
        Rewrite(DatFile);
        Write(DatFile,RegData);
        CloseFile(DatFile);
end;

end.
