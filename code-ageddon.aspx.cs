using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class code_ageddon : System.Web.UI.Page
{
     SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cn1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            int qn = Convert.ToInt32(Session["level"]);
            if (qn == 0)
            {
                HiddenField1.Value = "alpha.png";
            }
            else if (qn == 1)
            {
                HiddenField1.Value = "now.png";
            }
            else if (qn == 2)
            {
                HiddenField1.Value = "freijd.png";
            }
            else if (qn == 3)
            {
                HiddenField1.Value = "sddsd.png";
            }
            else if (qn == 4)
            {
                HiddenField1.Value = "dsfsd.png";
            }
            else if (qn == 5)
            {
                HiddenField1.Value = "dferfx.png";
            }
            else if (qn == 6)
            {
                HiddenField1.Value = "xtdxw.png";
            }
            else if (qn == 7)
            {
                HiddenField1.Value = "they.png";
            }
            else if (qn == 8)
            {
                HiddenField1.Value = "akash.png";
            }
            else if (qn == 9)
            {
                HiddenField1.Value = "tewari.png";
            }
            else if (qn == 10)
            {
                HiddenField1.Value = "11.png";
            }
            else if (qn == 11)
            {
                HiddenField1.Value = "12.png";
            }
            else if (qn == 12)
            {
                HiddenField1.Value = "13.png";
            }
            else if (qn == 13)
            {
                HiddenField1.Value = "14.png";
            }
            else if (qn == 14)
            {
                HiddenField1.Value = "15.png";
            }
            else if (qn == 15)
            {
                HiddenField1.Value = "cs.png";
            }
            
        }
        string a = Request.QueryString["attempt"];
        if (a == "success")
        {
            successAlert.Visible = true;
        }
        if (a == "failure")
        {
            failureAlert.Visible = true;
        }
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
         string query = "SELECT * FROM answers WHERE qnumber = '"+(Convert.ToInt32(Session["level"])+1)+"' and answer= @ans";
         using (con)
         {
             using (SqlCommand command = new SqlCommand(query, con))
             {
                 command.Parameters.AddWithValue("@ans", answertxt.Text);
                 con.Open();
                 SqlDataReader r = command.ExecuteReader();
                 if (r.HasRows)
                 {
                     Session["level"] = Convert.ToInt32(Session["level"]) + 1;
                     con.Close();
                     query = "update registration set no_of_correct_questions='" + Convert.ToInt32(Session["level"]) + "', date= getdate(), time='"+DateTime.Now.TimeOfDay+"' where zealId='" + Session["zealId"].ToString() + "'";
                     SqlCommand cmd = new SqlCommand(query, con);
                     con.Open();
                     cmd.ExecuteNonQuery();
                     con.Close();
                     Response.Redirect("code-ageddon.aspx?attempt=success");
                 }
                 else
                 {
                     Response.Redirect("code-ageddon.aspx?attempt=failure");
                 }
             }
         }
             
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}