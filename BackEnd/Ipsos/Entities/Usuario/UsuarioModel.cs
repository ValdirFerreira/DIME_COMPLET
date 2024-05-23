using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Usuario
{
    public class UsuarioAnalistaModel
    {
        public int CodAnalista { get; set; }
        public string Nome { get; set; }
        public bool Status { get; set; }
        public int Tipo { get; set; }
        public string TipoDescricao { get; set; }
        public string SL { get; set; }
    }
}
