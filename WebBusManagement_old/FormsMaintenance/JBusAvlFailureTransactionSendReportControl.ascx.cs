﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBusManagement.FormsMaintenance
{
    public partial class JBusAvlFailureTransactionSendReportControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int NumOfDay;
                if (txtNumOfDay.Text != "")
                {
                    if (int.TryParse(txtNumOfDay.Text, out NumOfDay) == true)
                    {
                        GetReport(Convert.ToInt32(txtNumOfDay.Text));
                    }
                }
            }
        }

        public int GmtMintePlus = 210;
        public void GetReport(int NumOfDay = 0)
        {

            string PersianDateNow = ClassLibrary.JDateTime.FarsiDate(DateTime.Now);
            if (Convert.ToInt32(PersianDateNow.Split('/')[2].ToString()) <= 6)
            {
                GmtMintePlus = 270;
            }

            WebControllers.MainControls.Grid.JGridView jGridView = new WebControllers.MainControls.Grid.JGridView("WebBusMaintenance_JBusAvlFailureTransactionSend");
            jGridView.SQL = @"SELECT top 100 percent a.code AS Code,a.BUSNumber,
                                a.LastSimCardCharge,a.LastBatteryCharge,a.LastGpsAntenna,a.LastGsmAntenna
                                ,dateadd(minute," + GmtMintePlus.ToString() + @",a.LastDate)LastDate
                                FROM AUTBus a
                                WHERE a.[Active]=1 and dateadd(minute," + GmtMintePlus.ToString() + @",a.LastDate)
                                not BETWEEN dateadd(day,-" + NumOfDay + @",GETDATE()) AND GETDATE()
                                ORDER BY dateadd(minute," + GmtMintePlus.ToString() + @",a.LastDate)";
            jGridView.SQLType = (int)WebControllers.MainControls.Grid.SQLTypeEnum.Query;
            jGridView.PageSize = 50;
            jGridView.HiddenColumns = "Code";
            jGridView.Title = "JBusAvlFailureTransactionSendReportControl";
            jGridView.Buttons = "excel";
            ((WebControllers.MainControls.Grid.JGridViewControl)RadGridReport).GridView = jGridView;
            ((WebControllers.MainControls.Grid.JGridViewControl)RadGridReport).LoadGrid(true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int NumOfDay;
            if (txtNumOfDay.Text != "")
            {
                if (int.TryParse(txtNumOfDay.Text, out NumOfDay) == true)
                {
                    GetReport(Convert.ToInt32(txtNumOfDay.Text));
                }
                else
                {
                    WebClassLibrary.JWebManager.RunClientScript("alert('لطفا عدد وارد کنید');", "UpdateSettings");
                }
            }
            else
            {
                WebClassLibrary.JWebManager.RunClientScript("alert('لطفا تعداد روز را وارد کنید');", "UpdateSettings");
            }
        }
    }
}