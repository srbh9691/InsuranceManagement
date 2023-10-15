namespace InsuranceManagementAPI.Data
{
    public class Person
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string PhoneNo { get; set; }

        public string UserName { get; set; }

        public bool IsActive { get; set; }

        public string EmailId { get; set; }

        public DateTime DateOfBirth { get; set; }

        public string HouseNo { get; set; }

        public string Area { get; set; }

        public string City { get; set; }

        public int Zip { get; set; }
    }

    public class SavePerson : Person
    {
        public string Password { get; set; }

        public bool IsCustomer { get; set; }
    }
}
