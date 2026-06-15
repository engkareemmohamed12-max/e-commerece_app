import 'package:e_commerece_app/api/models/response/category_brand/common/metadata_dto.dart';
import 'package:e_commerece_app/domain/entities/response/common/metadata.dart';
import 'package:flutter/material.dart';

extension MetadataMapper on MetadataDto {
  Metadata toMetaData(){

    return Metadata(
      currentPage: currentPage,
      limit: limit,
      numberOfPages: numberOfPages
    );
  }
}