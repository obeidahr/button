import 'package:flutter/cupertino.dart';

class MyFloatingButton extends ShapeBorder{
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
      return getOuterPath(rect,textDirection: textDirection) ;
    }
  
    @override
    Path getOuterPath(Rect rect, {TextDirection textDirection}) {
        
        var p=Path();
        p.moveTo(rect.left+rect.width/2.0,rect.top);//top
        p.lineTo(rect.right,rect.top+rect.height/2.0);//right
        p.lineTo(rect.left+rect.width/2.0,rect.bottom);//bottom
        p.lineTo(rect.left,rect.top+rect.height/2.0);//left
        p.close();
        return p;
        // return Path()..moveTo(rect.left+rect.width/2.0,rect.top)
        // ..lineTo(rect.right,rect.top+rect.height/2.0)
        // ..lineTo(rect.left+rect.width/2.0,rect.bottom)
        // ..lineTo(rect.left,rect.top+rect.height/2.0)
        // ..close();
    }
  
    @override
    void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
      // TODO: implement paint
    }
  
    @override
    ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}