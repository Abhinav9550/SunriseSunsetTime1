using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunriseSunsetTime1
{
    public partial class SunriseSunsetTime : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubMit_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://api.sunrise-sunset.org/json?lat=" + txtLatitude.Value + "&lng=" + txtLongitude.Value);
            var request = new RestRequest(Method.GET);
            var response = client.Execute(request);
            var responseOrg = Newtonsoft.Json.JsonConvert.DeserializeObject<SunOrganisation>(response.Content);
            lblSunRise.InnerText = responseOrg.results != null ? Convert.ToString(Convert.ToDateTime(responseOrg.results.sunrise).AddHours(5).AddMinutes(30)) : "";
            lblSunSet.InnerText = responseOrg.results != null ? Convert.ToString(Convert.ToDateTime(responseOrg.results.sunset).AddHours(5).AddMinutes(30)) : "";
            lblError.InnerText = responseOrg.results != null ?  "":" please enter valid values ";
        }
    }

    public class SunOrganisation
    {
        public SunOrganisationResults results { get; set; }
        public string status { get; set; }
    }

    public class SunOrganisationResults
    {
        public string sunrise { get; set; }
        public string sunset { get; set; }
       
}
