xquery version "1.0";

(: Generated with EditiX at Thu Mar 12 10:59:03 CET 2015 :)
declare default element namespace "http://www.expression.org";

declare option saxon:output "omit-xml-declaration=yes";



declare function local:print($name as xs:string) as xs:string {	
	concat(doc($name)/expr/op/@val, '
')
};
let $exp := "/home/m1/saintomer/Documents/S2/LABD/tp8/tp8/LABD-TP8/expression.xml" 

return  local:print($exp)
