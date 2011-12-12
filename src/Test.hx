import HTML;

using HTML;
using Lambda;


class Test {

  static function main() {
    trace("o");
    trace("Hello World".qS().h2({'class':"my_class"}));
    trace( "<".qS().t('h2').s() ); // failure
    trace( [1,2,3,4].map(function(x){ return x.qI(); }).tds().tr().table() );
  }    

}
