using System;
using FluentValidator;
using FluentValidator.Validation;

namespace StoreDomain.StoreContext.ValueObjects
{
    public class Email : Notifiable
    {
        public Email(string address)
        {
            Address = address;

            AddNotifications(new ValidationContract()
                .Requires()
                .IsEmail(Address, "Email", "O E-Mail é inválido."));
        }
        public string Address { get; private set; }

        public override string ToString()
        {
            return $"{Address}";
        }
    }
}