<?php
session_start();

$host = "localhost";
$user = "root";
$pass = "";
$db = "user";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    $sql = "SELECT * FROM user WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($userData = $result->fetch_assoc()) {
        if ($userData['password'] === $password) {
            $_SESSION['username'] = $username;
            $_SESSION['saldo'] = $userData['saldo'];
            header("Location: listGame.php");
            exit();
        } else {
            $error = "Password salah.";
        }
    } else {
        $error = "Akun tidak ditemukan. Silakan buat akun terlebih dahulu.";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Login Pengguna</h2>
    <?php if (!empty($error)): ?>
        <div class="alert alert-danger"><?= $error ?></div>
    <?php endif; ?>
    <form action="loginuser.php" method="POST">
        <div class="mb-3">
            <label>Username:</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Password:</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
        <a href="create.php" class="btn btn-secondary">Buat Akun</a>
    </form>
</div>
</body>
</html>
