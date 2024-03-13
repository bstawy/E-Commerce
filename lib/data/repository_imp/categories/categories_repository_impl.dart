import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../domain/entities/home/category_entity.dart';
import '../../../domain/entities/home/sub_category_entity.dart';
import '../../../domain/repository/categories/categories_repository.dart';
import '../../data_source/categories/categories_local_data_source.dart';
import '../../data_source/categories/categories_remote_data_source.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesLocalDataSource categoriesLocalDataSource;

  @factoryMethod
  CategoriesRepositoryImpl(
      this.categoriesRemoteDataSource, this.categoriesLocalDataSource);

  @override
  Future<Either<ServerFailure, List<Category>>> getCategories() async {
    List<Category> categories = categoriesLocalDataSource.getCategories();
    if (categories.isNotEmpty) {
      return Right(categories);
    }

    var response = await categoriesRemoteDataSource.getCategories();

    return response.fold(
      (serverFailure) {
        return Left(serverFailure);
      },
      (categories) {
        return Right(categories);
      },
    );
  }

  @override
  Future<Either<ServerFailure, List<SubCategory>>> getSubCategoriesOnCategory(
      String categoryId) async {
    List<SubCategory> subCategories =
        categoriesLocalDataSource.getSubCategoriesOnCategory(categoryId);
    if (subCategories.isNotEmpty) {
      debugPrint(
          "============= Repository =============\n${subCategories.toString()}");
      return Right(subCategories);
    }

    var response =
        await categoriesRemoteDataSource.getSubCategoriesOnCategory(categoryId);

    return response.fold(
      (serverFailure) {
        return Left(serverFailure);
      },
      (subCategories) {
        return Right(subCategories);
      },
    );
  }
}
