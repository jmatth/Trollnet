<?php

$ext = strtolower(end(explode(".", $i)));

if ($ext == 'jpg' || $ext == 'jpeg') {
  header('Content-type: image/jpeg'); 
  $im = imagecreatefromjpeg($i);
}

if ($ext == 'png') {
  header('Content-type: image/png'); 
  $im = imagecreatefrompng($i);
}

if ($ext == 'gif') {
  header('Content-type: image/gif'); 
  $im = imagecreatefromgif($i);
}

$images = glob("./*.png");
$imnum = rand(0, count($images) - 1);

$cat = imagecreatefrompng($images[$imnum]);

$src_width = imagesx($im);
$src_height = imagesy($im);

$cat_width = imagesx($cat);
$cat_height = imagesy($cat);

if ($src_width > $cat_width and $src_height > $cat_height) {

  $random = rand(0, 3);

  $dest_x = rand(0, $src_width - $cat_width);
  $dest_y = rand(0, $src_height - $cat_height);

  switch ($random) {
    case 0:
      imagecopy($im, $cat, $dest_x, $src_height - $cat_height, 0, 0, $cat_width, $cat_height);
    break;

    case 1:
      $new_cat = imagerotate($cat, 180, 0);
      imagecopy($im, $new_cat, $dest_x, 0, 0, 0, $cat_width, $cat_height);
    break;

    case 2:
      $new_cat = imagerotate($cat, 90, 0);
      imagecopy($im, $new_cat, $src_width - $cat_height, $dest_y, 0, 0, $cat_height, $cat_width);
    break;

    case 3:
      $new_cat = imagerotate($cat, 270, 0);
      imagecopy($im, $new_cat, 0, $dest_y, 0, 0, $cat_height, $cat_width);
    break;
  }

}

if ($ext == 'png') imagepng($im);
if ($ext == 'gif') imagegif($im);
if ($ext == 'jpg' || $ext == 'jpeg') imagepng($im);
