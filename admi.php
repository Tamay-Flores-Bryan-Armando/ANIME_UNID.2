<?php

class DatabaseConnection
{
    private $servername;
    private $username;
    private $password;
    private $dbname;
    private $conn;

    public function __construct($servername, $username, $password, $dbname)
    {
        $this->servername = $servername;
        $this->username = $username;
        $this->password = $password;
        $this->dbname = $dbname;
    }

    public function connect()
    {
        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);

        if ($this->conn->connect_error) {
            die("Error de conexión: " . $this->conn->connect_error);
        }
    }

    public function close()
    {
        $this->conn->close();
    }

    public function getConnection()
    {
        return $this->conn;
    }
}

class UserAuthentication
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function authenticateUser($usuario, $contrasena)
    {
        $query = "SELECT * FROM usuarios WHERE correo = '$usuario' AND contrasena = '$contrasena'";
        $result = $this->conn->query($query);

        if ($result->num_rows == 1) {
            header("Location: admin.php");
        } else {
            echo "Usuario o contraseña incorrectos.";
        }
    }
}

session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "anime_unid";

$dbConnection = new DatabaseConnection($servername, $username, $password, $dbname);
$dbConnection->connect();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST["username"];
    $contrasena = $_POST["contrasena"];

    $userAuth = new UserAuthentication($dbConnection->getConnection());
    $userAuth->authenticateUser($usuario, $contrasena);
}

$dbConnection->close();

?>
