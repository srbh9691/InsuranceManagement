using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Net.Mail;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ResetPasswordController : Controller
    {
        [HttpPost]
        public async Task<IActionResult> SendEmail(string emailId)
        {
            bool result = false;
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@EmailId", emailId)
            };
            string password = await DbHelper.Instance.GetFirstRecord<string>("SSP_GetPassword", parameters);

            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("2022mt93642@wilp.bits-pilani.ac.in");
            mailMessage.To.Add(emailId);
            mailMessage.Subject = "Reset Password";
            mailMessage.Body = $"Hello,\nThe Password for your account having EmailId {emailId} is {password}.";

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("2022mt93642@wilp.bits-pilani.ac.in", "Wp$09061991");
            smtpClient.EnableSsl = true;

            try
            {
                smtpClient.Send(mailMessage);
                Console.WriteLine("Email Sent Successfully.");
                result = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }

            return Ok(result);
        }

    }
}
