import 'package:dotted_border/dotted_border.dart'; //import library for dotted border
import 'package:flutter/material.dart'; //import flutter material dart
import 'package:job_finder_app/utils/app_images.dart'; //import app images dart
import '../../../utils/app_fonts.dart'; //import app fonts dart

//Create a class for CustomDottedUploadFiles
class CustomDottedUploadFiles extends StatelessWidget {
  //Define the constructor
  const CustomDottedUploadFiles({
    super.key,
    this.onTap, //Function to be called when the container is tapped
    this.removeFile, //Function to be called when the remove file button is pressed
    this.fileName, //The name of the file to be uploaded
    this.fileSize, //The size of the file to be uploaded
  });

  //Define the onTap function
  final Function()? onTap;

  //Define the removeFile function
  final Function()? removeFile;

  //Define the fileName
  final String? fileName;

  //Define the fileSize
  final String? fileSize;

  //Define the build function
  @override
  Widget build(BuildContext context) {
    //Return a column
    return Column(
      //Set the crossAxisAlignment to CrossAxisAlignment.start
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Add a SizedBox with height 20
        const SizedBox(height: 20),
        //Add a GestureDetector
        GestureDetector(
          //Set the onTap function
          onTap: onTap,
          child: DottedBorder( //Add DottedBorder
            //Set the borderType to BorderType.RRect
            borderType: BorderType.RRect,
            //Set the radius to Radius.circular(8)
            radius: const Radius.circular(8),
            //Set the color to Color(0xff3366FF)
            color: const Color(0xff3366FF),
            //Set the strokeWidth to 2
            strokeWidth: 2,
            //Set the dashPattern to [8, 4]
            dashPattern: const [8, 4],
            //Add a Container
            child: Container(
              //Set the width to double.infinity
              width: double.infinity,
              //Set the padding to EdgeInsets.all(16)
              padding: const EdgeInsets.all(16),
              //Set the decoration to BoxDecoration
              decoration: BoxDecoration(
                //Set the color to Color(0xffECF2FF)
                color: const Color(0xffECF2FF),
                //Set the borderRadius to BorderRadius.circular(8)
                borderRadius: BorderRadius.circular(8),
              ),
              //Add a Column
              child: Column(
                children: [
                  //If fileName is not null, show an Image.asset of AppImages.kPDF, otherwise show a CircleAvatar
                  fileName != null
                      ? Image.asset(AppImages.kPDF)
                      : CircleAvatar(
                          //Set the radius to 30
                          radius: 30,
                          //Set the backgroundColor to Color(0xffD6E4FF)
                          backgroundColor: const Color(0xffD6E4FF),
                          //Add an Image.asset of AppImages.kDocument
                          child: Image.asset(AppImages.kDocument),
                        ),
                  //Add a SizedBox with height 10
                  const SizedBox(height: 10),
                  //Add a Text with the fileName or 'Upload your other file' if fileName is null
                  Text(
                    fileName ?? ' Upload your other file',
                    //Set the style to TextStyle
                    style: const TextStyle(
                      //Set the color to Color(0xff111827)
                      color: Color(0xff111827),
                      //Set the fontFamily to AppFonts.kLoginHeadlineFont
                      fontFamily: AppFonts.kLoginHeadlineFont,
                      //Set the fontSize to 18
                      fontSize: 18,
                    ),
                  ),
                  //Add a SizedBox with height 10
                  const SizedBox(height: 10),
                  //Add a Text with the fileSize or 'Max. file size 10 MB' if fileSize is null
                  Text(
                    fileSize ?? 'Max. file size 10 MB',
                    //Set the style to TextStyle
                    style: const TextStyle(
                      //Set the color to Color(0xff6B7280)
                      color: Color(0xff6B7280),
                      //Set the fontFamily to AppFonts.kLoginSubHeadlineFont
                      fontFamily: AppFonts.kLoginSubHeadlineFont,
                      //Set the fontSize to 12
                      fontSize: 12,
                    ),
                  ),
                  //Add a SizedBox with height 25
                  const SizedBox(height: 25),
                  //Add a Container with a BoxDecoration, a padding, and a Row
                  Container(
                    //Set the padding to EdgeInsets.symmetric(vertical: 16)
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    //Set the decoration to BoxDecoration
                    decoration: BoxDecoration(
                      //Set the borderRadius to BorderRadius.circular(100)
                      borderRadius: BorderRadius.circular(100),
                      //Set the border to Border.all
                      border: Border.all(
                        //Set the color to Color(0xff3366FF)
                        color: const Color(0xff3366FF),
                      ),
                      //Set the color to Color(0xffD6E4FF)
                      color: const Color(0xffD6E4FF),
                    ),
                    //If fileName is not null, show a Row with a Done icon and 'Uploaded' text, otherwise show a Row with an Add file icon and 'Add file' text
                    child: fileName != null
                        ? const Row(
                            //Set the mainAxisAlignment to MainAxisAlignment.center
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Add an Icon with an Icons.done icon
                              Icon(Icons.done),
                              //Add a SizedBox with width 10
                              SizedBox(width: 10),
                              //Add a Text with 'Uploaded'
                              Text('Uploaded'),
                            ],
                          )
                        : Row(
                            //Set the mainAxisAlignment to MainAxisAlignment.center
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Add a ColorFiltered with a ColorFilter.mode and Image.asset of AppImages.kExport
                              ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xff3366FF),
                                    BlendMode.modulate,
                                  ),
                                  child: Image.asset(AppImages.kExport)),
                              //Add a SizedBox with width 10
                              const SizedBox(width: 10),
                              //Add a Text with 'Add file'
                              const Text('Add file'),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
