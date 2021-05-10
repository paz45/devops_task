 def get = new URL("https:/0.0.0.0:5000").openConnection();
 def getRC = get.getResponseCode();
 println(getRC);
 if(getRC.equals(200)) {
    println(get.getInputStream().getText());
    println('OK')
}
 else{
 	println('NOT OK')
 	} 