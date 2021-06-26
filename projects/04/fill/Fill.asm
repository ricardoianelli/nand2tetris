// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//screen_color: (0) white, (1) black

@screen_color
M=0
@SCREEN
D=A
@8192
D=D+A
@max
M=D

(RESET)
	@SCREEN
	D=A
	@curr_addr
	M=D

(MAINLOOP)
	@KBD
	D=M
	@PREBLACK
	D;JGT
	@PREWHITE
	0;JMP

(PREBLACK)
	@screen_color
	D=M
	@MAINLOOP
	D;JGT
	@BLACK
	0;JMP

(PREWHITE)
	@screen_color
	D=M
	@MAINLOOP
	D;JEQ
	@WHITE
	0;JMP

(BLACK)
	@screen_color
	M=1
	@curr_addr
	A=M
	M=-1
	@curr_addr
	M=M+1
	@max
	D=M
	@curr_addr
	D=D-M
	@BLACK
	D;JGT
	@RESET
	0;JMP

(WHITE)
	@screen_color
	M=0
	@curr_addr
	A=M
	M=0
	@curr_addr
	M=M+1
	@max
	D=M
	@curr_addr
	D=D-M
	@WHITE
	D;JGT
	@RESET
	0;JMP

(END)
	@END
	0;JMP
