/*
 * 获取当前上传文件的所有文件实体对象
 * CodeBy:Mr.Co
 * Date:2013/5/24
*/
var SWFFileModel = function () {
    var _model = [];
    $('table#FileUploadList tbody tr').each(function () {
        var _fileObj = $(this).children('th').children('a');
        _model.push({
            OldName: _fileObj.attr('fileOldName'),
            NewName: _fileObj.attr('fileNewName'),
            Size: _fileObj.attr('fileSize'),
            Type: _fileObj.attr('fileType'),
            FileDate:_fileObj.attr('fileDate'),
            GUID: '-1',
            IsDel: '0'
        });
    });
    return _model;
}