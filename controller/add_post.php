<?php
if (isset($_POST['submitPost'])) {
    $content = mysqli_real_escape_string($conn, strip_tags($_POST['post']));
    $username = 'Ricardo';
    $timestamp = date("h:i a");
    $picture = 'https://i.imgur.com/hBEtrB9h.jpg';


    if (!$conn->query('INSERT INTO post (content, username, timestamp, picture) VALUES("' . $content . '", "' . $username . '","' . $timestamp . '", "' . $picture . '");')) {
        echo ("Error description: " . $conn->error);
    }
}
