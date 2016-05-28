### Summary

Like [langton's ant](https://github.com/forsythe/langtons-ant), but with multiple colors and states. ![demo](https://i.gyazo.com/023e79492d360680603d400e3c9d3999.gif)  
Demo movement pattern: `LRRRRRLLR`  

### How it works

The program will ask you for a movement pattern (a string of  `L`'s and `R`'s):   
If the first letter of your movement pattern is an `L`, it will move left on the first color. If the second letter of your movement pattern is an `R`, the termite will move right on the second color, etc. The colors are randomly generated, with the exception of the first color, which remains black.  


### Customizable options  
`delay`: Milliseconds between each ant move  
`randDir`: Whether or not to initialize ants with a random direction  
`cellSize`: Size of each grid in pixels  

### Controls  
`Click`: Add termite  
`Spacebar`: Toggle pause (also displays step number)  
`R`: Reset
