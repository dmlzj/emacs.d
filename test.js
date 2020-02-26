function a() {
  this.a = '11';
}

let t = a;

console.log(t.a);
setTimeout(() => {
  console.log('test');
}, 1000);
