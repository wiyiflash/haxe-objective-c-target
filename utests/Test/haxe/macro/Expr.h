//
//  Expr
//  Test
//
//  Source generated by Haxe Objective-C target
//

typedef enum{
	CInt,
	CFloat,
	CString,
	CIdent,
	CRegexp
} Constant;
typedef enum{
	OpAdd,
	OpMult,
	OpDiv,
	OpSub,
	OpAssign,
	OpEq,
	OpNotEq,
	OpGt,
	OpGte,
	OpLt,
	OpLte,
	OpAnd,
	OpOr,
	OpXor,
	OpBoolAnd,
	OpBoolOr,
	OpShl,
	OpShr,
	OpUShr,
	OpMod,
	OpAssignOp,
	OpInterval,
	OpArrow
} Binop;
typedef enum{
	OpIncrement,
	OpDecrement,
	OpNot,
	OpNeg,
	OpNegBits
} Unop;
typedef enum{
	EConst,
	EArray,
	EBinop,
	EField,
	EParenthesis,
	EObjectDecl,
	EArrayDecl,
	ECall,
	ENew,
	EUnop,
	EVars,
	EFunction,
	EBlock,
	EFor,
	EIn,
	EIf,
	EWhile,
	ESwitch,
	ETry,
	EReturn,
	EBreak,
	EContinue,
	EUntyped,
	EThrow,
	ECast,
	EDisplay,
	EDisplayNew,
	ETernary,
	ECheckType,
	EMeta
} ExprDef;
typedef enum{
	TPath,
	TFunction,
	TAnonymous,
	TParent,
	TExtend,
	TOptional
} ComplexType;
