program Sismul;

uses
  Forms,
  USismul in 'USismul.pas' {FMain},
  UAbout in 'UAbout.pas' {FAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Compression & Decompression';
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFAbout, FAbout);
  Application.Run;
end.
