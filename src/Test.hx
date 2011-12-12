using HTML;
using Lambda;


class Test {

  static function main() {
    trace("o");
    trace( "<".qS().t('h2').s() );
    // trace( [1,2,3,4].map(function(x){ return x.qI(); }).tds().tr().table() );
  }    

}
