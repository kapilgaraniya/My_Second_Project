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
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string cropName = TextBox1.Text;

        // Process the changed crop name as needed
    }

    private void BindGridView()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "SELECT CropId, Cropname FROM Crop";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string cropName = TextBox1.Text.Trim();

        if (!string.IsNullOrEmpty(cropName))
        {
            AddCropToDatabase(cropName);
            BindGridView();
            TextBox1.Text = ""; 
        }
        else
        {
       
        }
    }

    private void AddCropToDatabase(string cropName)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "INSERT INTO Crop (Cropname) VALUES (@CropName)";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@CropName", cropName);
                cmd.ExecuteNonQuery();
            }
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        if (e.NewEditIndex >= 0 && e.NewEditIndex < GridView1.Rows.Count)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridView();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];

        
        int cropId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

    
        TextBox txtCropName = (TextBox)row.FindControl("TextBox1");

        if (txtCropName != null)
        {
           
            UpdateCropInDatabase(cropId, txtCropName.Text);

            GridView1.EditIndex = -1;
            BindGridView();
        }
    }

    private void UpdateCropInDatabase(int cropId, string cropName)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "UPDATE Crop SET Cropname = @CropName WHERE CropId = @CropId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@CropId", cropId);
                cmd.Parameters.AddWithValue("@CropName", cropName);
                cmd.ExecuteNonQuery();
            }
        }
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int rowIndex = e.RowIndex;

        if (GridView1.DataKeys != null && rowIndex >= 0 && rowIndex < GridView1.Rows.Count)
        {
            int cropId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
            DeleteCropFromDatabase(cropId);
            BindGridView();
        }
    }

    private void DeleteCropFromDatabase(int cropId)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "DELETE FROM Crop WHERE CropId = @CropId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@CropId", cropId);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
