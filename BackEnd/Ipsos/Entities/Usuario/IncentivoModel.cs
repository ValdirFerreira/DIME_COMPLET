using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Usuario
{
    public class IncentivoModel
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string WhatsApp { get; set; }
        public string Projeto { get; set; }
        public string TempoComunidade { get; set; }
        public string ValorIncentivo { get; set; }
        public string Sobre { get; set; }
        public string Link { get; set; }
        public string IdUser { get; set; }
        public bool Status { get; set; }
    }


    public class DadosCadastro
    {
        public int Id { get; set; }
        public string Celular { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }

    }

}

