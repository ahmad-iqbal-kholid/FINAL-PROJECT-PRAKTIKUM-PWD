<?php
session_start();

$host = "localhost";
$user = "root";
$pass = "";
$db = "db_admin"; // database khusus admin

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Koneksi ke database admin gagal: " . $conn->connect_error);
}

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    $sql = "SELECT * FROM admin WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($admin = $result->fetch_assoc()) {
        if ($admin['password'] === $password) {
            $_SESSION['admin'] = $username;
            header("Location: pageAdmin.php"); // Ganti dengan dashboard admin jika ada
            exit();
        } else {
            $error = "Password admin salah.";
        }
    } else {
        $error = "Admin tidak ditemukan.";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="main1.css">
</head>
<body>

<div class="card text-center" style="width: 22rem; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
  <div class="card-body">
    <h4 class="card-title mb-3">Login Admin</h4>
    
    <?php if (!empty($error)): ?>
      <div class="alert alert-danger"><?= $error ?></div>
    <?php endif; ?>

    <form method="POST" action="">
        <div class="mb-3">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
        </div>
        <div class="mb-3">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
        </div>
        <button type="submit" class="btn btn-warning w-100">LOGIN</button>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
