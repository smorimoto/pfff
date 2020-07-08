(* Yoann Padioleau
 *
 * Copyright (C) 2019 r2c
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * version 2.1 as published by the Free Software Foundation, with the
 * special exception on linking described in file license.txt.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the file
 * license.txt for more details.
 *)
open OCaml
open AST_generic

(* Disable warnings against unused variables *)
[@@@warning "-26"]

(*****************************************************************************)
(* Prelude *)
(*****************************************************************************)

(* hooks *)
type visitor_in = {
  kexpr: (expr  -> unit) * visitor_out -> expr  -> unit;
  kstmt: (stmt  -> unit) * visitor_out -> stmt  -> unit;
  ktype_: (type_  -> unit) * visitor_out -> type_  -> unit;
  kpattern: (pattern  -> unit) * visitor_out -> pattern  -> unit;

  kdef: (definition  -> unit) * visitor_out -> definition  -> unit;
  kdir: (directive  -> unit) * visitor_out -> directive  -> unit;

  kattr: (attribute  -> unit) * visitor_out -> attribute  -> unit;
  kparam: (parameter  -> unit) * visitor_out -> parameter  -> unit;
  kident: (ident -> unit)  * visitor_out -> ident  -> unit;
  kentity: (entity -> unit)  * visitor_out -> entity  -> unit;
  kstmts: (stmt list  -> unit) * visitor_out -> stmt list -> unit;

  kfunction_definition: (function_definition -> unit) * visitor_out -> 
    function_definition -> unit;
  kclass_definition: (class_definition -> unit) * visitor_out -> 
    class_definition -> unit;

  kinfo: (tok -> unit)  * visitor_out -> tok  -> unit;
}
and visitor_out = any -> unit

let default_visitor =
  { kexpr   = (fun (k,_) x -> k x);
    kstmt   = (fun (k,_) x -> k x);
    ktype_   = (fun (k,_) x -> k x);
    kpattern   = (fun (k,_) x -> k x);

    kdef   = (fun (k,_) x -> k x);
    kdir   = (fun (k,_) x -> k x);

    kattr   = (fun (k,_) x -> k x);
    kparam   = (fun (k,_) x -> k x);
    kident   = (fun (k,_) x -> k x);
    kentity   = (fun (k,_) x -> k x);
    kstmts   = (fun (k,_) x -> k x);

    kfunction_definition   = (fun (k,_) x -> k x);
    kclass_definition   = (fun (k,_) x -> k x);

    kinfo   = (fun (k,_) x -> k x);
  }

let (mk_visitor: visitor_in -> visitor_out) = fun vin ->

(* start of auto generation *)


(* generated by ocamltarzan with: camlp4o -o /tmp/yyy.ml -I pa/ pa_type_conv.cmo pa_visitor.cmo  pr_o.cmo /tmp/xxx.ml  *)

let rec v_info x =
  let k x = match x with { Parse_info.
     token = _v_pinfox; transfo = _v_transfo
    } ->
(*
    let arg = Parse_info.v_pinfo v_pinfox in
    let arg = v_unit v_comments in
    let arg = Parse_info.v_transformation v_transfo in
*)
    ()
  in
  vin.kinfo (k, all_functions) x

and v_tok v = v_info v

and v_wrap: 'a. ('a -> unit) -> 'a wrap -> unit = fun _of_a (v1, v2) ->
  let v1 = _of_a v1 and v2 = v_info v2 in ()

and v_bracket: 'a. ('a -> unit) -> 'a bracket -> unit = 
  fun of_a (v1, v2, v3) ->
  let v1 = v_info v1 and v2 = of_a v2 and v3 = v_info v3 in ()

and v_ident v = 
  let k x =
    v_wrap v_string x
  in
  vin.kident (k, all_functions) v

and v_dotted_ident v = v_list v_ident v

and v_qualifier = function
 | QDots v -> v_dotted_ident v
 | QTop t -> v_tok t
 | QExpr (e, t) -> v_expr e; v_tok t

and v_module_name =
  function
  | FileName v1 -> let v1 = v_wrap v_string v1 in ()
  | DottedName v1 -> let v1 = v_dotted_ident v1 in ()


and v_resolved_name (v1, v2) =
  v_resolved_name_kind v1;
  v_int v2

and v_resolved_name_kind =
  function
  | Local -> ()
  | Param  -> ()
  | EnclosedVar -> ()
  | Global -> ()
  | ImportedEntity v1 -> let v1 = v_dotted_ident v1 in ()
  | ImportedModule v1 -> let v1 = v_module_name v1 in ()
  | Macro -> ()
  | EnumConstant -> ()
  | TypeName -> ()


and v_name (v1, v2) = let v1 = v_ident v1 and v2 = v_name_info v2 in ()

and
  v_name_info {
                name_qualifier = v_name_qualifier;
                name_typeargs = v_name_typeargs
              } =
  let arg = v_option v_qualifier v_name_qualifier in
  let arg = v_option v_type_arguments v_name_typeargs in ()

and v_id_info 
  { id_resolved = v_id_resolved; id_type = v_id_type;
    id_const_literal = _IGNORED;
  } =
  let arg = v_ref_do_not_visit (v_option v_resolved_name) v_id_resolved in
  let arg = v_ref_do_not_visit (v_option v_type_) v_id_type in ()

and
  v_xml { xml_tag = v_xml_tag; xml_attrs = v_xml_attrs; xml_body = vv_xml_body
        } =
  let v_xml_tag = v_ident v_xml_tag in
  let v_xml_attrs =
    v_list (fun (v1, v2) -> let v1 = v_ident v1 and v2 = v_xml_attr v2 in ())
      v_xml_attrs in
  let vv_xml_body = v_list v_xml_body vv_xml_body in 
  ()
and v_xml_attr v = v_expr v
and v_xml_body =
  function
  | XmlText v1 -> let v1 = v_wrap v_string v1 in ()
  | XmlExpr v1 -> let v1 = v_expr v1 in ()
  | XmlXml v1 -> let v1 = v_xml v1 in ()


and v_expr x =
  let k x = 
  match x with
  | DisjExpr (v1, v2) -> let v1 = v_expr v1 in let v2 = v_expr v2 in ()
  | L v1 -> let v1 = v_literal v1 in ()
  | Ellipsis v1 -> let v1 = v_tok v1 in ()
  | DeepEllipsis v1 -> let v1 = v_bracket v_expr v1 in ()
  | Container ((v1, v2)) ->
      let v1 = v_container_operator v1 and v2 = v_bracket (v_list v_expr) v2
      in ()
  | Tuple v1 -> let v1 = v_list v_expr v1 in ()
  | Record v1 -> let v1 = v_bracket (v_list v_field) v1 in ()
  | Constructor ((v1, v2)) ->
      let v1 = v_name v1 and v2 = v_list v_expr v2 in ()
  | Lambda ((v1)) -> let v1 = v_function_definition v1 in ()
  | AnonClass ((v1)) -> let v1 = v_class_definition v1 in ()
  | Xml v1 -> let v1 = v_xml v1 in ()
  | Id ((v1, v2)) -> let v1 = v_ident v1 and v2 = v_id_info v2 in ()
  | IdQualified ((v1, v2)) -> let v1 = v_name v1 and v2 = v_id_info v2 in ()
  | IdSpecial v1 -> let v1 = v_wrap v_special v1 in ()
  | Call ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_arguments v2 in ()
  | Assign ((v1, v2, v3)) -> 
        let v1 = v_expr v1 and v2 = v_tok v2 and v3 = v_expr v3 in ()
  | AssignOp ((v1, v2, v3)) ->
      let v1 = v_expr v1
      and v2 = v_wrap v_arithmetic_operator v2
      and v3 = v_expr v3
      in ()
  | LetPattern ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_expr v2 in ()
  | DotAccess ((v1, t, v2)) -> 
        let v1 = v_expr v1 and t = v_tok t and v2 = v_field_ident v2 in ()
  | ArrayAccess ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_expr v2 in ()
  | SliceAccess ((v1, v2, v3, v4)) -> 
        let v1 = v_expr v1 
        and v2 = v_option v_expr v2 
        and v3 = v_option v_expr v3
        and v4 = v_option v_expr v4 
        in
        ()
  | Conditional ((v1, v2, v3)) ->
      let v1 = v_expr v1 and v2 = v_expr v2 and v3 = v_expr v3 in ()
  | TypedMetavar ((v1, v2, v3)) ->
      let v1 = v_ident v1 and v2 = v_tok v2 and v3 = v_type_ v3 in ()
  | MatchPattern ((v1, v2)) ->
      let v1 = v_expr v1
      and v2 =
        v_list
          (fun (v1, v2) -> let v1 = v_pattern v1 and v2 = v_expr v2 in ()) v2
      in ()
  | Yield ((t, v1, v2)) -> 
        let t = v_tok t in
        let v1 = v_option v_expr v1 and v2 = v_bool v2 in ()
  | Await (t, v1) -> 
      let t = v_tok t in
      let v1 = v_expr v1 in ()
  | Cast ((v1, v2)) -> let v1 = v_type_ v1 and v2 = v_expr v2 in ()
  | Seq v1 -> let v1 = v_list v_expr v1 in ()
  | Ref (t, v1) -> 
      let t = v_tok t in
      let v1 = v_expr v1 in ()
  | DeRef (t, v1) -> 
      let t = v_tok t in
      let v1 = v_expr v1 in ()
  | OtherExpr ((v1, v2)) ->
      let v1 = v_other_expr_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kexpr (k, all_functions) x

and v_field_ident = function
 | FId id -> v_ident id
 | FName n -> v_name n
 | FDynamic e -> v_expr e

and v_literal =
  function
  | Unit v1 -> let v1 = v_tok v1 in ()
  | Bool v1 -> let v1 = v_wrap v_bool v1 in ()
  | Int v1 -> let v1 = v_wrap v_string v1 in ()
  | Float v1 -> let v1 = v_wrap v_string v1 in ()
  | Imag v1 -> let v1 = v_wrap v_string v1 in ()
  | Ratio v1 -> let v1 = v_wrap v_string v1 in ()
  | Atom v1 -> let v1 = v_wrap v_string v1 in ()
  | Char v1 -> let v1 = v_wrap v_string v1 in ()
  | String v1 -> let v1 = v_wrap v_string v1 in ()
  | Regexp v1 -> let v1 = v_wrap v_string v1 in ()
  | Null v1 -> let v1 = v_tok v1 in ()
  | Undefined v1 -> let v1 = v_tok v1 in ()

and v_container_operator =
  function | Array -> () | List -> () | Set -> () | Dict -> ()

and v_special =
  function
  | Defined -> ()
  | This -> ()
  | Super -> ()
  | Self -> ()
  | Parent -> ()
  | Eval -> ()
  | Typeof -> ()
  | Instanceof -> ()
  | Sizeof -> ()
  | New -> ()
  | Spread -> ()
  | HashSplat -> ()
  | EncodedString v1 -> let v1 = v_wrap v_string v1 in ()
  | Op v1 -> let v1 = v_arithmetic_operator v1 in ()
  | IncrDecr ((v1, v2)) -> let v1 = v_incr_decr v1 and v2 = v_prepost v2 in ()
  | ConcatString v1 -> let v1 = v_interpolated_kind v1 in ()
and v_interpolated_kind _ = ()
and v_incr_decr _ = ()
and v_prepost _ = ()
and v_arithmetic_operator _x = ()
and v_arguments v = v_bracket (v_list v_argument) v
and v_argument =
  function
  | Arg v1 -> let v1 = v_expr v1 in ()
  | ArgType v1 -> let v1 = v_type_ v1 in ()
  | ArgKwd ((v1, v2)) -> let v1 = v_ident v1 and v2 = v_expr v2 in ()
  | ArgOther ((v1, v2)) ->
      let v1 = v_other_argument_operator v1 and v2 = v_list v_any v2 in ()

and v_other_argument_operator _x = ()

and v_other_expr_operator _x = ()

and v_type_ x =
  let k x = 
  match x with
  | TyAnd v1 ->
      let v1 =
        v_bracket
          (v_list
             (fun (v1, v2) -> let v1 = v_ident v1 and v2 = v_type_ v2 in ()))
          v1
      in ()
  | TyOr v1 -> let v1 = v_list v_type_ v1 in ()
  | TyBuiltin v1 -> let v1 = v_wrap v_string v1 in ()
  | TyFun ((v1, v2)) -> let v1 = v_list v_parameter_classic v1 and 
    v2 = v_type_ v2 in ()
  | TyNameApply ((v1, v2)) ->
      let v1 = v_name v1 and v2 = v_type_arguments v2 in ()
  | TyName ((v1)) ->
      let v1 = v_name v1 in ()
  | TyVar v1 -> let v1 = v_ident v1 in ()
  | TyArray ((v1, v2)) ->
      let v1 = v_option v_expr v1 and v2 = v_type_ v2 in ()
  | TyPointer (t, v1) -> 
        let t = v_tok t in
        let v1 = v_type_ v1 in ()
  | TyTuple v1 -> let v1 = v_bracket (v_list v_type_) v1 in ()
  | TyQuestion (v1, t) -> 
        let t = v_tok t in
        let v1 = v_type_ v1 in ()
  | OtherType ((v1, v2)) ->
      let v1 = v_other_type_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.ktype_ (k, all_functions) x

and v_type_arguments v = v_list v_type_argument v
and v_type_argument =
  function
  | TypeArg v1 -> let v1 = v_type_ v1 in ()
  | OtherTypeArg ((v1, v2)) ->
      let v1 = v_other_type_argument_operator v1
      and v2 = v_list v_any v2
      in ()
and v_other_type_argument_operator = function | OTA_Question -> ()

and v_other_type_operator _ = ()

and v_type_parameter (v1, v2) =
  let v1 = v_ident v1 and v2 = v_type_parameter_constraints v2 in ()
and v_type_parameter_constraints v = v_list v_type_parameter_constraint v
and v_type_parameter_constraint =
  function | Extends v1 -> let v1 = v_type_ v1 in ()
and v_attribute x =
  let k x = 
  match x with
  | KeywordAttr v1 -> let v1 = v_wrap v_keyword_attribute v1 in ()
  | NamedAttr ((t, v1, v2, v3)) -> 
      let t = v_tok t in
      let v1 = v_ident v1 and v2 = v_id_info v2 and
      v3 = v_bracket (v_list v_argument) v3 in ()
  | OtherAttribute ((v1, v2)) ->
      let v1 = v_other_attribute_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kattr (k, all_functions) x

and v_keyword_attribute _ = ()
and v_other_attribute_operator _ = ()

and v_stmts xs =
  let k xs = 
    match xs with
    | [] -> ()
    | x::xs ->
      v_stmt x;
      v_stmts xs
  in
  vin.kstmts (k, all_functions) xs

and v_stmt x =
  let k x =
  match x with
  | DisjStmt (v1, v2) -> let v1 = v_stmt v1 in let v2 = v_stmt v2 in ()
  | ExprStmt (v1, t) -> 
        let v1 = v_expr v1 in 
        let t = v_tok t in
        ()
  | DefStmt v1 -> let v1 = v_def v1 in ()
  | DirectiveStmt v1 -> let v1 = v_directive v1 in ()
  | Block v1 -> let v1 = v_bracket v_stmts v1 in ()
  | If ((t, v1, v2, v3)) ->
      let t = v_tok t in
      let v1 = v_expr v1 and v2 = v_stmt v2 and v3 = v_option v_stmt v3 in ()
  | While ((t, v1, v2)) -> 
        let t = v_tok t in
        let v1 = v_expr v1 and v2 = v_stmt v2 in ()
  | DoWhile ((t, v1, v2)) -> 
        let t = v_tok t in
        let v1 = v_stmt v1 and v2 = v_expr v2 in ()
  | For ((t, v1, v2)) -> 
        let t = v_tok t in
        let v1 = v_for_header v1 and v2 = v_stmt v2 in ()
  | Switch ((v0, v1, v2)) ->
      let v0 = v_tok v0 in
      let v1 = v_option v_expr v1
      and v2 =
        v_list
          (fun (v1, v2) -> let v1 = v_list v_case v1 and v2 = v_stmt v2 in ())
          v2
      in ()
  | Return (t, v1) -> 
        let t = v_tok t in
        let v1 = v_option v_expr v1 in ()
  | Continue (t, v1) -> 
        let t = v_tok t in
        let v1 = v_label_ident v1 in ()
  | Break (t, v1) -> 
        let t = v_tok t in
        let v1 = v_label_ident v1 in ()
  | Label ((v1, v2)) -> let v1 = v_label v1 and v2 = v_stmt v2 in ()
  | Goto (t, v1) -> 
        let t = v_tok t in
        let v1 = v_label v1 in ()
  | Throw (t, v1) -> 
        let t = v_tok t in
        let v1 = v_expr v1 in ()
  | Try ((t, v1, v2, v3)) ->
      let t = v_tok t in
      let v1 = v_stmt v1
      and v2 = v_list v_catch v2
      and v3 = v_option v_finally v3
      in ()
  | Assert ((t, v1, v2)) -> 
        let t = v_tok t in
        let v1 = v_expr v1 and v2 = v_option v_expr v2 in ()
  | OtherStmtWithStmt ((v1, v2, v3)) ->
      let v1 = v_other_stmt_with_stmt_operator v1 
      and v2 = v_expr v2 
      and v3 = v_stmt v3
      in ()
  | OtherStmt ((v1, v2)) ->
      let v1 = v_other_stmt_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kstmt (k, all_functions) x
and v_other_stmt_with_stmt_operator _ = ()

and v_label_ident =
  function
  | LNone -> ()
  | LId v1 -> let v1 = v_label v1 in ()
  | LInt v1 -> let v1 = v_wrap v_int v1 in ()
  | LDynamic v1 -> let v1 = v_expr v1 in ()

and v_case = function 
  | Case (t, v1) -> 
        let t = v_tok t in
      let v1 = v_pattern v1 in () 
  | CaseEqualExpr (t, v1) -> 
        let t = v_tok t in
      let v1 = v_expr v1 in () 
  | Default t ->
      let t = v_tok t in
      ()

and v_catch (t, v1, v2) = 
  let t = v_tok t in
  let v1 = v_pattern v1 and v2 = v_stmt v2 in ()
and v_finally (t, v) = 
  let t = v_tok t in
  v_stmt v
and v_label v = v_ident v
and v_for_header =
  function
  | ForClassic ((v1, v2, v3)) ->
      let v1 = v_list v_for_var_or_expr v1
      and v2 = v_option v_expr v2
      and v3 = v_option v_expr v3
      in ()
  | ForEach ((v1, t, v2)) -> 
      let t = v_tok t in
      let v1 = v_pattern v1 and v2 = v_expr v2 in ()
  | ForEllipsis t -> v_tok t

and v_for_var_or_expr =
  function
  | ForInitVar ((v1, v2)) ->
      let v1 = v_entity v1 and v2 = v_variable_definition v2 in ()
  | ForInitExpr v1 -> let v1 = v_expr v1 in ()
and v_other_stmt_operator _x = ()

and v_pattern x =
  let k x = 
  match x with
  | PatRecord v1 ->
      let v1 =
        v_bracket (v_list
          (fun (v1, v2) -> let v1 = v_name v1 and v2 = v_pattern v2 in ()))
          v1
      in ()
  | PatId ((v1, v2)) -> let v1 = v_ident v1 and v2 = v_id_info v2 in ()
  | PatVar ((v1, v2)) ->
      let v1 = v_type_ v1
      and v2 =
        v_option
          (fun (v1, v2) -> let v1 = v_ident v1 and v2 = v_id_info v2 in ())
          v2
      in ()
  | PatLiteral v1 -> let v1 = v_literal v1 in ()
  | PatType v1 -> let v1 = v_type_ v1 in ()
  | PatConstructor ((v1, v2)) ->
      let v1 = v_name v1 and v2 = v_list v_pattern v2 in ()
  | PatTuple v1 -> let v1 = v_list v_pattern v1 in ()
  | PatList v1 -> let v1 = v_bracket (v_list v_pattern) v1 in ()
  | PatKeyVal ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_pattern v2 in ()
  | PatUnderscore v1 -> let v1 = v_tok v1 in ()
  | PatDisj ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_pattern v2 in ()
  | DisjPat ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_pattern v2 in ()
  | PatTyped ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_type_ v2 in ()
  | PatAs ((v1, v2)) ->
      let v1 = v_pattern v1
      and v2 =
        (match v2 with
         | (v1, v2) -> let v1 = v_ident v1 and v2 = v_id_info v2 in ())
      in ()

  | PatWhen ((v1, v2)) -> let v1 = v_pattern v1 and v2 = v_expr v2 in ()
  | OtherPat ((v1, v2)) ->
      let v1 = v_other_pattern_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kpattern (k, all_functions) x
and v_other_pattern_operator _ = ()

and v_def x =
  let k x =
    let (v1, v2) = x in
    let v1 = v_entity v1 and v2 = v_def_kind v2 in ()
  in
  vin.kdef (k, all_functions) x
and v_entity x =

  let k x =
   let {
             name = x_name;
             attrs = v_attrs;
             tparams = v_tparams;
             info = v_info;
           } = x in
   let arg = v_ident x_name in
   let arg = v_list v_attribute v_attrs in
   let arg = v_list v_type_parameter v_tparams in 
   let arg = v_id_info v_info in
   ()
  in
  vin.kentity (k, all_functions) x

and v_def_kind =
  function
  | FuncDef v1 -> let v1 = v_function_definition v1 in ()
  | VarDef v1 -> let v1 = v_variable_definition v1 in ()
  | FieldDef v1 -> let v1 = v_variable_definition v1 in ()
  | ClassDef v1 -> let v1 = v_class_definition v1 in ()
  | TypeDef v1 -> let v1 = v_type_definition v1 in ()
  | ModuleDef v1 -> let v1 = v_module_definition v1 in ()
  | MacroDef v1 -> let v1 = v_macro_definition v1 in ()
  | Signature v1 -> let v1 = v_type_ v1 in ()
  | UseOuterDecl v1 -> let v1 = v_tok v1 in ()

and v_function_definition x =
  let k {
                          fparams = v_fparams;
                          frettype = v_frettype;
                          fbody = v_fbody;
                        } =
  let arg = v_parameters v_fparams in
  let arg = v_option v_type_ v_frettype in
  let arg = v_stmt v_fbody in 
  ()
  in
  vin.kfunction_definition (k, all_functions) x
and v_parameters v = v_list v_parameter v
and v_parameter x =
  let k x =
  match x with
  | ParamClassic v1 -> let v1 = v_parameter_classic v1 in ()
  | ParamPattern v1 -> let v1 = v_pattern v1 in ()
  | ParamEllipsis v1 -> let v1 = v_tok v1 in ()
  | OtherParam ((v1, v2)) ->
      let v1 = v_other_parameter_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kparam (k, all_functions) x
and
  v_parameter_classic {
                        pname = v_pname;
                        pdefault = v_pdefault;
                        ptype = v_ptype;
                        pattrs = v_pattrs;
                        pinfo = v_pinfo;
                      } =
  let arg = v_id_info v_pinfo in
  let arg = v_option v_ident v_pname in
  let arg = v_option v_expr v_pdefault in
  let arg = v_option v_type_ v_ptype in
  let arg = v_list v_attribute v_pattrs in ()
and v_other_parameter_operator _ = ()
and
  v_variable_definition {
                          vinit = v_vinit;
                          vtype = v_vtype;
                        } =
  let arg = v_option v_expr v_vinit in
  let arg = v_option v_type_ v_vtype in
  ()

and v_field =
  function
  | FieldDynamic ((v1, v2, v3)) ->
      let v1 = v_expr v1
      and v2 = v_list v_attribute v2
      and v3 = v_expr v3
      in ()
  | FieldSpread (t, v1) -> 
      let t = v_tok t in
      let v1 = v_expr v1 in ()
  | FieldStmt v1 -> let v1 = v_stmt v1 in ()

and v_type_definition { tbody = v_tbody } =
  let arg = v_type_definition_kind v_tbody in ()
and v_type_definition_kind =
  function
  | OrType v1 ->
      let v1 = v_list v_or_type_element v1
      in ()
  | AndType v1 -> let v1 = v_bracket (v_list v_field) v1 in ()
  | AliasType v1 -> let v1 = v_type_ v1 in ()
  | NewType v1 -> let v1 = v_type_ v1 in ()
  | Exception ((v1, v2)) ->
      let v1 = v_ident v1 and v2 = v_list v_type_ v2 in ()
  | OtherTypeKind ((v1, v2)) ->
      let v1 = v_other_type_kind_operator v1 and v2 = v_list v_any v2 in ()
and v_other_type_kind_operator _x = ()

and v_or_type_element =
  function
  | OrConstructor ((v1, v2)) ->
      let v1 = v_ident v1 and v2 = v_list v_type_ v2 in ()
  | OrEnum ((v1, v2)) -> let v1 = v_ident v1 and v2 = v_option v_expr v2 in ()
  | OrUnion ((v1, v2)) -> let v1 = v_ident v1 and v2 = v_type_ v2 in ()
  | OtherOr ((v1, v2)) ->
      let v1 = v_other_or_type_element_operator v1
      and v2 = v_list v_any v2
      in ()
and v_other_or_type_element_operator _x = ()

and v_class_definition x = 
  let k {
                       ckind = v_ckind;
                       cextends = v_cextends;
                       cimplements = v_cimplements;
                       cmixins = v_mixins;
                       cbody = v_cbody;
                     } =
  let arg = v_class_kind v_ckind in
  let arg = v_list v_type_ v_cextends in
  let arg = v_list v_type_ v_cimplements in
  let arg = v_list v_type_ v_mixins in
  let arg = v_bracket (v_list v_field) v_cbody in
  ()
  in
  vin.kclass_definition (k, all_functions) x
and v_class_kind = function | Class -> () | Interface -> () | Trait -> ()

and v_module_definition { mbody = v_mbody } =
  let arg = v_module_definition_kind v_mbody in ()
and v_module_definition_kind =
  function
  | ModuleAlias v1 -> let v1 = v_name v1 in ()
  | ModuleStruct ((v1, v2)) ->
      let v1 = v_option v_dotted_ident v1 and v2 = v_stmts v2 in ()
  | OtherModule ((v1, v2)) ->
      let v1 = v_other_module_operator v1 and v2 = v_list v_any v2 in ()
and v_other_module_operator = function | OMO_Functor -> ()
and
  v_macro_definition { macroparams = v_macroparams; macrobody = v_macrobody }
                     =
  let arg = v_list v_ident v_macroparams in
  let arg = v_list v_any v_macrobody in ()

and v_directive x =
  let k x = 
  match x with
  | ImportFrom ((t, v1, v2, v3)) ->
      let t = v_tok t in
      let v1 = v_module_name v1 and _ = v_alias (v2, v3) in ()
  | ImportAs ((t, v1, v2)) ->
      let t = v_tok t in
      let v1 = v_module_name v1 and v2 = v_option v_ident v2 in ()
  | ImportAll ((t, v1, v2)) ->
      let t = v_tok t in
      let v1 = v_module_name v1 and v2 = v_tok v2 in ()
  | Package ((t, v1)) ->
      let t = v_tok t in
      let v1 = v_dotted_ident v1 in ()
  | PackageEnd ((t)) ->
      let t = v_tok t in
      ()
  | OtherDirective ((v1, v2)) ->
      let v1 = v_other_directive_operator v1 and v2 = v_list v_any v2 in ()
  in
  vin.kdir (k, all_functions) x
and v_alias (v1, v2) = let v1 = v_ident v1 and v2 = v_option v_ident v2 in ()
and v_other_directive_operator =
  function
  | OI_Export -> ()
  | OI_ImportCss -> ()
  | OI_ImportEffect -> ()
and v_program v = v_stmts v
and v_any =
  function
  | N v1 -> let v1 = v_name v1 in ()
  | En v1 -> let v1 = v_entity v1 in ()
  | E v1 -> let v1 = v_expr v1 in ()
  | S v1 -> let v1 = v_stmt v1 in ()
  | Ss v1 -> let v1 = v_stmts v1 in ()
  | T v1 -> let v1 = v_type_ v1 in ()
  | P v1 -> let v1 = v_pattern v1 in ()
  | Def v1 -> let v1 = v_def v1 in ()
  | Dir v1 -> let v1 = v_directive v1 in ()
  | Fld v1 -> let v1 = v_field v1 in ()
  | Dk v1 -> let v1 = v_def_kind v1 in ()
  | Di v1 -> let v1 = v_dotted_ident v1 in ()
  | Pa v1 -> let v1 = v_parameter v1 in ()
  | Ar v1 -> let v1 = v_argument v1 in ()
  | At v1 -> let v1 = v_attribute v1 in ()
  | Pr v1 -> let v1 = v_program v1 in ()
  | I v1 -> let v1 = v_ident v1 in ()
  | Tk v1 -> let v1 = v_tok v1 in ()
  

and all_functions x = v_any x
in
all_functions

(*****************************************************************************)
(* Helpers *)
(*****************************************************************************)
