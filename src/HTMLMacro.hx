import haxe.macro.Expr;
class HTMLMacro {
    @:macro public static function build(tags:Array<String>) : Array<Field> {
      var pos = haxe.macro.Context.currentPos();
      var fields = haxe.macro.Context.getBuildFields();
      var ed = function(e){return {pos: pos, expr: e};};

      for (n in tags){
        var tint = TPath({ pack : [], name : "Int", params : [], sub : null });

        /*
        static public inline function {n}(c:HTML, a:Dynamic = null):HTML{
          return HTML.t(c, '{n}', a);
        }
        */
        var f = {
          args: [{ opt : false, name: "c", type: TPath({ pack: [], sub: null, name: "HTML", params: []}), value: null },
                 { opt : false, name: "a", type: TPath({ pack: [], sub: null, name: "Dynamic", params: []}), value: ed(EConst(CIdent("null"))) }
                ],
          ret: TPath({ pack: [], params: [], sub: null, name: "HTML"}),
          expr: ed(EBlock([
                   ed(EReturn(
                      ed(ECall( ed(EField(ed(EConst(CType("HTML"))) ,"t")),
                              [ ed(EConst(CIdent("c"))), ed(EConst(CString("h2"))) , ed(EConst(CIdent("a")))])
                        )))])),
          params: []
        };

        fields.push({ name : n, doc : null, meta : [], access : [AInline, APublic, AStatic], kind : FFun(f), pos : pos });
      }
      return fields;
    }
}
