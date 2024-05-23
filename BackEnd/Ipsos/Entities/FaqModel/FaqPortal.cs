using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.FaqModel
{
    public class FaqPortal
    {
        public int Id { get; set; }
        public int IdKeyFaq { get; set; }
        public string KeyFaq { get; set; }
        public string TitleFaq { get; set; }
        public string TextoFaq { get; set; }
    }
}
