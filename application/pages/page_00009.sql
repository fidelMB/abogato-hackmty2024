prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'Add Modal'
,p_alias=>'ADD-MODAL'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('A\00F1adir h\00E1bito')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38775634883284144350)
,p_button_sequence=>80
,p_button_name=>unistr('A\00F1adir')
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(38690048613557699146)
,p_button_image_alt=>unistr('A\00F1adir')
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38775634751442144349)
,p_name=>'CATEGORIA_TEXT'
,p_item_sequence=>30
,p_prompt=>unistr('Categor\00EDa')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:F\00EDsica;F\00EDsica,Social;Social,Laboral;Laboral,Intelectual;Intelectual,Espiritual;Espiritual,Econ\00F3mico;Econ\00F3mico')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(38690046162189699145)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38853180847708251401)
,p_name=>'NAME_TEXT'
,p_item_sequence=>40
,p_prompt=>unistr('Ingrese un h\00E1bito')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(38690046162189699145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38853180963260251402)
,p_name=>'START_DATE_TEXT'
,p_item_sequence=>50
,p_prompt=>'Fecha de inicio'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(38690046162189699145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38853181018844251403)
,p_name=>'END_DATE_TEXT'
,p_item_sequence=>60
,p_prompt=>unistr('Fecha de finalizaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(38690046162189699145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38853181104256251404)
,p_name=>'FREQUENCY_TEXT'
,p_item_sequence=>70
,p_prompt=>'Frecuencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Diario;Diario,Semanal;Semanal,Mensual;Mensual'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(38690046162189699145)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38869652359527792204)
,p_name=>'EMAIL_TEXT'
,p_item_sequence=>10
,p_source=>'EMAIL_TEXT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38853181219395251405)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38775634883284144350)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38853181371270251406)
,p_event_id=>wwv_flow_imp.id(38853181219395251405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO HABITS (USER_ID, CATEGORY, NAME, START_DATE, END_DATE, FREQUENCY, ICON)',
'VALUES (',
'    (SELECT ID FROM USERS WHERE EMAIL = :EMAIL_TEXT),',
'    :CATEGORIA_TEXT, ',
'    :NAME_TEXT, ',
'    :START_DATE_TEXT, ',
'    :END_DATE_TEXT, ',
'    :FREQUENCY_TEXT, ',
'    CASE ',
'        WHEN :CATEGORIA_TEXT = ''Social'' THEN (''fa fa-users'')',
'        WHEN :CATEGORIA_TEXT = ''Laboral'' THEN (''fa fa-briefcase'')',
unistr('        WHEN :CATEGORIA_TEXT = ''Econ\00F3mico'' THEN (''fa fa-money'')'),
unistr('        WHEN :CATEGORIA_TEXT = ''F\00EDsica'' THEN (''fa fa-person-running-fast'')'),
'        WHEN :CATEGORIA_TEXT = ''Intelectual'' THEN (''fa fa-head-ai-sparkle'')',
'        WHEN :CATEGORIA_TEXT = ''Espiritual'' THEN (''fa fa-user-heart'')',
'        ELSE (''fa fa-404'')',
'    END',
');',
''))
,p_attribute_02=>'CATEGORIA_TEXT,NAME_TEXT,START_DATE_TEXT,END_DATE_TEXT,FREQUENCY_TEXT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
