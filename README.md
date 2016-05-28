### Summary

Like [langton's ant](https://github.com/forsythe/langtons-ant), but with multiple colors and states. ![demo](https://i.gyazo.com/023e79492d360680603d400e3c9d3999.gif)  
Demo movement pattern: `LRRRRRLLR`  

### How it works

The program will ask you for a movement pattern (a string of  `L`'s and `R`'s):   
If the first letter of your movement pattern is an `L`, the termite will move left on the first color. If the second letter of your movement pattern is an `R`, the termite will move right on the second color, etc. The colors are randomly generated, with the exception of the first color, which remains black.  


### Customizable options  
`delay`: Milliseconds between each termite move  
`randDir`: Whether or not to initialize termite with a random direction  
`cellSize`: Size of each grid in pixels  

### Controls  
`Click`: Add termite  
`Spacebar`: Toggle pause (also displays step number)  
`R`: Reset  

### Gallery  
![1](https://i.gyazo.com/4944079ff00151bfdc13ac6e084464f3.gif)  
Movement pattern: `RRRRLLLL`  

![2](https://i.gyazo.com/fd137d6e8585e81c486a9529e9ae0a81.gif) 
![2.5](https://i.gyazo.com/6097b8811daeb18cd3ccfa03dac00f8e.gif)  
Movement pattern: `LRRRRRLLR`  

![3](https://i.gyazo.com/a0db2b5a0221d3438955a453cdae2b40.gif)  
Movement pattern: `LRRRLLR`  

![4](https://i.gyazo.com/9c95124116322b8369f01b9b09d5774b.gif)  
Movement pattern: `LLLRLRRRRRRRR`  
