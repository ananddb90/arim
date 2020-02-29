function [lable] = get_label(r_axis, distances, ampl)

lable = zeros(1, 2048);
for i=1:1:length(distances)
    [min_value, min_index] = min(abs(r_axis - distances(i)));
    lable(min_index) = ampl(i);
end

end

