<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="xmlsugupuu._Default" %>



<!DOCKTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>xml ja xslt andmete kuvamine</title>

    </head>
    <body>
        <h1>xml ja xslt andmete kuvamine</h1>
        <div>
            <asp:Xml runat="server"
                DocumentSource="~/reisid.xml"
                TransformSource="~/reisidLisa.xslt" />
        </div>
    </body>
</html>
