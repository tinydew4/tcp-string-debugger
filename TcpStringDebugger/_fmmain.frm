object fmMain: TfmMain
  Left = 86
  Height = 720
  Top = 86
  Width = 960
  Caption = 'TCP String Debugger'
  ClientHeight = 720
  ClientWidth = 960
  DesignTimePPI = 144
  Position = poWorkAreaCenter
  LCLVersion = '8.0'
  object PnTop: TPanel
    Left = 4
    Height = 40
    Top = 4
    Width = 952
    Align = alTop
    BorderSpacing.Around = 4
    BevelOuter = bvNone
    ClientHeight = 40
    ClientWidth = 952
    TabOrder = 0
    object BtnActive: TToggleBox
      Left = 200
      Height = 40
      Top = 0
      Width = 112
      Align = alLeft
      Caption = '&Open'
      OnChange = BtnActiveChange
      TabOrder = 0
    end
    object LbPort: TLabel
      Left = 0
      Height = 40
      Top = 0
      Width = 80
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '&Port'
      FocusControl = EdtPort
      Layout = tlCenter
    end
    object EdtPort: TEdit
      Left = 80
      Height = 32
      Top = 4
      Width = 120
      Align = alLeft
      Alignment = taRightJustify
      BorderSpacing.Top = 4
      BorderSpacing.Bottom = 4
      NumbersOnly = True
      TabOrder = 1
      Text = '80'
    end
  end
  object MmLog: TMemo
    Left = 0
    Height = 672
    Top = 48
    Width = 960
    Align = alClient
    ReadOnly = True
    ScrollBars = ssAutoBoth
    TabOrder = 1
    WordWrap = False
  end
  object TCPServer: TfclTCPServer
    BindAddress = '0.0.0.0'
    ServerPort = 0
    OnStarting = TCPServerStarting
    OnStopping = TCPServerStopping
    OnClientAdd = TCPServerClientAdd
    OnClientClose = TCPServerClientClose
    OnClientRead = TCPServerClientRead
    UseWorkerThread = True
    Left = 24
    Top = 72
  end
end
