// This is a part of the CvPortfolioCubit.dart file.
part of 'cv_portfolio_cubit.dart';

// The @immutable annotation indicates that the state object should not be modified after it is created.
@immutable

// Abstract class CvPortfolioState is the base class for all the different states that the CvPortfolioCubit can be in.
abstract class CvPortfolioState {}

// Class CvPortfolioInitial represents the initial state of the CvPortfolioCubit, before any action has been taken.
class CvPortfolioInitial extends CvPortfolioState {}

// Class CvPortfolioSuccess represents the state of the CvPortfolioCubit when the CV has been successfully uploaded.
class CvPortfolioSuccess extends CvPortfolioState {
  // The file variable stores the uploaded CV file.
  final File file;

  // The CvPortfolioSuccess constructor takes the uploaded file as an argument and assigns it to the file variable.
  CvPortfolioSuccess(this.file);
}

// Class CvPortfolioLoading represents the state of the CvPortfolioCubit when the CV is being uploaded.
class CvPortfolioLoading extends CvPortfolioState {}

// Class CvPortfolioFailure represents the state of the CvPortfolioCubit when the CV upload has failed.
class CvPortfolioFailure extends CvPortfolioState {
  // The errMessage variable stores the error message associated with the failure.
  final String errMessage;

  // The CvPortfolioFailure constructor takes the error message as an argument and assigns it to the errMessage variable.
  CvPortfolioFailure({required this.errMessage});
}
