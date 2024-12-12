<%@ Page Language="C#" MasterPageFile="~/User/Index.master" AutoEventWireup="true" CodeFile="Daily Progress.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
 h2{
  text-align:center;     
 }
 .c{
    text-align:center;
  }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <h2>Please Select Date</h2>
    
    <div class="c">
    <asp:DropDownList ID="DropDownListDates" runat="server" AutoPostBack="true" 
        OnSelectedIndexChanged="DropDownListDates_SelectedIndexChanged" 
        ForeColor="#006666">
    </asp:DropDownList>
    </div>
    

    <br />
    <br />
    
<p ALIGN="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Height="272px" 
        Width="474px" HorizontalAlign="Center">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:BoundField DataField="CropName" HeaderText="Crop Name" SortExpression="CropName" />
            <asp:BoundField DataField="MinPrice" HeaderText="Min Price" SortExpression="MinPrice" />
            <asp:BoundField DataField="MaxPrice" HeaderText="Max Price" SortExpression="MaxPrice" />
            <asp:BoundField DataField="TotalIncome" HeaderText="Total Income" SortExpression="TotalIncome" />
            <asp:BoundField DataField="TotalOutgoing" HeaderText="Total Outgoing" SortExpression="TotalOutgoing" />
        </Columns>
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </p>
    <p ALIGN="center">
        &nbsp;</p>
    <p ALIGN="center">
        &nbsp;</p>
    <br />
    <br />
</asp:Content>
