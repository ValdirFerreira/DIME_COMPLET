  
CREATE proc [dbo].[pr_Lista_Traducao]  
 @idiomaId int  
 as  
  BEGIN
--'por'  1  
--'ing'  2  
--'esp'  3  
  
  
  select Objeto as objeto, Texto as valor from tblTraducaoComponenteObjetoTraducao t1 with(nolock)  
  JOIN tblTraducaoIdioma t2 with(nolock)  ON t1.IdiomaId = t2.CodIdioma
  where t2.CodIdioma = @idiomaId
  END