<%
    String mess = "";
    mess = String.valueOf(request.getAttribute("message"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bonjour</title>
</head>
<body>
    <center>
        <h1><%=mess %></h1>
    </center>
</body>
</html>