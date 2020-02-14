function sayHello(persion: string) {
    return 'hello ' + persion;
}

let user = 'tom';
console.log(sayHello(user));

let s: string | number
s = 10
s = '222'
console.log(s)

interface Persion {
    readonly id?: number;
    name: string;
    age?: number;
    [propName: string]: any;
}

let tom: Persion = {
    name: 'tom',
    age: 20
}

console.log(tom)

let jack: Persion = {
    name: 'jack'
}

console.log(jack)

let tony: Persion = {
    name: 'tony',
    age: 20,
    test: '222'
}

console.log(tony)

let x: Persion = {
    name: 'x',
    age: 20,
    id: 111
}
// x.id = 3
console.log(x)

let a: number[] = [2,3,4,4]
console.log(a)

let b: Array<number> = [2,3,42,2]
console.log(b)

let c: Array<string> = ['2', '222']
console.log(c)

let d: string[] = ['t', 'ss']
console.log(d)
declare let Jquery: (selector: string) => any;
Jquery('.aaa').s
