grammar gramatica;

@members{
    List<Par> list = new ArrayList<>();
    int val=0;
}

@parser::header {
    import java.util.List;
    import java.util.ArrayList;
}

@lexer::header {
    import java.util.List;
    import java.util.ArrayList;
}

STR: '"'~('"')*'"';
SPACE  : [ \t\n\r]+ -> skip;


axioma: '[' blocos [0] ']' {
    System.out.println("Lista:");
    for(Par a : list){
        System.out.println(a.toString());
    }
};

blocos [int nivel]
       : bloco [nivel] (',' bloco [nivel])*
      ;

bloco [int nivel]
     : 'Use' STR {
        Par a = new Par($STR.text,"Use",nivel);
        list.add(a);
        System.out.println("USE:" + $STR.text + " valor:" + $nivel);
}
     | 'Decl' STR {
        Par a = new Par($STR.text,"Decl",nivel);
        list.add(a);
        System.out.println("DECL:" + $STR.text + " valor:" + $nivel);
}
     |'[' blocos [nivel + 1] ']'
     ;