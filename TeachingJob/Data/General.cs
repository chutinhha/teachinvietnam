using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeachingJob.Data
{
    public static class General
    {
        public static int PAGE_SIZE = 12;
        public static int MAX_PAGE = 10000;

        //Image path
        public static String EMP_LOGO = "~/UserData/Employer/logo/";
        public static String EMP_HIRING_ADVICE = "~/UserData/Employer/hiringadvice/";
        public static String CAN_LOGO = "~/UserData/Candidate/logo/";
        public static String EMP_ARTICLE_LOGO = "~/UserData/Employer/article_logo/";
        public static String EMP_TESTIMONIAL_LOGO = "~/UserData/Employer/testimonial_logo/";
        public static String ADMIN_IMAGE_UPLOAD = "~/UserData/ImageUpload/";
        public static String APPLY_ONLINE_IMAGE_UPLOAD = "~/UserData/Other/ApplyOnline/";
        public static int CLOSING_DATE_PERIOD = 60;

        public static int DEFAULT_JOB_SLIDE = 6;        //Max = 6

        //Mail
        public static String DOMAIN = "http://teachinvietnam.org";
        public static String CONTACT_PHONE = "0166 2025 930";
        public static String WEB_MAIL = "info@teachinvietnam.org";
        //public static String MAIL_TO_CONTACT = "info@teachinvietnam.org";
        //public static String WEB_MAIL_INTERNSHIP = "info@teachinvietnam.org";
        //public static String WEB_MAIL = "toquyen16112003@gmail.com";
        public static String MAIL_TO_CONTACT = "toquyen16112003@gmail.com";
        public static String WEB_MAIL_INTERNSHIP = "toquyen16112003@gmail.com";
        
        //Validator
        public static String REGEX_IS_VALID_DATETIME = @"^(((0?[1-9]|1[012])/(0?[1-9]|1\d|2[0-8])|(0?[13456789]|1[012])/(29|30)|(0?[13578]|1[02])/31)/(19|[2-9]\d)\d{2}|0?2/29/((19|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([2468][048]|[3579][26])00)))$";
        public static String REGEX_IS_VALID_IMAGE = @"(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$";

        public static int IMAGE_SIZE = 5242880;
        public static int GetImageSize(int image)
        {
            return image / (1024 * 1024);
        }
        public static int GetFileSizeByKB(int size)
        {
            return size / 1024;
        }
        //Active when created or not.
        public static bool ACTIVE_JOB = true;
        public static bool ACTIVE_CV = false;
        public static bool ACTIVE_PREPARATION = true;
        public static bool ACTIVE_HIRINGADVICE = false;
        public static bool ACTIVE_HIRINGADVICE_COMMENT = false;
        public static bool ACTIVE_TESTIMONIAL = false;
        public static bool ACTIVE_TESTIMONIAL_COMMENT = false;

        public static string AlertErrorJS = "Something went wrong.\\nPlease inform us this error.\\nThanks";
    }
}