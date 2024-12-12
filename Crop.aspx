<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Crop.aspx.cs" Inherits="Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .input-group {
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
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
    <div class="input-group">
        <br />
        <asp:Label ID="Label1" runat="server" Text="CROP"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" 
            ontextchanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Add Crop" OnClick="Button1_Click" />
    </div>

    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" DataKeyNames="CropId" 
        OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowUpdating="GridView1_RowUpdating" 
        OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" 
        CellPadding="4" Height="246px" Width="475px" HorizontalAlign="Center" 
        ForeColor="#333333" GridLines="None">
        <Columns>
            <asp:BoundField DataField="CropId" HeaderText="Crop ID" ReadOnly="True" />
            <asp:TemplateField HeaderText="Crop Name">
                <ItemTemplate>
                    <asp:Label ID="lblCropName" runat="server" Text='<%# Bind("CropName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCropName" runat="server" Text='<%# Bind("CropName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" HeaderText="Actions" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
