xquery version "1.0";

(: Generated with EditiX at Thu Mar 12 10:59:03 CET 2015 :)
declare default element namespace "http://www.expression.org";

declare option saxon:output "omit-xml-declaration=yes";

declare function local:fall($name){	
if(count($name)>0) then

	if($name/name() = 'op') then
	 concat('(',local:fall($name/*[1]),$name/@val,local:fall($name/*[2]),')')
	else( $name )
else()

};


declare function local:print($name as xs:string) as xs:string {	
	 concat(local:fall(doc($name)/expr/op),'
')

};
let $exp := "/home/rosat/LABD/LABD-TP8/expression.xml" 

return  local:print($exp)
