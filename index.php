<!DOCTYPE html>
<html>
<body>

<?php
/******************************/

   class node {
     var $id;
     var $x;
     var $y;

       function node($id,$x,$y){
          $this->x=$x;
          $this->y=$y;
          $this->id=$id;
       }
   };

   class element {
      var $id;
      var $nodeIds;
      var $props;
     function element ($line){
         $this->nodeIds=array();
         $this->id=$line['id'];
       foreach($line as $x=>$x_value){
         if( strchr($x,"n")!=false) {
             array_push($this->nodeIds,$x_value);
           }
       }
    }
};
/******************************/

$width = 750;
$height=750;
$size=3;

    /* Установление соединения с СУБД mySQL, функционирующей на узле mysql_host */
    $link = mysql_connect("localhost", "zhucci", "1234")
        or die("Could not connect : " . mysql_error());
  /*  print "Connected successfully";*/
    echo "<br>";
    /* Выбор БД my_database */
    mysql_select_db("femdb") or die("Could not select database");
    
   $Nodes = array();
   
    /* Выполнение SQL-запроса */
    $nodesQuery = "SELECT id,x,y FROM nodes";
    $elementsQuery = "Select id,n1,n2,n3 from elements"; 
    $result = mysql_query($nodesQuery) or die("Query failed : " . mysql_error());

   
    /* Цикл чтения строк SQL-таблицы в ассоциативный массив */
    while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
      
	$NewNode=new node($line['id'],$line['x'],$line['y']);
         $Nodes+=array($line['id']=>$NewNode);
      /*  array_push($Nodes,$line['id']=>$NewNode);*/
    }
    $result = mysql_query($elementsQuery) or die("Elemetns query is out" . mysql_error());
    $Elements=array();
    while($line = mysql_fetch_array($result,MYSQL_ASSOC)){
       $newElem = new element($line);
        array_push($Elements,$newElem);
    }

    /* Освобождение памяти, занятой результатами выполнения запроса */
    mysql_free_result($result);

    /* Закрытие соединения с СУБД mySQL */
    mysql_close($link);

   $img = @imagecreate($width,$height)
      or die("Cannot Initialize new GD image stream");

   $background_color = imagecolorallocate($img, 255, 255, 255);
   $square_color = imagecolorallocate($img, 0, 0, 0);
   $text_color = imagecolorallocate($img, 233, 14, 91);

     foreach($Nodes as $id=>$femNode){
        $x1=($femNode->x+100)*$size;
        $y1=(-$femNode->y+100)*$size;
        $x2=$x1+3;
        $y2=$y1+3;
         imagefilledrectangle($img,$x1,$y1,$x2,$y2,$square_color);
         
     }
  
 
     foreach($Elements as $fem){
       /*  print "n1= $fem->id=>";*/
       
       $points=array();
      for($i=0;$i<3;$i++){
         $id = $fem->nodeIds[$i];
         $x=(int)($Nodes[$id]->x+101)*$size;
         $y=(int)(-$Nodes[$id]->y+101)*$size;
           array_push($points,$x);
           array_push($points,$y);
        /*  print "--$x,$y";*/
        }
  
        imagepolygon($img,$points,3,$square_color);
      /*  print "<br>";*/
       unset($points);
     }
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    print "Post";
     print "<br>"; 
   /* Get mouse coordinates*/
    $x=$_POST['sub_x'];
    $y=$_POST['sub_y'];
    
  print "Координыты  x= $x,y= $y ";
  print "<br>"; 
  /* Get the nearest node among all */
   $nearNode;
   $maxDelta=300;
    foreach($Nodes as $id=>$femNode){
        $x1=($femNode->x+100)*$size;
        $y1=(-$femNode->y+100)*$size;
         $delta=abs($x-$x1)+abs($y-$y1);
       if($delta<$maxDelta){
            $nearNode=$id;
            $maxDelta=$delta;
        }
     }
      $x1=(int)($Nodes[$nearNode]->x+101)*$size-10;
      $y1=(int)(-$Nodes[$nearNode]->y+101)*$size-10;
       $x2=$x1+20;
      $y2=$y1+20;
  imagerectangle($img,$x1,$y1,$x2,$y2,$text_color);
    print "Node $nearNode ";
 }
 else 
   print "Get";

 print "<br>"; 
 
imagepng($img,"image.png");
imagedestroy($img);
/* 
print "<FORM ACTION='form_proc.php' METHOD='POST'>".
    "Ваше имя: <INPUT TYPE='text' NAME='username'><BR>".
   " <INPUT TYPE='submit'>".
 "</FORM>";*/
print "<FORM ACTION='index.php' method='post'>";
echo "<input type='image' src='image.png' name='sub' alt='Image' style='width:${width}px;height:${height};'>";
print  "</FORM>";
?>
</body>
</html>
