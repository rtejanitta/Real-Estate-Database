<!DOCTYPE html>
<html>
    <head><h1>Search Results</h1></head>
    <br>
    <style>
        table{ background-color: burlywood;                                                                
               border: black;}
        td {padding: 5px;
            text-align: center;}
        h1 {color: cornflowerblue;
            font-family:Georgia, 'Times New Roman', Times, serif;
            font-size: 42px;
            text-align: center;}
        h3 {text-align: center;}
        body {background-color: beige;}
        form {text-align: center;}
        .center {
            margin-left: auto;
            margin-right: auto;}
    </style> 
    <body> 

        <?php

            if ( !( $database = mysqli_connect( "localhost","root", "" ) ) )          #Connecting to Database            
                die( "Could not connect to database </body></html>" );

            if ( !mysqli_select_db($database, "real_estate" ) )
                die( "Could not open products database </body></html>" );


            if (array_key_exists('1', $_POST)) {                                                           #Displays Listings

                $query1 = "SELECT L.mlsNumber, L.addr, A.a_name, L.DateListed, H.bedrooms, H.bathrooms, H.h_size, P.price
                           FROM Listings L, Agent A, Property P, House H
                           WHERE L.addr = P.addr AND L.agentId = A.agentId AND H.addr = L.addr";
                $query2 = "SELECT L.mlsNumber, L.addr, A.a_name, L.DateListed, B.p_type, B.p_size, P.price
                           FROM Listings L, Agent A, Property P, BusinessProperty B
                           WHERE L.addr = P.addr AND L.agentId = A.agentId AND B.addr = L.addr";
                         
                if ( !( $result1 = mysqli_query( $database, $query1 ))){
                    print( "<p>Could not execute query!</p>" );
                    die( mysql_error() . "</body></html>" );
                }

                else {

                    print("<h3>Houses:</h3>");
                    print("<table class = \"center\">");
                    
                    $fields = mysqli_fetch_fields($result1);

                    print("<tr>");
                    foreach ($fields as $field)
                        print("<th>$field->name</th>");
                    print("</tr>");

                    while ( $row = mysqli_fetch_row($result1)) {
                        print("<tr>");
                        foreach ($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                    
                    print("</table>");
                }   

                print("<br>");

                if (!( $result2 = mysqli_query( $database, $query2 ) ) ){
                    print( "<p>Could not execute query!</p>" );
                    die( mysql_error() . "</body></html>" );
                }

                else {

                    print("<h3>Business Properties:</h3>");
                    print("<table class = \"center\">");

                    $fields = mysqli_fetch_fields($result2);

                    print("<tr>");
                    foreach ($fields as $field)
                        print("<th>$field->name</th>");
                    print("</tr>");
                    
                    while ( $row = mysqli_fetch_row($result2)) {
                        print("<tr>");
                        foreach ($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                    
                    print("</table>");
                }   


            }

            if (array_key_exists('bedrooms', $_POST)) {                                                     #Displays Houses to user spec 


                $query = "SELECT L.mlsNumber, H.addr, H.h_size, Pr.price
                          FROM Listings L, House H, Property Pr
                          WHERE H.addr = Pr.addr AND H.addr = L.addr AND H.bedrooms = " . $_POST["bedrooms"] .
                        " AND H.bathrooms = " . $_POST["bathrooms"] . " AND Pr.price >= " . $_POST["minPrice"] . 
                        " AND Pr.price <= " . $_POST["maxPrice"];
                       
                if ( !( $result = mysqli_query( $database, $query ))) {
                    print( "<p>Could not execute query!</p>" );
                    die( mysql_error() . "</body></html>" );
                }

                if ($result) {

                    print("<h3>Matching Houses:</h3>");
                    print("<table class = \"center\">");

                    $fields = mysqli_fetch_fields($result);

                    print("<tr>");
                    foreach ($fields as $field)
                        print("<th>$field->name</th>");
                    print("</tr>");
                    
                    while ( $row = mysqli_fetch_row($result)) {
                        print("<tr>");
                        foreach ($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                    
                    print("</table>");
                }   


            }

            if (array_key_exists('minSize', $_POST)) {                                                         #Displays Business Properties to user spec

                $query = "SELECT L.mlsNumber, B.addr, B.p_type, B.p_size, P.price
                          FROM Listings L, BusinessProperty B, Property P
                          WHERE B.addr = P.addr AND B.addr = L.addr AND P.price >= " . $_POST["minPrice"] .
                              " AND P.price <= " . $_POST["maxPrice"] . " AND B.p_size >= " . $_POST["minSize"] . 
                              " AND B.p_size <= " . $_POST["maxSize"];

                if ( !( $result = mysqli_query( $database, $query ))) {
                    print( "<p>Could not execute query!</p>" );
                    die( mysql_error() . "</body></html>" );
                }

                if ($result) {

                    print("<h3>Matching Business Properties:</h3>");
                    print("<table class = \"center\">");
                 
                    $fields = mysqli_fetch_fields($result);

                    print("<tr>");
                    foreach ($fields as $field)
                        print("<th>$field->name</th>");
                    print("</tr>");
                    

                    while ( $row = mysqli_fetch_row($result)) {
                        print("<tr>");
                        foreach ($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                    
                    print("</table>");
                }   

            }

            if (array_key_exists('4', $_POST)){                                                                 #Displays Agents

                $query = "SELECT A.a_name, A.phone, A.dateStarted, F.f_name
                          FROM Agent A, Firm F
                          WHERE A.firmId = F.id";

                if ( !( $result = mysqli_query( $database, $query ))) {
                    print( "<p>Could not execute query!</p>" );
                    die( mysql_error() . "</body></html>" );
                }

                if ($result) {

                    print("<h3>Agents:</h3>");
                    print("<table class = \"center\">");

                    $fields = mysqli_fetch_fields($result);

                    print("<tr>");
                    foreach ($fields as $field)
                        print("<th>$field->name</th>");
                    print("</tr>");
                    
                    while ( $row = mysqli_fetch_row($result)) {
                        print("<tr>");
                        foreach ($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                    
                    print("</table>");
                }   
            }

            if (array_key_exists('5', $_POST)) {                                                                #Displays Buyers

                $query = "SELECT * FROM Buyer ";

                if ( !( $result = mysqli_query( $database, $query ))) {
                    print( "<p>Could not execute query!</p>" );
                    die( mysql_error() . "</body></html>" );
                }

                if ($result) {

                    print("<h3>Buyers:</h3>");
                    print("<table class = \"center\">");

                    $fields = mysqli_fetch_fields($result);

                    print("<tr>");
                    foreach ($fields as $field)
                        print("<th>$field->name</th>");
                    print("</tr>");
                    
                    while ( $row = mysqli_fetch_row($result)) {
                        print("<tr>");
                        foreach ($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                    
                    print("</table>");
                }   
            }

            if (array_key_exists('user_query', $_POST)) {                                                       #Displays Result of Custom Query

                $query = $_POST["user_query"];

                if ( !( $result = mysqli_query( $database, $query ))) {
                    print( "<p>Could not execute query!</p>" );
                    die( mysql_error() . "</body></html>" );
                }

                if ($result) {

                    print("<table class = \"center\">");

                    $fields = mysqli_fetch_fields($result);

                    print("<tr>");
                    foreach ($fields as $field)
                        print("<th>$field->name</th>");
                    print("</tr>");
                    
                    while ( $row = mysqli_fetch_row($result)) {
                        print("<tr>");
                        foreach ($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                    
                    print("</table>");
                }   
            }

            mysqli_close(($database));
        ?>
    </body>
</html>