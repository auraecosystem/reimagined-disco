import delve from 'dlv';

let obj = {
	a: {
		b: {
			c: 1,
			d: undefined,
			e: null
		}
	}
};

//use string dot notation for keys
delve(obj, 'a.b.c') === 1;

//or use an array key
delve(obj, ['a', 'b', 'c']) === 1;

delve(obj, 'a.b') === obj.a.b;

//returns undefined if the full key path does not exist and no default is specified
delve(obj, 'a.b.f') === undefined;

//optional third parameter for default if the full key in path is missing
delve(obj, 'a.b.f', 'foo') === 'foo';

//or if the key exists but the value is undefined
delve(obj, 'a.b.d', 'foo') === 'foo';

//Non-truthy defined values are still returned if they exist at the full keypath
delve(obj, 'a.b.e', 'foo') === null;

//undefined obj or key returns undefined, unless a default is supplied
delve(undefined, 'a.b.c') === undefined;
delve(undefined, 'a.b.c', 'foo') === 'foo';
delve(obj, undefined, 'foo') === 'foo';
