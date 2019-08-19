#
#
#
#  Auto-move-files
#
#  Moves recently created or moved files on your Downloads folder 
#  into their content specific folders (Music, Video, etc)
#
#  Modify 'user' and folder paths to match your folder structure
#
#  Created by Gilberto "Onizudo" Timotheo
#
#
#

from time import localtime, strftime, sleep
import os
import shutil
import mimetypes
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

# All folder locations
user = "junior"
homeFolder = "/home/{}".format(user)
downloadPath = "{}/Downloads".format(homeFolder)
soundPath = "{}/Música".format(homeFolder)
imagePath = "{}/Imagens".format(homeFolder)
docPath = "{}/Documentos".format(homeFolder)
videoPath = "{}/Vídeos".format(homeFolder)


class moveFile(FileSystemEventHandler):
    # Extension base used for content type sorting
    extensions = {
        'image': ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.psd', '.tiff'],
        'video': ['.mp4', '.m4v', '.f4v', '.f4a', '.m4b', '.m4r', '.mxf',
                  '.f4b', '.mov', '.3gp', '.3gp2', '.3g2', '.3gpp', '.3gpp2',
                  '.oga', '.ogv', '.ogx', '.wmv', '.asf', '.flv', '.avi', '.hdv'],
        'doc': ['.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.odt', '.fodt',
                '.ods', '.fods', '.odp', '.fodp', '.odg', '.fodg', '.odf', '.pdf',
                '.ms', '.groff', '.txt', '.tar', '.tar.gz', '.rar', '.zip', '.7z',
                '.deb', '.rpm', '.AppImage', '.tgz', '.exe', '.iso', '.otf'],
        'sound': ['.wav', '.mid', '.ogg', '.mp3', '.raw', '.wma', '.m4a', '.webm']
    }

    # Check for content types (image, video, sound, document)
    def isImageFile(self, ext):
        if ext in self.extensions['image']:
            return True
        else:
            return False

    def isVideoFile(self, ext):
        if ext in self.extensions['video']:
            return True
        else:
            return False

    def isSoundFile(self, ext):
        if ext in self.extensions['sound']:
            return True
        else:
            return False

    def isDocFile(self, ext):
        if ext in self.extensions['doc']:
            return True
        else:
            return False

    # Checks for file type and moves it to the correct folder
    def moveCurrentFile(self, fileName, ext, eventFile):
        print("Nome: {} - Ext: {}".format(fileName, ext))
        currentDate = strftime('%Y%m%d%H%M', localtime())
        newFileName = "{}_{}".format(currentDate, fileName)
        path = ""
        hasPath = False
        if self.isImageFile(ext):
            path = imagePath
            hasPath = True
        if self.isDocFile(ext):
            path = docPath
            hasPath = True
        if self.isSoundFile(ext):
            path = soundPath
            hasPath = True
        if self.isVideoFile(ext):
            path = videoPath
            hasPath = True
        if !hasPath:
            path = docPath
        oldFile = "{}/{}{}".format(downloadPath, fileName, ext)
        newFile = "{}/{}{}".format(path, newFileName, ext)
        shutil.move(oldFile, newFile)
        print("File {}{} moved to {}".format(newFileName, ext, path))

    def handleFile(self, event):
        eventFile = os.path.basename(event.src_path)
        filename, fileExt = os.path.splitext(eventFile)
        if fileExt:
            self.moveCurrentFile(filename, fileExt, eventFile)

    def on_moved(self, event):
        self.handleFile(event)

    def on_created(self, event):
        self.handleFile(event)

# Main Method
if __name__ == "__main__":
    eventHandler = moveFile()
    observer = Observer()
    observer.schedule(eventHandler, downloadPath, recursive=False)
    observer.start()
    try:
        while True:
            sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
