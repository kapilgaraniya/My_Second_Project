<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .input-group {
            text-align: center;
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
    <br />
    <div class="input-group">
        <br />
        <asp:Label ID="Label1" runat="server" Text="EMAIL"></asp:Label>
        <asp:TextBox ID="TextBoxEmail" runat="server" MaxLength="40"></asp:TextBox>
        <br />
        <br />
    </div>

    <div class="input-group">
        <asp:Label ID="Label2" runat="server" Text="PASSWORD"></asp:Label>
        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" 
            MaxLength="8"></asp:TextBox>
        <br />
        <br />
    </div>

    <div class="input-group">
        <asp:Button ID="ButtonAdd" runat="server" Text="Add User" OnClick="ButtonAdd_Click" />
        <br />
    </div>

    <br /><br />

    <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId"
        OnRowDeleting="GridViewUsers_RowDeleting" OnRowEditing="GridViewUsers_RowEditing"
        OnRowCancelingEdit="GridViewUsers_RowCancelingEdit" 
        OnRowUpdating="GridViewUsers_RowUpdating" CellPadding="4" 
        Height="241px" Width="455px" HorizontalAlign="Center" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="User ID" ReadOnly="true" />
            
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEmail_Edit" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:Label ID="LabelPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxPassword_Edit" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
