<%@ Page Language="C#" MasterPageFile="~/User/Index.master" AutoEventWireup="true" CodeFile="ca.aspx.cs" Inherits="User_Default" Title="Untitled Page" %>

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
    <br />
    <br />
<h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>Commission Agent</h2>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
        Height="286px" Width="601px" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                    <asp:BoundField DataField="Firmname" HeaderText="Firmname" SortExpression="Firmname" />
                    <asp:BoundField DataField="Mobilenumber" HeaderText="Mobilenumber" SortExpression="Mobilenumber" />
                    <asp:BoundField DataField="Shopnumber" HeaderText="Shopnumber" SortExpression="Shopnumber" />
                    <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="imgUser" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px" />
            </ItemTemplate>
        </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#E3EAEB" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
</asp:Content>

