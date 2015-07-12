program GenP;

{$R 'AddRes.res' 'AddRes.rc'}

uses
  Forms,
  GenCode in 'GenCode.pas' {frmmain},
  About in 'frmabout\About.pas' {FrmAbout},
  metro in 'frmmetro\metro.pas' {frmmetro},
  kit in 'frmkit\kit.pas' {frmkit},
  randopt in 'frmrandopt\randopt.pas' {frmrandopt},
  comment in 'frmcomment\comment.pas' {frmcomment},
  midi in 'frmmidi\midi.pas' {frmmidi},
  prefs in 'frmprefs\prefs.pas' {frmprefs},
  sticking in 'frmsticking\sticking.pas' {frmsticking},
  playalong in 'frmplayalong\playalong.pas' {frmplayalong},
  devcntrl in 'frmdevcntrl\devcntrl.pas' {frmdevcntrl},
  reg in 'frmreg\reg.pas' {frmreg},
  rhythmtrain in 'frmrhythmtrain\rhythmtrain.pas' {frmrhythmtrain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'The Ultimate Drum Excercise Generator';
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmmetro, frmmetro);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(Tfrmrandopt, frmrandopt);
  Application.CreateForm(Tfrmcomment, frmcomment);
  Application.CreateForm(Tfrmmidi, frmmidi);
  Application.CreateForm(Tfrmprefs, frmprefs);
  Application.CreateForm(Tfrmsticking, frmsticking);
  Application.CreateForm(Tfrmplayalong, frmplayalong);
  Application.CreateForm(Tfrmkit, frmkit);
  Application.CreateForm(Tfrmdevcntrl, frmdevcntrl);
  Application.CreateForm(Tfrmreg, frmreg);
  Application.CreateForm(Tfrmrhythmtrain, frmrhythmtrain);
  Application.Run;
end.
