object frmMain: TfrmMain
  Left = 427
  Top = 193
  Width = 900
  Height = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object cxgDatos: TcxGrid
    Left = 8
    Top = 8
    Width = 873
    Height = 497
    PopupMenu = PopupMenu
    TabOrder = 0
    object cxgDatosDBTableView1: TcxGridDBTableView
      OnDblClick = cxgDatosDBTableView1DblClick
      DataController.DataSource = dsDatos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxgDatosDBTableView1CustomDrawCell
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxgDatosDBTableView1id_orden: TcxGridDBColumn
        DataBinding.FieldName = 'id_orden'
      end
      object cxgDatosDBTableView1fecha: TcxGridDBColumn
        DataBinding.FieldName = 'fecha'
      end
      object cxgDatosDBTableView1cliente: TcxGridDBColumn
        DataBinding.FieldName = 'cliente'
      end
      object cxgDatosDBTableView1equipo_id: TcxGridDBColumn
        DataBinding.FieldName = 'equipo_id'
        Visible = False
      end
      object cxgDatosDBTableView1equipo: TcxGridDBColumn
        DataBinding.FieldName = 'equipo'
      end
      object cxgDatosDBTableView1marca: TcxGridDBColumn
        DataBinding.FieldName = 'marca'
      end
      object cxgDatosDBTableView1modelo: TcxGridDBColumn
        DataBinding.FieldName = 'modelo'
      end
      object cxgDatosDBTableView1numero_serie: TcxGridDBColumn
        DataBinding.FieldName = 'numero_serie'
      end
      object cxgDatosDBTableView1falla: TcxGridDBColumn
        DataBinding.FieldName = 'falla'
      end
      object cxgDatosDBTableView1estado_id: TcxGridDBColumn
        DataBinding.FieldName = 'estado_id'
        Visible = False
      end
      object cxgDatosDBTableView1estado: TcxGridDBColumn
        DataBinding.FieldName = 'estado'
      end
    end
    object cxgDatosLevel1: TcxGridLevel
      GridView = cxgDatosDBTableView1
    end
  end
  object MainMenu: TMainMenu
    Left = 560
    Top = 8
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object SALIR1: TMenuItem
        Caption = 'SALIR'
        OnClick = SALIR1Click
      end
    end
    object ABMs1: TMenuItem
      Caption = 'ABMs'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Equipos1: TMenuItem
        Caption = 'Equipos'
        OnClick = Equipos1Click
      end
      object Marcas1: TMenuItem
        Caption = 'Marcas'
        OnClick = Marcas1Click
      end
    end
    object OrdenDeTrabajo1: TMenuItem
      Caption = 'Orden de Trabajo'
      object NuevaOrdenTrabajo: TMenuItem
        Caption = 'Nueva Orden de Trabajo'
        OnClick = NuevaOrdenTrabajoClick
      end
      object ModificarOrdenTrabajo: TMenuItem
        Caption = 'Modificar la Orden de Trabajo'
        OnClick = ModificarOrdenTrabajoClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ImprimirOrdenTrabajo: TMenuItem
        Caption = 'Imprimir la Orden de Trabajo'
        OnClick = ImprimirOrdenTrabajoClick
      end
    end
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmConexion.zroqOrdenes
    Left = 176
    Top = 80
  end
  object PopupMenu: TPopupMenu
    Left = 568
    Top = 104
    object popupNuevaOrdenTrabajo: TMenuItem
      Caption = 'Nueva Orden de trabajo'
      OnClick = popupNuevaOrdenTrabajoClick
    end
    object popupModificarOrdenTrabajo: TMenuItem
      Caption = 'Modificar la Orden de trabajo'
      OnClick = popupModificarOrdenTrabajoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popupImprimirOrdenTrabajo: TMenuItem
      Caption = 'Imprimir la Orden de rabajo'
      OnClick = popupImprimirOrdenTrabajoClick
    end
  end
end
