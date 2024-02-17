using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;


namespace Mechine_Details
{
    public partial class RegistationTL : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     

        protected void btnregistation_Click1(object sender, EventArgs e)
        {
            if (ChkiAgree.Checked)
            {
                Cmd = new SqlCommand("Insert into UserTable values(@fname,@lname,@email,@password);", Con);
                Cmd.CommandType = CommandType.Text;
                Cmd.Parameters.AddWithValue("@fname", txtfirstName.Text);
                Cmd.Parameters.AddWithValue("@lname", txtlastName.Text);
                Cmd.Parameters.AddWithValue("@email", txtemail.Text);
                Cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                Con.Open();
                int i = Cmd.ExecuteNonQuery();
                if (i.Equals(1))
                {
                    txtfirstName.Text = string.Empty;
                    txtlastName.Text = string.Empty;
                    txtemail.Text = string.Empty;
                    txtpassword.Text = string.Empty;
                    FormsAuthentication.RedirectToLoginPage();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Record added successfully')", true);
                }
                Con.Close();
            }
            else
            {
                lbl.Text = " Not Checked";
            }
        }
    }
}