if (!is_poisoned) {
    var ef = instance_create_layer(x, y, layer, obj_trungdoc);
    ef.target = id;

    is_poisoned = true;
}