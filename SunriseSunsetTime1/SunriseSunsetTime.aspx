
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SunriseSunsetTime.aspx.cs" Inherits="SunriseSunsetTime1.SunriseSunsetTime" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/caret/1.0.0/jquery.caret.min.js"></script>
</head>
<body>
   <form runat="server">
       <div style="text-align: center">
           <label>Latitude : </label>
           &nbsp;
           <input type="text" class="filterme" runat="server" id="txtLatitude" />
           &nbsp
           &nbsp
           &nbsp
           <label>Longitude </label>
           &nbsp;
           <input type="text" class="filterme"
               runat="server" id="txtLongitude" />
           <br />
           <br />
           <asp:Button runat="server" OnClick="btnSubMit_Click"
               ID="btnSubMit" OnClientClick="return validation()" Text="Get Times"></asp:Button>
           <br />
           <br />
           <div style="text-align: center !important">
               <div >
                   <label style="text-align: left">Sun Rise Time : </label>
                   &nbsp;
                   <label runat="server" style="text-align: left" id="lblSunRise"></label>
                   <br />
                   <br />
                   <label style="text-align: left">Sun Set Time : </label>
                   &nbsp;
                   <label runat="server" style="text-align: left" id="lblSunSet"></label>
                   <br />
                   <br />
                   <label id="lblError" runat="server" style="color: red;text-align: left"></label>
               </div>
           </div>
       </div>
   </form>
   <script>
       $('.filterme').keypress(function (eve) {

           if ((eve.which != 46 || $(this).val().indexOf('.') != -1) && (eve.which < 48 || eve.which > 57) || (eve.which == 46 && $(this).caret().start == 0)) {
               eve.preventDefault();
           }

           $('.filterme').keyup(function (eve) {
               if ($(this).val().indexOf('.') == 0) {
                   $(this).val($(this).val().substring(1));
               }
           });
       });

       function validation() {
           var result = $("#txtLatitude").val() != "" && $("#txtLongitude").val() != "";
           $("#lblError")[0].innerText = result ? "" : "please enter valid Values";
           return result;
       }
   </script>
</body>
    </html>