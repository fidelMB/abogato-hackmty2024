prompt --application/shared_components/security/authentications/google
begin
--   Manifest
--     AUTHENTICATION: Google
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.3'
,p_default_workspace_id=>38423972925266448818
,p_default_application_id=>159659
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HACKMTYABOGATO'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(38738126716933967422)
,p_name=>'Google'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(38737747236494241690)
,p_attribute_02=>'GOOGLE'
,p_attribute_07=>'profile,openid,email'
,p_attribute_08=>'prompt=consent'
,p_attribute_09=>'#email#'
,p_attribute_10=>'email'
,p_attribute_11=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'GOOGLE_USER_EMAIL'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>15569671204342
);
wwv_flow_imp.component_end;
end;
/
