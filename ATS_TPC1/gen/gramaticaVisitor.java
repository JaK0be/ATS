// Generated from /home/carlos/Desktop/ATS/ATS_TPC1/src/gramatica.g4 by ANTLR 4.7.2

    import java.util.List;
    import java.util.ArrayList;

import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link gramaticaParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface gramaticaVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link gramaticaParser#axioma}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAxioma(gramaticaParser.AxiomaContext ctx);
	/**
	 * Visit a parse tree produced by {@link gramaticaParser#blocos}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlocos(gramaticaParser.BlocosContext ctx);
	/**
	 * Visit a parse tree produced by {@link gramaticaParser#bloco}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBloco(gramaticaParser.BlocoContext ctx);
}