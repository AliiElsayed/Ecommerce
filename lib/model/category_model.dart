
class CategoryModel{
  String name , image;

  CategoryModel.fromJson(Map <dynamic,dynamic> categoryData ){
    if(categoryData == null){
      return ;
    }
    name = categoryData['name'];
    image =categoryData['image'];
  }

  toJson(){
    return {
      'name' : name,
      'image' : image,
    };
  }



}