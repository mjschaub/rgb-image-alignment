function final_image = find_displace(base,edit)

%this function finds the displacement vector for the edit image compared
%to the base image using the SSD method
min_ssd = sum(sum((base - edit) .^2));
for x_off = -15:15
    for y_off = -15:15
        displace = [x_off y_off];
        edit_new = circshift(edit, displace);
        new_ssd = sum(sum((base - edit_new) .^2));
        if min_ssd > new_ssd
            min_ssd = new_ssd;
            displacement = [x_off y_off];
        end
    end
end
display(displacement);
display(min_ssd);
%final_image = circshift(edit, displacement);
final_image = displacement;