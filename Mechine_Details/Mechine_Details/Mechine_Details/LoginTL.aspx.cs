using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace Mechine_Details
{
    public partial class LoginTL : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        SqlCommand Cmd;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            // string name =.ToString();      
            if (Session["c"]==null)
            {     
                string URL;
                Cmd = new SqlCommand("select count(*) from UserTable where Email=@email and password=@password;", Con);
                Cmd.CommandType = CommandType.Text;
                Cmd.Parameters.AddWithValue("@email", txtemail.Text);
                Cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                Con.Open();
                int i = Convert.ToInt32(Cmd.ExecuteScalar());
                if (i.Equals(1))
                {
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Login Successfully')", true);
                    URL = Request.QueryString["ReturnURL"];
                    if (URL != null)
                    {
                        if(URL.Equals("/RegistationTL.aspx"))
                        {
                            HttpCookie c = FormsAuthentication.GetAuthCookie(txtemail.Text, chkr.Checked);
                            Response.Cookies.Add(c);
                            URL = "/Secured/Machine.aspx";
                            Response.Redirect(URL);
                        }
                        else
                        {

                          // Session["user"] = URL;
                           HttpCookie c= FormsAuthentication.GetAuthCookie(txtemail.Text, chkr.Checked);
                            Response.Cookies.Add(c);
                            URL = Request.QueryString["ReturnURL"];
                            Response.Redirect(URL);
                        }
                    }
                    else
                    {
                        FormsAuthentication.SetAuthCookie(txtemail.Text, chkr.Checked);
                        URL = "/Secured/Machine.aspx";
                         //Session["user"] = URL;
                        Response.Redirect(URL);
                    }
                   
                }
                else
                    lblDisplay.Text = "Invalid User Details";
                Con.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('LogOut befour User')", true);
            }

        }

       
    }
}