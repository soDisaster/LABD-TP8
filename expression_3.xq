xquery version "1.0";

(: Generated with EditiX at Thu Mar 12 10:59:03 CET 2015 :)
declare default element namespace "http://www.expression.org";

declare option saxon:output "omit-xml-declaration=yes";

declare function local:fall($name,$variables){	
if(count($name)>0) then

	if($name/name() = 'op') then
		if($name/@val = '/') then
			 xs:integer(local:fall($name/*[1],$variables) div local:fall($name/*[2],$variables))
		else(
			if($name/@val = '*') then
			 xs:integer(local:fall($name/*[1],$variables) * local:fall($name/*[2],$variables))
			else(
				if($name/@val = '-') then
				 xs:integer(local:fall($name/*[1],$variables) - local:fall($name/*[2],$variables))
				else(
					if($name/@val = '+') then
						 xs:integer(local:fall($name/*[1],$variables) + local:fall($name/*[2],$variables))
					else(	)
				)
			)
		)
			
			
		
	else( 
		if($name/name() = 'var') then
				if(count($variables//*[./name()=$name])>1) then
				fn:error(xs:QName("ERROR"), "Multiple Declaration of Variable",$name)
			else(
				if(count($variables//*[./name()=$name])<1) then
				fn:error(xs:QName("ERROR"), "Unknown Variable",$name)
				else(
					$variables//*[./name()=$name]
					)
				)
		else($name )
		)
else()

};


declare function local:eval-var($name as xs:string, $variables as xs:string) as xs:integer{	
	 local:fall(doc($name)/expr/op,doc($variables))

};
let $exp := "/home/rosat/LABD/LABD-TP8/expression.xml" 
let $var := "/home/rosat/LABD/LABD-TP8/variables.xml" 
return  concat(local:eval-var($exp,$var),'
')
