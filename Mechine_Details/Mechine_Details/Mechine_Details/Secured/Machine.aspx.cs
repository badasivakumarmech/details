using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Configuration;
using System.Web.Security;

namespace Mechine_Details.Secured
{
    public partial class Machine : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        SqlCommand cmd;
        SqlDataReader DR;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                BindGridData();               
                Session["c"] = Request.Cookies[".ASPXAUTH"].Name;
            }
            
        }
        private void BindGridData()
        {
            SqlCommand command = new SqlCommand("SELECT * from Machine_Details", connection);
            SqlDataAdapter daimages = new SqlDataAdapter(command);
            DataSet DS = new DataSet();
            //DataTable dt = new DataTable();
            daimages.Fill(DS);
            grdEmployee.DataSource = DS.Tables[0];
            grdEmployee.DataBind();
        }


        protected void btnsave_Click(object sender, EventArgs e)
        {
            //Condition to check if the file uploaded or not   
            //  if (fileuploadImage.HasFile)
            try
            {

                //getting length of uploaded file  
                int length = fileuploadImage.PostedFile.ContentLength;
                //create a byte array to store the binary image data  
                byte[] imgbyte = new byte[length];

                //store the currently selected file in memeory  
                HttpPostedFile img = fileuploadImage.PostedFile;
                //set the binary data  
                img.InputStream.Read(imgbyte, 0, length);


                int Id = Convert.ToInt32(txtID.Text);
                string MName = txtMName.Text;
                string MB = txtMB.Text;
                string MN = txtMN.Text;
                string AM = txtAM.Text;


                //Open The Connection  
                connection.Open();
                cmd = new SqlCommand("insert into Machine_Details values(@Id,@MachineName,@ManufacturingBy,@MachineNumber,@Image,@AnalysisMaintainance)", connection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
                cmd.Parameters.AddWithValue("@MachineName", MName);
                cmd.Parameters.AddWithValue("@ManufacturingBy", MB);
                cmd.Parameters.AddWithValue("@MachineNumber", MN);
                cmd.Parameters.Add("@Image", SqlDbType.Image).Value = imgbyte;
                cmd.Parameters.AddWithValue("@AnalysisMaintainance", AM);
                int count = cmd.ExecuteNonQuery();
                //Close The Connection  
                connection.Close();
                if (count == 1)
                {
                    Clear();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Record added successfully')", true);
                    //call the method to bind the grid  
                    BindGridData();
                }

            }
            catch (Exception ex)
            {
                string s = ex.Message;
                if (s.Contains("s"))
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Id is available')", true);
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Error')", true);
            }
        }
       /* private void clearCall()
        {
            //BindGridData();  
            txtID.Text = string.Empty;
            txtMName.Text = string.Empty;
            txtMB.Text = string.Empty;
            txtMN.Text = string.Empty;
            txtAM.Text = string.Empty;
        }*/
        private void Clear()
        {
            foreach (Control b in feedback.Controls) //feedback is division

            {
                TextBox c;
                if (b is TextBox)
                {
                    c = b as TextBox;
                    if (c != null)
                    {
                        c.Text = String.Empty;

                        // or we can use

                        c.Text = "";
                    }
                }
            }
        }
        protected void btnFind_Click(object sender, EventArgs e)
        {
            btnDelete.Visible = true;
            btnupdate.Visible = true;
            cmd = new SqlCommand("Select * from Machine_Details where Id=@p1", connection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@p1", txtID.Text);
            connection.Open();
            DR = cmd.ExecuteReader();
            if (DR.Read())
            {
                txtID.Text = DR[0].ToString();
                txtMName.Text = DR[1].ToString();
                txtMB.Text = DR[2].ToString();
                txtMN.Text = DR[3].ToString();
                lblIm.Visible = true;
                byte[] a = (byte[])DR[4];
                lblIm.Text = a.ToString();
                Session["byte"] = a;
                txtAM.Text = DR[5].ToString();
            }
            connection.Close();
          
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string Query = "delete from Machine_Details where Id=@p1";
            cmd = new SqlCommand(Query, connection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@p1", txtID.Text);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            txtID.Text = string.Empty;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Record Deleted successfully')", true);
            Clear();
            BindGridData();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            btnDelete.Visible = false;
            btnupdate.Visible = false;
            lblIm.Text = "";
            lblIm.Visible = false;
            cmd = new SqlCommand("update Machine_Details set Machine_Name=@p1,Manufacturing_By=@p2,Machine_Number=@p3,Image=@p4,Analysis_Maintainance=@p5 where Id=@p6", connection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@p1", txtMName.Text);
            cmd.Parameters.AddWithValue("@p2", txtMB.Text);
            cmd.Parameters.AddWithValue("@p3", txtMN.Text);
            if (fileuploadImage.HasFiles)
            {
                int length = fileuploadImage.PostedFile.ContentLength;
                byte[] imgbyte = new byte[length];
                HttpPostedFile img = fileuploadImage.PostedFile;
                img.InputStream.Read(imgbyte, 0, length);
                cmd.Parameters.Add("@p4", SqlDbType.Image).Value = imgbyte;
            }
            else
            {
                cmd.Parameters.AddWithValue("@p4", Session["byte"]);
            }
            cmd.Parameters.AddWithValue("@p5", txtAM.Text);
            cmd.Parameters.AddWithValue("@p6", txtID.Text);
            connection.Open();
            int k = cmd.ExecuteNonQuery();
            connection.Close();
            if (k == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Update Sucess')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Not Updated')", true);
            }
            Clear();
            BindGridData();
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
            Session["c"] = null;
        }
    }
}