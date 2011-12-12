using StringTools;
using Lambda;

extern class HTML {
  // escape html
  static public inline function qS(s:String):HTML {
    return untyped(StringTools.htmlEscape(s));
  }
  static public inline function qI(i:Int):HTML {
    return untyped(""+i);
  }

  static public function append(a:HTML, b:HTML):HTML{
    // stirng concatenation
    return untyped(untyped(a) + untyped(b));
  }

  static public function join( it : Iterator<HTML>):HTML {
    return untyped(untyped(it).join(''));
  }

  // use macros to make this code faster ad inline?
  static public function t(content:HTML, tag:String, args:Dynamic = {}):HTML{
    // TODO attrs
    return untyped("<"+tag+">"+untyped(content)+"</"+tag+">");
  }

  static public inline function s(h:HTML):String{
    return untyped(h);
  }

  // should be created by macro!
  static public inline function td(c:HTML, attrs:Dynamic = null):HTML{
    return HTML.t(c, 'td', attrs);
  }

  static public function tds(c:List<HTML>, attrs:Dynamic = {}):HTML{
    return untyped(c.map(function(x){ return untyped(HTML.td(x, attrs)); }).join('')); 
  }

  static public inline function tr(c:HTML, a:Dynamic = null):HTML{
    return HTML.t(c, 'tr', a);
  }

  static public inline function table(c:HTML, a:Dynamic = null):HTML{
    return HTML.t(c, 'table', a);
  }

}
