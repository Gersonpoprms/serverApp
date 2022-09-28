import multer from "multer";
export const saveFile = async (req, res, next) => {
  const upload = multer();
  /**
   *  Configuracion de Multer para multipart/formData
   */

  var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, path.join(__dirname, "/uploads"));
    },
    filename: function (req, file, cb) {
      console.log("file", file);
      fileExtension = file.originalname.split(".")[1];
      cb(null, file.fieldname + "-" + Date.now() + "." + fileExtension);
    }
  });
  next();
};