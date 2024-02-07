// Part of the image_portfolio_cubit.dart file
part of 'image_portfolio_cubit.dart';

// Immutable annotation makes the class immutable, meaning its state cannot be changed after it is created.
@immutable
// Abstract class for the different states of the Image Portfolio Cubit
abstract class ImagePortfolioState {}

// Initial state of the Cubit, where no image has been selected yet.
class ImagePortfolioInitial extends ImagePortfolioState {}

// State when an image has been successfully selected and its URL is available.
class ImagePortfolioSuccess extends ImagePortfolioState {
  // URL of the selected image.
  final String imageUrl;

  // Constructor for ImagePortfolioSuccess state.
  ImagePortfolioSuccess(this.imageUrl);
}

// State when the Cubit is loading an image.
class ImagePortfolioLoading extends ImagePortfolioState {}

// State when the Cubit encounters an error while selecting an image.
class ImagePortfolioFailure extends ImagePortfolioState {
  // Error message associated with the failure.
  final String errMessage;

  // Constructor for ImagePortfolioFailure state.
  ImagePortfolioFailure({required this.errMessage});
}
