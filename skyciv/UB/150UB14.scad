d = 150;  // Overall height.
bt = 75;  // Width of top flange. 
bb = bt;  // Width of bottom flange. 
tt = 7;   // Thickness of top flange.
tb = tt;  // Thickness of bottom flange. 
tw = 5;   // Thicknes of web. 
r = 8;    // Radius between web and flange.

// Bottom flange
translate ([0, -((d - tb) / 2)]) { square(size = [bb, tb], center = true); };
// Web
translate ([0, 0]) { square(size = [tw, (d - tt - tb)], center = true); };
// Top flange
translate ([0, ((d - tt) / 2)]) { square(size = [bt, tt], center = true); };

color ("red") {
translate ( [  (-tw/2 - r), -d/2   ] ) { 
  polygon(
    points = [
      [   (-tw/2 - r)  , -d/4      ],
      [   (-tw/2)      , -d/4 + r  ],
      [   (-tw/2)      , -d/4      ]
    ],
    paths = [[0, 1, 2]]
  );
};
};
