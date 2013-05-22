clear
make haxe

echo " "
echo "Build CocoaTouch demos..."
echo " "

cd ../hxcocoa/demos/Hello
# ./../../../haxe/haxe compile.hxml

cd ../Busses
# ./../../../haxe/haxe compile.hxml

cd ../PiratePig
# ./../../../haxe/haxe compile.hxml

cd ../WWX
# ./../../../haxe/haxe compile.hxml

echo " "
echo "Build the playground..."
echo " "
cd ../../../playground
./../haxe/haxe compile.hxml
# ./haxe/haxe -main Tests -dce no -cp tests -as3 tests/as3
# echo "Build Cpp tests..."
# ./haxe/haxe -main Tests -dce no -cp tests -cpp tests/cpp
# echo "Build CS tests..."
# ./../haxe/haxe -main Tests -cp . -cs tests/cs
# echo "Build Java tests..."
# ./../haxe/haxe -main Tests -cp tests -java tests/java -lib hxjava


echo " "
echo "Build utests..."
echo " "

cd ..
# ./haxe/haxe -cp haxe/tests -objc utests -main unit.Test -lib hxcocoa -dce no --times
