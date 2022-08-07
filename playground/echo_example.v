module main

import tsp
import tsp.signal

fn main() {
	x := [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

	y := signal.echo<int, f32>(x, [
		signal.EchoParameters{delay: 2, attenuation: 0.8},
		signal.EchoParameters{delay: 4, attenuation: 0.2}
	])

	tsp.print(y, 'y')
}