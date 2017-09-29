import argparse
import subprocess
from subprocess import DEVNULL, STDOUT
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler


# API: http://pythonhosted.org/watchdog/_modules/watchdog/events.html
class MyHandler(FileSystemEventHandler):
  def __init__(self, src_path, dst_path, remote_hosts):
    self.src_path, self.dst_path, self.remote_hosts = src_path, dst_path, remote_hosts
    self._upload()

  def _upload(self):
    src = self.src_path
    for remote_host in self.remote_hosts:
      dst = '{}:{}'.format(remote_host, self.dst_path)
      subprocess.Popen(['rsync', '-arz', '--delete', '--exclude-from', 'ignore.txt', src, dst],
                       stdout=DEVNULL, stderr=STDOUT)

  def on_modified(self, event):
    print('modified: ', event.src_path)
    self._upload()


parser = argparse.ArgumentParser()
parser.add_argument('--src_path', type=str, default='/vision/u/zelunluo/research/cvpr18')
parser.add_argument('--dst_path', type=str, default='/home/luoa/research')
parser.add_argument('--remote_hosts', type=str, nargs='+', default=['dt1', 'dt2', 'dt3', 'dt4', 'dt5', 'dt6'])
opt = parser.parse_args()

event_handler = MyHandler(opt.src_path, opt.dst_path, opt.remote_hosts)
observer = Observer()
observer.schedule(event_handler, opt.src_path, recursive=True)
observer.start()

try:
  while True:
    time.sleep(1)
except KeyboardInterrupt:
  observer.stop()
observer.join()

