// Generated from /home/carlos/Desktop/ATS/ATS_TPC1/src/gramatica.g4 by ANTLR 4.7.2

    import java.util.List;
    import java.util.ArrayList;

import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class gramaticaParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, STR=6, SPACE=7;
	public static final int
		RULE_axioma = 0, RULE_blocos = 1, RULE_bloco = 2;
	private static String[] makeRuleNames() {
		return new String[] {
			"axioma", "blocos", "bloco"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'['", "']'", "','", "'Use'", "'Decl'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, "STR", "SPACE"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "gramatica.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }


	    List<Par> list = new ArrayList<>();
	    int val=0;

	public gramaticaParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class AxiomaContext extends ParserRuleContext {
		public BlocosContext blocos() {
			return getRuleContext(BlocosContext.class,0);
		}
		public AxiomaContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_axioma; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof gramaticaListener ) ((gramaticaListener)listener).enterAxioma(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof gramaticaListener ) ((gramaticaListener)listener).exitAxioma(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof gramaticaVisitor ) return ((gramaticaVisitor<? extends T>)visitor).visitAxioma(this);
			else return visitor.visitChildren(this);
		}
	}

	public final AxiomaContext axioma() throws RecognitionException {
		AxiomaContext _localctx = new AxiomaContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_axioma);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(6);
			match(T__0);
			setState(7);
			blocos(0);
			setState(8);
			match(T__1);

			    System.out.println("Lista:");
			    for(Par a : list){
			        System.out.println(a.toString());
			    }

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlocosContext extends ParserRuleContext {
		public int nivel;
		public List<BlocoContext> bloco() {
			return getRuleContexts(BlocoContext.class);
		}
		public BlocoContext bloco(int i) {
			return getRuleContext(BlocoContext.class,i);
		}
		public BlocosContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public BlocosContext(ParserRuleContext parent, int invokingState, int nivel) {
			super(parent, invokingState);
			this.nivel = nivel;
		}
		@Override public int getRuleIndex() { return RULE_blocos; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof gramaticaListener ) ((gramaticaListener)listener).enterBlocos(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof gramaticaListener ) ((gramaticaListener)listener).exitBlocos(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof gramaticaVisitor ) return ((gramaticaVisitor<? extends T>)visitor).visitBlocos(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BlocosContext blocos(int nivel) throws RecognitionException {
		BlocosContext _localctx = new BlocosContext(_ctx, getState(), nivel);
		enterRule(_localctx, 2, RULE_blocos);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(11);
			bloco(nivel);
			setState(16);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__2) {
				{
				{
				setState(12);
				match(T__2);
				setState(13);
				bloco(nivel);
				}
				}
				setState(18);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlocoContext extends ParserRuleContext {
		public int nivel;
		public Token STR;
		public TerminalNode STR() { return getToken(gramaticaParser.STR, 0); }
		public BlocosContext blocos() {
			return getRuleContext(BlocosContext.class,0);
		}
		public BlocoContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public BlocoContext(ParserRuleContext parent, int invokingState, int nivel) {
			super(parent, invokingState);
			this.nivel = nivel;
		}
		@Override public int getRuleIndex() { return RULE_bloco; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof gramaticaListener ) ((gramaticaListener)listener).enterBloco(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof gramaticaListener ) ((gramaticaListener)listener).exitBloco(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof gramaticaVisitor ) return ((gramaticaVisitor<? extends T>)visitor).visitBloco(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BlocoContext bloco(int nivel) throws RecognitionException {
		BlocoContext _localctx = new BlocoContext(_ctx, getState(), nivel);
		enterRule(_localctx, 4, RULE_bloco);
		try {
			setState(29);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__3:
				enterOuterAlt(_localctx, 1);
				{
				setState(19);
				match(T__3);
				setState(20);
				((BlocoContext)_localctx).STR = match(STR);

				        Par a = new Par((((BlocoContext)_localctx).STR!=null?((BlocoContext)_localctx).STR.getText():null),"Use",nivel);
				        list.add(a);
				        System.out.println("USE:" + (((BlocoContext)_localctx).STR!=null?((BlocoContext)_localctx).STR.getText():null) + " valor:" + _localctx.nivel);

				}
				break;
			case T__4:
				enterOuterAlt(_localctx, 2);
				{
				setState(22);
				match(T__4);
				setState(23);
				((BlocoContext)_localctx).STR = match(STR);

				        Par a = new Par((((BlocoContext)_localctx).STR!=null?((BlocoContext)_localctx).STR.getText():null),"Decl",nivel);
				        list.add(a);
				        System.out.println("DECL:" + (((BlocoContext)_localctx).STR!=null?((BlocoContext)_localctx).STR.getText():null) + " valor:" + _localctx.nivel);

				}
				break;
			case T__0:
				enterOuterAlt(_localctx, 3);
				{
				setState(25);
				match(T__0);
				setState(26);
				blocos(nivel + 1);
				setState(27);
				match(T__1);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\t\"\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3\3\7\3\21\n\3\f\3\16\3\24\13\3"+
		"\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\5\4 \n\4\3\4\2\2\5\2\4\6\2\2"+
		"\2!\2\b\3\2\2\2\4\r\3\2\2\2\6\37\3\2\2\2\b\t\7\3\2\2\t\n\5\4\3\2\n\13"+
		"\7\4\2\2\13\f\b\2\1\2\f\3\3\2\2\2\r\22\5\6\4\2\16\17\7\5\2\2\17\21\5\6"+
		"\4\2\20\16\3\2\2\2\21\24\3\2\2\2\22\20\3\2\2\2\22\23\3\2\2\2\23\5\3\2"+
		"\2\2\24\22\3\2\2\2\25\26\7\6\2\2\26\27\7\b\2\2\27 \b\4\1\2\30\31\7\7\2"+
		"\2\31\32\7\b\2\2\32 \b\4\1\2\33\34\7\3\2\2\34\35\5\4\3\2\35\36\7\4\2\2"+
		"\36 \3\2\2\2\37\25\3\2\2\2\37\30\3\2\2\2\37\33\3\2\2\2 \7\3\2\2\2\4\22"+
		"\37";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}