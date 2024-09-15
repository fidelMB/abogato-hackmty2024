prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 159659
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.3'
,p_default_workspace_id=>38423972925266448818
,p_default_application_id=>159659
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HACKMTYABOGATO'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(38690166544154699274)
,p_group_name=>'Administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(38690175939739699283)
,p_group_name=>'User Settings'
);
wwv_flow_imp.component_end;
end;
/
