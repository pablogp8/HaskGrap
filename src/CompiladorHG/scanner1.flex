package compiladorhg;

import java_cup.runtime.*;
import javax.swing.*;
import java.util.*;
import HaskGrap.*;
%%

%class scannerS
%{String literal;
  String temp_include;

%}
%{
int columna=1;
%}
%public
%cup
%line
%full
%unicode
%ignorecase
%char

%{
  public String sourceFilename;
 StringBuffer string = new StringBuffer();
  int ultimoEstado = 0;
 public void init(){};
%}

%eofval{
{return new Symbol(sym.EOF, null); }
%eofval}

Num=[0-9][0-9]*
Decim=Num(.)Num
ID=[A-Za-z]([A-Za-z]|Num)*
DIRE=(".")((\/)*((_)|([A-Za-z]|[0-9][0-9]*))+)+(".")[A-Za-z]+([A-Za-z]|[0-9][0-9])*
ALPHA_NUMERIC={ALPHA}|{DIGITO}
MAIL=ID("@")ID(".")("com")
NLinea=(\n|\r)
Espacio=([\ |\t|\f])
FinL = \r|\n|\r\n
Entrada = [^\r\n]

st = [^\\\n\"]+ | [\\][\\] | "\\\"" | "\\\'" |"\\t"| "\\n" | "\\r" |"\\b" |"\n"
 

//FRASE=("_"|{ALPHA_NUMERIC})("_"|{ALPHA_NUMERIC})*

%%
[\n] { yychar=0;}

[ \t\r\n\f] { /* ignore white space. */ }

\' { /* ignore apostrofos. */ } 
 \"[^\"]*\" 		{  /*return new Symbol(sym.espacio, new String(yytext().replaceAll("\"", "")), yyline, yychar,  yytext()); */}
<YYINITIAL> {Espacio}  {/*no hace nada, aumenta una columna*/yychar++; }
<YYINITIAL> {NLinea}     {yychar=0; yyline=0}
<YYINITIAL>{Num}  	{      System.out.println("numero "); return new Symbol(sym.num, yyline, yychar,  yytext());}
<YYINITIAL>{Decim}  	{      System.out.println("Decimal "); return new Symbol(sym.deci, yyline, yychar,  yytext());}
<YYINITIAL>{DIRE}  	{      System.out.println("Direccion ");return new Symbol(sym.dire, yyline, yychar,  yytext());}
<YYINITIAL>{MAIL}  	{      System.out.println("email ");return new Symbol(sym.mail, yyline, yychar,  yytext());}
<YYINITIAL>"<"		{  System.out.println("Menor <"); return new Symbol(sym.menr, yyline, yychar,  yytext());}
<YYINITIAL>">"		{  System.out.println("mayor >"); return new Symbol(sym.mayr, yyline, yychar,  yytext());}
<YYINITIAL>{ID}  	{      System.out.println("ID");return new Symbol(sym.id, yyline, yychar,  yytext());}

.		        {
              System.out.println("error lexico en la fila "+yyline +" y en la columna " + yychar);
//interfaz.rotular("error lexico :"+  yytext()+" en la fila "+yyline +" y en la columna " + yychar);

	          	}

