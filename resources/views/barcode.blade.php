<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
    <title>Cross-Browser QRCode generator for Javascript</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/qrcode.js"></script>
    <style>
        #qrcode {
           
        }

    </style>
</head>

<body>

    <center>
        <h1>{{ $user->name }}</h1>
        <h2 style="color:grey">{{ $user->email }}</h2>
    </center>

   <center>
       <div id="qrcode" style="left:50%"></div>
   </center>
    



    <script type="text/javascript">
        var user = {!! $user !!}
        console.log(user)
        new QRCode(document.getElementById("qrcode"), toString(user.id));
    </script>
</body>
