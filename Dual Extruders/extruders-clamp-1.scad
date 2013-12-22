// Extruders clamp
// Used for joining 2 peeks
//
// Author:
// * Sara Rodriguez <sara@metamaquina.com.br>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

epsilon = 0.1;

include <bolts.h>
include <configuration.scad>
include <BillOfMaterials.h>;
include <render.h>
include <lm8uu_bearing.h>
include <nuts.h>;
include <spacer.h>;
use <Metamaquina2.scad>
use <utils.scad>;

module extrudersclamp_face(r = 11/2, folga = 0.5, h = 6, largura_total = 84, comprimento_total = 23, cover = false, abertura = 3, separador = 1, distancia = 26){
  difference(){

    union(){

      for (i=[-1,1]){

          //círculo maior para colocação dos parafusos 
          translate([i*distancia/2, 0])
          circle(r = comprimento_total/2, $fn=80);

        hull(){

          //círculo menor - extremidades
          translate([i*33,0])
          circle(r = m4_diameter*3/2, $fn=80);

          //círculo maior para colocação dos parafusos 
          translate([i*distancia/2, 0])
          circle(r = comprimento_total/2, $fn=80);

          //junção meio
          translate([-distancia/2,-30/4]) 
          square([distancia,30/2]);
        }
      }
    }
      

    union(){
      for (i=[-1,1]){
        //furo que prende o extrusor
        translate([i*distancia/2,0])
        circle(r = r+folga/2, $fn=80);
          
        //define profundidade do sulco para encaixe do extrusor
        translate([i*distancia/2,0])
        circle(r = r+folga/2, $fn=80);

        //furo para encaixe dos extrusores
        translate([i*distancia/2,0])
        circle(r = r+folga/2, $fn=80);

        //furo parafusos que prendem no carrinho
        translate([i*35,0])
        circle(r = m3_diameter/2, $fn=80);   
        
        if(cover){
          difference(){
            circle(r = 50);
            circle(r = 20-folga);
          }
        }
      }
    }
  }
}

bearing_sandwich_spacing = 12;
thickness = 6;
XCarPosition = -100;
XMotor_height = 31;
PulleyRadius = 6;
XCarriage_padding = 6;
margin=4;
tslot_extra=thickness+margin;
X_rod_height = XMotor_height + PulleyRadius - lm8uu_diameter/2 - 2*thickness;
XCarriage_height = thickness + X_rod_height + lm8uu_diameter/2;
XCarriage_length = 82;
XCarriage_lm8uu_distance = XCarriage_length - 30;
XPlatform_width = X_rods_distance + X_rods_diameter + 2*margin + 2* tslot_extra;

module extrudersclamp(){
  BillOfMaterials(category="Lasercut wood", partname="Extruders Clamp", ref="");
  material("lasercut")
  linear_extrude(height=6)
  extrudersclamp_face(cover=false);
}

module extrudersclamp_cover(){
  BillOfMaterials(category="Lasercut wood", partname="Extruders Clamp", ref="");
  material("lasercut")
  linear_extrude(height=6)
  extrudersclamp_face(cover=true);
}

//descomente para ver no carrinho

color("red") 
translate([0,-0.5,h/2])
translate([XCarPosition-0.4, 0, XCarriage_height-2*thickness]){
    translate([0,0,6])
    extrudersclamp();
    translate([0,0,12])
    extrudersclamp_cover();
}
//XCarriage();

translate([XCarPosition, 0, XCarriage_height]){
    %XCarriage_bottom_sheet();
  }


//descomente para ver apenas a peça
/*
translate([0,-0.5,h/2]){
extrudersclamp();

translate([0,0,6])
extrudersclamp_cover();
}
*/
