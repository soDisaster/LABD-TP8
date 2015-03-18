xquery version "1.0";

(: Generated with EditiX at Thu Mar 12 10:59:03 CET 2015 :)
declare default element namespace "http://www.expression.org";

declare function local:write($name,$variables) {
	concat('<op val=',$name/@val,'>',
		concat(if($name/*[1]/name() = 'op')then
				local:fall($name/*[1],$variables)
			
		else(),

			concat('<var>',$name/*[name()='var'],'</var>')
	,
		if($name/*[2]/name() = 'op')then
				local:fall($name/*[1],$variables)
			
		else()
				),'</op>')
	
};

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
				
						
						if($name/../@val = '/') then
								1		
						else(
							if($name/../@val = '*') then
							 1
							else(
								if($name/../@val = '-') then
								 0
								else(
									if($name/../@val = '+') then
										0
									else()
								)
							)
						)
						
					
				else(
					$variables//*[./name()=$name]
					)
				)
		else($name)
		)
else()

};


declare function local:simplifie($name as xs:string, $variables as xs:string) as xs:string{	
	xs:string( local:fall(doc($name)/expr/op,doc($variables)))

};


<expr xsi:schemaLocation="http://www.expression.org expression.xsd" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://www.expression.org">
{
let $exp := "/home/rosat/LABD/LABD-TP8/expression4.xml" 
let $var := "/home/rosat/LABD/LABD-TP8/variables.xml" 
return  concat(local:simplifie($exp,$var),'
')
}
</expr>
