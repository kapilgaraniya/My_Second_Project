using System;
using System.Collections;
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
using System.Data.SqlClient;
using System.Data.SqlClient;


public partial class Admin_Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["welcome"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "SELECT UserId, Email, Password FROM [User]WHERE UserType = 'Admin' ";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                SqlDataReader reader = cmd.ExecuteReader();
                GridViewUsers.DataSource = reader;
                GridViewUsers.DataBind();
            }
        }
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        string email = TextBoxEmail.Text.Trim();
        string password = TextBoxPassword.Text.Trim();

        if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
        {
            AddUserToDatabase(email, password);
            BindGridView();
            TextBoxEmail.Text = "";
            TextBoxPassword.Text = "";
        }
        else
        {
            // Handle the case when email or password is empty
            // You can display an error message or take appropriate action
        }
    }

    private void AddUserToDatabase(string email, string password)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "INSERT INTO [User] (Email, Password,UserType) VALUES (@Email, @Password,'Admin') ";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.ExecuteNonQuery();
            }
        }
    }

    protected void GridViewUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridViewUsers.EditIndex = e.NewEditIndex;
        BindGridView();
    }

    protected void GridViewUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridViewUsers.EditIndex = -1;
        BindGridView();
    }

    protected void GridViewUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewUsers.Rows[e.RowIndex];
        int userId = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value);

        TextBox txtEmail = (TextBox)row.FindControl("TextBoxEmail_Edit");
        TextBox txtPassword = (TextBox)row.FindControl("TextBoxPassword_Edit");

        if (txtEmail != null && txtPassword != null)
        {
            UpdateUserInDatabase(userId, txtEmail.Text, txtPassword.Text);
            GridViewUsers.EditIndex = -1;
            BindGridView();
        }
    }

    private void UpdateUserInDatabase(int userId, string email, string password)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "UPDATE [User] SET Email = @Email, Password = @Password WHERE UserId = @UserId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.ExecuteNonQuery();
            }
        }
    }

    protected void GridViewUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int rowIndex = e.RowIndex;

        if (GridViewUsers.DataKeys != null && rowIndex >= 0 && rowIndex < GridViewUsers.Rows.Count)
        {
            int userId = Convert.ToInt32(GridViewUsers.DataKeys[rowIndex].Value);
            DeleteUserFromDatabase(userId);
            BindGridView();
        }
    }

    private void DeleteUserFromDatabase(int userId)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "DELETE FROM [User] WHERE UserId = @UserId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
