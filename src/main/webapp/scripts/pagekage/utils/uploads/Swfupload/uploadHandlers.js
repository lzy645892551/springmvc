/*
 * 文件上传
 * CodeBy:Mr.Co
 * Date:2013/5/23
*/
var SWFUploadHandlers = {
    FileQueueError: function (file, errorCode, message) {
        try {
            var errorName = "";
            switch (errorCode) {
                case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                    errorName = "温馨提示：每次只能上传单个文件！";
                    break;
                case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                    break;
                case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                    errorName = "温馨提示：上传文件过大！";
                    break;
                case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                default:
                    alert(message);
                    break;
            }
            if (errorName != '') {
                alert(errorName);
            }
        } catch (ex) {
            swf.debug(ex);
        }
    },
    FileDialogComplete: function (numFilesSelected, numFilesQueued) {
        try {
            if (numFilesQueued > 0) {
                this.startUpload();
            }
        } catch (ex) {
            this.debug(ex);
        }
    },
    UploadProgress: function (file, bytesLoaded) {
        try {
            var _size = $('table#FileUploadList tbody tr[class=cur_upload]').size(),
                _index = 0; 
            if (_size < 1) {
                var _bgColor = $('table#FileUploadList tbody tr').size() % 2 === 0 ? '' : '#EBF8FF';
                $('table#FileUploadList tbody').append('<tr class="cur_upload" style="background:' + _bgColor + '"><th><div class="upload_progress_bar"><span id="upload_progress" class="upload_progress"></span></div><span id="progress_tip" class="progress_tip"></span></th><td width="84" ><span class="ml_20">删除</span></td>');
            }            
            var _progress = $('span#upload_progress'),
                _progressTip = $('span#progress_tip'),
                _percent = Math.ceil((bytesLoaded / file.size) * 100),
                _parcent2 = _percent > 100 ? 100 : _percent;
            _progress.css({ width: _parcent2 + '%' });
            //_progressTip.text(_parcent2 + '%');
        } catch (ex) {
            this.debug(ex);
        }
    },
    UploadError: function (file, errorCode, message) {
        var progress;
        try {
            switch (errorCode) {
                case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                    try {

                    }
                    catch (ex1) {
                        this.debug(ex1);
                    }
                    break;
                case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                    try {

                    }
                    catch (ex2) {
                        this.debug(ex2);
                    }
                    break;
                case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                    //imageName = "uploadlimit.gif";
                    break;
                default:
                    alert(message);
                    break;
            }
        } catch (ex3) {
            this.debug(ex3);
        }
    },
    UploadMultiFile: function (swf) {
        setTimeout(function () {
            if (swf.getStats().files_queued > 0) {
                swf.startUpload();
            } else {
                swf.setFileUploadLimit(0);
            }
        }, 1000);
    }
}

var FileUpload = function (args) {      
    new SWFUpload({
        button_placeholder_id: args.ButtonID,
        upload_url: args.UploadURL,// + '?fileName=' + args.FileName + '&data=' + args.PARAME,
        file_size_limit: args.FileSize,//'10 MB',
        button_window_mode: 'transparent',
        file_types: '*.jpg;*.png;*.jpeg;*.gif;*.xlsx;*.txt;*.docx;*.doc;*.xls;*.ppt;*.pptx;*.pdf',
        file_types_description: '.jpg;.png;.jpeg;.gif;.xlsx;.txt;.docx;.doc;.xls;.ppt;.pptx;.pdf',
        file_upload_limit: 0,
        button_image_url: "/Scripts/pagekage/utils/uploads/Swfupload/XPButtonNoText_160x22.png",
        button_width: 160,
        button_height: 22,
        flash_url: "/Scripts/pagekage/utils/uploads/Swfupload/swfupload/swfupload.swf",
        file_queue_error_handler: SWFUploadHandlers.FileQueueError,
        file_dialog_complete_handler: SWFUploadHandlers.FileDialogComplete,
        upload_progress_handler: SWFUploadHandlers.UploadProgress,
        upload_error_handler: SWFUploadHandlers.UploadError,
        upload_success_handler:args.UploadSuccessHandler
        //upload_success_handler: function (file, serverData) {            
            //serverData = eval('(' + serverData + ')');
            //if (serverData) {
            //    var _fileAttr = ' fileNewName="' + serverData.FileNewName + '" fileOldName="' + serverData.FileOldName + '" fileSize="' + serverData.FileSize + '" fileType="' + serverData.FileType + '"';
            //    $('table#FileUploadList tbody tr.cur_upload th:first').html('<a ' + _fileAttr + ' href="/Upload/' + serverData.FileDate + '/' + serverData.FileNewName + '" target="_blank">' + serverData.FileOldName + '</a>').parent().removeClass('cur_upload');
            //} else {
            //    $('table#FileUploadList tbody tr.cur_upload th:first').html('文件"' + file.name + '"上传失败！').parent().removeClass('cur_upload');
            //}
            //SWFUploadHandlers.UploadMultiFile(this);
        //}
    });

}