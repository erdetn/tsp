// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module tsp

pub fn version() string {
	return '0.1'
}

pub fn print[T](x []T, name string) {
	for i := 0; i < x.len; i++ {
		println('$name[${u32(i):5}] = ${f64(x[i]):.4f}')
	}
}
