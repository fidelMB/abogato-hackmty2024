prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Habit Cards'
,p_alias=>'HABIT-CARDS'
,p_step_title=>'Inicio'
,p_autocomplete_on_off=>'ON'
,p_css_file_urls=>'#APP_FILES#main#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.category-progress {',
'    margin-bottom: 20px;',
'}',
'',
'.progress-bar-background {',
'    width: 100%;',
'    height: 15px;',
'    background-color: #a5d6a7; /* Lighter green background for 100% bar */',
'    border-radius: 16px;',
'    position: relative;',
'    overflow: hidden;',
'}',
'',
'.progress-bar {',
'    height: 100%;',
'    background-color: #4caf50; /* Darker green for actual progress */',
'    border-radius: 16px;',
'    position: absolute;',
'    top: 0;',
'    left: 0;',
'    transition: width 0.3s ease;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38738371153519274019)
,p_plug_name=>'Title'
,p_title=>unistr('H\00E1bitos')
,p_region_attributes=>'style="padding-top:-50px;"'
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>5
,p_location=>null
,p_plug_source=>unistr('<h1> Mis h\00E1bitos </h1>')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38738371424736274022)
,p_plug_name=>unistr('Estad\00EDsticas')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_region_attributes=>'style = "margin: 0 auto";'
,p_plug_template=>wwv_flow_imp.id(38689975019653699112)
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>4
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_html CLOB;',
'BEGIN',
'    -- Initialize the CLOB',
'    l_html := '''';',
'',
'    -- Loop through the results of your query',
'    FOR r IN (',
'        WITH AllCategories AS (',
unistr('            SELECT ''F\00EDsica'' AS CATEGORY FROM DUAL'),
'            UNION ALL SELECT ''Social'' FROM DUAL',
'            UNION ALL SELECT ''Laboral'' FROM DUAL',
'            UNION ALL SELECT ''Intelectual'' FROM DUAL',
'            UNION ALL SELECT ''Espiritual'' FROM DUAL',
unistr('            UNION ALL SELECT ''Econ\00F3mico'' FROM DUAL'),
'        ),',
'        HabitDays AS (',
'            SELECT ',
'                h.ID AS HabitID,',
'                h.CATEGORY,',
'                (h.END_DATE - h.START_DATE) + 1 AS TotalDays',
'            FROM ',
'                HABITS h',
'            WHERE ',
'                h.USER_ID = 1',
'        ),',
'        CompletedHabitDays AS (',
'            SELECT ',
'                h.ID AS HabitID,',
'                COUNT(ch.ID) AS CompletedDays',
'            FROM ',
'                HABITS h',
'            LEFT JOIN ',
'                COMPLETED_HABITS ch ON h.ID = ch.HABIT_ID',
'            WHERE ',
'                h.USER_ID = 1',
'            GROUP BY ',
'                h.ID',
'        )',
'        SELECT ',
'            ac.CATEGORY,',
'            COALESCE(AVG(COALESCE(chd.CompletedDays, 0) * 100.0 / hd.TotalDays), 0) AS CompletionPercentageByCategory',
'        FROM ',
'            AllCategories ac',
'        LEFT JOIN ',
'            HabitDays hd ON ac.CATEGORY = hd.CATEGORY',
'        LEFT JOIN ',
'            CompletedHabitDays chd ON hd.HabitID = chd.HabitID',
'        GROUP BY ',
'            ac.CATEGORY',
'    ) LOOP',
'        -- Append the HTML for each progress bar to the CLOB',
'        l_html := l_html || ''<div class="category-progress">'';',
'        l_html := l_html || ''<h3>'' || r.CATEGORY || ''</h3>'';',
'        l_html := l_html || ''<div class="progress-bar-background">'';',
'        l_html := l_html || ''<div class="progress-bar" style="width: '' || r.CompletionPercentageByCategory || ''%;"></div>'';',
'        l_html := l_html || ''</div>'';',
'        l_html := l_html || ''</div>'';',
'    END LOOP;',
'',
'    -- Output the final CLOB containing the HTML',
'    htp.p(l_html);',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        -- Handle exceptions and output an error message',
'        htp.p(''An error occurred: '' || SQLERRM);',
'END;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38744554063293415599)
,p_plug_name=>'Habit Cards'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(38689915274856699086)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
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
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(38775632812803144330)
,p_region_id=>wwv_flow_imp.id(38744554063293415599)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_card_css_classes=>'cardPrueba'
,p_title_adv_formatting=>false
,p_title_column_name=>'NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CATEGORY'
,p_body_adv_formatting=>false
,p_body_column_name=>'FREQUENCY'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p> Fecha de inicio: &START_DATE.</p>',
'<p> Fecha de fin: &END_DATE.</p>',
'',
''))
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'ICON'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ID'
,p_pk2_column_name=>'USER_ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(38780294344643986711)
,p_card_id=>wwv_flow_imp.id(38775632812803144330)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Borrar'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::HABIT_ID_TEXT,HABIT_NAME_TEXT:&ID.,&NAME.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-trash'
,p_is_hot=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(38444487706350284242)
,p_card_id=>wwv_flow_imp.id(38775632812803144330)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>20
,p_label=>'Completed'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::HABIT_ID_TEXT_COMPLETED,HABIT_NAME:&ID.,&NAME.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-check-circle'
,p_is_hot=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(38853181932926251412)
,p_card_id=>wwv_flow_imp.id(38775632812803144330)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>20
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::MOD_HABIT_ID:&ID.'
,p_button_display_type=>'TEXT'
,p_is_hot=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38775634522006144347)
,p_button_sequence=>10
,p_button_name=>unistr('A\00F1adir')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(38690048737141699147)
,p_button_image_alt=>unistr('A\00F1adir h\00E1bito')
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::EMAIL_TEXT:&GOOGLE_USER_EMAIL.'
,p_icon_css_classes=>'fa-plus-circle'
,p_button_cattributes=>'style="margin-top:30px;"'
,p_grid_new_row=>'Y'
,p_grid_column_span=>4
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38853181722929251410)
,p_button_sequence=>20
,p_button_name=>'PushDinamico'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(38690048737141699147)
,p_button_image_alt=>unistr('A\00F1adir un recordatorio')
,p_icon_css_classes=>'fa-clock-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38780296646352986734)
,p_name=>'P2_NEW'
,p_item_sequence=>40
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH AllCategories AS (',
unistr('    SELECT ''F\00EDsica'' AS CATEGORY FROM DUAL'),
'    UNION ALL SELECT ''Social'' FROM DUAL',
'    UNION ALL SELECT ''Laboral'' FROM DUAL',
'    UNION ALL SELECT ''Intelectual'' FROM DUAL',
'    UNION ALL SELECT ''Espiritual'' FROM DUAL',
unistr('    UNION ALL SELECT ''Econ\00F3mico'' FROM DUAL'),
'),',
'HabitDays AS (',
'    SELECT ',
'        h.ID AS HabitID,',
'        h.CATEGORY,',
'        (h.END_DATE - h.START_DATE) + 1 AS TotalDays',
'    FROM ',
'        HABITS h',
'    WHERE ',
'        h.USER_ID = (SELECT ID FROM USERS WHERE EMAIL = :GOOGLE_USER_EMAIL)',
'),',
'CompletedHabitDays AS (',
'    SELECT ',
'        h.ID AS HabitID,',
'        COUNT(ch.ID) AS CompletedDays',
'    FROM ',
'        HABITS h',
'    LEFT JOIN ',
'        COMPLETED_HABITS ch ON h.ID = ch.HABIT_ID',
'    WHERE ',
'        h.USER_ID = (SELECT ID FROM USERS WHERE EMAIL = :GOOGLE_USER_EMAIL)',
'    GROUP BY ',
'        h.ID',
'),',
'CompletionPercentages AS (',
'    SELECT ',
'        ac.CATEGORY,',
'        COALESCE(AVG(COALESCE(chd.CompletedDays, 0) * 100.0 / hd.TotalDays), 0) AS CompletionPercentageByCategory',
'    FROM ',
'        AllCategories ac',
'    LEFT JOIN ',
'        HabitDays hd ON ac.CATEGORY = hd.CATEGORY',
'    LEFT JOIN ',
'        CompletedHabitDays chd ON hd.HabitID = chd.HabitID',
'    GROUP BY ',
'        ac.CATEGORY',
'),',
'MaxCategory AS (',
'    SELECT CATEGORY',
'    FROM CompletionPercentages',
'    ORDER BY CompletionPercentageByCategory DESC',
'    FETCH FIRST 1 ROWS ONLY',
')',
'SELECT ',
'    CASE ',
unistr('        WHEN mc.CATEGORY = ''F\00EDsica'' THEN ''https://i.imgur.com/ZJzwnq9.png'''),
'        WHEN mc.CATEGORY = ''Social'' THEN ''https://i.imgur.com/z0TVL0V.png''',
'        WHEN mc.CATEGORY = ''Laboral'' THEN ''https://i.imgur.com/o3lGZhR.png''',
'        WHEN mc.CATEGORY = ''Intelectual'' THEN ''https://i.imgur.com/5pY8zTF.png''',
'        WHEN mc.CATEGORY = ''Espiritual'' THEN ''https://i.imgur.com/wYUQrd7.png''',
unistr('        WHEN mc.CATEGORY = ''Econ\00F3mico'' THEN ''https://i.imgur.com/1irxoQm.png'''),
'        ELSE ''https://i.imgur.com/fdIuHRE.png''',
'    END AS SelectedURL',
'FROM MaxCategory mc;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style = "margin: 0 auto;"'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(38690046162189699145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'URL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38775634369806144345)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SEND_PUSH_NOTIFICATION'
,p_process_name=>'Push Notification'
,p_attribute_01=>'FIDEL.MORALES.BRIONES@GMAIL.COM'
,p_attribute_02=>'Hola '
,p_attribute_03=>'asdadasda'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38775634369806144345
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38853181534065251408)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>'INSERT INTO USERS (EMAIL) VALUES (''PRUEBA'');'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38853181534065251408
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38853181681404251409)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Push dinamico'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_pwa.send_push_notification (',
'        p_application_id => :APP_ID,',
'        p_user_name      => :APP_USER,',
'        p_title          => ''Recordatorio'',',
unistr('        p_body           => ''Que no se te olvide continuar con tus buenos h\00E1bitos!'''),
'    );',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38853181722929251410)
,p_internal_uid=>38853181681404251409
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38780296952788986737)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO USERS (EMAIL)',
'SELECT :GOOGLE_USER_EMAIL',
'FROM DUAL',
'WHERE NOT EXISTS (',
'    SELECT 1 FROM USERS WHERE EMAIL = :GOOGLE_USER_EMAIL',
');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>38780296952788986737
);
wwv_flow_imp.component_end;
end;
/
