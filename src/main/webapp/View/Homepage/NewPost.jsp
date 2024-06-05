<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng bài viết</title>
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            width: 100%;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            background-color: #333;
            color: #fff;
            overflow: hidden;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #444;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: orange;
        }

        .publish-btn {
            background-color: orange;
            border: none;
            padding: 10px 20px;
            color: #fff;
            cursor: pointer;
        }

        .editor-container {
            display: flex;
            flex-direction: column;
            padding: 10px;
            flex: 1;
            overflow: hidden;
        }

        .title {
            padding: 10px;
            font-size: 12px;
            margin-bottom: 10px;
            background-color: #555;
            color: #fff;
            border: none;
            outline: none;
        }

        .toolbar {
            display: flex;
            margin-bottom: 10px;
        }

        .toolbar-btn {
            background-color: #555;
            border: none;
            padding: 10px;
            color: #fff;
            cursor: pointer;
            margin-right: 5px;
        }

        .editor {
            flex: 1;
            padding: 10px;
            background-color: #222;
            color: #fff;
            border: none;
            outline: none;
            overflow-y: auto;
        }

        .sidebar {
            width: 300px;
            background-color: #444;
            padding: 10px;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
        }

        .setting {
            margin-bottom: 20px;
        }

        .setting-item {
            background-color: #555;
            padding: 10px;
            margin-top: 5px;
        }

        .divider {
            height: 2px;
            background-color: #555;
            margin: 10px 0;
        }

        #image-upload {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="main-content">
            <header class="header">
                <div class="logo">BLOG</div>
                <form action="Index">
                <button type="submit" class="publish-btn">Đăng tin</button>
                </form>
            </header>
            <div class="editor-container">
                <input type="text" class="title" placeholder="Tiêu đề">
                <div class="toolbar">
                    <button class="toolbar-btn" id="bold-btn">B</button>
                    <button class="toolbar-btn" id="italic-btn">I</button>
                    <button class="toolbar-btn" id="underline-btn">U</button>
                    <button class="toolbar-btn" id="image-btn">Hình ảnh</button>
                </div>
                <input type="file" id="image-upload" accept="image/*">
                <div class="editor" contenteditable="true"></div>
            </div>
        </div>
        <aside class="sidebar">
            <div class="setting">
                <h3>Thông tin bài đăng</h3>
            </div>
            <div class="divider"></div>
            <div class="setting">
                <h3>Được xuất bản vào</h3>
                <div class="setting-item" id="publish-time"></div>
            </div>
        </aside>
    </div>

    <script>
        function updatePublishTime() {
            const now = new Date();
            const formattedDate = now.toLocaleDateString('vi-VN');
            const formattedTime = now.toLocaleTimeString('vi-VN');
            document.getElementById('publish-time').textContent = formattedDate + " " + formattedTime;
        }

        document.addEventListener('DOMContentLoaded', updatePublishTime);
        setInterval(updatePublishTime, 1000);

        document.getElementById('image-btn').addEventListener('click', function() {
            document.getElementById('image-upload').click();
        });

        document.getElementById('image-upload').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.style.maxWidth = '100%';
                    document.querySelector('.editor').appendChild(img);
                };
                reader.readAsDataURL(file);
            }
        });

        document.getElementById('bold-btn').addEventListener('click', function() {
            document.execCommand('bold');
        });

        document.getElementById('italic-btn').addEventListener('click', function() {
            document.execCommand('italic');
        });

        document.getElementById('underline-btn').addEventListener('click', function() {
            document.execCommand('underline');
        });
    </script>
</body>
</html>
