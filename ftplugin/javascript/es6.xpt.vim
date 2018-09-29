XPTemplate priority=lang-1

XPT fun " es6 function
const `name^ = () => {
  `cursor^
};

XPT setTimeout " setTimeout\(\() => { .. }, ..)
setTimeout(() => `do what^, `milliseconds^);
`cursor^

XPT () " es6 arrow function
() => {
  `cursor^
}

XPT new " const .. = new ..\(..)
XSET arg*|post=ExpandIfNotEmpty(', ', 'arg*')
const `name^ = new `Constructor^(`arg*^)
`cursor^

XPT class " class es6 skeleton
XSET arg*|post=ExpandIfNotEmpty(', ', 'arg*')
class `name^ {
  constructor(`arg*^) {
    `cursor^
  }
}

XPT cm " class es6 method
`methodName^() {
  `cursor^
}

XPT im "es6 import
import `what^ from `where^;
`cursor^

XPT ex "es6 export
export `default^ `what^

XPT p " es6 promise
new Promise((resolve, reject) => {
  `cursor^
});

