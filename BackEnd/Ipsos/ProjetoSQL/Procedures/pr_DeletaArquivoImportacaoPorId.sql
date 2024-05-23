


IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'pr_DeletaArquivoImportacaoPorId') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
  DROP  PROCEDURE pr_DeletaArquivoImportacaoPorId  
END

GO

CREATE PROCEDURE pr_DeletaArquivoImportacaoPorId  
@IdFile int
AS  
BEGIN  

delete from tblBase                where IdFile = @IdFile
delete from tbBase_ICSM			   where IdFile = @IdFile
delete from tbBase_DP			   where IdFile = @IdFile
delete from tbBases				   where IdFile = @IdFile
delete from tbBaseHC			   where IdFile = @IdFile
delete from tbBaseCHARGE		   where IdFile = @IdFile
								 
delete from tblBase_Completa 	   where IdFile = @IdFile
delete from tbBase_DP_Completa 	   where IdFile = @IdFile
delete from tbBase_ICSM_Completa   where IdFile = @IdFile
delete from tbBases_Completa 	   where IdFile = @IdFile
delete from tbBaseHC_Completa	   where IdFile = @IdFile
delete from tbBaseCHARGE_Completa  where IdFile = @IdFile

delete from  tblFile               where IdFile = @IdFile

END  
  