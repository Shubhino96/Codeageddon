using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cn1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
            Response.Redirect("code-ageddon.aspx");
        }
    }
    protected void regButton_Click(object sender, EventArgs e)
    {
        if (regconfirmPass.Text == regPass.Text)
        {
            string query = "insert into registration (name, email, contact, password, zealId, no_of_correct_questions) values('" + regName.Text + "', '" + regEmail.Text + "', '" + regContact.Text + "', '" + regPass.Text + "', '" + regzealId.Text + "', '0')";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            head.InnerText = "Registration Successful! Login To Continue.";
        }
        else
        {
            Response.Write("<script>alert('Passwords do not match!')</script>");
        }
    }
    protected void loginButton_Click(object sender, EventArgs e)
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
                        Response.Redirect("code-ageddon.aspx");
                    }
                }
            }
        }
    }
}