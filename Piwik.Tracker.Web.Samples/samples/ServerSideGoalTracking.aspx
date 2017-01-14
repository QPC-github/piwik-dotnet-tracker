﻿<%--http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later--%>

<%@ Page Language="C#" %>
<%@ Import Namespace="Piwik.Tracker" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>

This page tracks a goal conversion with the Server Side tracking API and displays the response. <br/><br/>

<% 
    PiwikTracker.URL = ConfigurationSettings.AppSettings["PiwikURL"];

    var piwikTracker = new PiwikTracker(1);
    piwikTracker.EnableCookies();

    var attributionInfo = new AttributionInfo();

    attributionInfo.CampaignName = "CAMPAIGN NAME";
    attributionInfo.CampaignKeyword = "CAMPAIGN KEYWORD";
    attributionInfo.ReferrerTimestamp = new DateTime(2011, 04, 08, 23, 48, 24);
    attributionInfo.ReferrerUrl = "http://www.example.org/test/really?q=yes";

    piwikTracker.SetAttributionInfo(attributionInfo);
    
    piwikTracker.SetCustomVariable(1, "custom-variable1", "custom-variable1-value");

    var response = piwikTracker.DoTrackGoal(1, 42.69F);

    this.Response.Write(response.HttpStatusCode);
%>

<br />

<a href="../Default.aspx">Back</a>