clear
make haxe

echo " "
echo "Build CocoaTouch demos..."
echo " "

cd ../hxcocoa/demos/Hello
# ./../../../haxe/haxe compile.hxml

cd ../PiratePig
# ./../../../haxe/haxe compile.hxml

cd ../WWX
./../../../haxe/haxe compile.hxml

echo " "
echo "Build ObjC tests..."
echo " "
# ./haxe/haxe -main Tests -dce no -cp tests -objc tests/objc -objc-version 6 -objc-bundle-version 1.0 -objc-identifier org.haxe.ObjcTests -resource tests/hello_message.txt@welcome --times
# ./haxe/haxe -main Tests -dce no -cp tests -as3 tests/as3
# ./haxe/haxe -main Tests -cp tests -php tests/php
# echo "Build Cpp tests..."
# ./haxe/haxe -main Tests -dce no -cp tests -cpp tests/cpp
# echo "Build CS tests..."
# ./haxe/haxe -main Tests -cp tests -cs tests/cs
# echo "Build Java tests..."
# ./haxe/haxe -main Tests -cp tests -java tests/java


echo " "
echo "Build utests..."
echo " "

cd ../../..
# ./haxe/haxe -cp haxe/tests -objc utests -main unit.Test -lib hxcocoa --times
