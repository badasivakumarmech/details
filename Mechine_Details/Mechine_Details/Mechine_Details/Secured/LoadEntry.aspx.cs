using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Mechine_Details.Secured
{
    public partial class LoadEntry : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
        SqlCommand cmd;
        DataRow DRow;
        DataSet DS;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridData();
            }
        }
        private void BindGridData()
        {
            SqlCommand command = new SqlCommand("SELECT * from Customer_Details", connection);
            da = new SqlDataAdapter(command);
            DS = new DataSet();
            //DataTable dt = new DataTable();
            da.Fill(DS);
            da.FillSchema(DS,SchemaType.Source);
            //Session["data"] = DS;
            SqlCommandBuilder BL = new SqlCommandBuilder(da);
            DVGloadData.DataSource = DS.Tables[0];
            DVGloadData.DataBind();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                string Query = "insert into Customer_Details values(@p1,@p2,@p3,@p4,@p5)";
                cmd = new SqlCommand(Query, connection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@p1", txtsno.Text);
                cmd.Parameters.AddWithValue("@p2", txtcdetails.Text);
                cmd.Parameters.AddWithValue("@p3", txttnum.Text);
                cmd.Parameters.AddWithValue("@p4", txtload.Text);
                cmd.Parameters.AddWithValue("@p5", txtdate.Text);
                connection.Open();
                int i = cmd.ExecuteNonQuery();
                connection.Close();
                if (i == 1)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Sucess')", true);
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Fail')", true);
                Clear();
                BindGridData();
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
        private void Find()
        {
            int id = Convert.ToInt32(txtsno.Text);
            DRow = DS.Tables[0].Rows.Find(id);
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            // Find();
            // ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Error')", true);
            //DS = (DataSet)Session["data"];
            BindGridData();
            Find();
            txtsno.Text = DRow[0].ToString();
            txtcdetails.Text = DRow[1].ToString();
            txttnum.Text = DRow[2].ToString();
            txtload.Text = DRow[3].ToString();
            txtdate.Text = DRow[4].ToString();
            btnUpdate.Visible = true;
            btnDelete.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            BindGridData();
            Find();
            DRow[1] = txtcdetails.Text;
            DRow[2] = txttnum.Text;
            DRow[3] = txtload.Text;
            DRow[4] = txtdate.Text;
            da.Update(DS);
           
            BindGridData();

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            BindGridData();
            Find();
            DRow.Delete();
            da.Update(DS);
            BindGridData();
            Clear();
        }
    }
}