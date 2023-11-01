import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { DownloadFileService } from './download-file.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'insurance-management';

  // constructor(private http: HttpClient, private downloadFileService:DownloadFileService) {}

  // name: string = '';
  // file: any;
  // FilePath: any = '';
  // FileRef: any = '';

  // getName(name: string) {
  //   this.name = name;
  // }

  // getFile(event: any) {
  //   this.file = event.target.files[0];
  //   console.log('file', this.file);
  // }

  // submitData() {
  //   let formData = new FormData();
  //   formData.set('name', this.name);
  //   formData.set('file', this.file);

  //   this.http
  //     .post('http://localhost:5250/api/Upload', formData)
  //     .subscribe((response) => {});
  // }

  // downloadFile()  {
  //   this.downloadFileService.downloadFile().subscribe(
  //     response=>{
  //       let fileName=response.headers.get('content-disposition')
  //       ?.split(';')[1].split('=')[1];

  //       let blob:Blob = response.body as Blob;
  //       let a:any = document.createElement('a');
  //       a.download = fileName;
  //       this.FilePath = fileName;
  //       a.href = window.URL.createObjectURL(blob);
  //       this.FileRef = a.href;
  //       //a.click();
  //     }
  //   )
  // }


}
