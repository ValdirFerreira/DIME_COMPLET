﻿

CREATE TABLE tbBase_ICSM( 
Id  int IDENTITY(1,1) NOT NULL, 
MES VARCHAR(8000),
CAMPO VARCHAR(8000),
ANO VARCHAR(8000),
Month VARCHAR(8000),
Record_Detail VARCHAR(8000),
Job_ID VARCHAR(8000),
Job_Name VARCHAR(8000),
Survey_ID VARCHAR(8000),
Date_Eligible VARCHAR(8000),
Date_Sent VARCHAR(8000),
Date_Returned VARCHAR(8000),
Region_Name VARCHAR(8000),
Country VARCHAR(8000),
BU_ID VARCHAR(8000),
BU_Name VARCHAR(8000),
Client_ID VARCHAR(8000),
Client_Name VARCHAR(8000),
Survey_Recipient VARCHAR(8000),
External_Job_Manager VARCHAR(8000),
Client_Sector_Name VARCHAR(8000),
Client_SBL_Name VARCHAR(8000),
Client_Territory VARCHAR(8000),
DC_Technique VARCHAR(8000),
Offering VARCHAR(8000),
Product VARCHAR(8000),
Job_Owner VARCHAR(8000),
Job_Manager VARCHAR(8000),
Job_Manager_2 VARCHAR(8000),
Overall_Satisfaction VARCHAR(8000),
OTIF VARCHAR(8000),
On_Time VARCHAR(8000),
On_SPEC VARCHAR(8000),
No_Issues VARCHAR(8000),
Impact VARCHAR(8000),
Client_requested_changes_in_job_specs VARCHAR(8000),
Client_delivered_late_job_specs VARCHAR(8000),
Client_delivered_late_questionnaire_approval VARCHAR(8000),
Client_delivered_late_ads_materials VARCHAR(8000),
Project_manager_did_not_inform_about_delays VARCHAR(8000),
Late_translation VARCHAR(8000),
Late_sample VARCHAR(8000),
Late_scripting_link VARCHAR(8000),
Late_logistics VARCHAR(8000),
Delayed_email_mail VARCHAR(8000),
Delayed_field_launch VARCHAR(8000),
Delayed_field_end VARCHAR(8000),
Late_coding VARCHAR(8000),
Late_DP VARCHAR(8000),
Other_Delay_Please_Specify VARCHAR(8000),
Project_manager_did_not_inform_about_spec_changes VARCHAR(8000),
Protocols_Products_mgt_specs VARCHAR(8000),
Translation_specs VARCHAR(8000),
Sample_specs VARCHAR(8000),
Target_pop_Quotas_specs VARCHAR(8000),
Ques_Script_specs VARCHAR(8000),
Audio_Video_specs VARCHAR(8000),
Logistics_specs VARCHAR(8000),
Mailout_specs VARCHAR(8000),
Field_specs VARCHAR(8000),
Coding_specs VARCHAR(8000),
DP_specs VARCHAR(8000),
Other_spec_issue VARCHAR(8000),
Post_prog_changes VARCHAR(8000),
Ads_material_not_as_expected VARCHAR(8000),
Field_incidence_different VARCHAR(8000),
Quest_length_different VARCHAR(8000),
Did_not_help_with_client_needs VARCHAR(8000),
Not_experienced VARCHAR(8000),
Did_not_inform_on_progress VARCHAR(8000),
Did_not_inform_on_problems VARCHAR(8000),
Did_not_resolve_problems VARCHAR(8000),
Did_not_react_proactively VARCHAR(8000),
Did_not_take_responsibility VARCHAR(8000),
Inaccurate_Translation VARCHAR(8000),
Sample_errors VARCHAR(8000),
Sample_provided_not_matching VARCHAR(8000),
Sample_insufficient VARCHAR(8000),
Sample_quotas_inversed VARCHAR(8000),
Script_text_errors VARCHAR(8000),
Script_logic_errors VARCHAR(8000),
Look_and_feel_errors VARCHAR(8000),
Media_link_errors VARCHAR(8000),
Scripted_quotas_incorrect VARCHAR(8000),
Scripting_error_refield VARCHAR(8000),
Long_implementation_time VARCHAR(8000),
Interview_docs_imcomplete VARCHAR(8000),
Mistakes_in_legs__sample_id VARCHAR(8000),
Quest_translation_issues VARCHAR(8000),
Quotas_not_filled VARCHAR(8000),
Quota_wrong VARCHAR(8000),
Interview_instructions_not_respected VARCHAR(8000),
Interview_instructions_wrong VARCHAR(8000),
Wrong_code_frame VARCHAR(8000),
Errors_in_translation VARCHAR(8000),
Errors_in_coding_ques VARCHAR(8000),
Uncoded_questions VARCHAR(8000),
Wrong_respondent_id VARCHAR(8000),
Wrong_matching_repsondent_id VARCHAR(8000),
Wrong_question_data VARCHAR(8000),
Wrong_norms_weighting VARCHAR(8000),
Wrong_historical_data VARCHAR(8000),
Banners_not_matching VARCHAR(8000),
Other_Specify VARCHAR(8000),
OTIF_Verbatim VARCHAR(8000),
PM_Overall_Issue VARCHAR(8000),
PM_Information_on_Issues VARCHAR(8000),
PM_Reaction_to_Issues VARCHAR(8000),
PM_Resolution_of_Issues VARCHAR(8000),
PM_Experience VARCHAR(8000),
PM_GMU_Job_Mger_Flexibility VARCHAR(8000),
OTIF_CS_Setup VARCHAR(8000),
OTIF_CS_Setup_On_Time VARCHAR(8000),
OTIF_CS_Setup_On_Specs VARCHAR(8000),
OTIF_CS_Setup_Without_Errors VARCHAR(8000),
OTIF_CS_Field VARCHAR(8000),
OTIF_CS_Field_On_Time VARCHAR(8000),
OTIF_CS_Field_On_Specs VARCHAR(8000),
OTIF_CS_Field_Without_Errors VARCHAR(8000),
OTIF_CS_Delivery VARCHAR(8000),
OTIF_CS_Delivery_On_Time VARCHAR(8000),
OTIF_CS_Delivery_On_Specs VARCHAR(8000),
OTIF_CS_Delivery_Without_Errors VARCHAR(8000),
ST_Delays_Sample_File_Preparation VARCHAR(8000),
ST_Delays_Quota_File_Preparation VARCHAR(8000),
ST_Delays_Translations VARCHAR(8000),
ST_Delays_QNR_Scripting_Link VARCHAR(8000),
ST_Delays_Materials_Audio_Video_Images VARCHAR(8000),
ST_Delays_Logistics VARCHAR(8000),
ST_Delays_CLT_Venues VARCHAR(8000),
ST_Delays_Products VARCHAR(8000),
ST_Delays_Field_Brief VARCHAR(8000),
ST_Delays_Setup_CATI_CAPI_Machines VARCHAR(8000),
ST_Delays_IT_Infrastructure_Issues VARCHAR(8000),
ST_Delays_Other_Issues VARCHAR(8000),
ST_Delays_Other_Issues_Verbatim VARCHAR(8000),
ST_Specs_Incorrect_Sample VARCHAR(8000),
ST_Specs_Incorrect_Quotas VARCHAR(8000),
ST_Specs_Incorrect_Translation VARCHAR(8000),
ST_Specs_Incorrect_QNR VARCHAR(8000),
ST_Specs_Materials_Audio_Video_Images VARCHAR(8000),
ST_Specs_Incorrect_Logistics VARCHAR(8000),
ST_Specs_Incorrect_Product VARCHAR(8000),
ST_Specs_Incorrect_Protocol_instructions VARCHAR(8000),
ST_Specs_Incorrect_Field_Brief VARCHAR(8000),
ST_Specs_Other_Issues VARCHAR(8000),
ST_Specs_Other_Issues_Verbatim VARCHAR(8000),
ST_Errors_Sample_File_Preparation VARCHAR(8000),
ST_Errors_Sample VARCHAR(8000),
ST_Errors_Sample_Insufficient_Quotas VARCHAR(8000),
ST_Errors_Sample_not_Matching_Quotas_Requests VARCHAR(8000),
ST_Errors_Quota_File_Preparation VARCHAR(8000),
ST_Errors_Quota VARCHAR(8000),
ST_Errors_Quota_Legs VARCHAR(8000),
ST_Errors_Translations VARCHAR(8000),
ST_Errors_QNR_Scripting_Link VARCHAR(8000),
ST_Errors_QNR_Spelling_translations VARCHAR(8000),
ST_Errors_QNR_Logic_in_Script VARCHAR(8000),
ST_Errors_QNR_Look_and_Feel VARCHAR(8000),
ST_Errors_QNR_Media_Errors_in_Link VARCHAR(8000),
ST_Errors_Quotas_Scripting VARCHAR(8000),
ST_Errors_QNR_Changes_Corrections VARCHAR(8000),
ST_Errors_Materials_Audio_Video_Images VARCHAR(8000),
ST_Errors_Logistics VARCHAR(8000),
ST_Errors_Printing_Issues VARCHAR(8000),
ST_Errors_Incomplete_Documents VARCHAR(8000),
ST_Errors_Products VARCHAR(8000),
ST_Errors_Missing_Products_for_Field VARCHAR(8000),
ST_Errors_Labelling_of_Products VARCHAR(8000),
ST_Errors_Proucts_Legs_Sub_Sample VARCHAR(8000),
ST_Errors_Handling_Shipping VARCHAR(8000),
ST_Errors_Field_Brief VARCHAR(8000),
ST_Errors_Setup_CATI_CAPI_Machines VARCHAR(8000),
ST_Errors_IT_Setup VARCHAR(8000),
ST_Errors_Other_Issues VARCHAR(8000),
ST_Errors_Other_Issues_Verbatim VARCHAR(8000),
FLD_Delays_Field_Launch VARCHAR(8000),
FLD_Delays_Data_Entry_Scanning VARCHAR(8000),
FLD_Delays_Field_End_QNrs_Completed VARCHAR(8000),
FLD_Delays_IT_Infrastructure_Issues VARCHAR(8000),
FLD_Delays_Other_Issues VARCHAR(8000),
FLD_Delays_Other_Issues_Verbatim VARCHAR(8000),
FLD_Specs_Field_Launch VARCHAR(8000),
FLD_Specs_Field_Instructions VARCHAR(8000),
FLD_Specs_Fieldwork_Report VARCHAR(8000),
FLD_Specs_Quality_Control VARCHAR(8000),
FLD_Specs_Quota_Management VARCHAR(8000),
FLD_Specs_Data_Entry_Scanning VARCHAR(8000),
FLD_Specs_Other_Issues VARCHAR(8000),
FLD_Specs_Other_Issues_Verbatim VARCHAR(8000),
FLD_errors_Field_Launch VARCHAR(8000),
FLD_errors_Field_Instructions VARCHAR(8000),
FLD_errors_No_Respect_Field_Instructions VARCHAR(8000),
FLD_errors_Wrong_Field_Instructions_Used VARCHAR(8000),
FLD_errors_Field_Instruction_Recruitment VARCHAR(8000),
FLD_errors_Field_Supervision VARCHAR(8000),
FLD_errors_Fieldwork_Report VARCHAR(8000),
FLD_errors_Quality_Control VARCHAR(8000),
FLD_errors_Quota_Management VARCHAR(8000),
FLD_errors_Quotas_were_not_Fulfilled VARCHAR(8000),
FLD_errors_Target_Pop_Quota_Spec_not_Followed VARCHAR(8000),
FLD_errors_Data_Entry_Scanning VARCHAR(8000),
FLD_errors_IT_Infrastructure_Issues VARCHAR(8000),
FLD_errors_Other_Issues VARCHAR(8000),
FLD_errors_Other_Issues_Verbatim VARCHAR(8000),
DLV_Delays_Coding VARCHAR(8000),
DLV_Delays_DP_Delivery VARCHAR(8000),
DLV_Delays_Tabular_reports VARCHAR(8000),
DLV_Delays_Charting VARCHAR(8000),
DLV_Delays_GMU_Research_Analytics VARCHAR(8000),
DLV_Delays_IT_Infrastructure VARCHAR(8000),
DLV_Delays_Other_Issues VARCHAR(8000),
DLV_Delays_Other_Issues_Verbatim VARCHAR(8000),
DLV_Specs_Coding VARCHAR(8000),
DLV_Specs_Coding_Translation VARCHAR(8000),
DLV_Specs_Coding_Frame VARCHAR(8000),
DLV_Specs_Wrong_partial_coded_Data_Provided VARCHAR(8000),
DLV_Specs_DP_Delivery VARCHAR(8000),
DLV_Specs_Tabular_Reports VARCHAR(8000),
DLV_Specs_Charting VARCHAR(8000),
DLV_Specs_GMU_Research_Analytics VARCHAR(8000),
DLV_Specs_Other_Issues VARCHAR(8000),
DLV_Specs_Other_Issues_Verbatim VARCHAR(8000),
DLV_errors_Coding VARCHAR(8000),
DLV_errors_Coding_Translation VARCHAR(8000),
DLV_errors_Coding_Frame VARCHAR(8000),
DLV_errors_Wrong_partial_coded_Data_Provided VARCHAR(8000),
DLV_errors_Respondent_Ids_not_Matching VARCHAR(8000),
DLV_errors_DP_Delivery VARCHAR(8000),
DLV_errors_DP_Incorrect_missing_data VARCHAR(8000),
DLV_errors_DP_Incorrect_norms_weighting VARCHAR(8000),
DLV_errors_DP_Used_Wrong_historical_data VARCHAR(8000),
DLV_errors_DP_Banners_not_Matching_Specs VARCHAR(8000),
DLV_errors_Tabular_Reports VARCHAR(8000),
DLV_errors_Charting VARCHAR(8000),
DLV_errors_GMU_Research_Analytics VARCHAR(8000),
DLV_errors_GMU_Setup VARCHAR(8000),
DLV_errors_GMU_Analysis VARCHAR(8000),
DLV_errors_GMU_Explanation_POVs VARCHAR(8000),
DLV_errors_IT_Infrastructure VARCHAR(8000),
DLV_errors_Other_Issues VARCHAR(8000),
DLV_errors_Other_Issues_Verbatim VARCHAR(8000),
IdFile INT  NULL
)