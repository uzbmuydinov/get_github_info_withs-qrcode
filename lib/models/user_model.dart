// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    this.avatarUrl,
    this.htmlUrl,
    this.siteAdmin,
    this.name,
    this.blog,
    this.location,
    this.bio,

    this.publicRepos,
    this.followers,
    this.following,
  });

  int id;
  String? avatarUrl;
  String? htmlUrl;
  bool? siteAdmin;
  String? name;
  String? blog;
  String? location;
  String? bio;
  int? publicRepos;
  int? followers;
  int? following;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    avatarUrl: json["avatar_url"],
    htmlUrl: json["html_url"],
    siteAdmin: json["site_admin"],
    name: json["name"],
    blog: json["blog"],
    location: json["location"],
    bio: json["bio"],

    publicRepos: json["public_repos"],
    followers: json["followers"],
    following: json["following"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar_url": avatarUrl,
    "html_url": htmlUrl,
    "site_admin": siteAdmin,
    "name": name,
    "blog": blog,
    "location": location,
    "bio": bio,

    "public_repos": publicRepos,
    "followers": followers,
    "following": following,
  };
}
