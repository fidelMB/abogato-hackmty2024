prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.3'
,p_default_workspace_id=>38423972925266448818
,p_default_application_id=>159659
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HACKMTYABOGATO'
);
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Calendario'
,p_alias=>'CALENDARIO'
,p_step_title=>'Calendario'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38763184645241854058)
,p_plug_name=>'Calendario'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(38689975019653699112)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       USER_ID,',
'       CATEGORY,',
'       NAME,',
'       START_DATE,',
'       END_DATE,',
'       FREQUENCY,',
'       ICON',
'  from HABITS',
'where USER_ID = (SELECT ID FROM USERS WHERE EMAIL = :GOOGLE_USER_EMAIL);'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_customized=>'1'
,p_plug_customized_name=>'Jimena'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'calendar_views_and_navigation', 'month:week',
  'display_column', 'NAME',
  'drag_and_drop', 'Y',
  'drag_and_drop_plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    update HABITS',
    '        set start_date = to_date(:APEX$NEW_START_DATE, ''YYYYMMDDHH24MISS''),',
    '        end_date = to_date(:APEX$NEW_END_DATE, ''YYYYMMDDHH24MISS'')',
    '    where id = :APEX$PK_VALUE;',
    ' end;')),
  'end_date_column', 'END_DATE',
  'event_sorting', 'AUTOMATIC',
  'first_hour', '9',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'primary_key_column', 'ID',
  'show_time', 'Y',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'START_DATE',
  'time_format', '00')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38444486976015284234)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch_Calendar_Events'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_json clob;',
'begin',
'  l_json := ''['';',
'  for rec in (select NAME, START_DATE, END_DATE from HABITS) loop',
'    l_json := l_json || ''{"title": "'' || rec.NAME || ''", "start": "'' || to_char(rec.START_DATE, ''YYYY-MM-DD"T"HH24:MI:SS'') || ''", "end": "'' || to_char(rec.END_DATE, ''YYYY-MM-DD"T"HH24:MI:SS'') || ''"},'';',
'  end loop;',
'  l_json := rtrim(l_json, '','') || '']'';',
'  ',
'  -- Output the JSON',
'  htp.p(l_json);',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>38444486976015284234
);
wwv_flow_imp.component_end;
end;
/
