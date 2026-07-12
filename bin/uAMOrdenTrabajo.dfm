inherited frmAMOrdenTrabajo: TfrmAMOrdenTrabajo
  Left = 410
  Top = 133
  Width = 991
  Height = 665
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Orden de trabajo'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 648
    Top = 24
    Width = 103
    Height = 13
    Caption = 'No borrar -  hace falta'
  end
  object DBLookupComboBox1: TDBLookupComboBox [1]
    Left = 760
    Top = 16
    Width = 145
    Height = 21
    DataField = 'equipo_id'
    DataSource = dsDatos
    KeyField = 'id_equipo'
    ListField = 'numero_serie'
    ListSource = dsEquipos
    TabOrder = 7
  end
  inherited PanelButton: TPanel
    Top = 576
    inherited btnAceptar: TSpeedButton
      OnClick = btnAceptarClick
    end
    inherited btnSalir: TSpeedButton
      Visible = False
    end
  end
  inherited PanelHeader: TPanel
    inherited lInfo: TLabel
      Width = 96
      Caption = 'Orden de trabajo'
    end
  end
  object cxgEquipos: TcxGrid
    Left = 8
    Top = 64
    Width = 649
    Height = 177
    TabOrder = 2
    object cxgEquiposDBTableView1: TcxGridDBTableView
      DataController.DataSource = dsEquipos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxgEquiposDBTableView1id_equipo: TcxGridDBColumn
        DataBinding.FieldName = 'id_equipo'
        Visible = False
      end
      object cxgEquiposDBTableView1cliente_id: TcxGridDBColumn
        DataBinding.FieldName = 'cliente_id'
        Visible = False
      end
      object cxgEquiposDBTableView1cliente: TcxGridDBColumn
        DataBinding.FieldName = 'cliente'
      end
      object cxgEquiposDBTableView1tipo_equipo_id: TcxGridDBColumn
        DataBinding.FieldName = 'tipo_equipo_id'
        Visible = False
      end
      object cxgEquiposDBTableView1equipo: TcxGridDBColumn
        DataBinding.FieldName = 'equipo'
      end
      object cxgEquiposDBTableView1marca_id: TcxGridDBColumn
        DataBinding.FieldName = 'marca_id'
        Visible = False
      end
      object cxgEquiposDBTableView1marca: TcxGridDBColumn
        DataBinding.FieldName = 'marca'
      end
      object cxgEquiposDBTableView1modelo: TcxGridDBColumn
        DataBinding.FieldName = 'modelo'
      end
      object cxgEquiposDBTableView1numero_serie: TcxGridDBColumn
        DataBinding.FieldName = 'numero_serie'
      end
      object cxgEquiposDBTableView1observaciones: TcxGridDBColumn
        DataBinding.FieldName = 'observaciones'
      end
      object cxgEquiposDBTableView1fecha_alta: TcxGridDBColumn
        DataBinding.FieldName = 'fecha_alta'
      end
    end
    object cxgEquiposLevel1: TcxGridLevel
      GridView = cxgEquiposDBTableView1
    end
  end
  object dbmFalla: TDBMemo
    Left = 8
    Top = 248
    Width = 649
    Height = 57
    DataField = 'falla'
    DataSource = dsDatos
    TabOrder = 3
  end
  object cxgDetalles: TcxGrid
    Left = 8
    Top = 312
    Width = 737
    Height = 152
    PopupMenu = PopupMenuDetalle
    TabOrder = 4
    object cxgDetallesDBTableView1: TcxGridDBTableView
      OnDblClick = cxgDetallesDBTableView1DblClick
      DataController.DataSource = dsOrdenesDetalles
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxgDetallesDBTableView1CustomDrawCell
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxgDetallesDBTableView1id_orden_detalle: TcxGridDBColumn
        DataBinding.FieldName = 'id_orden_detalle'
        Visible = False
      end
      object cxgDetallesDBTableView1fecha: TcxGridDBColumn
        DataBinding.FieldName = 'fecha'
      end
      object cxgDetallesDBTableView1orden_id: TcxGridDBColumn
        DataBinding.FieldName = 'orden_id'
        Visible = False
      end
      object cxgDetallesDBTableView1detalle: TcxGridDBColumn
        DataBinding.FieldName = 'detalle'
      end
      object cxgDetallesDBTableView1tiempo: TcxGridDBColumn
        DataBinding.FieldName = 'tiempo'
      end
      object cxgDetallesDBTableView1estado_id: TcxGridDBColumn
        DataBinding.FieldName = 'estado_id'
        Visible = False
      end
      object cxgDetallesDBTableView1estado: TcxGridDBColumn
        DataBinding.FieldName = 'estado'
      end
    end
    object cxgDetallesLevel1: TcxGridLevel
      GridView = cxgDetallesDBTableView1
    end
  end
  object cxgRepuestos: TcxGrid
    Left = 8
    Top = 472
    Width = 737
    Height = 96
    PopupMenu = PopupMenuRespuesto
    TabOrder = 5
    object cxgRepuestosDBTableView1: TcxGridDBTableView
      OnDblClick = cxgRepuestosDBTableView1DblClick
      DataController.DataSource = dsOrdenesRepuestos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxgRepuestosDBTableView1id_orden_repuesto: TcxGridDBColumn
        DataBinding.FieldName = 'id_orden_repuesto'
        Visible = False
      end
      object cxgRepuestosDBTableView1fecha: TcxGridDBColumn
        DataBinding.FieldName = 'fecha'
      end
      object cxgRepuestosDBTableView1orden_id: TcxGridDBColumn
        DataBinding.FieldName = 'orden_id'
        Visible = False
      end
      object cxgRepuestosDBTableView1descripcion: TcxGridDBColumn
        DataBinding.FieldName = 'descripcion'
      end
      object cxgRepuestosDBTableView1costo: TcxGridDBColumn
        DataBinding.FieldName = 'costo'
      end
    end
    object cxgRepuestosLevel1: TcxGridLevel
      GridView = cxgRepuestosDBTableView1
    end
  end
  object gbOrdenDetalle: TGroupBox
    Left = 664
    Top = 56
    Width = 297
    Height = 249
    Caption = 'Detalle de la orden'
    TabOrder = 6
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Orden Nro.:'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 38
      Height = 13
      Caption = 'Tiempo:'
    end
    object Label6: TLabel
      Left = 8
      Top = 104
      Width = 54
      Height = 13
      Caption = 'Repuestos:'
    end
    object btnDetalleEquipo: TSpeedButton
      Left = 8
      Top = 136
      Width = 105
      Height = 22
      Caption = 'Detalle del equipo'
      Flat = True
      OnClick = btnDetalleEquipoClick
    end
    object dbtCostoTotal: TDBText
      Left = 72
      Top = 104
      Width = 66
      Height = 13
      AutoSize = True
      DataField = 'costo_total'
      DataSource = dsCosto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6336039
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbtIdOrden: TDBText
      Left = 72
      Top = 24
      Width = 53
      Height = 13
      AutoSize = True
      DataField = 'id_orden'
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14063668
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbtFecha: TDBText
      Left = 72
      Top = 40
      Width = 45
      Height = 13
      AutoSize = True
      DataField = 'fecha'
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14063668
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbtEstado: TDBText
      Left = 72
      Top = 56
      Width = 48
      Height = 13
      AutoSize = True
      DataField = 'estado'
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14063668
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lTiempoTotal: TLabel
      Left = 72
      Top = 88
      Width = 61
      Height = 13
      Caption = 'lTiempoTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6336039
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object dsDatos: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zqOrdenes
    Left = 424
    Top = 264
  end
  object dsEquipos: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zroqEquipos
    Left = 192
    Top = 120
  end
  object dsOrdenesDetalles: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zqOrdenesDetalles
    Left = 352
    Top = 336
  end
  object dsOrdenesRepuestos: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zqOrdenesRepuestos
    Left = 272
    Top = 504
  end
  object PopupMenuDetalle: TPopupMenu
    Left = 384
    Top = 336
    object AgregarDetalle1: TMenuItem
      Caption = 'Agregar Detalle'
      OnClick = AgregarDetalle1Click
    end
    object ModificarDetalle1: TMenuItem
      Caption = 'Modificar Detalle'
      OnClick = ModificarDetalle1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object BorrarDetalle1: TMenuItem
      Caption = 'Borrar Detalle'
      OnClick = BorrarDetalle1Click
    end
  end
  object PopupMenuRespuesto: TPopupMenu
    Left = 304
    Top = 504
    object AgregarRepuesto1: TMenuItem
      Caption = 'Agregar Repuesto'
      OnClick = AgregarRepuesto1Click
    end
    object ModificarRepuesto1: TMenuItem
      Caption = 'Modificar Repuesto'
      OnClick = ModificarRepuesto1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object EliminarRepuesto1: TMenuItem
      Caption = 'Eliminar Repuesto'
      OnClick = EliminarRepuesto1Click
    end
  end
  object dsTiempo: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zroqTiempoTotal
    Left = 848
    Top = 128
  end
  object dsCosto: TDataSource
    AutoEdit = False
    DataSet = dmOrdenesTrabajos.zroqCostoTotal
    Left = 848
    Top = 152
  end
end
