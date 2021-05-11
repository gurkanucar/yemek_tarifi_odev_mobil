class IngredientModel{

  String _name;
  String _count;


  IngredientModel(String name,String count){
    _name=name;
    _count=count;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get count => _count;

  set count(String value) {
    _count = value;
  }
}