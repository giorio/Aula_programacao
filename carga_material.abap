=======================================================================
*|                                ATIVAS
*|
*| Programa:   ZMMI002
*| Autor:      C0034 - Jorge Mendonça - Axxiom
*|
*| Descrição:  Este programa cria registros no mestre de materiais a
*|             partir dos dados de uma planilha.
*|
*| Histórico do desenvolvimento:
*|______________________________________________________________________
*|Data       Ordem      Programador          Descrição
*|______________________________________________________________________
*|21/10/2016 ECDK990173 C0034 - Jorge        Criação
*|______________________________________________________________________
report zmmi002.

* Types
*----------------------------------------------------------------------*
types:
  begin of ty_file_data,
    matnr type matnr,      "Nº do material
    mbrsh type mbrsh,      "Setor industrial
    mtart type mtart,      "Tipo de material
    werks type werks_d,    "Centro
    maktx type maktx,      "Texto breve de material
    meins type meins,      "Unidade de medida básica
    matkl type matkl,      "Grupo de mercadorias
    spart type spart,      "Setor de atividade
    steuc type steuc,      "Código de controle
    indus type j_1bindus3, "Categoria de CFOP
    bklas type bklas,      "Classe de avaliação
    vprsv type vprsv,      "Cód. controle do preço
    mtuse type j_1bmatuse, "Utilização de material
    mtorg type j_1bmatorg, "Origem de material
  end of ty_file_data,

  begin of ty_log,
    matnr   type matnr,
    icon    type icon_d,
    id      type symsgid,
    number  type symsgno,
    message type bapi_msg,
  end of ty_log.

* Structures
*----------------------------------------------------------------------*
constants:
  gc_icon_g type icon_d value '@08@',
  gc_icon_r type icon_d value '@0A@',
  gc_icon_y type icon_d value '@09@'.

* Structures
*----------------------------------------------------------------------*
data:
  gs_file_data      type ty_file_data,
  gs_headdata       type bapimathead,
  gs_clientdata     type bapi_mara,
  gs_clientdatax    type bapi_marax,
  gs_plantdata      type bapi_marc,
  gs_plantdatax     type bapi_marcx,
  gs_valuationdata  type bapi_mbew,
  gs_valuationdatax type bapi_mbewx.

* Internal Tables
*----------------------------------------------------------------------*
data:
  gt_file_data           type table of ty_file_data,
  gt_materialdescription type table of bapi_makt,
  gt_log                 type table of ty_log.

* Selection Screen
*----------------------------------------------------------------------*
selection-screen begin of block a0
  with frame title text-a00.

parameters:
  p_file type localfile obligatory lower case.

selection-screen end of block a0.

* Events
*----------------------------------------------------------------------*
at selection-screen on value-request for p_file.

  perform f_call_file_f4.

start-of-selection.

  perform f_upload_file.

end-of-selection.

  if gt_file_data is not initial.

    perform f_process_data.

  endif.

  if gt_log is not initial.

    perform f_show_log.

  endif.

* Routines
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  f_call_file_f4
*&---------------------------------------------------------------------*
*       Chama a ajuda de pesquisa para arquivos
*----------------------------------------------------------------------*
form f_call_file_f4.

  data:
    lv_rc type i.

  data:
    ls_file type file_table.

  data:
    lt_file type table of file_table.

  call method cl_gui_frontend_services=>file_open_dialog
    exporting
      file_filter             = 'Planilhas (*.xls;*.xlsx)|*.xls;*.xlsx'
    changing
      file_table              = lt_file
      rc                      = lv_rc
    exceptions
      file_open_dialog_failed = 1
      cntl_error              = 2
      error_no_gui            = 3
      not_supported_by_gui    = 4
      others                  = 5.

  if lv_rc eq 1.

    read table lt_file
      into ls_file
      index 1.

    p_file = ls_file-filename.

  endif.

endform.                    "f_call_file_f4

*&---------------------------------------------------------------------*
*&      Form  f_upload_file
*&---------------------------------------------------------------------*
*       Carrega o arquivo
*----------------------------------------------------------------------*
form f_upload_file.

  data:
    lv_perc   type i,
    lv_tot    type i,
    lv_string type string.

  data:
    ls_intern type alsmex_tabline,
    ls_log    type ty_log.

  data:
    lt_intern type table of alsmex_tabline,
    lt_string type table of string.

  call function 'SAPGUI_PROGRESS_INDICATOR'
    exporting
      text = 'Carregando o arquivo...'.

* Carrega o arquivo
  call function 'ALSM_EXCEL_TO_INTERNAL_TABLE'
    exporting
      filename                = p_file
      i_begin_col             = 1
      i_begin_row             = 5
      i_end_col               = 15
      i_end_row               = 65536
    tables
      intern                  = lt_intern
    exceptions
      inconsistent_parameters = 1
      upload_ole              = 2
      others                  = 3.

  if sy-subrc ne 0.

    perform f_append_log
      using space
            space
            'E' "Erro
            000
            'Erro ao ler o arquivo (verificar caminho e nome)'.

  else.

    lv_tot = lines( lt_intern ).

* Monta tabela com os dados do arquivo
    loop at lt_intern
      into ls_intern.

      lv_perc =
        sy-tabix / lv_tot * 100.

      call function 'SAPGUI_PROGRESS_INDICATOR'
        exporting
          percentage = lv_perc
          text       = 'Formatando os dados...'.

      case ls_intern-col.

        when '1'. "Nº do material

          gs_file_data-matnr = ls_intern-value.

        when '2'. "Setor industrial

          gs_file_data-mbrsh = ls_intern-value.

        when '3'. "Tipo de material

          gs_file_data-mtart = ls_intern-value.

        when '4'. "Centro

          clear lt_string.

          split ls_intern-value
            at ';'
            into table lt_string.

        when '5'. "Texto breve de material

          gs_file_data-maktx = ls_intern-value.

        when '6'. "Unidade de medida básica

          gs_file_data-meins = ls_intern-value.

        when '7'. "Grupo de mercadorias

          gs_file_data-matkl = ls_intern-value.

        when '8'. "Setor de atividade

          gs_file_data-spart = ls_intern-value.

        when '9'. "Código de controle

          gs_file_data-steuc = ls_intern-value.

        when '10'. "Categoria de CFOP

          gs_file_data-indus = ls_intern-value.

        when '11'. "Classe de avaliação

          gs_file_data-bklas = ls_intern-value.

        when '12'. "Cód. controle do preço

          gs_file_data-vprsv = ls_intern-value.

        when '13'. "Utilização de material

          gs_file_data-mtuse = ls_intern-value.

        when '14'. "Origem de material

          gs_file_data-mtorg = ls_intern-value.

          loop at lt_string
            into lv_string.

            gs_file_data-werks = lv_string.

            append gs_file_data
              to gt_file_data.

          endloop.

          clear gs_file_data.

      endcase.

    endloop.

  endif.

endform.                    "f_upload_file

*&---------------------------------------------------------------------*
*&      Form  f_process_data
*&---------------------------------------------------------------------*
*       Processa os dados
*----------------------------------------------------------------------*
form f_process_data.

  data:
    lv_perc   type i,
    lv_tot    type i,
    lv_string type string.

  data:
    ls_bapiret type bapiret2.

  lv_tot = lines( gt_file_data ).

  loop at gt_file_data
    into gs_file_data.

    lv_perc =
      sy-tabix / lv_tot * 100.

    call function 'SAPGUI_PROGRESS_INDICATOR'
      exporting
        percentage = lv_perc
        text       = 'Criando os materiais...'.

    perform f_fill_bapi_headdata.
    perform f_fill_bapi_clientdata.
    perform f_fill_bapi_plantdata.
    perform f_fill_bapi_valuationdata.
    perform f_fill_bapi_materialdescr.

    call function 'BAPI_MATERIAL_SAVEDATA'
      exporting
        headdata            = gs_headdata
        clientdata          = gs_clientdata
        clientdatax         = gs_clientdatax
        plantdata           = gs_plantdata
        plantdatax          = gs_plantdatax
        valuationdata       = gs_valuationdata
        valuationdatax      = gs_valuationdatax
      importing
        return              = ls_bapiret
      tables
        materialdescription = gt_materialdescription.

    lv_string = ls_bapiret-message.

    perform f_append_log
      using gs_headdata-material
            ls_bapiret-id
            ls_bapiret-type
            ls_bapiret-number
            lv_string.

    if ls_bapiret-type eq 'S'. "Sucesso

      commit work and wait.

    else.

      rollback work.

    endif.

  endloop.

endform.                    "f_process_data
*
*&---------------------------------------------------------------------*
*&      Form  f_fill_bapi_headdata
*&---------------------------------------------------------------------*
*       Preenche a estrutura HEADDATA da BAPI
*----------------------------------------------------------------------*
form f_fill_bapi_headdata.

  data:
    ls_material_number type bapimatinr.

  data:
    lt_material_number type table of bapimatinr.

  clear gs_headdata.

  if gs_file_data-matnr is initial.

* Recupera o nº do material
    call function 'BAPI_MATERIAL_GETINTNUMBER'
      exporting
        material_type    = gs_file_data-mtart
        industry_sector  = gs_file_data-mbrsh
        required_numbers = 1
      tables
        material_number  = lt_material_number.

    read table lt_material_number
      into ls_material_number
      index 1.

    gs_file_data-matnr = ls_material_number-material.

  endif.

  gs_headdata-material      = gs_file_data-matnr.
  gs_headdata-ind_sector    = gs_file_data-mbrsh.
  gs_headdata-matl_type     = gs_file_data-mtart.
  gs_headdata-basic_view    = 'X'. "Visão dados básicos
  gs_headdata-purchase_view = 'X'. "Visão compras
  gs_headdata-account_view  = 'X'. "Visão da Contabilidade

endform.                    "f_fill_bapi_headdata

*&---------------------------------------------------------------------*
*&      Form  f_fill_bapi_clientdata
*&---------------------------------------------------------------------*
*       Preenche a estrutura CLIENTDATA da BAPI
*----------------------------------------------------------------------*
form f_fill_bapi_clientdata.

  clear:
    gs_clientdata,
    gs_clientdatax.

  gs_clientdata-base_uom   = gs_file_data-meins.
*  gs_clientdata-po_unit    = gs_file_data-bstme.
  gs_clientdata-matl_group = gs_file_data-matkl.
  gs_clientdata-division   = gs_file_data-spart.

  perform f_fill_bapi_x_structure
    using    'GS_CLIENTDATA'
    changing gs_clientdatax.

endform.                    "f_fill_bapi_clientdata

*&---------------------------------------------------------------------*
*&      Form  f_fill_bapi_plantdata
*&---------------------------------------------------------------------*
*       Preenche a estrutura PLANTDATA da BAPI
*----------------------------------------------------------------------*
form f_fill_bapi_plantdata.

  clear:
    gs_plantdata,
    gs_plantdatax.

  gs_plantdata-plant     = gs_file_data-werks.
  gs_plantdata-ctrl_code = gs_file_data-steuc.
  gs_plantdata-mat_cfop  = gs_file_data-indus.

  write gs_plantdata-ctrl_code
    to gs_plantdata-ctrl_code
    using edit mask '____.__.__'.

  perform f_fill_bapi_x_structure
    using    'GS_PLANTDATA'
    changing gs_plantdatax.

  gs_plantdatax-plant = gs_plantdata-plant.

endform.                    "f_fill_bapi_plantdata

*&---------------------------------------------------------------------*
*&      Form  f_fill_bapi_valuationdata
*&---------------------------------------------------------------------*
*       Preenche a estrutura VALUATIONDATA da BAPI
*----------------------------------------------------------------------*
form f_fill_bapi_valuationdata.

  clear:
    gs_valuationdata,
    gs_valuationdatax.

  gs_valuationdata-val_area   = gs_file_data-werks.
  gs_valuationdata-val_class  = gs_file_data-bklas.
  gs_valuationdata-price_ctrl = gs_file_data-vprsv.
  gs_valuationdata-matl_usage = gs_file_data-mtuse.
  gs_valuationdata-mat_origin = gs_file_data-mtorg.

  perform f_fill_bapi_x_structure
    using    'GS_VALUATIONDATA'
    changing gs_valuationdatax.

  gs_valuationdatax-val_area   = gs_valuationdata-val_area.
  gs_valuationdatax-price_ctrl = 'X'.

endform.                    "f_fill_bapi_valuationdata

*&---------------------------------------------------------------------*
*&      Form  f_fill_bapi_materialdescr
*&---------------------------------------------------------------------*
*       Preenche a tabela MATERIALDESCRIPTION da BAPI
*----------------------------------------------------------------------*
form f_fill_bapi_materialdescr.

  data:
    ls_materialdescription type bapi_makt.

  clear:
    gt_materialdescription.

  ls_materialdescription-langu     = sy-langu.
  ls_materialdescription-matl_desc = gs_file_data-maktx.

  append ls_materialdescription
    to gt_materialdescription.

endform.                    "f_fill_bapi_materialdescr

*&---------------------------------------------------------------------*
*&      Form  f_fill_bapi_x_structure
*&---------------------------------------------------------------------*
*       Preenche a estrutura X da BAPI
*----------------------------------------------------------------------*
form f_fill_bapi_x_structure
  using    us_struct   type any
  changing cs_struct_x type any.

  data:
    ls_rstrucinfo type rstrucinfo.

  data:
    lt_rstrucinfo type table of rstrucinfo.

  field-symbols:
    <struct>  type any,
    <field>   type any,
    <x_field> type any.

* Recupera o conteúdo da estrutura
  assign (us_struct)
    to <struct>.

  check <struct> is assigned.

* Recupera o nome dos campos da estrutura
  call function 'GET_COMPONENT_LIST'
    exporting
      program    = sy-repid
      fieldname  = us_struct
    tables
      components = lt_rstrucinfo.

* Para cada campo da estrutura
  loop at lt_rstrucinfo
    into ls_rstrucinfo.

* Recupera o conteúdo do campo da estrutura
    unassign <field>.

    assign component ls_rstrucinfo-compname
      of structure <struct>
      to <field>.

    if <field> is assigned and
       <field> is not initial.

* Recupera o conteúdo do campo da estrutura X
      unassign <x_field>.

      assign component ls_rstrucinfo-compname
        of structure cs_struct_x
        to <x_field>.

      if <x_field> is assigned.

        <x_field> = 'X'.

      endif.

    endif.

  endloop.

endform.                    "f_fill_bapi_x_structure

*&---------------------------------------------------------------------*
*&      Form  f_append_log
*&---------------------------------------------------------------------*
*       Insere um registro no log
*----------------------------------------------------------------------*
form f_append_log
  using uv_matnr   type matnr
        uv_id      type symsgid
        uv_type    type symsgty
        uv_number  type symsgno
        uv_message type string.

  data:
    ls_log type ty_log.

  ls_log-matnr   = uv_matnr.
  ls_log-id      = uv_id.
  ls_log-number  = uv_number.
  ls_log-message = uv_message.

  case uv_type.

    when 'A' or "Cancelamento
         'E'.   "Erro

      ls_log-icon = gc_icon_r.

    when 'S'. "Sucesso

      ls_log-icon = gc_icon_g.

    when 'I' or "Informação
         'W'.   "Alerta

      ls_log-icon = gc_icon_y.

  endcase.

  append ls_log
    to gt_log.

endform.                    "f_append_log

*&---------------------------------------------------------------------*
*&      Form  f_show_log
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
form f_show_log.

  data:
    lo_alv type ref to cl_salv_table.

  data:
    lv_repid type syrepid.

  data:
    ls_key type salv_s_layout_key.

  data:
    lo_alv_layout       type ref to cl_salv_layout,
    lo_alv_dis_settings type ref to cl_salv_display_settings,
    lo_alv_cols         type ref to cl_salv_columns.

* Exibe mensagem de interação com o usuário
  call function 'SAPGUI_PROGRESS_INDICATOR'
    exporting
      percentage = 100
      text       = 'Preparando o log...'.

  lv_repid = sy-repid.

* Instancia o ALV
  try.

      call method cl_salv_table=>factory
        importing
          r_salv_table = lo_alv
        changing
          t_table      = gt_log.

    catch cx_salv_msg.

      message 'Impossível instanciar o ALV (contatar TI)'
        type         'S'
        display like 'E'.

  endtry.

  if lo_alv is bound.

* Define as opções de saída
    call method lo_alv->get_display_settings
      receiving
        value = lo_alv_dis_settings.

    call method lo_alv_dis_settings->set_striped_pattern
      exporting
        value = if_salv_c_bool_sap=>true.

* Define a barra de botões
    call method lo_alv->set_screen_status
      exporting
        report        = lv_repid
        pfstatus      = 'SALV'
        set_functions = lo_alv->c_functions_all.

* Define as colunas
    call method lo_alv->get_columns
      receiving
        value = lo_alv_cols.

    if lo_alv_cols is bound.

      call method lo_alv_cols->set_optimize
        exporting
          value = if_salv_c_bool_sap=>true.

      perform f_set_alv_col
        using    'MATNR'
                 10
                 'Material'
                 'Material'
                 'Material'
        changing lo_alv_cols.

      perform f_set_alv_col
        using    'ICON'
                 3
                 space
                 space
                 space
        changing lo_alv_cols.

      perform f_set_alv_col
        using    'ID'
                 '3'
                 'ID'
                 'ID'
                 'ID'
        changing lo_alv_cols.

      perform f_set_alv_col
        using    'NUMBER'
                 '3'
                 'Nº'
                 'Número'
                 'Número'
        changing lo_alv_cols.

      perform f_set_alv_col
        using    'MESSAGE'
                 '100'
                 'Msg'
                 'Mensagem'
                 'Mensagem'
        changing lo_alv_cols.

    endif.

* Exibe o ALV
    call method lo_alv->display.

  endif.

endform.                    "f_show_log

*&---------------------------------------------------------------------*
*&      Form  f_alv_col
*&---------------------------------------------------------------------*
*       Define uma coluna do ALV
*----------------------------------------------------------------------*
form f_set_alv_col
  using    uv_field    type lvc_fname
           uv_length   type outputlen
           uv_txt_s    type scrtext_s "10
           uv_txt_m    type scrtext_m "20
           uv_txt_l    type scrtext_l "40
  changing co_alv_cols type ref to cl_salv_columns.

  data:
    lo_alv_col   type ref to cl_salv_column,
    lo_alv_col_t type ref to cl_salv_column_table.

  try.

      call method co_alv_cols->get_column
        exporting
          columnname = uv_field
        receiving
          value      = lo_alv_col.

    catch cx_salv_not_found.

  endtry.

  if lo_alv_col is bound.

    if uv_length is initial.

      call method lo_alv_col->set_technical
        exporting
          value = if_salv_c_bool_sap=>false.

    else.

      call method lo_alv_col->set_output_length
        exporting
          value = uv_length.

      call method lo_alv_col->set_short_text
        exporting
          value = uv_txt_s.

      call method lo_alv_col->set_medium_text
        exporting
          value = uv_txt_m.

      call method lo_alv_col->set_long_text
        exporting
          value = uv_txt_l.

      call method lo_alv_col->set_tooltip
        exporting
          value = uv_txt_l.

    endif.

  endif.

endform.                    "f_set_alv_col

 
Juliane Mendonça
Gerência de Soluções SAP
Axxiom Soluções Tecnológicas S.A.
(31) 3280-4982
www.axxiom.com.br



