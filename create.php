<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "user";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$success = "";
$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $saldo = (int) ($_POST['saldo'] ?? 0);

    if ($saldo < 1000) {
        $error = "Saldo awal minimal Rp 1.000";
    } else {
        // Cek apakah username sudah ada
        $cek = $conn->prepare("SELECT id FROM user WHERE username = ?");
        $cek->bind_param("s", $username);
        $cek->execute();
        $cek->store_result();

        if ($cek->num_rows > 0) {
            $error = "Username sudah digunakan.";
        } else {
            $sql = "INSERT INTO user (username, password, saldo) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssd", $username, $password, $saldo);

            if ($stmt->execute()) {
                $success = "Akun berhasil dibuat. <a href='loginuser.php'>Login sekarang</a>";
            } else {
                $error = "Gagal membuat akun: " . $stmt->error;
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Buat Akun</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Buat Akun Baru</h2>

    <?php if ($error): ?>
        <div class="alert alert-danger"><?= $error ?></div>
    <?php elseif ($success): ?>
        <div class="alert alert-success"><?= $success ?></div>
    <?php endif; ?>

    <form action="create.php" method="POST">
        <div class="mb-3">
            <label>Username:</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Password:</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Saldo Awal (minimal Rp 1.000):</label>
            <input type="number" name="saldo" class="form-control" min="1000" required>
        </div>
        <button type="submit" class="btn btn-success">Buat Akun</button>
    </form>
</div>
</body>
</html>
