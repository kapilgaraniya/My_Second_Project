<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Annaucement.aspx.cs" Inherits="Admin_Default" Title="Add Announcement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .center-container {
    text-align: center;
}

.input-group {
    display: inline-block;
    text-align: left;
    margin: 10px;
}

.input-group input[type="text"],
.input-group input[type="password"] {
    width: 200px; 
}

.input-group button {
    width: auto;
    padding: 8px 20px;
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="center-container">
        <div class="input-group">
            <br />
            <asp:Label ID="LabelDate" runat="server" Text="DATE"></asp:Label>
            <asp:TextBox ID="TextBoxDate" runat="server" Width="299px" MaxLength="10"></asp:TextBox>
        </div>
        <br />
        <div class="input-group">
            <br />
            <asp:Label ID="LabelNotice" runat="server" Text="NOTICE"></asp:Label>
            <asp:TextBox ID="TextBoxNotice" runat="server" Height="44px" Width="302px" 
                MaxLength="100"></asp:TextBox>
        </div>
        <br />
        <br />
        <div class="input-group">
            <asp:Button ID="ButtonAddAnnouncement" runat="server" Text="Add Announcement" OnClick="ButtonAddAnnouncement_Click" />
            <br />
        </div>
    </div>

    <asp:GridView ID="GridViewAnnouncements" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="AnnouncementId"
        OnRowDeleting="GridViewAnnouncements_RowDeleting" 
        ShowHeaderWhenEmpty="True" CellPadding="4" Height="344px" 
        Width="754px" HorizontalAlign="Center" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="AnnouncementId" HeaderText="Announcement ID" SortExpression="AnnouncementId" ReadOnly="True" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Notice" HeaderText="Notice" SortExpression="Notice" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
