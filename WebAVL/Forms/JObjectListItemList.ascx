﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JObjectListItemList.ascx.cs" Inherits="WebAVL.Forms.JObjectListItemList" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<telerik:RadAjaxManagerProxy runat="server" ID="AjaxManagerProxy_Control">
	<AjaxSettings>
		<telerik:AjaxSetting AjaxControlID="btnSearch">
			<UpdatedControls>
				<telerik:AjaxUpdatedControl ControlID="grdDeviceModel" />
				<telerik:AjaxUpdatedControl ControlID="txtSearch" />
			</UpdatedControls>
		</telerik:AjaxSetting>
	</AjaxSettings>
</telerik:RadAjaxManagerProxy>

<telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
	<script type="text/javascript">
	    function RowDblClick(sender, eventArgs) {
	        var evt = eventArgs.get_domEvent();

	        if (evt.target.tagName == "INPUT" || evt.target.tagName == "A") {
	            return;
	        }

	        var index = eventArgs.get_itemIndexHierarchical();
	        document.getElementById("radGridClickedRowIndex").value = index;
	        document.getElementById("EventType").value = 'GridRowDblClick';

	        sender.get_masterTableView().selectItem(sender.get_masterTableView().get_dataItems()[index].get_element(), true);

	        var ajaxManager = $find("<%=RadAjaxManager.GetCurrent(Page).ClientID %>");
	        ajaxManager.ajaxRequest('');
        }
        function RowClick(sender, eventArgs) {
            var evt = eventArgs.get_domEvent();

            if (evt.target.tagName == "INPUT" || evt.target.tagName == "A") {
                return;
            }

            var index = eventArgs.get_itemIndexHierarchical();
            document.getElementById("radGridClickedRowIndex").value = index;
            document.getElementById("<%=hdnRowId.ClientID%>").value = index;
        }
	</script>
</telerik:RadCodeBlock>

<input type="hidden" id="EventType" name="EventType" />
<input type="hidden" id="radGridClickedRowIndex" name="radGridClickedRowIndex" />
<div style="position: relative; top: 0px; height: 40px; padding: 5px">
	<table>
        <tr>            
            <td>
                کد
            </td>
            <td>
                برچسب
            </td>
        </tr>
		<tr>
			<td>
				<telerik:RadTextBox runat="server" ID="txtCode" Width="100px"></telerik:RadTextBox>
			</td>
            <td>
				<telerik:RadTextBox runat="server" ID="txtLabel" Width="50px"></telerik:RadTextBox>
            </td>
		</tr>
	</table>
</div>
<div style="position: relative; top: 0px; bottom: 0px; height: 200px; overflow-y: auto; overflow-x: hidden">
	<telerik:RadGrid runat="server" ID="grdDeviceModel" AutoGenerateColumns="false" AllowFilteringByColumn="False" Width="100%" ActiveItemStyle-Width="100%"
		AllowSorting="True" GridLines="None">
		<MasterTableView>
			<Columns>
                <telerik:GridBoundColumn UniqueName="Code" DataField="Code" HeaderText="کد" ItemStyle-Width="40px"></telerik:GridBoundColumn>				
				<telerik:GridBoundColumn UniqueName="Label" DataField="Label" HeaderText="برچسب" ItemStyle-Width="100px"></telerik:GridBoundColumn>				
			</Columns>
		</MasterTableView>
		<ClientSettings>
			<ClientEvents OnRowClick="RowClick" />
			<Selecting AllowRowSelect="true"></Selecting>
		</ClientSettings>
	</telerik:RadGrid>
</div>
<div style="position: relative; bottom: 0px; height: 40px;">
	<telerik:RadButton runat="server" ID="btnSelect" Width="80px" Height="30px" Text="انتخاب" OnClick="btnSelect_Click"></telerik:RadButton>
	<asp:HiddenField runat="server" ID="hdnRowId" />
	<%--<asp:TextBox runat="server" ID="hdnRowId" CssClass="hdn1" />--%>
</div>