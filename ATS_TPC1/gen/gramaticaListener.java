// Generated from /home/carlos/Desktop/ATS/ATS_TPC1/src/gramatica.g4 by ANTLR 4.7.2

    import java.util.List;
    import java.util.ArrayList;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link gramaticaParser}.
 */
public interface gramaticaListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link gramaticaParser#axioma}.
	 * @param ctx the parse tree
	 */
	void enterAxioma(gramaticaParser.AxiomaContext ctx);
	/**
	 * Exit a parse tree produced by {@link gramaticaParser#axioma}.
	 * @param ctx the parse tree
	 */
	void exitAxioma(gramaticaParser.AxiomaContext ctx);
	/**
	 * Enter a parse tree produced by {@link gramaticaParser#blocos}.
	 * @param ctx the parse tree
	 */
	void enterBlocos(gramaticaParser.BlocosContext ctx);
	/**
	 * Exit a parse tree produced by {@link gramaticaParser#blocos}.
	 * @param ctx the parse tree
	 */
	void exitBlocos(gramaticaParser.BlocosContext ctx);
	/**
	 * Enter a parse tree produced by {@link gramaticaParser#bloco}.
	 * @param ctx the parse tree
	 */
	void enterBloco(gramaticaParser.BlocoContext ctx);
	/**
	 * Exit a parse tree produced by {@link gramaticaParser#bloco}.
	 * @param ctx the parse tree
	 */
	void exitBloco(gramaticaParser.BlocoContext ctx);
}