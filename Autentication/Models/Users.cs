//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Authentication.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Users
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public string CompletNames { get; set; }
        public string Address { get; set; }
        public Nullable<decimal> Phone { get; set; }
        public string Email { get; set; }
        public Nullable<int> Age { get; set; }
        public Nullable<int> IdRol { get; set; }
    
        public virtual Roles Roles { get; set; }
    }
}
