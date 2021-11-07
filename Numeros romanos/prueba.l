%{
  #include <stdio.h>
  int acum = 0;
  char lastChar;

  void lastCharFunction(int value, char correctLastChar, int lastCharAcum){
    if(lastChar == correctLastChar){
      acum += value - 2*lastCharAcum;
    } else {
      acum += value;
    }
  }
%}

%% 
[IVXLCDM] {
  switch(*yytext) {
    case 'I':
      acum += 1;
      lastChar = 'I';
      break; 

    case 'V':
      lastCharFunction(5, 'I', 1);
      lastChar = 'V';
      break; 

    case 'X':
      lastCharFunction(10, 'I', 1);
      lastChar = 'X';
      break;

    case 'L':
      lastCharFunction(50, 'X', 10);
      lastChar = 'L';
      break;

    case 'C':
      lastCharFunction(100, 'X', 10);
      lastChar = 'C';
      break;

    case 'D':
      lastCharFunction(500, 'C', 100);
      lastChar = 'D';
      break;

    case 'M':
      lastCharFunction(1000, 'C', 100);
      lastChar = 'M';
      break;

    default:
      return acum;
  }
}

[\n] {
  printf("%d  \n", acum);
  acum = 0;
  lastChar = '\0';
}

%%


int main() {
  yylex();
}

