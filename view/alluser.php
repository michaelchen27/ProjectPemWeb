<?php
include 'controller/getLoggedInData.php';

$query = 'SELECT * FROM user WHERE NOT username = "' . $_SESSION['user']->getusername() . '" ';
$result = $conn->query($query);
$results = array();

foreach ($result as $row) array_push($results, new User(
    $row['username'],
    $row['firstName'],
    $row['lastName'],
    $row['password'],
    $row['bdate'],
    $row['gender'],
    $row['coverPath'],
    $row['profilePicturePath'],
    $row['contact'],
    $row['userdesc'],
    $row['phonenum']
));


?>

<!DOCTYPE html>
<html>

<head>
    <title>Discover other user</title>

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Pacifico|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/profileStyle.css">
    <link rel="stylesheet" href="css/footer.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.1/css/mdb.min.css" rel="stylesheet">
    <style>
    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        max-width: 300px;
        text-align: center;
        font-family: arial;
    }

    .title {
        color: grey;
        font-size: 18px;
    }

    button {
        border: none;
        outline: 0;
        display: inline-block;
        padding: 8px;
        color: white;
        background-color: #000;
        text-align: center;
        cursor: pointer;
        width: 100%;
        font-size: 18px;
    }

    a {
        text-decoration: none;
        font-size: 22px;
        color: black;
    }

    button:hover,
    a:hover {
        opacity: 0.7;
    }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark"
        style="background: linear-gradient(to right, #0062E6, #33AEFF)">
        <a class="navbar-brand" href="index.php" style="font-family: 'Pacifico', cursive; font-size:25px">Xpress
            Yourself</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
            aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <form method="post">
                        <input type="hidden" name="loc" value="home.php">
                        <button class="btn btn-link p-0" type="submit" style="color:white">Home <span
                                class="sr-only">(current)</span></button>
                    </form>
                </li>
            </ul>
            <form method="POST" class="form-inline my-2 my-lg-0">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link" data-toggle="dropdown">
                            <img src="<?= $loginUser->getprofilePicturePath() ?>" alt="Photo Avatar" id="profileavatar"
                                class="avatar">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right animate slideIn">
                            <a href="index.php" class="dropdown-item">Signed in as
                                <br><strong><?= $loginUser->getusername() ?></strong></a>
                            <div class="dropdown-divider"></div>
                            <form method="POST">
                                <button type="submit" name="loc" value="profile.php" class="dropdown-item">My
                                    Profile</button>
                                <!-- ini gimana maksudnya? -->
                            </form>
                            <div class="dropdown-divider"></div>
                            <form method="POST">
                                <button type="submit" name="do" value="logout.php" class="dropdown-item">Logout</button>
                                <input type="hidden" name="loc" value="login.php">
                            </form>
                        </div>
                    </li>
                </ul>
            </form>
        </div>
    </nav>

    <div class="container pt-5">
        <div class="row">
            <?php foreach ($results as $row) : ?>
            <div class="col-md-3">
                <div class="card" style="height: 120%;position:relative">
                    <div class="container pb-3 pt-3">
                        <div class="view overlay">
                            <img src="<?= $row->profilePicturePath ?>" style="width:200px; height:200px">
                            <div class="mask flex-center rgba-blue-light">
                                <form method="POST">
                                    <button class="btn btn-link" name="loc" value="profile.php">
                                        <h3 class="white-text">View Profile</h3>
                                        <input type="hidden" name="username" value="<?= $row->username ?>">
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <h1><?= $row->firstName . " " . $row->lastName ?></h1>
                    <p class="title" style="position: absolute;bottom:0;left:42%"><?= $row->username ?></p>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>