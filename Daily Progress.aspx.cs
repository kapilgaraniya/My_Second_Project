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


public partial class _Default : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["welcome"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDateDropDown();
            BindGridView();
        }
    }

    private void BindDateDropDown()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string query = "SELECT DISTINCT Date FROM Progress";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownListDates.DataSource = dt;
                DropDownListDates.DataTextField = "Date";
                DropDownListDates.DataValueField = "Date";
                DropDownListDates.DataBind();

                DropDownListDates.Items.Insert(0, new ListItem("Select Date", ""));
            }
        }
    }

    protected void DropDownListDates_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGridView();
    }

    private void BindGridView()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string selectedDate = DropDownListDates.SelectedValue;

            string query = @"
                SELECT
                    CropName,
                    MIN(LowPrice) AS MinPrice,
                    MAX(HighPrice) AS MaxPrice,
                    SUM(Income) AS TotalIncome,
                    SUM(Outgoing) AS TotalOutgoing
                FROM
                    Progress
                WHERE
                    Date = @selectedDate
                GROUP BY
                    CropName;

            ";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@selectedDate", selectedDate);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        BindGridView();
    }
}
