#include <iostream>

#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

int main()
{
	for (int a = 1; a < 24; a++)
	{
		string name = format("img/cap/%d.bmp", a);
		string name_L = format("img/left/L%d.bmp", a);
		string name_R = format("img/right/R%d.bmp", a);

		Mat cap_img = imread(name);
		if (cap_img.data == 0) {
			printf("Image read error!\n");
			break;
		}
		else{
			Rect area_L(0, 0, 1280, 720);
			Rect area_R(1280, 0, 1280, 720);
			Mat img_L = cap_img(area_L);
			Mat img_R = cap_img(area_R);
			imwrite(name_L, img_L);
			imwrite(name_R, img_R);
		}
	}
	return 0;
}
