class TextService{

  static String checkLength(String data){
    String text = data;
    if(data.length>10){
      text=data.substring(0,10)+"...";
    }
    return text;
  }


}