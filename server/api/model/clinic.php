<?php
class Clinic{
 
    // database connection and table name
    private $conn;
    private $table_name = "clinic";
 
    // object properties
    public $id;
    public $name;
    public $address;
    public $maplatitude;
    public $maplongitude;
    public $officehours;
    public $status;
    public $image;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // list clinics
    function get(){
    
        // select all query
        $query = "select clinic as id,name,address,maplatitude,maplongitude,officehours,status,image
                  from clinic";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);
    
        // execute query
        $stmt->execute();
    
        return $stmt;
    }    

    function getById() {
    
        // select all query
        $query = "select clinic as id,name,address,maplatitude,maplongitude,officehours,status,image
                  from clinic
                  where clinic = :id";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // bind id
        $stmt->bindParam(":id",$this->id);
    
        // execute query
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        //Set properties
        $this->id = $row['id'];
        $this->name = $row['name'];
        $this->address = $row['address'];
        $this->maplatitude = $row['maplatitude'];
        $this->maplongitude = $row['maplongitude'];
        $this->officehours = $row['officehours'];
        $this->status = $row['status'];
        $this->image = $row['image'];
    }

    function create() {
    
        // select all query
        $query = "INSERT INTO clinic(name,address,maplatitude,maplongitude,officehours,status,image)
                  VALUES(:name,:address,:maplatitude,:maplongitude,:officehours,:status,:image)";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // clean data
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->address = htmlspecialchars(strip_tags($this->address));
        $this->maplatitude = htmlspecialchars(strip_tags($this->maplatitude));
        $this->maplongitude = htmlspecialchars(strip_tags($this->maplongitude));
        $this->officehours = htmlspecialchars(strip_tags($this->officehours));
        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->image = htmlspecialchars(strip_tags($this->image));

        // bind data
        $stmt->bindParam(":name",$this->name);
        $stmt->bindParam(":address",$this->address);
        $stmt->bindParam(":maplatitude",$this->maplatitude);
        $stmt->bindParam(":maplongitude",$this->maplongitude);
        $stmt->bindParam(":officehours",$this->officehours);
        $stmt->bindParam(":status",$this->status);
        $stmt->bindParam(":image",$this->image);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        // print error if something goes wrong
        printf("Error: %s.\n",$stmt->error);

        return false;
    }    

    function update() {
    
        // select all query
        $query = "UPDATE clinic SET 
                        name = :name,
                        address = :address,
                        maplatitude = :maplatitude,
                        maplongitude = :maplongitude,
                        officehours = :officehours,
                        status = :status,
                        image = :image
                  WHERE clinic = :id";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // clean data
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->address = htmlspecialchars(strip_tags($this->address));
        $this->maplatitude = htmlspecialchars(strip_tags($this->maplatitude));
        $this->maplongitude = htmlspecialchars(strip_tags($this->maplongitude));
        $this->officehours = htmlspecialchars(strip_tags($this->officehours));
        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->image = htmlspecialchars(strip_tags($this->image));

        // bind data
        $stmt->bindParam(":name",$this->name);
        $stmt->bindParam(":address",$this->address);
        $stmt->bindParam(":maplatitude",$this->maplatitude);
        $stmt->bindParam(":maplongitude",$this->maplongitude);
        $stmt->bindParam(":officehours",$this->officehours);
        $stmt->bindParam(":status",$this->status);
        $stmt->bindParam(":image",$this->image);
        $stmt->bindParam(":id",$this->id);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        // print error if something goes wrong
        printf("Error: %s.\n",$stmt->error);

        return false;
    }        

    function delete() {
    
        // select all query
        $query = "DELETE FROM clinic WHERE clinic = :id";
    
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // bind id
        $stmt->bindParam(":id",$this->id);
    
        // execute query
        $stmt->execute();

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        // print error if something goes wrong
        printf("Error: %s.\n",$stmt->error);

        return false;
    }    
}
?>