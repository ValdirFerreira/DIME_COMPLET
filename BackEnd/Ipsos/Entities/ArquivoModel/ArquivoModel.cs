using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.ArquivoModel
{
    public class ArquivoModel
    {
        public int IdFile { get; set; }
        public string NameFile { get; set; }
        public string FileExension { get; set; }
        public DateTime DateCreate { get; set; }
        public byte[] BinFile { get; set; }

        public  string Aba1 { get; set; }
        public string Aba2 { get; set; }
        public string Aba3 { get; set; }
        public string Aba4 { get; set; }
        public string Aba5 { get; set; }
        public string Aba6 { get; set; }

        public int QtdColunasAba1 { get; set; }
        public int QtdColunasAba2 { get; set; }
        public int QtdColunasAba3 { get; set; }

        /// <summary>
        /// 0 Arquivo Importado
        /// 1 Em Processamento
        /// 2 Pronto para Download
        /// 3 Com Erro
        /// </summary>
        public int StatusImportacao { get; set; }

        public DateTime DateUpdateProcess { get; set; }
        public int IdUser { get; set; }

        public string InfoErro { get; set; }

        public int Ano { get; set; }
        public int Mes { get; set; }
    }
}
