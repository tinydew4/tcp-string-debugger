object fmMain: TfmMain
  Left = 86
  Height = 480
  Top = 86
  Width = 640
  Caption = 'TCP String Debugger'
  ClientHeight = 480
  ClientWidth = 640
  Position = poWorkAreaCenter
  LCLVersion = '7.1'
  object PnTop: TPanel
    Left = 0
    Height = 32
    Top = 0
    Width = 640
    Align = alTop
    ClientHeight = 32
    ClientWidth = 640
    TabOrder = 0
    object EdtPort: TLabeledEdit
      Left = 48
      Height = 23
      Top = 4
      Width = 80
      Alignment = taRightJustify
      EditLabel.Height = 12
      EditLabel.Width = 26
      EditLabel.Caption = '&Port '
      EditLabel.ParentColor = False
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '80'
    end
    object BtnActive: TToggleBox
      Left = 136
      Height = 20
      Top = 4
      Width = 75
      Caption = '&Open'
      OnChange = BtnActiveChange
      TabOrder = 1
    end
  end
  object MmLog: TMemo
    Left = 0
    Height = 448
    Top = 32
    Width = 640
    Align = alClient
    ReadOnly = True
    ScrollBars = ssAutoBoth
    TabOrder = 1
    WordWrap = False
  end
  object TCPServer: TfclTCPServer
    BindAddress = '0.0.0.0'
    ServerPort = 0
    MaxReadBufferSize = 9000
    MaxWriteBufferSize = 9000
    OnStart = TCPServerStart
    OnStop = TCPServerStop
    OnClientAdd = TCPServerClientAdd
    OnClientRead = TCPServerClientRead
    OnClientClose = TCPServerClientClose
    UseWorkerThread = True
    Left = 16
    Top = 48
  end
end
