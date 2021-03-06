# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160502200322) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nome",       limit: 80
    t.integer  "idade",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.text     "conteudo",        limit: 65535
    t.integer  "comentavel_id",   limit: 4
    t.string   "comentavel_type", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "comentarios", ["comentavel_id"], name: "index_comentarios_on_comentavel_id", using: :btree
  add_index "comentarios", ["comentavel_type"], name: "index_comentarios_on_comentavel_type", using: :btree

  create_table "especialidades", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "especialidades_restaurantes", id: false, force: :cascade do |t|
    t.integer "restaurante_id",   limit: 4, null: false
    t.integer "especialidade_id", limit: 4, null: false
  end

  add_index "especialidades_restaurantes", ["especialidade_id", "restaurante_id"], name: "espc_resp", using: :btree
  add_index "especialidades_restaurantes", ["restaurante_id", "especialidade_id"], name: "rest_espc", using: :btree

  create_table "pratos", force: :cascade do |t|
    t.string   "nome",              limit: 80
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "foto_file_name",    limit: 255
    t.string   "foto_content_type", limit: 255
    t.integer  "foto_file_size",    limit: 4
    t.datetime "foto_updated_at"
    t.string   "descricao",         limit: 80
  end

  create_table "pratos_restaurantes", id: false, force: :cascade do |t|
    t.integer "prato_id",       limit: 4
    t.integer "restaurante_id", limit: 4
  end

  add_index "pratos_restaurantes", ["prato_id"], name: "fk_rails_295555769c", using: :btree
  add_index "pratos_restaurantes", ["restaurante_id"], name: "fk_rails_7987cd3df4", using: :btree

  create_table "qualificacoes", force: :cascade do |t|
    t.float    "nota",           limit: 24
    t.float    "valor_gasto",    limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "cliente_id",     limit: 4
    t.integer  "restaurante_id", limit: 4
  end

  add_index "qualificacoes", ["cliente_id"], name: "fk_rails_5b62f7ef27", using: :btree
  add_index "qualificacoes", ["restaurante_id"], name: "fk_rails_081869fcbc", using: :btree

  create_table "receitas", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "prato_id",     limit: 4
    t.text     "ingredientes", limit: 65535
    t.text     "modo_preparo", limit: 65535
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string   "nome",              limit: 80
    t.string   "endereco",          limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "foto_file_name",    limit: 255
    t.string   "foto_content_type", limit: 255
    t.integer  "foto_file_size",    limit: 4
    t.datetime "foto_updated_at"
  end

  add_foreign_key "especialidades_restaurantes", "especialidades"
  add_foreign_key "especialidades_restaurantes", "restaurantes"
  add_foreign_key "pratos_restaurantes", "pratos"
  add_foreign_key "pratos_restaurantes", "restaurantes"
  add_foreign_key "qualificacoes", "clientes"
  add_foreign_key "qualificacoes", "restaurantes"
end
