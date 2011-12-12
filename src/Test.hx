import HTML;

using HTML;
using Lambda;


class Test {

  static function main() {
    // qS quotes a string, qI int -> HTML
    var helloWorld:HTML = "Hello world".qS();

    // make hello world be a headline:
    trace(helloWorld.h2({'class':"my_class"}));

    // quoting works the way htmlEscape does (StringTools)
    trace( "<".qS().t('h2').s() ); // failure

    // tds special function:
    trace( [1,2,3,4].map(function(x){ return x.qI(); }).tds().tr().table() );

    // append HTML
    var x = "text".qS()
            .append("fooo".qS());
    trace(x.append("y".qS()));
    
    // Yes - the resulting code may not be very optimizied - eventually more macro magic should be used
  }    

}
