<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Seance" %>
<%@ include file="include/header.jsp" %>

<body>
    <div class="container-scroller">
        <%@ include file="include/sidebar.jsp" %>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="text-center">RECHERCHE MULTICRITERIA (Seances)</h1>
                                <form action="" method="post">
                                    <input type="hidden" name="action" value="<%= request.getAttribute("film") == null ? "create" : "update" %>">
                                    
                                    <div class="form-group">
                                        <label for="date1">Date :</label>
                                        <input type="date" class="form-control" id="date1" name="date1" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="date2">Date :</label>
                                        <input type="date" class="form-control" id="date2" name="date2" value="">
                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary"></button>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="include/footer.jsp" %>
        </div>
    </div>


</body>
</html>
