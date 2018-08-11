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

ActiveRecord::Schema.define(version: 2018_08_09_011624) do

  create_table "alunos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "ra"
    t.string "email"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_alunos_on_curso_id"
  end

  create_table "cursos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "descricao"
    t.integer "duracao"
    t.string "periodo"
    t.bigint "semestre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semestre_id"], name: "index_cursos_on_semestre_id"
  end

  create_table "livros", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "autor"
    t.string "titulo"
    t.date "ano_publicacao"
    t.bigint "curso_id"
    t.bigint "semestre_id"
    t.bigint "materia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_livros_on_curso_id"
    t.index ["materia_id"], name: "index_livros_on_materia_id"
    t.index ["semestre_id"], name: "index_livros_on_semestre_id"
  end

  create_table "materias", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "descricao"
    t.integer "carga_horaria"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_materias_on_curso_id"
  end

  create_table "semestres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "alunos", "cursos"
  add_foreign_key "cursos", "semestres", column: "semestre_id"
  add_foreign_key "livros", "cursos"
  add_foreign_key "livros", "materias"
  add_foreign_key "livros", "semestres", column: "semestre_id"
  add_foreign_key "materias", "cursos"
end
