namespace InsuranceManagementAPI.Data
{
    public class UserLogin
    {
        public UserLogin(string personId, string personName, string accessToken)
        {
            PersonId = personId;
            PersonFirstName = personName;
            AccessToken = accessToken;
        }
        public string PersonId { get; set; }
        public string PersonFirstName { get; set; }
        public string AccessToken { get; set; }
    }
}
