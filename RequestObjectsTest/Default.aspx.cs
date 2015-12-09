using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace RequestObjectsTest
{
    public partial class _Default : System.Web.UI.Page
    {
        public List<NameValuePair> GetServerVars()
        {
            List<NameValuePair> serverVars = new List<NameValuePair>();

			foreach (string s in Context.Items.Keys.OfType<string>())
			{
				serverVars.Add(new NameValuePair(s, Context.Items[s].ToString()));
			}
			serverVars.Sort();

            return serverVars;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
			if (!string.IsNullOrEmpty (Request.QueryString ["filter"])) 
			{
				string rFilter = Request.QueryString ["filter"];
				foreach (string s in Request.ServerVariables.AllKeys) 
				{
					if(s.StartsWith(rFilter))
					{
						Context.Items [s] = Request.ServerVariables [s];
					}
				}
			} 
			else 
			{
				foreach (string s in Request.ServerVariables.AllKeys) 
				{
					Context.Items [s] = Request.ServerVariables [s];
				}
			}
            RequestObjectsGV.DataBind();
        }
    }

    public class NameValuePair : IComparable
    {
        public string Name { get; set; }
        public string Value { get; set; }

        public NameValuePair(string Name, string Value)
        {
            this.Name = Name;
            this.Value = Value;
        }

        #region IComparable Members

        public int CompareTo(object obj)
        {
            NameValuePair nvp = (NameValuePair)obj;
            return this.Name.CompareTo(nvp.Name);
        }

        #endregion
    }
}
