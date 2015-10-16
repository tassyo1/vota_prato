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

ActiveRecord::Schema.define(version: 20151016160613) do

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

  create_table "pratos", force: :cascade do |t|
    t.string   "nome",       limit: 80
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
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
    t.text     "conteudo",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "prato_id",   limit: 4
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string   "nome",          limit: 80
    t.string   "endereco",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "especialidade", limit: 40
  end

  add_foreign_key "pratos_restaurantes", "pratos"
  add_foreign_key "pratos_restaurantes", "restaurantes"
  add_foreign_key "qualificacoes", "clientes"
  add_foreign_key "qualificacoes", "restaurantes"
end
