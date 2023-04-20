use <MX_DES_Standard.scad>
spru_n = 2;
spacing = 19.05;
spru_radius = 0.8;

union() {
    translate([0, -19 * 0, 0])  des_spru(row=1);
    translate([0, -19 * 1, 0])  des_spru(row=2);
    translate([0, -19 * 2, 0])  des_spru(row=3);
    translate([0, -19 * 3, 0])  des_spru(row=3, home=true);
    translate([0, -19 * 4, 0])  des_spru(row=4);
    translate([0, -19 * 5, 0])  des_spru(row=5);
    translate([0, -19 * 6, 0])  des_spru(row=5, width=1.25);
    translate([0, -19 * 7, 0])  des_spru(row=5, width=1.5);
    translate([0, -19 * 8, 0])  des_spru(row=5, width=1.75);
    translate([0, -19 * 9, 0])  des_spru(row=5, width=2);
    translate([0, -19 * 10, 0]) des_spru(row=5, width=2.25);
    translate([0, -19 * 11, 0]) des_spru(row=5, width=2.75);
}

module des_spru(row, home=false, n=spru_n, width=1, radius=spru_radius) {
    echo ("Row", row, "width", width);
    union() {
        for (i = [0 : n - 1]){
            translate([i * spacing * width, 0, 0])
            mirror([0,0,0])
            des_keycap(row=row, width=width, home=home);
        }

        for (i = [0 : n - 1 - 1]){
            translate([width * spacing / 2 - 5, 5, -0.95 * spru_radius/2])
            rotate([0, 90, 0])
            cylinder(h = 10, r = spru_radius, $fn=20);
        }
    }
}

module des_keycap(row, width=1, home=false) {
    if      (row == 1) {rotate([0, 0, 180]) des_standard(5);}
    else if (row == 2) {des_standard(2);}
    else if (row == 3) {des_standard(1, home=home);}
    else if (row == 4) {des_standard(0);}
    else if (row == 5 && width == 1) {des_standard(4);}
    else if (row == 5 && width == 1.25) {des_standard(6);}
    else if (row == 5 && width == 1.5)  {des_standard(10);}
    else if (row == 5 && width == 1.75) {des_standard(14);}
    else if (row == 5 && width == 2)    {des_standard(18);}
    else if (row == 5 && width == 2.25) {des_standard(23);}
    else if (row == 5 && width == 2.75) {des_standard(31);}
}

module des_standard(keyID, home=false) {
    echo("keyID", keyID)
    keycap(
        keyID  = keyID, //change profile refer to KeyParameters Struct
        Stem   = true, //tusn on shell and stems
        crossSection = false,
        homeDot = home, //turn on homedots
    );
}


