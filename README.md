# 3160Project
## Overview
<p>  With the threat of the Corona virus, food delivery services are more important than ever.  Local restaurants are eager to find easy ways to have food delivered to customers without having to hire delivery employees. Even when things return to normal, many experts feel that food delivery will be something that we all will have become accustomed to as a part of our regular activites (even more than before). </p>
<p>  Students love food delivery services on campus.  Campuses do not like the steady stream of visitors that may or  may not have a formal connection with the university.  Companies such as UberEats and GrubHub are happy to deliver on campus, but many schools are wondering if they should take control of the delivery and ensure that students and authorized university employees are the only ones delivering food on campus for safety and health reasons. </p>
<h2> Assignment </h2>
<p>Given an existing schema, add a ratings table in order to allow customers using a campus food delivery systems to privide drivers and resturants with ratings.</p>
<h2> Deliverable 1</h2>
<p>Create a github site for the project and a readme with basic information such as group members</p>
<h2><a href="/Deliverable-2">Deliverable 2</a></h2>
<ul>
  <li><h3>Paragraph updating scope of project (introduction, description)</h3>
    <ul>
      <li>
        <p>
          For this project, we are given a Campus Eats model. We need to thoroughly review the model and DB to understand it. Once the model is reviewed, we need to start thinking about how to implement a rating system. Customers need to have the ability to rate restaurants and drivers. A customer should have the ability to rate ONLY the following: The restaurant that they ordered food from and the driver that delivered the food. Customers are NOT required to rate the driver or food, it is optional. Once a rating is submitted it will become public data, meaning anyone will have access to view it. System admins should have the ability to filter, edit, and delete ratings.
        </p>
      </li>
    </ul>  
  </li>
  <li><h3>Create use cases diagram</h3>
    <ul>  
      <li>
        <img src = "/Deliverable-2/Case%20Diagram.PNG"/>
      </li>
    </ul> 
  </li>
  <li><h3>Create Business Rules for the rating system</h3>
    <ul>
      <li>
        <img src = "/Deliverable-2/Business-Rules.PNG"/>
      </li>
    </ul>
  </li>
  <li><h3>Provied picture of EERD for the full database(Fully Normalized)</h3>
    <ul>
      <li>
        <img src = "/Deliverable-2/EERD.PNG"/>
      </li>
    </ul>
  </li>
  <li><h3>Data Dictionary identifying all new tables, primary and foreign keys, attributes, data types and any constraints (ranges for data, etc.)<h3/>
    <ul>
      <li>
        <img src = "/Deliverable-2/DataDictionary.PNG"/>
      </li>
    </ul>
  </li>
</ul>
<h2><a href="/Deliverable-3">Deliverable 3</a></h2>
<ul>
  <li><h3><a href="/Deliverable-3/Tables-And-Test-Data">Tables and Test Data</a></h3></li>
  <li><h3>Data Dictionary identifying all new tables, primary and foreign keys, attributes, data types and any constraints (ranges for data, etc.)<h3/>
    <ul>
      <li>
        <img src = "/Deliverable-3/Relationships.PNG"/>
      </li>
    </ul>
  </li>
  <li><h3>EERD<h3/>
    <ul>
      <li>
        <img src = "/Deliverable-3/EERD.PNG"/>
      </li>
    </ul>
  </li>
  <li><h3><a href="/Deliverable-3/Dump-Deliverable3">SQL Dump Files</a><h3/></li>
  <li><h3>SQL Queries<h3/>
    <ul>
      <li>
        <img src = "/Deliverable-3/Queries/All-Ratings-Driver.PNG"/><br><br>
      </li><br>
      <li>
        <img src = "/Deliverable-3/Queries/All-Ratings-Restaurant.PNG"/><br><br>
      </li><br>
      <li>
        <img src = "/Deliverable-3/Queries/All-Ratings.PNG"/><br><br>
      </li>
    </ul>
  </li> 
</ul>

<h2><a href="/Deliverable-4">Deliverable 4</a></h2>
<ul>
  <li><h3><a href="/Deliverable-4/queries/All-SQL-Queries-and-Procedures.sql">All Queries</a><h3/></li>
  <li><h3>Complex Queries<h3/>
    <ul>
      <li>
        <img src = "/Deliverable-4/queries/ComplexQuery-All-Drivers-With-AVGRatings.PNG"/><br><br>
      </li>
      <li>
        <img src = "/Deliverable-4/queries/All-Ratings-RestaurantAndDriver.PNG"/><br><br>
      </li>
      <li>
        <img src = "/Deliverable-4/queries/ComplexQuery-AllRecipts.PNG"/>
      </li>
    </ul>
  </li>
  <li><h3>Stored Procedures<h3/>
    <ul>
      <li>
        <img src = "/Deliverable-4/procedures/All_Ratings_for_Particular_Restaurant.PNG"/><br><br>
      </li>
      <li>
        <img src = "/Deliverable-4/procedures/Rating_For_Particular_Driver.PNG"/><br><br>
      </li>
      <li>
        <img src = "/Deliverable-4/procedures/Ratings_For_All_Drivers.PNG"/><br><br>
      </li>
      <li>
        <img src = "/Deliverable-4/procedures/Ratings_For_All_Restaurants.PNG"/><br><br>
      </li>
      <li>
        <img src = "/Deliverable-4/procedures/Recipt_Procedure.PNG"/>
      </li>
    </ul>
  </li>
  <li><h3>Query Optimization<h3/>
    <ul>
      <li>
        <img src = "/Deliverable-4/Query-Performance.PNG"/>
      </li>
    </ul>
  </li>
  <li><h3><a href="/Deliverable-4/SQL-Dump">SQL Dump Files</a><h3/></li> 
</ul>
