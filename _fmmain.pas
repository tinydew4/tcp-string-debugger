unit _fmMain;

{$mode objfpc}{$H+}

interface

uses
  ExtCtrls, Forms, StdCtrls, SysUtils,
  flcTCPServer;

type

  { TfmMain }

  TfmMain = class(TForm)
    TCPServer: TfclTCPServer;
    EdtPort: TLabeledEdit;
    MmLog: TMemo;
    PnTop: TPanel;
    BtnActive: TToggleBox;
    procedure BtnActiveChange(Sender: TObject);
    procedure TCPServerClientAdd(Sender: TTCPServerClient);
    procedure TCPServerClientClose(Sender: TTCPServerClient);
    procedure TCPServerClientRead(Sender: TTCPServerClient);
    procedure TCPServerStart(Sender: TF5TCPServer);
    procedure TCPServerStop(Sender: TF5TCPServer);
  private
  public
    procedure AfterConstruction; override;
  end;

var
  fmMain: TfmMain;

implementation

uses
  Windows;

{$R *.frm}

{ TfmMain }

procedure TfmMain.AfterConstruction;
begin
  inherited AfterConstruction;
  Windows.SetWindowLong(EdtPort.Handle, GWL_STYLE, ES_NUMBER or GetWindowLong(EdtPort.Handle, GWL_STYLE));
end;

procedure TfmMain.BtnActiveChange(Sender: TObject);
begin
  BtnActive.Enabled := False;
  if BtnActive.Checked then begin
    TCPServer.ServerPort := StrToInt(EdtPort.Text);
  end;
  TCPServer.Active := BtnActive.Checked;
end;

procedure TfmMain.TCPServerClientAdd(Sender: TTCPServerClient);
begin
  MmLog.Lines.Add('Connection accepted: ' + Sender.RemoteAddrStr);
end;

procedure TfmMain.TCPServerClientClose(Sender: TTCPServerClient);
begin
  MmLog.Lines.Add('Connection closed: ' + Sender.RemoteAddrStr);
end;

procedure TfmMain.TCPServerClientRead(Sender: TTCPServerClient);
var
  Message: string;
  Bytes: TBytes;
begin
  Bytes := Sender.Connection.ReadBytes(MaxInt);
  Message := string(TEncoding.UTF8.GetString(Bytes));
  Message := StringReplace(Message, #13, '\r', [rfReplaceAll]);
  Message := StringReplace(Message, #10, '\n', [rfReplaceAll]);
  MmLog.Lines.Add(Message);
  MmLog.VertScrollBar.Position := MmLog.VertScrollBar.Range - MmLog.VertScrollBar.Page;
end;

procedure TfmMain.TCPServerStart(Sender: TF5TCPServer);
begin
  BtnActive.Caption := 'Cl&ose';
  BtnActive.Enabled := True;
end;

procedure TfmMain.TCPServerStop(Sender: TF5TCPServer);
begin
  BtnActive.Caption := '&Open';
  BtnActive.Enabled := True;
end;

end.

