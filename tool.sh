#!/bin/sh
#
#  Created by TienAnh on 26/07/2023.
#
chmod +x ./tool.sh

folderName=$1
DesignPath="/Users/user/SyncFlutterApp/SynologyDrive/designer"

changeIntroductionImages() {
    folderPath="$DesignPath/$folderName/app_images/apps"

    source_folder="./introduction_images"
    index=1

    for file in "$source_folder"/*.png; do
        filename=$(basename "$file")
        extension="${filename##*.}"

        new_filename="introduction_image_$index.$extension"

        cp "$file" "$folderPath/$new_filename"

        ((index++))
    done
}

changeStudyPlanImages() {
    folderPath="$DesignPath/$folderName/app_images/apps"

    source_folder="./study_plan_images"

    for file in "$source_folder"/*.png; do
        filename=$(basename "$file")
        extension="${filename##*.}"

        if [[ $filename == "6.png" ]]; then
            new_filename="study_plan_level.$extension"
        elif [[ $filename == "7.png" ]]; then
            new_filename="study_plan_week_days.$extension"
        elif [[ $filename == "8.png" ]]; then
            new_filename="study_plan_practice_time.$extension"
        else 
            new_filename="study_plan_analyzing_image.$extension"
        fi

        cp "$file" "$folderPath/$new_filename"

    done
}

changeFinalTestImages() {
    folderPath="$DesignPath/$folderName/app_images/apps"

    source_folder="./final_test_images"

    for file in "$source_folder"/*.jpeg; do
        filename=$(basename "$file")
        extension="${filename##*.}"

        new_filename="final_test_detail.$extension"

        cp "$file" "$folderPath/$new_filename"

    done
}

changeBackgroundGameImages() {
    folderPath="$DesignPath/$folderName/app_images/apps"

    source_folder="./background_game_images"

    for file in "$source_folder"/*.jpeg; do
        filename=$(basename "$file")
        extension="${filename##*.}"

        new_filename="background_game.jpg"

        cp "$file" "$folderPath/$new_filename"

    done
}

process() {
    changeIntroductionImages
    changeStudyPlanImages
    changeFinalTestImages
    changeBackgroundGameImages
}

process