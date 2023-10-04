namespace InsuranceManagementAPI.Data
{
    public class Policy
    {
        public long PolicyID {  get; set; }
        
        public string Name { get; set; }

        public string TypeOfPolicy { get; set; }

        public decimal Premium {  get; set; }
    }
}
