module "prod" {
    source = "../../infra"

    nome_repositorio = "producao"
    cargoIAM = "producao"
    ambiente = "producao"
}

output "IP_alb" {
  value = module.prod.IP
}