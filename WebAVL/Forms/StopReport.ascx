﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StopReport.ascx.cs" Inherits="WebAVL.Forms.JStopReport" %>


<%@ Register Assembly="WebControllers" Namespace="WebControllers.MainControls.Grid" TagPrefix="cc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/WebControllers/MainControls/Date/JDateControl.ascx" TagPrefix="uc1" TagName="JDateControl" %>
<%@ Register Src="~/WebAVL/Controls/Search/JSearchDevice.ascx" TagPrefix="cc1" TagName="JSearchDevice" %>


<div class="BigTitle">گزارش توقف ها</div>
<table style="width: 500px">
    <tr class="Table_RowB">
        <td style="width: 150px">متحرک:</td>
        <td>
           <cc1:JSearchDevice runat="server" ID="searchDevice" MultipleSselection="false"></cc1:JSearchDevice>

        </td>
    </tr>
    <tr class="Table_RowB">
        <td style="width: 150px">تاریخ:</td>
        <td>
            <uc1:JDateControl runat="server" id="dcDate" />
        </td>
    </tr>
</table>
<telerik:RadButton runat="server" ID="btnSave" Text="مشاهده گزارش" AutoPostBack="true" Width="100px" Height="35px" OnClick="btnSave_Click" />
<telerik:RadButton runat="server" ID="btnClose" Text="بازگشت" OnClientClicked="CloseDialog" AutoPostBack="false" Width="100px" Height="35px" />
<table style="width: 100%; height: auto; margin-top: 15px">
    <tr>
        <td style="width: 100%; height: auto; overflow: auto">
            <cc1:JGridView runat="server" id="RadGridReport">
            </cc1:JGridView>            
        </td>
    </tr>
</table>
