if (!is_poisoned) {
    var ef = instance_create_layer(x, y, layer, obj_trungquai);
    ef.target = id;

    is_poisoned = true;
}