#ifndef INIT_A52SXQ_H
#define INIT_A52SXQ_H

#include <string>

enum device_variant {
    VARIANT_A528B = 0,
    VARIANT_A528N,
    VARIANT_MAX
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant international_models_a52sxq = {
    .model = "SM-A528B",
    .codename = "a52sxq"
};

static const variant asia_models_a52sxq = {
    .model = "SM-A528N",
    .codename = "a52sxq"
};

static const variant *all_variants[VARIANT_MAX] = {
    &international_models_a52sxq,
    &asia_models_a52sxq
};

#endif // INIT_A52SXQ_H
