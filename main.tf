

module "course" {
    source = "./modules/dynamodb/eu-central-1"
    context = module.label.context
    name = "course"
}

module "author" {
    source = "./modules/dynamodb/eu-central-1"
    context = module.label.context
    name = "author"
}

module "lpnu" {
    source = "./modules/dynamodb/eu-central-1"
    context = module.label.context
    name = "lpnu"
}



