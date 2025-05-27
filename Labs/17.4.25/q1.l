%{
#include<stdio.h>
%}

%s A B C D E F G H INV

%%
<INITIAL>a BEGIN B;
<INITIAL>b BEGIN A;
<INITIAL>[^a|^b|^\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("Not Accepted\n");}

<A>a BEGIN B;
<A>b BEGIN A;
<A>[^a|^b|^\n] BEGIN INV;
<A>\n {BEGIN INITIAL; printf("not Accepted\n");}

<B>a BEGIN C;
<B>b BEGIN D;
<B>[^a|^b|^\n] BEGIN INV;
<B>\n {BEGIN INITIAL; printf("not Accepted\n");}

<C>a BEGIN E;
<C>b BEGIN F;
<C>[^a|^b|^\n] BEGIN INV;
<C>\n {BEGIN INITIAL; printf("not Accepted\n");}

<D>a BEGIN G;
<D>b BEGIN H;
<D>[^a|^b|^\n] BEGIN INV;
<D>\n {BEGIN INITIAL; printf("not Accepted\n");}

<E>a BEGIN E;
<E>b BEGIN F;
<E>[^a|^b|^\n] BEGIN INV;
<E>\n {BEGIN INITIAL; printf("Accepted\n");}

<F>a BEGIN E;
<F>b BEGIN H;
<F>[^a|^b|^\n] BEGIN INV;
<F>\n {BEGIN INITIAL; printf("Accepted\n");}

<G>a BEGIN C;
<G>b BEGIN H;
<G>[^a|^b|^\n] BEGIN INV;
<G>\n {BEGIN INITIAL; printf("Accepted\n");}

<H>a BEGIN B;
<H>b BEGIN A;
<H>[^a|^b|^\n] BEGIN INV;
<H>\n {BEGIN INITIAL; printf("Accepted\n");}

<INV>[^\n] BEGIN INV;
<INV>\n {BEGIN INITIAL; printf("invalid\n");}

%%
int yywrap(){return 1;}
int main()
{
	yylex();
}