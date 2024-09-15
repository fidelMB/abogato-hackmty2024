prompt --workspace/credentials/app_159659_push_notifications_credentials
begin
--   Manifest
--     CREDENTIAL: App 159659 Push Notifications Credentials
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.3'
,p_default_workspace_id=>38423972925266448818
,p_default_application_id=>159659
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HACKMTYABOGATO'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(38690183172118699289)
,p_name=>'App 159659 Push Notifications Credentials'
,p_static_id=>'App_159659_Push_Notifications_Credentials'
,p_authentication_type=>'KEY_PAIR'
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
