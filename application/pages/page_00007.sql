prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Delete Modal'
,p_alias=>'DELETE-MODAL'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Confirmar elecci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38780294732132986715)
,p_button_sequence=>60
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(38690048613557699146)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Borrar'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38780295301067986721)
,p_name=>'HABIT_ID_TEXT'
,p_item_sequence=>30
,p_prompt=>'Id:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(38690045962305699145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38780296456618986732)
,p_name=>'HABIT_NAME_TEXT'
,p_item_sequence=>50
,p_prompt=>unistr('H\00E1bito:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(38690045962305699145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38780296207362986730)
,p_name=>'DELETE HABIT'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38780294732132986715)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38780296340581986731)
,p_event_id=>wwv_flow_imp.id(38780296207362986730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DELETE QUERY'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'DELETE FROM HABITS WHERE HABITS.ID = :HABIT_ID_TEXT;'
,p_attribute_02=>'HABIT_ID_TEXT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
