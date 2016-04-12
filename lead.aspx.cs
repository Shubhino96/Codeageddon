using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lead : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cn1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
        StringBuilder table = new StringBuilder();
        
            string query = "select top 5 name,zealId, no_of_correct_questions,time, date from registration order by no_of_correct_questions desc, time asc";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            table.Append("<table class='table table-striped'>");
            table.Append("<thead class='table table-striped'><th class='center'> Name </th> <th> Zealicon Id </th> <th> Correct Answers </th> </thead>");
            int i = 0;
            string[] name = new string[5];
            string[] zealId = new string[5];
            string[] correctAns = new string[5];
            string[] lastCorrect = new string[5];
            string[] lastDate = new string[5];
            while (sdr.Read())
            {
                name[i] = sdr["name"].ToString();
                zealId[i] = sdr["zealId"].ToString();
                correctAns[i] = sdr["no_of_correct_questions"].ToString();
               
                i++;
            }
            con.Close();
            int j = 0;
            while (j < i)
            {
                table.Append("<tr class='table table-striped'>");
                table.Append("<td>" + name[j] + "</ td >");
                table.Append("<td> " + zealId[j] + "</td>");
                table.Append("<td> " + correctAns[j] + " </td>");
               
                table.Append("</tr>");
                j++;
            }
            table.Append("</table>");
            PlaceHolder2.Controls.Add(new Literal { Text = table.ToString() });
            //Controls.Add(new Literal { Text = table.ToString() });
        
        if (Session["Name"] == null)
        {
            logout.Visible = false;
            login.Visible = true;
        }
        else
        {
            login.Visible = false;
            logout.Visible = true;
        }
        
        
    }
    protected void regButton_Click(object sender, EventArgs e)
    {
        if (loginConfirmPasstxt.Text == Password.Text)
        {
            string query = "insert into registration (name, email, contact, password, zealId, no_of_correct_questions) values('" + regName.Text + "', '" + regEmail.Text + "', '" + regContact.Text + "', '" + Password.Text + "', '" + zealId.Text + "', '0')";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Registration Successfull. Login to continue!')<>");
        }
        else
        {
            Response.Write("<script>alert('Passwords do not match!')</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        {
            string query = "SELECT * FROM registration WHERE email = @email and password= @pass";
            using (con)
            {
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@email", loginEmailtxt.Text);
                    command.Parameters.AddWithValue("@pass", loginPasstxt.Text);
                    con.Open();
                    SqlDataReader r = command.ExecuteReader();
                    if (!r.HasRows)
                    {
                        Response.Write("<script>alert('You have entered a wrong combination of EMAIL and PASSWORD!')</script>");
                    }
                    else
                    {
                        if (r.Read())
                        {
                            Session["Name"] = r["name"].ToString();
                            Session["email"] = r["email"].ToString();
                            Session["zealId"] = r["zealId"].ToString();
                            Session["level"] = r["no_of_correct_questions"].ToString();
                            Response.Redirect("lead.aspx");
                        }
                    }
                }
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }
}