// MySQL Connection
const mysql = require("mysql");
// MySQL Connection Configuration
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "nodemysql"
});
db.connect(err => {
  if (err) throw err;
  console.log("Connected!");
});

//  ---------------- routing ----------------
const express = require("express");
app = express();

// Get Suppliers
app.get("/suppliers", (req, res) => {
  // Tested
  console.log("GET suppliers");
  let sql = "SELECT * FROM nodemysql.Suppliers";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// Get Shipping
app.get("/shipping", (req, res) => {
  // Tested
  console.log("GET Shipping");
  let sql = "SELECT * FROM nodemysql.Shipping";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// Get Products
app.get("/products", (req, res) => {
  // Tested
  console.log("GET products");
  let sql = "SELECT * FROM nodemysql.Products";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// Get Orders
app.get("/orders", (req, res) => {
  // Tested
  console.log("GET orders");
  let sql = "SELECT * FROM nodemysql.Orders";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// Get Customers
app.get("/customers", (req, res) => {
  // Tested
  console.log("GET orders");
  let sql = "SELECT * FROM nodemysql.Customers";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.get("/categories", (req, res) => {
  // Tested
  console.log("GET categories");
  let sql = "SELECT * FROM nodemysql.Categories";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// VIEWS
// View 1
app.get("/view1", (req, res) => {
  console.log("GET view1");
  let sql =
    "SELECT CustomerName, BillingAddress, OrderTotal, OrderDate, ShipDate from Customers c INNER JOIN Orders o ON c.Customer_ID = o.Customer_ID INNER JOIN Shipping s ON o.ORDER_ID = s.ORDER_ID;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 2
app.get("/view2", (req, res) => {
  console.log("GET view2");
  let sql =
    "SELECT avg(Price) FROM Products WHERE Product_ID = ANY(SELECT Product_ID FROM Carts WHERE Quantity < 3) GROUP BY Category_ID;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 3
app.get("/view3", (req, res) => {
  console.log("GET view3");
  let sql =
    "SELECT p1.ProductName, p1.Price, p1.Category_ID FROM Products AS p1 WHERE p1.Price = (SELECT MAX(p2.PRICE) FROM Products AS p2 WHERE p2.Category_ID = p1.Category_ID);";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});
// View 4
app.get("/view4", (req, res) => {
  console.log("GET view4");
  let sql =
    "SELECT c.CustomerName, c.CustomerContact, o.OrderTotal, o.OrderDate FROM Customers c FULL JOIN Orders o ON c.Customer_ID = o.Customer_ID;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 5
app.get("/view5", (req, res) => {
  console.log("GET view5");
  let sql =
    "SELECT Product_ID FROM Carts WHERE Quantity > 1 UNION SELECT Product_ID FROM Products WHERE Price < 200 ORDER BY Product_ID;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 6
app.get("/view6", (req, res) => {
  console.log("GET view6");
  let sql = "SELECT avg(Price) FROM Products;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 7
app.get("/view7", (req, res) => {
  console.log("GET view7");
  let sql =
    "SELECT CustomerName from Customers c INNER JOIN Orders o ON c.Customer_ID = o.Customer_ID AND o.OrderTotal > 100;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 8
app.get("/view8", (req, res) => {
  console.log("GET view8");
  let sql = "SELECT avg(OrderTotal) FROM Orders;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 10
app.get("/view10", (req, res) => {
  console.log("GET view10");
  let sql =
    "SELECT avg(Price) as Average_Price_Per_Category FROM Products GROUP BY Category_ID;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// View 11
app.get("/view11", (req, res) => {
  console.log("GET view11");
  let sql =
    "SELECT ProductName, Price FROM Products WHERE Product_ID = ANY(SELECT Product_ID FROM Carts WHERE Quantity < 3)";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// STOCKS
// POST favourite stock
app.post("/symbol/:symbol", (req, res) => {
  console.log("POST request for symbol: " + req.params.symbol);
  let sql =
    "INSERT INTO `nodemysql`.`symbols` (`symbol`) VALUES ('" +
    req.params.symbol +
    "');";
  db.query(sql, (err, result) => {
    if (err) {
      res.status(400);
      res.send("Something went wrong with the SQL query");
      throw err;
    }
    res.sendStatus(200);
    console.log(sql);
  });
});

// GET Favourite Stocks
app.get("/favourites", (req, res) => {
  console.log("GET favourite stocks ");
  let sql = "SELECT * FROM nodemysql.symbols;";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// DELETE favoutire stocks
app.get("/favourites/delete/:symbol", (req, res) => {
  console.log("Delete favourite stocks");
  let sql =
    "DELETE FROM nodemysql.symbols WHERE symbol='" + req.params.symbol + "'; ";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

app.listen("3000", () => {
  console.log("Now listening on port 3000");
});
