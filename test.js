function Persion(name, age) {
  this.name = name;
  this.age = age;
};

Persion.prototype.sayName = function(){
  console.log(this.name);
}
var o = new Object();
Persion.call(o, 'dmlzj', 32);
// o.sayName();

var p = new Persion('test', 34);
p.sayName();

console.log(o);
console.log(Persion);
 
