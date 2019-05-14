(* Yoann Padioleau
 *
 * Copyright (C) 2019 Yoann Padioleau
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
open Ocaml
open Ast_js

(* generated by ocamltarzan with: camlp4o -o /tmp/yyy.ml -I pa/ pa_type_conv.cmo pa_visitor.cmo  pr_o.cmo /tmp/xxx.ml  *)

(*****************************************************************************)
(* Prelude *)
(*****************************************************************************)

(* hooks *)
type visitor_in = {
  kexpr: (expr  -> unit) * visitor_out -> expr  -> unit;
  kstmt: (stmt  -> unit) * visitor_out -> stmt  -> unit;
  ktop: (toplevel -> unit) * visitor_out -> toplevel -> unit;
  kinfo: (tok -> unit)  * visitor_out -> tok  -> unit;
}
and visitor_out = any -> unit

let default_visitor =
  { kexpr   = (fun (k,_) x -> k x);
    kstmt   = (fun (k,_) x -> k x);
    ktop   = (fun (k,_) x -> k x);
    kinfo = (fun (k,_) x -> k x);
  }

let (mk_visitor: visitor_in -> visitor_out) = fun vin ->

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

(* start of auto generation *)

and v_tok v = v_info v

and v_wrap: 'a. ('a -> unit) -> 'a wrap -> unit = fun _of_a (v1, v2) ->
  let v1 = _of_a v1 and v2 = v_info v2 in ()

and v_name v = v_wrap v_string v

and v_filename v = v_wrap v_string v

and v_special =
  function
  | Null -> ()
  | Undefined -> ()
  | This -> ()
  | Super -> ()
  | New -> ()
  | NewTarget -> ()
  | Eval -> ()
  | Seq -> ()
  | Typeof -> ()
  | Instanceof -> ()
  | In -> ()
  | Delete -> ()
  | Void -> ()
  | Spread -> ()
  | Yield -> ()
  | YieldStar -> ()
  | Await -> ()
  | Encaps v1 -> let v1 = v_option v_name v1 in ()
  | Not -> ()
  | And -> ()
  | Or -> ()
  | Xor -> ()
  | BitNot -> ()
  | BitAnd -> ()
  | BitOr -> ()
  | BitXor -> ()
  | Lsr -> ()
  | Asr -> ()
  | Lsl -> ()
  | Equal -> ()
  | PhysEqual -> ()
  | Lower -> ()
  | Greater -> ()
  | Plus -> ()
  | Minus -> ()
  | Mul -> ()
  | Div -> ()
  | Mod -> ()
  | Expo -> ()
  | Incr v1 -> let v1 = v_bool v1 in ()
  | Decr v1 -> let v1 = v_bool v1 in ()

and v_property_name =
  function
  | PN v1 -> let v1 = v_name v1 in ()
  | PN_Computed v1 -> let v1 = v_expr v1 in ()    

and v_label v = v_wrap v_string v

and v_expr (x: expr) =
  (* tweak *)
  let k x =  match x with
  | Bool v1 -> let v1 = v_wrap v_bool v1 in ()
  | Num v1 -> let v1 = v_wrap v_string v1 in ()
  | String v1 -> let v1 = v_wrap v_string v1 in ()
  | Regexp v1 -> let v1 = v_wrap v_string v1 in ()
  | Id v1 -> let v1 = v_name v1 in ()
  | IdSpecial v1 -> let v1 = v_wrap v_special v1 in ()
  | Nop -> ()
  | Assign ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_expr v2 in ()
  | Obj v1 -> let v1 = v_obj_ v1 in ()
  | Class v1 -> let v1 = v_class_ v1 in ()
  | ObjAccess ((v1, v2)) ->
      let v1 = v_expr v1 and v2 = v_property_name v2 in ()
  | Fun ((v1, v2)) -> let v1 = v_fun_ v1 and v2 = v_option v_name v2 in ()
  | Apply ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_list v_expr v2 in ()
  | Conditional ((v1, v2, v3)) ->
      let v1 = v_expr v1 and v2 = v_expr v2 and v3 = v_expr v3 in ()
  in  
  vin.kexpr (k, all_functions) x


and v_stmt x =
  let k x = match x with
  | VarDecl v1 -> let v1 = v_var v1 in ()
  | Block v1 -> let v1 = v_list v_stmt v1 in ()
  | ExprStmt v1 -> let v1 = v_expr v1 in ()
  | If ((v1, v2, v3)) ->
      let v1 = v_expr v1 and v2 = v_stmt v2 and v3 = v_stmt v3 in ()
  | Do ((v1, v2)) -> let v1 = v_stmt v1 and v2 = v_expr v2 in ()
  | While ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_stmt v2 in ()
  | For ((v1, v2)) -> let v1 = v_for_header v1 and v2 = v_stmt v2 in ()
  | Switch ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_list v_case v2 in ()
  | Continue v1 -> let v1 = v_option v_label v1 in ()
  | Break v1 -> let v1 = v_option v_label v1 in ()
  | Return v1 -> let v1 = v_expr v1 in ()
  | Label ((v1, v2)) -> let v1 = v_label v1 and v2 = v_stmt v2 in ()
  | Throw v1 -> let v1 = v_expr v1 in ()
  | Try ((v1, v2, v3)) ->
      let v1 = v_stmt v1
      and v2 =
        v_option
          (fun (v1, v2) -> let v1 = v_name v1 and v2 = v_stmt v2 in ()) v2
      and v3 = v_option v_stmt v3
      in ()
  in
  vin.kstmt (k, all_functions) x

and v_for_header =
  function
  | ForClassic ((v1, v2, v3)) ->
      let v1 = v_either (v_list v_var) v_expr v1
      and v2 = v_expr v2
      and v3 = v_expr v3
      in ()
  | ForIn ((v1, v2)) ->
      let v1 = v_either v_var v_expr v1 and v2 = v_expr v2 in ()
  | ForOf ((v1, v2)) ->
      let v1 = v_either v_var v_expr v1 and v2 = v_expr v2 in ()

and v_case =
  function
  | Case ((v1, v2)) -> let v1 = v_expr v1 and v2 = v_stmt v2 in ()
  | Default v1 -> let v1 = v_stmt v1 in ()

and v_var { v_name = v_v_name; v_kind = v_v_kind; v_init = v_v_init } =
  let arg = v_name v_v_name in
  let arg = v_var_kind v_v_kind in let arg = v_expr v_v_init in ()
and v_var_kind = function | Var -> () | Let -> () | Const -> ()

and v_fun_ { f_props = v_f_props; f_params = v_f_params; f_body = v_f_body } =
  let arg = v_list v_fun_prop v_f_props in
  let arg = v_list v_parameter v_f_params in let arg = v_stmt v_f_body in ()
and v_parameter { p_name = v_p_name; p_default = v_p_default; p_dots = v_p_dots
              } =
  let arg = v_name v_p_name in
  let arg = v_option v_expr v_p_default in let arg = v_bool v_p_dots in ()
and v_fun_prop =
  function | Get -> () | Set -> () | Generator -> () | Async -> ()

and v_obj_ v = v_list v_property v
and v_class_ { c_extends = v_c_extends; c_body = v_c_body } =
  let arg = v_option v_expr v_c_extends in
  let arg = v_list v_property v_c_body in ()
and v_property =
  function
  | Field ((v1, v2, v3)) ->
      let v1 = v_property_name v1
      and v2 = v_list v_property_prop v2
      and v3 = v_expr v3
      in ()
  | FieldSpread v1 -> let v1 = v_expr v1 in ()
and v_property_prop =
  function | Static -> () | Public -> () | Private -> () | Protected -> ()
  
and v_toplevel x =
  let k x =
  match x with
  | V v1 -> let v1 = v_var v1 in ()
  | S ((v1, v2)) -> let v1 = v_tok v1 and v2 = v_stmt v2 in ()
  | Import ((v1, v2, v3)) ->
      let v1 = v_name v1 and v2 = v_name v2 and v3 = v_filename v3 in ()
  | Export ((v1, v2)) -> let v1 = v_name v1 and v2 = v_expr v2 in ()
  in
  vin.ktop (k, all_functions) x

and v_any =
  function
  | Expr v1 -> let v1 = v_expr v1 in ()
  | Stmt v1 -> let v1 = v_stmt v1 in ()
  | Top v1 -> let v1 = v_toplevel v1 in ()
  | Program v1 -> let v1 = v_program v1 in ()

and v_program v = v_list v_toplevel v

and all_functions x = v_any x
in
all_functions

(*****************************************************************************)
(* Helpers *)
(*****************************************************************************)

let do_visit_with_ref mk_hooks = fun any ->
  let res = ref [] in
  let hooks = mk_hooks res in
  let vout = mk_visitor hooks in
  vout any;
  List.rev !res
