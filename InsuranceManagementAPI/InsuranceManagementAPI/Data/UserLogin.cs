namespace InsuranceManagementAPI.Data
{
    public class UserLogin
    {
        public UserLogin(long personId, string personName, bool isCustomer, string accessToken)
        {
            PersonId = personId;
            FirstName = personName;
            AccessToken = accessToken;
            IsCustomer = isCustomer;
        }
        public long PersonId { get; set; }
        public string FirstName { get; set; }
        public string AccessToken { get; set; }
        public bool IsCustomer { get; set; }
    }

    public class PersonLoginDetail
    {
        public long PersonId { get; set; }
        public string FirstName { get; set; }
        public bool IsCustomer { get; set; }
    }
}
