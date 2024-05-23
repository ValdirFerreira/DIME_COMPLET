


IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'pr_ProcessaImportacaoPorPeriodo') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
DROP  PROCEDURE pr_ProcessaImportacaoPorPeriodo  
END


GO

CREATE PROCEDURE pr_ProcessaImportacaoPorPeriodo  
@IdFile int,  
@Ano varchar(8000),  
@Mes varchar(8000)  
AS  
BEGIN  


 -- LIMPEZA GERAL
-- SE ANO FOR 2000 W ME FOR 1
IF (@Ano='2000' AND @Mes = '1')
BEGIN

		delete from tblBase_Completa 	   
		delete from tbBase_DP_Completa 	   
		delete from tbBase_ICSM_Completa   
		delete from tbBases_Completa 	   
		delete from tbBaseHC_Completa	   
		delete from tbBaseCHARGE_Completa  								 

		SET IDENTITY_INSERT tblBase_Completa ON
		insert into tblBase_Completa (Id, MES, CAMPO, ANO, MES2, QUARTER, JOB_ID, Coluna1, NOME_DO_PROJETO, GP, GC, METODOLOGIA, TIPO_DE_JOB, AMOSTRA, AMOSTRA_REAL, TEMPO_ORÇADO, TEMPO_REAL, Bud, Real, CLIENT_NAME, PRODUCT, EXCEPTIONS, EXCEPTIONS_REAL, Length_Rating__Bud, Length_Rating__Real, Length_Rating_FRANCE__Bud, Length_Rating_FRANCE__Real, JUSTIFICATIVA_ATRASO_BD, JUSTIFICATIVA_ERRO_DE_BD, JUSTIFICATIVA_ATRASO_DE_CAMPO, ATRASO_DE_BD_OPS, ERRO_DE_BD_OPS, ATRASO_DE_CAMPO_OPS, Service_Line, METODOLOGIA2, Service_Line2, CAMPO_1, Coluna1_1, Megabase, IdFile)
		select Id, MES, CAMPO, ANO, MES2, QUARTER, JOB_ID, Coluna1, NOME_DO_PROJETO, GP, GC, METODOLOGIA, TIPO_DE_JOB, AMOSTRA, AMOSTRA_REAL, TEMPO_ORÇADO, TEMPO_REAL, Bud, Real, CLIENT_NAME, PRODUCT, EXCEPTIONS, EXCEPTIONS_REAL, Length_Rating__Bud, Length_Rating__Real, Length_Rating_FRANCE__Bud, Length_Rating_FRANCE__Real, JUSTIFICATIVA_ATRASO_BD, JUSTIFICATIVA_ERRO_DE_BD, JUSTIFICATIVA_ATRASO_DE_CAMPO, ATRASO_DE_BD_OPS, ERRO_DE_BD_OPS, ATRASO_DE_CAMPO_OPS, Service_Line, METODOLOGIA2, Service_Line2, CAMPO_1, Coluna1_1, Megabase, IdFile  
		from tblBase 
		SET IDENTITY_INSERT tblBase_Completa OFF
		DELETE FROM  tblBase 

		SET IDENTITY_INSERT tbBase_DP_Completa ON
		insert into tbBase_DP_Completa (Id, ANO, MES, N_e_Nome_do_Projeto, Tracking, SL, Fornecedor_Processamento, Fornecedor_Dashboard, Dashboard, Fornecedor_PPT, PPT_Autocharting, Local_Peru_Detroit, IdFile)
		select Id, ANO, MES, N_e_Nome_do_Projeto, Tracking, SL, Fornecedor_Processamento, Fornecedor_Dashboard, Dashboard, Fornecedor_PPT, PPT_Autocharting, Local_Peru_Detroit, IdFile 
		from tbBase_DP 
		SET IDENTITY_INSERT tbBase_DP_Completa OFF	 
		DELETE FROM tbBase_DP

		SET IDENTITY_INSERT tbBase_ICSM_Completa ON
		insert into tbBase_ICSM_Completa (Id, MES, CAMPO, ANO, Month, Record_Detail, Job_ID, Job_Name, Survey_ID, Date_Eligible, Date_Sent, Date_Returned, Region_Name, Country, BU_ID, BU_Name, Client_ID, Client_Name, Survey_Recipient, External_Job_Manager, Client_Sector_Name, Client_SBL_Name, Client_Territory, DC_Technique, Offering, Product, Job_Owner, Job_Manager, Job_Manager_2, Overall_Satisfaction, OTIF, On_Time, On_SPEC, No_Issues, Impact, Client_requested_changes_in_job_specs, Client_delivered_late_job_specs, Client_delivered_late_questionnaire_approval, Client_delivered_late_ads_materials, Project_manager_did_not_inform_about_delays, Late_translation, Late_sample, Late_scripting_link, Late_logistics, Delayed_email_mail, Delayed_field_launch, Delayed_field_end, Late_coding, Late_DP, Other_Delay_Please_Specify, Project_manager_did_not_inform_about_spec_changes, Protocols_Products_mgt_specs, Translation_specs, Sample_specs, Target_pop_Quotas_specs, Ques_Script_specs, Audio_Video_specs, Logistics_specs, Mailout_specs, Field_specs, Coding_specs, DP_specs, Other_spec_issue, Post_prog_changes, Ads_material_not_as_expected, Field_incidence_different, Quest_length_different, Did_not_help_with_client_needs, Not_experienced, Did_not_inform_on_progress, Did_not_inform_on_problems, Did_not_resolve_problems, Did_not_react_proactively, Did_not_take_responsibility, Inaccurate_Translation, Sample_errors, Sample_provided_not_matching, Sample_insufficient, Sample_quotas_inversed, Script_text_errors, Script_logic_errors, Look_and_feel_errors, Media_link_errors, Scripted_quotas_incorrect, Scripting_error_refield, Long_implementation_time, Interview_docs_imcomplete, Mistakes_in_legs__sample_id, Quest_translation_issues, Quotas_not_filled, Quota_wrong, Interview_instructions_not_respected, Interview_instructions_wrong, Wrong_code_frame, Errors_in_translation, Errors_in_coding_ques, Uncoded_questions, Wrong_respondent_id, Wrong_matching_repsondent_id, Wrong_question_data, Wrong_norms_weighting, Wrong_historical_data, Banners_not_matching, Other_Specify, OTIF_Verbatim, PM_Overall_Issue, PM_Information_on_Issues, PM_Reaction_to_Issues, PM_Resolution_of_Issues, PM_Experience, PM_GMU_Job_Mger_Flexibility, OTIF_CS_Setup, OTIF_CS_Setup_On_Time, OTIF_CS_Setup_On_Specs, OTIF_CS_Setup_Without_Errors, OTIF_CS_Field, OTIF_CS_Field_On_Time, OTIF_CS_Field_On_Specs, OTIF_CS_Field_Without_Errors, OTIF_CS_Delivery, OTIF_CS_Delivery_On_Time, OTIF_CS_Delivery_On_Specs, OTIF_CS_Delivery_Without_Errors, ST_Delays_Sample_File_Preparation, ST_Delays_Quota_File_Preparation, ST_Delays_Translations, ST_Delays_QNR_Scripting_Link, ST_Delays_Materials_Audio_Video_Images, ST_Delays_Logistics, ST_Delays_CLT_Venues, ST_Delays_Products, ST_Delays_Field_Brief, ST_Delays_Setup_CATI_CAPI_Machines, ST_Delays_IT_Infrastructure_Issues, ST_Delays_Other_Issues, ST_Delays_Other_Issues_Verbatim, ST_Specs_Incorrect_Sample, ST_Specs_Incorrect_Quotas, ST_Specs_Incorrect_Translation, ST_Specs_Incorrect_QNR, ST_Specs_Materials_Audio_Video_Images, ST_Specs_Incorrect_Logistics, ST_Specs_Incorrect_Product, ST_Specs_Incorrect_Protocol_instructions, ST_Specs_Incorrect_Field_Brief, ST_Specs_Other_Issues, ST_Specs_Other_Issues_Verbatim, ST_Errors_Sample_File_Preparation, ST_Errors_Sample, ST_Errors_Sample_Insufficient_Quotas, ST_Errors_Sample_not_Matching_Quotas_Requests, ST_Errors_Quota_File_Preparation, ST_Errors_Quota, ST_Errors_Quota_Legs, ST_Errors_Translations, ST_Errors_QNR_Scripting_Link, ST_Errors_QNR_Spelling_translations, ST_Errors_QNR_Logic_in_Script, ST_Errors_QNR_Look_and_Feel, ST_Errors_QNR_Media_Errors_in_Link, ST_Errors_Quotas_Scripting, ST_Errors_QNR_Changes_Corrections, ST_Errors_Materials_Audio_Video_Images, ST_Errors_Logistics, ST_Errors_Printing_Issues, ST_Errors_Incomplete_Documents, ST_Errors_Products, ST_Errors_Missing_Products_for_Field, ST_Errors_Labelling_of_Products, ST_Errors_Proucts_Legs_Sub_Sample, ST_Errors_Handling_Shipping, ST_Errors_Field_Brief, ST_Errors_Setup_CATI_CAPI_Machines, ST_Errors_IT_Setup, ST_Errors_Other_Issues, ST_Errors_Other_Issues_Verbatim, FLD_Delays_Field_Launch, FLD_Delays_Data_Entry_Scanning, FLD_Delays_Field_End_QNrs_Completed, FLD_Delays_IT_Infrastructure_Issues, FLD_Delays_Other_Issues, FLD_Delays_Other_Issues_Verbatim, FLD_Specs_Field_Launch, FLD_Specs_Field_Instructions, FLD_Specs_Fieldwork_Report, FLD_Specs_Quality_Control, FLD_Specs_Quota_Management, FLD_Specs_Data_Entry_Scanning, FLD_Specs_Other_Issues, FLD_Specs_Other_Issues_Verbatim, FLD_errors_Field_Launch, FLD_errors_Field_Instructions, FLD_errors_No_Respect_Field_Instructions, FLD_errors_Wrong_Field_Instructions_Used, FLD_errors_Field_Instruction_Recruitment, FLD_errors_Field_Supervision, FLD_errors_Fieldwork_Report, FLD_errors_Quality_Control, FLD_errors_Quota_Management, FLD_errors_Quotas_were_not_Fulfilled, FLD_errors_Target_Pop_Quota_Spec_not_Followed, FLD_errors_Data_Entry_Scanning, FLD_errors_IT_Infrastructure_Issues, FLD_errors_Other_Issues, FLD_errors_Other_Issues_Verbatim, DLV_Delays_Coding, DLV_Delays_DP_Delivery, DLV_Delays_Tabular_reports, DLV_Delays_Charting, DLV_Delays_GMU_Research_Analytics, DLV_Delays_IT_Infrastructure, DLV_Delays_Other_Issues, DLV_Delays_Other_Issues_Verbatim, DLV_Specs_Coding, DLV_Specs_Coding_Translation, DLV_Specs_Coding_Frame, DLV_Specs_Wrong_partial_coded_Data_Provided, DLV_Specs_DP_Delivery, DLV_Specs_Tabular_Reports, DLV_Specs_Charting, DLV_Specs_GMU_Research_Analytics, DLV_Specs_Other_Issues, DLV_Specs_Other_Issues_Verbatim, DLV_errors_Coding, DLV_errors_Coding_Translation, DLV_errors_Coding_Frame, DLV_errors_Wrong_partial_coded_Data_Provided, DLV_errors_Respondent_Ids_not_Matching, DLV_errors_DP_Delivery, DLV_errors_DP_Incorrect_missing_data, DLV_errors_DP_Incorrect_norms_weighting, DLV_errors_DP_Used_Wrong_historical_data, DLV_errors_DP_Banners_not_Matching_Specs, DLV_errors_Tabular_Reports, DLV_errors_Charting, DLV_errors_GMU_Research_Analytics, DLV_errors_GMU_Setup, DLV_errors_GMU_Analysis, DLV_errors_GMU_Explanation_POVs, DLV_errors_IT_Infrastructure, DLV_errors_Other_Issues, DLV_errors_Other_Issues_Verbatim, IdFile)
		select Id, MES, CAMPO, ANO, Month, Record_Detail, Job_ID, Job_Name, Survey_ID, Date_Eligible, Date_Sent, Date_Returned, Region_Name, Country, BU_ID, BU_Name, Client_ID, Client_Name, Survey_Recipient, External_Job_Manager, Client_Sector_Name, Client_SBL_Name, Client_Territory, DC_Technique, Offering, Product, Job_Owner, Job_Manager, Job_Manager_2, Overall_Satisfaction, OTIF, On_Time, On_SPEC, No_Issues, Impact, Client_requested_changes_in_job_specs, Client_delivered_late_job_specs, Client_delivered_late_questionnaire_approval, Client_delivered_late_ads_materials, Project_manager_did_not_inform_about_delays, Late_translation, Late_sample, Late_scripting_link, Late_logistics, Delayed_email_mail, Delayed_field_launch, Delayed_field_end, Late_coding, Late_DP, Other_Delay_Please_Specify, Project_manager_did_not_inform_about_spec_changes, Protocols_Products_mgt_specs, Translation_specs, Sample_specs, Target_pop_Quotas_specs, Ques_Script_specs, Audio_Video_specs, Logistics_specs, Mailout_specs, Field_specs, Coding_specs, DP_specs, Other_spec_issue, Post_prog_changes, Ads_material_not_as_expected, Field_incidence_different, Quest_length_different, Did_not_help_with_client_needs, Not_experienced, Did_not_inform_on_progress, Did_not_inform_on_problems, Did_not_resolve_problems, Did_not_react_proactively, Did_not_take_responsibility, Inaccurate_Translation, Sample_errors, Sample_provided_not_matching, Sample_insufficient, Sample_quotas_inversed, Script_text_errors, Script_logic_errors, Look_and_feel_errors, Media_link_errors, Scripted_quotas_incorrect, Scripting_error_refield, Long_implementation_time, Interview_docs_imcomplete, Mistakes_in_legs__sample_id, Quest_translation_issues, Quotas_not_filled, Quota_wrong, Interview_instructions_not_respected, Interview_instructions_wrong, Wrong_code_frame, Errors_in_translation, Errors_in_coding_ques, Uncoded_questions, Wrong_respondent_id, Wrong_matching_repsondent_id, Wrong_question_data, Wrong_norms_weighting, Wrong_historical_data, Banners_not_matching, Other_Specify, OTIF_Verbatim, PM_Overall_Issue, PM_Information_on_Issues, PM_Reaction_to_Issues, PM_Resolution_of_Issues, PM_Experience, PM_GMU_Job_Mger_Flexibility, OTIF_CS_Setup, OTIF_CS_Setup_On_Time, OTIF_CS_Setup_On_Specs, OTIF_CS_Setup_Without_Errors, OTIF_CS_Field, OTIF_CS_Field_On_Time, OTIF_CS_Field_On_Specs, OTIF_CS_Field_Without_Errors, OTIF_CS_Delivery, OTIF_CS_Delivery_On_Time, OTIF_CS_Delivery_On_Specs, OTIF_CS_Delivery_Without_Errors, ST_Delays_Sample_File_Preparation, ST_Delays_Quota_File_Preparation, ST_Delays_Translations, ST_Delays_QNR_Scripting_Link, ST_Delays_Materials_Audio_Video_Images, ST_Delays_Logistics, ST_Delays_CLT_Venues, ST_Delays_Products, ST_Delays_Field_Brief, ST_Delays_Setup_CATI_CAPI_Machines, ST_Delays_IT_Infrastructure_Issues, ST_Delays_Other_Issues, ST_Delays_Other_Issues_Verbatim, ST_Specs_Incorrect_Sample, ST_Specs_Incorrect_Quotas, ST_Specs_Incorrect_Translation, ST_Specs_Incorrect_QNR, ST_Specs_Materials_Audio_Video_Images, ST_Specs_Incorrect_Logistics, ST_Specs_Incorrect_Product, ST_Specs_Incorrect_Protocol_instructions, ST_Specs_Incorrect_Field_Brief, ST_Specs_Other_Issues, ST_Specs_Other_Issues_Verbatim, ST_Errors_Sample_File_Preparation, ST_Errors_Sample, ST_Errors_Sample_Insufficient_Quotas, ST_Errors_Sample_not_Matching_Quotas_Requests, ST_Errors_Quota_File_Preparation, ST_Errors_Quota, ST_Errors_Quota_Legs, ST_Errors_Translations, ST_Errors_QNR_Scripting_Link, ST_Errors_QNR_Spelling_translations, ST_Errors_QNR_Logic_in_Script, ST_Errors_QNR_Look_and_Feel, ST_Errors_QNR_Media_Errors_in_Link, ST_Errors_Quotas_Scripting, ST_Errors_QNR_Changes_Corrections, ST_Errors_Materials_Audio_Video_Images, ST_Errors_Logistics, ST_Errors_Printing_Issues, ST_Errors_Incomplete_Documents, ST_Errors_Products, ST_Errors_Missing_Products_for_Field, ST_Errors_Labelling_of_Products, ST_Errors_Proucts_Legs_Sub_Sample, ST_Errors_Handling_Shipping, ST_Errors_Field_Brief, ST_Errors_Setup_CATI_CAPI_Machines, ST_Errors_IT_Setup, ST_Errors_Other_Issues, ST_Errors_Other_Issues_Verbatim, FLD_Delays_Field_Launch, FLD_Delays_Data_Entry_Scanning, FLD_Delays_Field_End_QNrs_Completed, FLD_Delays_IT_Infrastructure_Issues, FLD_Delays_Other_Issues, FLD_Delays_Other_Issues_Verbatim, FLD_Specs_Field_Launch, FLD_Specs_Field_Instructions, FLD_Specs_Fieldwork_Report, FLD_Specs_Quality_Control, FLD_Specs_Quota_Management, FLD_Specs_Data_Entry_Scanning, FLD_Specs_Other_Issues, FLD_Specs_Other_Issues_Verbatim, FLD_errors_Field_Launch, FLD_errors_Field_Instructions, FLD_errors_No_Respect_Field_Instructions, FLD_errors_Wrong_Field_Instructions_Used, FLD_errors_Field_Instruction_Recruitment, FLD_errors_Field_Supervision, FLD_errors_Fieldwork_Report, FLD_errors_Quality_Control, FLD_errors_Quota_Management, FLD_errors_Quotas_were_not_Fulfilled, FLD_errors_Target_Pop_Quota_Spec_not_Followed, FLD_errors_Data_Entry_Scanning, FLD_errors_IT_Infrastructure_Issues, FLD_errors_Other_Issues, FLD_errors_Other_Issues_Verbatim, DLV_Delays_Coding, DLV_Delays_DP_Delivery, DLV_Delays_Tabular_reports, DLV_Delays_Charting, DLV_Delays_GMU_Research_Analytics, DLV_Delays_IT_Infrastructure, DLV_Delays_Other_Issues, DLV_Delays_Other_Issues_Verbatim, DLV_Specs_Coding, DLV_Specs_Coding_Translation, DLV_Specs_Coding_Frame, DLV_Specs_Wrong_partial_coded_Data_Provided, DLV_Specs_DP_Delivery, DLV_Specs_Tabular_Reports, DLV_Specs_Charting, DLV_Specs_GMU_Research_Analytics, DLV_Specs_Other_Issues, DLV_Specs_Other_Issues_Verbatim, DLV_errors_Coding, DLV_errors_Coding_Translation, DLV_errors_Coding_Frame, DLV_errors_Wrong_partial_coded_Data_Provided, DLV_errors_Respondent_Ids_not_Matching, DLV_errors_DP_Delivery, DLV_errors_DP_Incorrect_missing_data, DLV_errors_DP_Incorrect_norms_weighting, DLV_errors_DP_Used_Wrong_historical_data, DLV_errors_DP_Banners_not_Matching_Specs, DLV_errors_Tabular_Reports, DLV_errors_Charting, DLV_errors_GMU_Research_Analytics, DLV_errors_GMU_Setup, DLV_errors_GMU_Analysis, DLV_errors_GMU_Explanation_POVs, DLV_errors_IT_Infrastructure, DLV_errors_Other_Issues, DLV_errors_Other_Issues_Verbatim, IdFile  
		from tbBase_ICSM 
		SET IDENTITY_INSERT tbBase_ICSM_Completa OFF
		delete from tbBase_ICSM

		
		insert into tbBases_Completa (ANO, MES, MÊS_1, QUARTER, SL, TO_, TOTALOPS, AOT, IdFile)
		select ANO, MES, MÊS_1, QUARTER, SL, TO_, TOTALOPS, AOT, IdFile 
		from tbBases 
		
		delete from tbBases

	
		insert into tbBaseHC_Completa (ANO, MES, HEADCOUNT, IdFile)
		select ANO, MES, HEADCOUNT, IdFile  
		from tbBaseHC 

		delete from tbBaseHC 

	
		insert into tbBaseCHARGE_Completa (ANO, MES, Month_Chargeable_Hours, Month_Non_Chargeable_Hours, Month_Total_Hours, Month_Standard_Hours, Month_Adjusted_Standard_Hours, Month_Chargeability, Month_Average_Hours_Above_Standard_Hours, YTD_Chargeable_Hours, YTD_Non_Chargeable_Hours, YTD_Total_Hours, YTD_Standard_Hours, YTD_Adjusted_Standard_Hours, YTD_Chargeability, YTD_Chargeability_Target, YTD_Average_Hours_Above_Standard_Hours, IdFile)
		select ANO, MES, Month_Chargeable_Hours, Month_Non_Chargeable_Hours, Month_Total_Hours, Month_Standard_Hours, Month_Adjusted_Standard_Hours, Month_Chargeability, Month_Average_Hours_Above_Standard_Hours, YTD_Chargeable_Hours, YTD_Non_Chargeable_Hours, YTD_Total_Hours, YTD_Standard_Hours, YTD_Adjusted_Standard_Hours, YTD_Chargeability, YTD_Chargeability_Target, YTD_Average_Hours_Above_Standard_Hours, IdFile  
		from tbBaseCHARGE

		delete from tbBaseCHARGE

		RETURN;
END

ELSE
BEGIN


	IF( EXISTS( select TOP 1 *  from tblBase where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile))
	BEGIN
		 delete from tblBase_Completa where MES = @Mes AND ANO =  @Ano 
	 
	-- UTILIZADO PARA MAPEAR COLUNAS NO INSERT
	 --DECLARE @CLUNAS VARCHAR(MAX)
	 --SELECT @CLUNAS =  SUBSTRING(
	 --   (SELECT ', ' + QUOTENAME(COLUMN_NAME)
	 --       FROM INFORMATION_SCHEMA.COLUMNS
	 --       WHERE TABLE_NAME = 'tblBase_Completa'
	 --       ORDER BY ORDINAL_POSITION
	 --       FOR XML path('')),
	 --   3,
	 --   200000);
		--SET  @CLUNAS =  REPLACE(@CLUNAS,'[','')
		--SET   @CLUNAS =  REPLACE(@CLUNAS,']','')
		--SELECT @CLUNAS

		 SET IDENTITY_INSERT tblBase_Completa ON
		 insert into tblBase_Completa (Id, MES, CAMPO, ANO, MES2, QUARTER, JOB_ID, Coluna1, NOME_DO_PROJETO, GP, GC, METODOLOGIA, TIPO_DE_JOB, AMOSTRA, AMOSTRA_REAL, TEMPO_ORÇADO, TEMPO_REAL, Bud, Real, CLIENT_NAME, PRODUCT, EXCEPTIONS, EXCEPTIONS_REAL, Length_Rating__Bud, Length_Rating__Real, Length_Rating_FRANCE__Bud, Length_Rating_FRANCE__Real, JUSTIFICATIVA_ATRASO_BD, JUSTIFICATIVA_ERRO_DE_BD, JUSTIFICATIVA_ATRASO_DE_CAMPO, ATRASO_DE_BD_OPS, ERRO_DE_BD_OPS, ATRASO_DE_CAMPO_OPS, Service_Line, METODOLOGIA2, Service_Line2, CAMPO_1, Coluna1_1, Megabase, IdFile)
		 select Id, MES, CAMPO, ANO, MES2, QUARTER, JOB_ID, Coluna1, NOME_DO_PROJETO, GP, GC, METODOLOGIA, TIPO_DE_JOB, AMOSTRA, AMOSTRA_REAL, TEMPO_ORÇADO, TEMPO_REAL, Bud, Real, CLIENT_NAME, PRODUCT, EXCEPTIONS, EXCEPTIONS_REAL, Length_Rating__Bud, Length_Rating__Real, Length_Rating_FRANCE__Bud, Length_Rating_FRANCE__Real, JUSTIFICATIVA_ATRASO_BD, JUSTIFICATIVA_ERRO_DE_BD, JUSTIFICATIVA_ATRASO_DE_CAMPO, ATRASO_DE_BD_OPS, ERRO_DE_BD_OPS, ATRASO_DE_CAMPO_OPS, Service_Line, METODOLOGIA2, Service_Line2, CAMPO_1, Coluna1_1, Megabase, IdFile  
		 from tblBase where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile
		 SET IDENTITY_INSERT tblBase_Completa OFF
		 DELETE FROM  tblBase
	 END

	 IF( EXISTS( select TOP 1 *  from tbBase_DP where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile))
	BEGIN
		 delete from tbBase_DP_Completa where MES = @Mes AND ANO =  @Ano 

		  SET IDENTITY_INSERT tbBase_DP_Completa ON
		  insert into tbBase_DP_Completa (Id, ANO, MES, N_e_Nome_do_Projeto, Tracking, SL, Fornecedor_Processamento, Fornecedor_Dashboard, Dashboard, Fornecedor_PPT, PPT_Autocharting, Local_Peru_Detroit, IdFile)
		  select Id, ANO, MES, N_e_Nome_do_Projeto, Tracking, SL, Fornecedor_Processamento, Fornecedor_Dashboard, Dashboard, Fornecedor_PPT, PPT_Autocharting, Local_Peru_Detroit, IdFile 
		  from tbBase_DP where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile
		  SET IDENTITY_INSERT tbBase_DP_Completa OFF
	 
		  DELETE FROM tbBase_DP
	 END

	 IF( EXISTS( select TOP 1 *  from tbBase_ICSM where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile))
	BEGIN
		 delete from tbBase_ICSM_Completa where MES = @Mes AND ANO =  @Ano 

		 SET IDENTITY_INSERT tbBase_ICSM_Completa ON
		 insert into tbBase_ICSM_Completa (Id, MES, CAMPO, ANO, Month, Record_Detail, Job_ID, Job_Name, Survey_ID, Date_Eligible, Date_Sent, Date_Returned, Region_Name, Country, BU_ID, BU_Name, Client_ID, Client_Name, Survey_Recipient, External_Job_Manager, Client_Sector_Name, Client_SBL_Name, Client_Territory, DC_Technique, Offering, Product, Job_Owner, Job_Manager, Job_Manager_2, Overall_Satisfaction, OTIF, On_Time, On_SPEC, No_Issues, Impact, Client_requested_changes_in_job_specs, Client_delivered_late_job_specs, Client_delivered_late_questionnaire_approval, Client_delivered_late_ads_materials, Project_manager_did_not_inform_about_delays, Late_translation, Late_sample, Late_scripting_link, Late_logistics, Delayed_email_mail, Delayed_field_launch, Delayed_field_end, Late_coding, Late_DP, Other_Delay_Please_Specify, Project_manager_did_not_inform_about_spec_changes, Protocols_Products_mgt_specs, Translation_specs, Sample_specs, Target_pop_Quotas_specs, Ques_Script_specs, Audio_Video_specs, Logistics_specs, Mailout_specs, Field_specs, Coding_specs, DP_specs, Other_spec_issue, Post_prog_changes, Ads_material_not_as_expected, Field_incidence_different, Quest_length_different, Did_not_help_with_client_needs, Not_experienced, Did_not_inform_on_progress, Did_not_inform_on_problems, Did_not_resolve_problems, Did_not_react_proactively, Did_not_take_responsibility, Inaccurate_Translation, Sample_errors, Sample_provided_not_matching, Sample_insufficient, Sample_quotas_inversed, Script_text_errors, Script_logic_errors, Look_and_feel_errors, Media_link_errors, Scripted_quotas_incorrect, Scripting_error_refield, Long_implementation_time, Interview_docs_imcomplete, Mistakes_in_legs__sample_id, Quest_translation_issues, Quotas_not_filled, Quota_wrong, Interview_instructions_not_respected, Interview_instructions_wrong, Wrong_code_frame, Errors_in_translation, Errors_in_coding_ques, Uncoded_questions, Wrong_respondent_id, Wrong_matching_repsondent_id, Wrong_question_data, Wrong_norms_weighting, Wrong_historical_data, Banners_not_matching, Other_Specify, OTIF_Verbatim, PM_Overall_Issue, PM_Information_on_Issues, PM_Reaction_to_Issues, PM_Resolution_of_Issues, PM_Experience, PM_GMU_Job_Mger_Flexibility, OTIF_CS_Setup, OTIF_CS_Setup_On_Time, OTIF_CS_Setup_On_Specs, OTIF_CS_Setup_Without_Errors, OTIF_CS_Field, OTIF_CS_Field_On_Time, OTIF_CS_Field_On_Specs, OTIF_CS_Field_Without_Errors, OTIF_CS_Delivery, OTIF_CS_Delivery_On_Time, OTIF_CS_Delivery_On_Specs, OTIF_CS_Delivery_Without_Errors, ST_Delays_Sample_File_Preparation, ST_Delays_Quota_File_Preparation, ST_Delays_Translations, ST_Delays_QNR_Scripting_Link, ST_Delays_Materials_Audio_Video_Images, ST_Delays_Logistics, ST_Delays_CLT_Venues, ST_Delays_Products, ST_Delays_Field_Brief, ST_Delays_Setup_CATI_CAPI_Machines, ST_Delays_IT_Infrastructure_Issues, ST_Delays_Other_Issues, ST_Delays_Other_Issues_Verbatim, ST_Specs_Incorrect_Sample, ST_Specs_Incorrect_Quotas, ST_Specs_Incorrect_Translation, ST_Specs_Incorrect_QNR, ST_Specs_Materials_Audio_Video_Images, ST_Specs_Incorrect_Logistics, ST_Specs_Incorrect_Product, ST_Specs_Incorrect_Protocol_instructions, ST_Specs_Incorrect_Field_Brief, ST_Specs_Other_Issues, ST_Specs_Other_Issues_Verbatim, ST_Errors_Sample_File_Preparation, ST_Errors_Sample, ST_Errors_Sample_Insufficient_Quotas, ST_Errors_Sample_not_Matching_Quotas_Requests, ST_Errors_Quota_File_Preparation, ST_Errors_Quota, ST_Errors_Quota_Legs, ST_Errors_Translations, ST_Errors_QNR_Scripting_Link, ST_Errors_QNR_Spelling_translations, ST_Errors_QNR_Logic_in_Script, ST_Errors_QNR_Look_and_Feel, ST_Errors_QNR_Media_Errors_in_Link, ST_Errors_Quotas_Scripting, ST_Errors_QNR_Changes_Corrections, ST_Errors_Materials_Audio_Video_Images, ST_Errors_Logistics, ST_Errors_Printing_Issues, ST_Errors_Incomplete_Documents, ST_Errors_Products, ST_Errors_Missing_Products_for_Field, ST_Errors_Labelling_of_Products, ST_Errors_Proucts_Legs_Sub_Sample, ST_Errors_Handling_Shipping, ST_Errors_Field_Brief, ST_Errors_Setup_CATI_CAPI_Machines, ST_Errors_IT_Setup, ST_Errors_Other_Issues, ST_Errors_Other_Issues_Verbatim, FLD_Delays_Field_Launch, FLD_Delays_Data_Entry_Scanning, FLD_Delays_Field_End_QNrs_Completed, FLD_Delays_IT_Infrastructure_Issues, FLD_Delays_Other_Issues, FLD_Delays_Other_Issues_Verbatim, FLD_Specs_Field_Launch, FLD_Specs_Field_Instructions, FLD_Specs_Fieldwork_Report, FLD_Specs_Quality_Control, FLD_Specs_Quota_Management, FLD_Specs_Data_Entry_Scanning, FLD_Specs_Other_Issues, FLD_Specs_Other_Issues_Verbatim, FLD_errors_Field_Launch, FLD_errors_Field_Instructions, FLD_errors_No_Respect_Field_Instructions, FLD_errors_Wrong_Field_Instructions_Used, FLD_errors_Field_Instruction_Recruitment, FLD_errors_Field_Supervision, FLD_errors_Fieldwork_Report, FLD_errors_Quality_Control, FLD_errors_Quota_Management, FLD_errors_Quotas_were_not_Fulfilled, FLD_errors_Target_Pop_Quota_Spec_not_Followed, FLD_errors_Data_Entry_Scanning, FLD_errors_IT_Infrastructure_Issues, FLD_errors_Other_Issues, FLD_errors_Other_Issues_Verbatim, DLV_Delays_Coding, DLV_Delays_DP_Delivery, DLV_Delays_Tabular_reports, DLV_Delays_Charting, DLV_Delays_GMU_Research_Analytics, DLV_Delays_IT_Infrastructure, DLV_Delays_Other_Issues, DLV_Delays_Other_Issues_Verbatim, DLV_Specs_Coding, DLV_Specs_Coding_Translation, DLV_Specs_Coding_Frame, DLV_Specs_Wrong_partial_coded_Data_Provided, DLV_Specs_DP_Delivery, DLV_Specs_Tabular_Reports, DLV_Specs_Charting, DLV_Specs_GMU_Research_Analytics, DLV_Specs_Other_Issues, DLV_Specs_Other_Issues_Verbatim, DLV_errors_Coding, DLV_errors_Coding_Translation, DLV_errors_Coding_Frame, DLV_errors_Wrong_partial_coded_Data_Provided, DLV_errors_Respondent_Ids_not_Matching, DLV_errors_DP_Delivery, DLV_errors_DP_Incorrect_missing_data, DLV_errors_DP_Incorrect_norms_weighting, DLV_errors_DP_Used_Wrong_historical_data, DLV_errors_DP_Banners_not_Matching_Specs, DLV_errors_Tabular_Reports, DLV_errors_Charting, DLV_errors_GMU_Research_Analytics, DLV_errors_GMU_Setup, DLV_errors_GMU_Analysis, DLV_errors_GMU_Explanation_POVs, DLV_errors_IT_Infrastructure, DLV_errors_Other_Issues, DLV_errors_Other_Issues_Verbatim, IdFile)
		 select Id, MES, CAMPO, ANO, Month, Record_Detail, Job_ID, Job_Name, Survey_ID, Date_Eligible, Date_Sent, Date_Returned, Region_Name, Country, BU_ID, BU_Name, Client_ID, Client_Name, Survey_Recipient, External_Job_Manager, Client_Sector_Name, Client_SBL_Name, Client_Territory, DC_Technique, Offering, Product, Job_Owner, Job_Manager, Job_Manager_2, Overall_Satisfaction, OTIF, On_Time, On_SPEC, No_Issues, Impact, Client_requested_changes_in_job_specs, Client_delivered_late_job_specs, Client_delivered_late_questionnaire_approval, Client_delivered_late_ads_materials, Project_manager_did_not_inform_about_delays, Late_translation, Late_sample, Late_scripting_link, Late_logistics, Delayed_email_mail, Delayed_field_launch, Delayed_field_end, Late_coding, Late_DP, Other_Delay_Please_Specify, Project_manager_did_not_inform_about_spec_changes, Protocols_Products_mgt_specs, Translation_specs, Sample_specs, Target_pop_Quotas_specs, Ques_Script_specs, Audio_Video_specs, Logistics_specs, Mailout_specs, Field_specs, Coding_specs, DP_specs, Other_spec_issue, Post_prog_changes, Ads_material_not_as_expected, Field_incidence_different, Quest_length_different, Did_not_help_with_client_needs, Not_experienced, Did_not_inform_on_progress, Did_not_inform_on_problems, Did_not_resolve_problems, Did_not_react_proactively, Did_not_take_responsibility, Inaccurate_Translation, Sample_errors, Sample_provided_not_matching, Sample_insufficient, Sample_quotas_inversed, Script_text_errors, Script_logic_errors, Look_and_feel_errors, Media_link_errors, Scripted_quotas_incorrect, Scripting_error_refield, Long_implementation_time, Interview_docs_imcomplete, Mistakes_in_legs__sample_id, Quest_translation_issues, Quotas_not_filled, Quota_wrong, Interview_instructions_not_respected, Interview_instructions_wrong, Wrong_code_frame, Errors_in_translation, Errors_in_coding_ques, Uncoded_questions, Wrong_respondent_id, Wrong_matching_repsondent_id, Wrong_question_data, Wrong_norms_weighting, Wrong_historical_data, Banners_not_matching, Other_Specify, OTIF_Verbatim, PM_Overall_Issue, PM_Information_on_Issues, PM_Reaction_to_Issues, PM_Resolution_of_Issues, PM_Experience, PM_GMU_Job_Mger_Flexibility, OTIF_CS_Setup, OTIF_CS_Setup_On_Time, OTIF_CS_Setup_On_Specs, OTIF_CS_Setup_Without_Errors, OTIF_CS_Field, OTIF_CS_Field_On_Time, OTIF_CS_Field_On_Specs, OTIF_CS_Field_Without_Errors, OTIF_CS_Delivery, OTIF_CS_Delivery_On_Time, OTIF_CS_Delivery_On_Specs, OTIF_CS_Delivery_Without_Errors, ST_Delays_Sample_File_Preparation, ST_Delays_Quota_File_Preparation, ST_Delays_Translations, ST_Delays_QNR_Scripting_Link, ST_Delays_Materials_Audio_Video_Images, ST_Delays_Logistics, ST_Delays_CLT_Venues, ST_Delays_Products, ST_Delays_Field_Brief, ST_Delays_Setup_CATI_CAPI_Machines, ST_Delays_IT_Infrastructure_Issues, ST_Delays_Other_Issues, ST_Delays_Other_Issues_Verbatim, ST_Specs_Incorrect_Sample, ST_Specs_Incorrect_Quotas, ST_Specs_Incorrect_Translation, ST_Specs_Incorrect_QNR, ST_Specs_Materials_Audio_Video_Images, ST_Specs_Incorrect_Logistics, ST_Specs_Incorrect_Product, ST_Specs_Incorrect_Protocol_instructions, ST_Specs_Incorrect_Field_Brief, ST_Specs_Other_Issues, ST_Specs_Other_Issues_Verbatim, ST_Errors_Sample_File_Preparation, ST_Errors_Sample, ST_Errors_Sample_Insufficient_Quotas, ST_Errors_Sample_not_Matching_Quotas_Requests, ST_Errors_Quota_File_Preparation, ST_Errors_Quota, ST_Errors_Quota_Legs, ST_Errors_Translations, ST_Errors_QNR_Scripting_Link, ST_Errors_QNR_Spelling_translations, ST_Errors_QNR_Logic_in_Script, ST_Errors_QNR_Look_and_Feel, ST_Errors_QNR_Media_Errors_in_Link, ST_Errors_Quotas_Scripting, ST_Errors_QNR_Changes_Corrections, ST_Errors_Materials_Audio_Video_Images, ST_Errors_Logistics, ST_Errors_Printing_Issues, ST_Errors_Incomplete_Documents, ST_Errors_Products, ST_Errors_Missing_Products_for_Field, ST_Errors_Labelling_of_Products, ST_Errors_Proucts_Legs_Sub_Sample, ST_Errors_Handling_Shipping, ST_Errors_Field_Brief, ST_Errors_Setup_CATI_CAPI_Machines, ST_Errors_IT_Setup, ST_Errors_Other_Issues, ST_Errors_Other_Issues_Verbatim, FLD_Delays_Field_Launch, FLD_Delays_Data_Entry_Scanning, FLD_Delays_Field_End_QNrs_Completed, FLD_Delays_IT_Infrastructure_Issues, FLD_Delays_Other_Issues, FLD_Delays_Other_Issues_Verbatim, FLD_Specs_Field_Launch, FLD_Specs_Field_Instructions, FLD_Specs_Fieldwork_Report, FLD_Specs_Quality_Control, FLD_Specs_Quota_Management, FLD_Specs_Data_Entry_Scanning, FLD_Specs_Other_Issues, FLD_Specs_Other_Issues_Verbatim, FLD_errors_Field_Launch, FLD_errors_Field_Instructions, FLD_errors_No_Respect_Field_Instructions, FLD_errors_Wrong_Field_Instructions_Used, FLD_errors_Field_Instruction_Recruitment, FLD_errors_Field_Supervision, FLD_errors_Fieldwork_Report, FLD_errors_Quality_Control, FLD_errors_Quota_Management, FLD_errors_Quotas_were_not_Fulfilled, FLD_errors_Target_Pop_Quota_Spec_not_Followed, FLD_errors_Data_Entry_Scanning, FLD_errors_IT_Infrastructure_Issues, FLD_errors_Other_Issues, FLD_errors_Other_Issues_Verbatim, DLV_Delays_Coding, DLV_Delays_DP_Delivery, DLV_Delays_Tabular_reports, DLV_Delays_Charting, DLV_Delays_GMU_Research_Analytics, DLV_Delays_IT_Infrastructure, DLV_Delays_Other_Issues, DLV_Delays_Other_Issues_Verbatim, DLV_Specs_Coding, DLV_Specs_Coding_Translation, DLV_Specs_Coding_Frame, DLV_Specs_Wrong_partial_coded_Data_Provided, DLV_Specs_DP_Delivery, DLV_Specs_Tabular_Reports, DLV_Specs_Charting, DLV_Specs_GMU_Research_Analytics, DLV_Specs_Other_Issues, DLV_Specs_Other_Issues_Verbatim, DLV_errors_Coding, DLV_errors_Coding_Translation, DLV_errors_Coding_Frame, DLV_errors_Wrong_partial_coded_Data_Provided, DLV_errors_Respondent_Ids_not_Matching, DLV_errors_DP_Delivery, DLV_errors_DP_Incorrect_missing_data, DLV_errors_DP_Incorrect_norms_weighting, DLV_errors_DP_Used_Wrong_historical_data, DLV_errors_DP_Banners_not_Matching_Specs, DLV_errors_Tabular_Reports, DLV_errors_Charting, DLV_errors_GMU_Research_Analytics, DLV_errors_GMU_Setup, DLV_errors_GMU_Analysis, DLV_errors_GMU_Explanation_POVs, DLV_errors_IT_Infrastructure, DLV_errors_Other_Issues, DLV_errors_Other_Issues_Verbatim, IdFile  
		 from tbBase_ICSM where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile
		 SET IDENTITY_INSERT tbBase_ICSM_Completa OFF
	 
		  DELETE FROM tbBase_ICSM
	 END

	IF( EXISTS( select TOP 1 *  from tbBases where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile))
	BEGIN
		 delete from tbBases_Completa where MES = @Mes AND ANO =  @Ano 

		-- SET IDENTITY_INSERT tbBases_Completa ON
		 insert into tbBases_Completa (ANO, MES, MÊS_1, QUARTER, SL, TO_, TOTALOPS, AOT, IdFile)
		 select ANO, MES, MÊS_1, QUARTER, SL, TO_, TOTALOPS, AOT, IdFile 
		 from tbBases where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile
		 SET IDENTITY_INSERT tbBases_Completa OFF
	
		-- DELETE FROM tbBases
	 END

	IF( EXISTS( select TOP 1 *  from tbBaseHC where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile))
	BEGIN
		 delete from tbBaseHC_Completa where MES = @Mes AND ANO =  @Ano 

		-- SET IDENTITY_INSERT tbBaseHC_Completa ON
		 insert into tbBaseHC_Completa (ANO, MES, HEADCOUNT, IdFile)
		 select ANO, MES, HEADCOUNT, IdFile  
		 from tbBaseHC where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile
		-- SET IDENTITY_INSERT tbBaseHC_Completa OFF
	  
		  DELETE FROM tbBaseHC
	 END

	IF( EXISTS( select TOP 1 *  from tbBaseCHARGE where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile))
	BEGIN
		 delete from tbBaseCHARGE_Completa where MES = @Mes AND ANO =  @Ano 


	--	 SET IDENTITY_INSERT tbBaseCHARGE_Completa ON
		 insert into tbBaseCHARGE_Completa (ANO, MES, Month_Chargeable_Hours, Month_Non_Chargeable_Hours, Month_Total_Hours, Month_Standard_Hours, Month_Adjusted_Standard_Hours, Month_Chargeability, Month_Average_Hours_Above_Standard_Hours, YTD_Chargeable_Hours, YTD_Non_Chargeable_Hours, YTD_Total_Hours, YTD_Standard_Hours, YTD_Adjusted_Standard_Hours, YTD_Chargeability, YTD_Chargeability_Target, YTD_Average_Hours_Above_Standard_Hours, IdFile)
		 select ANO, MES, Month_Chargeable_Hours, Month_Non_Chargeable_Hours, Month_Total_Hours, Month_Standard_Hours, Month_Adjusted_Standard_Hours, Month_Chargeability, Month_Average_Hours_Above_Standard_Hours, YTD_Chargeable_Hours, YTD_Non_Chargeable_Hours, YTD_Total_Hours, YTD_Standard_Hours, YTD_Adjusted_Standard_Hours, YTD_Chargeability, YTD_Chargeability_Target, YTD_Average_Hours_Above_Standard_Hours, IdFile  
		 from tbBaseCHARGE where MES = @Mes AND ANO =  @Ano AND IdFile = @IdFile
	--	 SET IDENTITY_INSERT tbBaseCHARGE_Completa OFF
	 
		 DELETE FROM tbBaseCHARGE
	 END


 END


END  
  