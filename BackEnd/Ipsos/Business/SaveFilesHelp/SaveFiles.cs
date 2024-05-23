using Entities.ArquivoModel;
using ExcelDataReader;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.SaveFilesHelp
{
    public class SaveFiles : IDisposable
    {

        private string VerificaDiretorio
        {
            get
            {
                var path = AppDomain.CurrentDomain.BaseDirectory;

                path += "Files";

                if (!System.IO.Directory.Exists(path))
                    System.IO.Directory.CreateDirectory(path);

                path += "\\";
                return path;
            }
        }

        public void SalvaArquivo(ArquivoModel arquivo)
        {

            using (var outStream = new MemoryStream(arquivo.BinFile))
            {
                var diretorio = string.Concat(VerificaDiretorio, arquivo.NameFile, arquivo.FileExension);

                if (File.Exists(diretorio))
                {
                    File.Delete(diretorio);
                }
                using (var fileStream = new FileStream(diretorio, FileMode.CreateNew, FileAccess.ReadWrite))
                {

                    outStream.CopyTo(fileStream); // fileStream is not populated
                }
            }
        }


        public bool DeleteFileOriginal(ArquivoModel arquivol)
        {
            var diretorio_1_Importacao = string.Concat(VerificaDiretorio, arquivol.NameFile, arquivol.FileExension);

            try
            {
                File.Delete(diretorio_1_Importacao); // Deletar somente o Arquivo de Upload e deixar o arquivo traduzido
                return true;

            }
            catch (Exception)
            {
                return false;
            }


        }


        public DataSet LeituraArquivoCompleto(ArquivoModel arquivo)
        {
            try
            {
                // recuparar arquivo pelo ID
                var diretorio = string.Concat(VerificaDiretorio, arquivo.IdFile, arquivo.FileExension);

                var dtDados = new DataTable();

                IExcelDataReader reader;
                var stream = File.Open(diretorio, FileMode.Open, FileAccess.ReadWrite);
                reader = ExcelReaderFactory.CreateReader(stream);

                var conf = new ExcelDataSetConfiguration
                {
                    ConfigureDataTable = _ => new ExcelDataTableConfiguration
                    {
                        UseHeaderRow = false,
                    }
                };

                var dtSet = reader.AsDataSet(conf);            

                stream.Close();
                stream.Dispose();

                return dtSet;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public DataTable LeituraArquivo(ArquivoModel arquivo)
        {
            try
            {
                // recuparar arquivo pelo ID
                var diretorio = string.Concat(VerificaDiretorio, arquivo.IdFile, arquivo.FileExension);

                var dtDados = new DataTable();

                IExcelDataReader reader;
                var stream = File.Open(diretorio, FileMode.Open, FileAccess.ReadWrite);
                reader = ExcelReaderFactory.CreateReader(stream);

                var conf = new ExcelDataSetConfiguration
                {
                    ConfigureDataTable = _ => new ExcelDataTableConfiguration
                    {
                        UseHeaderRow = true,
                    }
                };

                var dtSet = reader.AsDataSet(conf);
                //dtDados = dtSet.Tables[arquivo.Aba1];
                var tabela1 = dtSet.Tables[0];

                stream.Close();
                stream.Dispose();

                return tabela1;


                //using (var temp = new FileStream(diretorio, FileMode.Open))
                //{
                //    ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                //    ExcelPackage package = new ExcelPackage(temp);
                //    //ExcelWorksheet sheet = package.Workbook.Worksheets["MDD Labels"];
                //    ExcelWorksheet sheet = package.Workbook.Worksheets[arquivo.Aba1];

                //    var linhaTitulo = 2;

                //    var ultimaColuna = sheet.Dimension.End.Column;

                //    for (int linha = sheet.Dimension.Start.Row; linha <= sheet.Dimension.End.Row; linha++)
                //    {
                //        string data = sheet.Cells[linha, 1].Value.ToString();
                //        string cliente = sheet.Cells[linha, 2].Value.ToString();
                //        string projeto = sheet.Cells[linha, 3].Value.ToString();
                //    }

                //    //for (int i = sheet.Dimension.Start.Row; i <= sheet.Dimension.End.Row; i++)
                //    //{
                //    //    string valorColuna = sheet.Cells[i, j].Value?.ToString();
                //    //}

                //    //do something with the current cell value
                //    //string currentCellValue = sheet.Cells[linhaTitulo, j].Value.ToString();

                //    //for (int nColuna = sheet.Dimension.Start.Column; nColuna <= sheet.Dimension.End.Column; nColuna++)
                //    //{
                //    //}
                //}
            }
            catch (Exception ex)
            {
                return null;
            }
          
        }

        private static byte[] ConverteStreamToByteArray(Stream stream)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                stream.CopyTo(ms);
                return ms.ToArray();
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
