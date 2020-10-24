import 'package:flutter_blog/models/category_model.dart';
import 'package:flutter_blog/models/post_model.dart';

enum TypeUser{admin, normal}
class UserGlobalModel {
  int id;
  String nome;
  String sobrenome;
  String cidade;
  String email;
  bool status;
  TypeUser typeUser;
  List<CategoryModel> categorias;
  List<PostModel> postagens;

  UserGlobalModel({
	this.id,
	this.nome,
	this.sobrenome,
	this.cidade,
	this.email,
	this.status,
	this.typeUser,
	this.categorias,
	this.postagens});

  UserGlobalModel.fromJson(Map<String, dynamic> json) {
	id = int.parse(json['id_usuario']);
	nome = json['nome'];
	sobrenome = json['sobrenome'];
	cidade = json['cidade'];
	email = json['email'];
	status = json['status'] == 1;
	typeUser = json['funcao'] == "1" ? TypeUser.admin : TypeUser.normal;
	if (json['categorias'] != null) {
	  categorias = List<CategoryModel>();
	  json['categorias'].forEach((v) {
		categorias.add(CategoryModel.fromJson(v));
	  });
	}
	if (json['postagens'] != null) {
	  postagens = List<PostModel>();
	  json['postagens'].forEach((v) {
		postagens.add(PostModel.fromJson(v));
	  });
	}
  }

  Map<String, dynamic> toJson() {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id_usuario'] = this.id;
	data['nome'] = this.nome;
	data['sobrenome'] = this.sobrenome;
	data['cidade'] = this.cidade;
	data['email'] = this.email;
	data['status'] = this.status;
	data['funcao'] = this.typeUser;
	if (this.categorias != null) {
	  data['categorias'] = this.categorias.map((v) => v.toJson()).toList();
	}
	if (this.postagens != null) {
	  data['postagens'] = this.postagens.map((v) => v.toJson()).toList();
	}
	return data;
  }
}
