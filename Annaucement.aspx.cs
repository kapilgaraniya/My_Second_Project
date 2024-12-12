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

    private void BindGridView()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "SELECT AnnouncementId, Date, Notice FROM Annoucement Order by AnnouncementId Desc";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                SqlDataReader reader = cmd.ExecuteReader();
                GridViewAnnouncements.DataSource = reader;
                GridViewAnnouncements.DataBind();
            }
        }
    }

    protected void ButtonAddAnnouncement_Click(object sender, EventArgs e)
    {
        string date = TextBoxDate.Text.Trim();
        string notice = TextBoxNotice.Text.Trim();

        if (!string.IsNullOrEmpty(date) && !string.IsNullOrEmpty(notice))
        {
            AddAnnouncementToDatabase(date, notice);
            BindGridView();
            TextBoxDate.Text = "";
            TextBoxNotice.Text = "";
        }
        else
        {

        }
    }

    private void AddAnnouncementToDatabase(string date, string notice)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            
            if (notice.Length <= 1000) 
            {
                string query = "INSERT INTO Annoucement (Date, Notice) VALUES (@Date, @Notice)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@Notice", notice);
                    cmd.ExecuteNonQuery();
                }
            }
            else
            {
                
            }
        }
    }

    protected void GridViewAnnouncements_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int rowIndex = e.RowIndex;

        if (GridViewAnnouncements.DataKeys != null && rowIndex >= 0 && rowIndex < GridViewAnnouncements.Rows.Count)
        {
            int announcementId = Convert.ToInt32(GridViewAnnouncements.DataKeys[rowIndex].Value);
            DeleteAnnouncementFromDatabase(announcementId);
            BindGridView();
        }
    }

    private void DeleteAnnouncementFromDatabase(int announcementId)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "DELETE FROM Annoucement WHERE AnnouncementId = @AnnouncementId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@AnnouncementId", announcementId);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
