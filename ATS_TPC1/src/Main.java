import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;

import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        gramaticaLexer lexer;

        try {
            lexer = new gramaticaLexer(CharStreams.fromFileName("/home/carlos/Desktop/ATS/ATS_TPC1/testes/teste.txt"));
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            gramaticaParser parser = new gramaticaParser(tokens);
            ParserRuleContext ctx = parser.axioma();
            System.out.println("END");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}