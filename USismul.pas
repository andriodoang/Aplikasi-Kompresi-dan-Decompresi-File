unit usismul;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, ComCtrls, ImgList, FileCtrl, pngimage;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    Add1: TMenuItem;
    RemoveSelected1: TMenuItem;
    RemoveAll1: TMenuItem;
    N1: TMenuItem;
    SelectAll1: TMenuItem;
    InvertSelection1: TMenuItem;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button1: TButton;
    lvComp: TListView;
    TabSheet2: TTabSheet;
    lvDecomp: TListView;
    Button2: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenFile1: TMenuItem;
    SelectAll2: TMenuItem;
    RemoveAll2: TMenuItem;
    Exit1: TMenuItem;
    Abaout1: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RemoveSelected1Click(Sender: TObject);
    procedure RemoveAll1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure InvertSelection1Click(Sender: TObject);

  private
    { Private declarations }
    procedure ExceptionHandler(Sender: TObject; e: Exception);
  public
    { Public declarations }
    function Folder:String;
  end;

var
  FMain: TFMain;

implementation

uses SysConst, zLibEx, UAbout;

{$R *.dfm}

const
  FORMAT_FLOAT = '#,#0.00  ;(#,#0.00) ;-   ';

var
  ListV : TListView;

// kompres

function CompressStreamToStream(const InStream, OutStream: TStream; const Level:TZCompressionLevel; var OutSize: Int64):Boolean;
begin

  try

  finally

  end;
end;

function CompressFileToFile(const InputFile, OutFile:String; const Level:TZCompressionLevel; var OutSize: Int64):Boolean;
var

begin

  try

  finally

  end;
end;

function CompressFileToStream(const InputFile: String; const Level:TZCompressionLevel; var OutStream:TStream; var OutSize: Int64):Boolean;
var

begin

end;

function CompressStreamToFile(InStream: TStream; const Level:TZCompressionLevel; const OutFile:String; var OutSize: Int64):Boolean;
var

begin

end;

//kompress

function DeCompressStreamToStream(const InStream, OutStream: TStream; var OutSize: Int64):Boolean;
begin
  Result := False;
  OutSize := 0;
  try
      ZDecompressStream(InStream, OutStream);
      OutSize := OutStream.Size;
      Result := True;
  finally

  end;
end;

function DeCompressFileToFile(const InputFile, OutFile:String; var OutSize: Int64):Boolean;
var
  SS, TS: TFileStream;
begin
  Result := False;
  SS := TFileStream.Create(InputFile, fmOpenRead + fmShareDenyNone);
  TS := TFileStream.Create(OutFile, fmCreate);
  OutSize := 0;
  try
      ZDecompressStream(SS, TS);
      OutSize := TS.Size;
      Result := True;
  finally
    TS.Free;
    SS.Free;
  end;
end;

function DeCompressFileToStream(const InputFile: String; var OutStream:TStream; var OutSize: Int64):Boolean;
var
  SS: TFileStream;
begin
  Result := False;
  OutStream.Size := 0;
  SS := TFileStream.Create(InputFile, fmOpenRead + fmShareDenyNone);
  OutSize := 0;
  try
      ZDecompressStream(SS, OutStream);
      OutSize := OutStream.Size;
      Result := True;
  finally
    SS.Free;
  end;
end;

function DeCompressStreamToFile(InStream: TStream; const OutFile:String; var OutSize: Int64):Boolean;
var
  TS: TFileStream;
begin
  Result := False;
  TS := TFileStream.Create(OutFile, fmCreate);
  OutSize := 0;
  try
      ZDecompressStream(InStream, TS);
      OutSize := TS.Size;
      Result := True;
  finally
    TS.Free;
  end;
end;

/////////////////////////////////

function FileSize(const AFile:String):int64;
begin
  Result := 0;
  with TFileStream.Create(AFile, fmOpenRead or fmShareDenyNone) do
  begin
    Result := Size;
    Free;
  end;
end;

function TFMain.Folder: String;
begin
  Result := '';
  SelectDirectory('Select Target Folder', '', Result);
end;

function ItemExists(List: TListView; const AItem:String):Boolean;
var
  i:integer;
begin
  Result := False;
  if List.Items.Count = 0 then exit;
  for i := 0 to List.Items.Count -1 do
  begin
    if lowercase(list.Items[i].Caption) = lowercase(Aitem) then
    begin
      Result := True;
      List.ItemIndex := i;
      List.Refresh;
      Break;
    end;
  end;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  Application.OnException := ExceptionHandler;
  PageControl1.ActivePageIndex := 0;
  Icon.Handle := Application.Icon.Handle;
  Caption := Application.Title;
  lvComp.Clear;
  lvDecomp.Clear;
  PageControl1Change(PageControl1);

end;

procedure TFMain.Button1Click(Sender: TObject);
var
  OutDir: String;
  AFileSrc, AFileTrg:String;
  i:integer;
  sz,x: int64;
begin
  if ListV.Items.Count = 0 then
  begin
    ExceptionHandler(Self, Exception.Create('Tidak ada file yang akan dikompres.'));
    exit


     end;


  OutDir := Folder();
  if trim(OutDir) = '' then exit;
  OutDir := ExcludeTrailingPathDelimiter(OutDir);
  if not DirectoryExists(OutDir) then
  begin
    raise Exception.Create('Direktori tidak ditemukan!');
    exit;
  end;
  for i:= 0 to ListV.Items.Count -1 do
  begin
    AFileSrc := ListV.Items[i].Caption;
    AFileTrg := OutDir +'\'+ ExtractFileName(AFileSrc)+'.zlib';
    ListV.Items[i].ImageIndex := 1;
    Application.ProcessMessages;
    x := FileSize(AFileSrc);
    if CompressFileToFile(AFileSrc, AFileTrg, zcMax, Sz) then
    begin
      ListV.Items[i].SubItems[1] := FormatFloat(FORMAT_FLOAT, sz/1024)+'KB';
      ListV.Items[i].SubItems[2] := FormatFloat(FORMAT_FLOAT, sz / x) +'%';
      ListV.Items[i].ImageIndex  := 2;
    end
    else
    begin
      ListV.Items[i].SubItems[2] := 'Error';
      ListV.Items[i].ImageIndex  := 6;

    end ;
    Application.ProcessMessages;
  end;
end;

procedure TFMain.ExceptionHandler(Sender: TObject; e: Exception);
begin
  MessageBox(handle,PChar('Following error has occured: '#13 + e.Message), 'Error', MB_ICONHAND);
end;

procedure TFMain.Exit1Click(Sender: TObject);
begin
close;
end;

procedure TFMain.Abaout1Click(Sender: TObject);
begin
fabout.Show;
end;

procedure TFMain.Add1Click(Sender: TObject);
var
  i:integer;
begin
  if PageControl1.ActivePageIndex = 1 then
  begin
    OpenDialog1.Filter := 'Zlib Compressed Files (*.zlib)|*.zlib';
  end
  else
  begin
    OpenDialog1.Filter := 'All Files (*.*)|*.*';
  end;
  if not OpenDialog1.Execute then exit;
  ListV.Items.BeginUpdate;
  try
    for i:=0 to OpenDialog1.Files.Count -1 do
    begin
      if ItemExists(ListV, OpenDialog1.Files[i]) then
        ExceptionHandler(Self, Exception.Create('File ini telah ada di daftar:'#13#13+OpenDialog1.Files[i]))
      else
      begin
        with ListV.Items.Add do
        begin
          Caption := OpenDialog1.Files[i];
          ImageIndex := 0;
          with SubItems do
          begin
            Add(FormatFloat(FORMAT_FLOAT, FileSize(OpenDialog1.Files[i])/1024)+'KB');
            Add(FormatFloat(FORMAT_FLOAT, 0)+'KB');
            add(FormatFloat('0.00',0)+'%');
          end;
        end;
      end;
    end;
  finally
    ListV.Items.EndUpdate;
  end;
end;

procedure TFMain.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    ListV := lvComp
  else
    ListV := lvDecomp;
end;

procedure TFMain.RemoveSelected1Click(Sender: TObject);
begin
  ListV.DeleteSelected;
end;

procedure TFMain.RemoveAll1Click(Sender: TObject);
begin
  ListV.Items.Clear;
end;

procedure TFMain.RemoveAll2Click(Sender: TObject);
begin
ListV.Items.Clear;
end;


procedure TFMain.InvertSelection1Click(Sender: TObject);
var
  i:integer;
begin
  ListV.Items.BeginUpdate;
  try
    for i:= 0 to ListV.Items.Count -1 do
    begin
      ListV.Items[i].Selected := not ListV.Items[i].Selected;
    end;
  finally
    ListV.Items.EndUpdate;
  end;
end;


end.
