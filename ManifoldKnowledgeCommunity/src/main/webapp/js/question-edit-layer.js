/**
 * 用于打开登录窗口
 */
function openQuestionEdit() {
    var url = 'question-edit.html';

    //弹出窗口
    layer.open({
        type: 2,
        title: '问题编辑',
        content: url,
        skin: 'my-layer-skin',
        area: ['575px', '375px'],
        maxmin: true

    });
}