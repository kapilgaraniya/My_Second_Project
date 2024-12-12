<%@ Page Language="C#" MasterPageFile="~/User/Index.master" AutoEventWireup="true" CodeFile="Announcement.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
h2{
  text-align:center;     
 }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                      <br />
                      <br />
 
                                        
    <h2>&nbsp;</h2>
                      <h2>&nbsp;</h2>
                      <h2>Announcements</h2>
    
    <asp:GridView ID="GridViewAnnouncements" runat="server" 
           AutoGenerateColumns="False" DataKeyNames="AnnouncementId" CellPadding="4" 
           ForeColor="#333333" GridLines="None" Height="493px" Width="671px" 
           HorizontalAlign="Center">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:BoundField DataField="AnnouncementId" HeaderText="Announcement ID" SortExpression="AnnouncementId" ReadOnly="True" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Notice" HeaderText="Notice" SortExpression="Notice" />
        </Columns>
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
    </asp:GridView>

</asp:Content>


