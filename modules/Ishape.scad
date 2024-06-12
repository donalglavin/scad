// Geometric definitions for: Universal Beams & Universal Columns.
/* 
  Source: https://skyciv.com/steel-i-beam-sizes/
*/

// Example: 
 // l = 1000;                     // Member length.
 // d = 150;                      // Overall height.
 // bt = 75;                      // Width of top flange. 
 // bb = bt;                      // Width of bottom flange. 
 // tt = 7;                       // Thickness of top flange.
 // tb = tt;                      // Thickness of bottom flange. 
 // tw = 5;                       // Thicknes of web. 
 // r = 8;                        // Radius between web and flange.

module Ibeam(d, l, bb, bt, tb, tt, tw, r) {
  di = (d - (tb/2) - (tt/2));   // Web length - Calculated.
  linear_extrude (height = l) {
      union () {        // Structure.
        translate ([0, -d/2])     { square ([bb, tb], center = true);       }; // Bottom flange.
        translate ([0, 0])        { square ([tw, di], center = true);       }; // Web
        translate ([0, d/2])      { square ([bt, tt], center = true);       }; // top flange.
        difference () { // Fillets
          union() {     
            translate([0, -(di-r)/2]) { square ([2*r + tw, r], center = true);  }; // Bottom Block.
            translate([0, (di-r)/2])  { square ([2*r + tw, r], center = true);  };  // Top Block
          };
          union () {   
            translate ([tw/2+r, -di/2 +r])    { circle(r); }; // Bottom right circle.
            translate ([-(tw/2+r), -di/2 +r]) { circle(r); }; // Bottom left circle.
            translate ([tw/2+r, di/2-r])      { circle(r); }; // Top right cirlce.
            translate ([-(tw/2+r), di/2-r])   { circle(r); }; // Top left circle.
          };
        };
      };
    };
};
