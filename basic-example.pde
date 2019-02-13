//background
strokeWeight(10);
stroke(0, 0, 0);
line(133, 25, 133, 375);
line(266, 25, 266, 375);
line(25, 133, 375, 133);
line(25, 266, 375, 266);

//make list of all 9 spaces
var taken = [0, 0, 0, 0, 0, 0, 0, 0, 0];
//define whether x or o is next
var drawX = function(x, y) {
stroke(255, 0, 0);
line(x, y, x+80, y+80);
line(x + 80, y, x, y+80);
};

var drawO = function(x, y) {
    stroke(0, 0, 255);
    ellipse(x, y, 80, 80);
};

//check what space the mouse clicked
var turn = 0;
var activeSquare = function(squareNum, x1, x2, y1, y2) {

if (turn % 2 === 0 && mouseIsPressed && mouseX < x1 && mouseX > x2 && mouseY < y1 && mouseY > y2 && taken[squareNum] === 0) {drawX(x2 + 25, y2 + 25);
turn++;
taken[squareNum] = "x";
}
else if (mouseIsPressed && turn % 2 > 0 && mouseX < x1 && mouseX > x2 && mouseY < y1 && mouseY > y2 && taken[squareNum] === 0) {drawO(x2 + 60, y2 + 60);
turn++;
taken[squareNum] = "o";
}

};

//check if someone wins
var checkWin = function(sq1, sq2, sq3) {
if (taken[sq1] === "x" && taken[sq2] === "x" && taken[sq3] === "x") {println("X wins!!");
}
else if (taken[sq1] === "o" && taken[sq2] === "o" && taken[sq3] === "o") {println("O wins!!");}
};
//draw x or o in said space
draw = function() {
    activeSquare(0, 130, 0, 130, 0);
    activeSquare(1, 260, 130, 130, 0);
    activeSquare(2, 400, 260, 130, 0);
    activeSquare(3, 130, 0, 260, 130);
    activeSquare(4, 260, 130, 260, 130);
    activeSquare(5, 400, 260, 260, 130);
    activeSquare(6, 130, 0, 400, 260);
    activeSquare(7, 260, 130, 400, 260);
    activeSquare(8, 400, 260, 400, 260);
    checkWin(0, 1, 2);
    checkWin(3, 4, 5);
    checkWin(6, 7, 8);
    checkWin(0, 4, 8);
    checkWin(2, 4, 6);
    checkWin(0, 3, 6);
    checkWin(1, 4, 7);
    checkWin(2, 5, 8);
};
