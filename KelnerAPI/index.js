require("dotenv").config();
const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

/*
Available endpoints:
- http://localhost:5000/article/        
- http://localhost:5000/Show/Orders        
- http://localhost:5000/tables/order/        
- http://localhost:5000/article/        
- http://localhost:5000/article/1       
- http://localhost:5000/article/ingredients/1    
- http://localhost:5000/article/allergies/2   
- http://localhost:5000/category
- http://localhost:5000/Orders                
*/

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "Kelner",
});

db.connect((err) => {
  if (err) {
    console.error("Database connection failed: ", err);
  } else {
    console.log("Connected to MySQL");
  }
});

app.get("/", (req, res) => {
  res.send("Node.js API with WAMP is Running!");
});

app.get("/article/:id", (req, res) => {
  const userId = req.params.id;
  db.query("SELECT * FROM article WHERE id=?", [userId], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(result);
    }
  });
});

app.get("/article/", (req, res) => {
  db.query("SELECT * FROM article", (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(result);
    }
  });
});

app.get("/category", (req, res) => {
  db.query("SELECT id, name FROM category", (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(result);
    }
  });
});

app.get("/category/articles/:id", (req, res) => {
  const aId = req.params.id;
  db.query(
    `SELECT article.id, article.name, article.price, article.weight 
     FROM article 
     JOIN article_category ON article.id = article_category.id_article 
     JOIN category ON article_category.id_category = category.id 
     WHERE category.id = ? OR parent_id = ?`,
    [aId, aId],
    (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(result);
      }
    }
  );
});

app.get("/ac/cp/:id", (req, res) => {
  const cpId = req.params.id;
  db.query(
    `SELECT article.name AS article, category.name AS category 
     FROM article  
     JOIN article_category ON article.id = article_category.id_article 
     JOIN category ON article_category.id_category = category.id 
     WHERE category.parent_id = ?`,
    [cpId],
    (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(result);
      }
    }
  );
});

app.get("/article/ingredients/:id", (req, res) => {
  const cpId = req.params.id;
  db.query(
    `SELECT i.name 
     FROM ingredients AS i
     JOIN article_ingredient AS ai ON i.id = ai.id_ingredient
     WHERE ai.id_article = ?`,
    [cpId],
    (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(result);
      }
    }
  );
});

app.get("/article/allergies/:id", (req, res) => {
  const cpId = req.params.id;
  db.query(
    `SELECT al.name 
     FROM article AS ar
     LEFT JOIN article_ingredient AS ai ON ai.id_article = ar.id
     LEFT JOIN ingredients AS i ON i.id = ai.id_ingredient  
     LEFT JOIN ingredients_allergies AS air ON air.id_ingredient = i.id
     LEFT JOIN allergies AS al ON al.id = air.id_allergie
     WHERE ar.id = ? AND al.name IS NOT NULL`,
    [cpId],
    (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(result);
      }
    }
  );
});

app.post("/Orders", (req, res) => {
  const { id_table, id_article } = req.body;
  const sql = "INSERT INTO orders (id_table, id_article) VALUES (?, ?)";
  const values = [id_table, id_article];

  db.query(sql, values, (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.status(201).json({ message: "Order added" });
  });
});

app.get("/Show/Orders", (req, res) => {
  db.query(
    `SELECT o.id AS OrderID, t.id AS TableId, a.name AS Name, a.price, a.weight 
     FROM orders AS o
     JOIN article AS a ON a.id = o.id_article
     LEFT JOIN ttable AS t ON t.id = o.id_table`,
    (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(result);
      }
    }
  );
});

app.delete("/tables/order/:id", (req, res) => {
  const orderId = req.params.id;
  db.query("DELETE FROM orders WHERE id = ?", [orderId], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(result);
    }
  });
});

const PORT = process.env.PORT || 5000;
const HOST = "0.0.0.0";

app.listen(PORT, HOST, () => {
  console.log(`Server running at http://${HOST}:${PORT}`);
});