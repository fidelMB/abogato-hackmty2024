prompt --workspace/credentials/google
begin
--   Manifest
--     CREDENTIAL: GOOGLE
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
 p_id=>wwv_flow_imp.id(38737747236494241690)
,p_name=>'GOOGLE'
,p_static_id=>'google_authentication'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
