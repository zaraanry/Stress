function out = radial_stress(p, w, v, r_i, r_o)
    global step_for_r
    
    r = r_i:step_for_r:r_o;
    t1 = r_i^2 + r_o^2 - r_i^2 * r_o^2 ./ r.^2 - r.^2;
    t2 = (3+v) / 8;
    t3 = p * w^2;
    out = t1 * t2 * t3;
end