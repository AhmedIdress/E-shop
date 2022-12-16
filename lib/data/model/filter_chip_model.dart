class FilterChipModel{
String filterName='';
bool isSelected=false;


FilterChipModel(this.filterName, this.isSelected);


FilterChipModel.fromJson(Map<String,dynamic> map){
  filterName=map['filterName'];
  isSelected=map['isSelected'];
}
Map<String,dynamic> toJson()=>{
  'filterName':filterName,
  'isSelected':isSelected,
};




}