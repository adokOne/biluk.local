<?php

$config['_default'] = "main/index";
$config['contacts'] = "pages/contacts";
$config["contacts/send"] = "pages/send";
$config["problems"] = "main/problems";

$config["about"] = "pages/about";

$config["news"] = "news/index";
$config["news/(.*)"] = "news/index/$1";

$config["pages/(.*)"] = "pages/index/$1";
$config["problem/(\d)"] = "pages/problem/$1";


?>
