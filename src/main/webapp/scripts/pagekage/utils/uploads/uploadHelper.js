/*
 * 文件上传
 * User: MrCo
 * Date: 13-10-11
 * Time: 下午8:11
 */
GLOBAL.namespace('utils.UploadHelper', function () {
    var _this = this;

    /*
     * 单张文件上传
     */
    _this.SingleUpload = function (args) {
        GLOBAL.load('/scripts/pagekage/utils/uploads/ajaxUpload/ajaxupload.3.6.js', '', function () {
            new AjaxUpload(args.buttonID,{
                action: args.uploadURL + '?handler=' + args.handler + '&data=' + args.parame,
                data: {},
                responseType:'json',
                name: args.postName,
                onSubmit: function (file, ext) {
                    if (!(ext && /^(jpg|JPG|png|PNG|gif|GIF)$/.test(ext))) {
                        alert("您上传的图片格式不对，请重新选择！");
                        return false;
                    }
                },
                onComplete: args.success
            });
        });
    }

});