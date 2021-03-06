package html;
using StringTools;
using Lambda;
import html.HTMLMacro;

/* creates

   static public inline function {n}(c:HTML, a:Dynamic = null):HTML{
   return HTML.t(c, '{n}', a);
   }

   like methods
*/
@:build(html.HTMLMacro.build(["body","head","html","tr","table","h1","h2","h3","td","span","strong","div"])) class HTML {
  // escape html
  static public inline function verb(s:String):HTML {
    return untyped(s);
  }
  static public inline function qS(s:String):HTML {
    return untyped(StringTools.htmlEscape(s));
  }
  static public inline function qI(i:Int):HTML {
    return untyped(""+i);
  }

  static public function append(a:HTML, b:HTML):HTML{
    var a_:String = untyped a;
    var b_:String = untyped b;
    // stirng concatenation
    return untyped(a_ + b_);
  }

  static public inline function join( it : Iterator<HTML>):HTML {
    return untyped(untyped(it).join(''));
  }

  // use macros to make this code faster ad inline?
  static public inline function t(content:HTML, tag:String, attrs:Dynamic = null):HTML{
    // TODO attrs
    var fields = "";
    for (n in Reflect.fields(attrs))
      fields += " "+n+"=\""+Reflect.field(attrs, n)+"\"";

    return untyped("<"+tag +fields+">"+untyped(content)+"</"+tag+">");
  }

  static public inline function s(h:HTML):String{
    return untyped(h);
  }

  static public inline function tds(c:List<HTML>, attrs:Dynamic = null):HTML{
    var s = "";
    for (x in c) s += untyped(HTML.td(x, attrs));
    return untyped(s);
  }
  /* dummy declarations for tags and such
  function body();
  function head();
  function html();
  function tr();
  function table()
  function h1();
  function h2();
  function h3();
  function td();
  function span();
  function strong();
  function div();
  */

}
