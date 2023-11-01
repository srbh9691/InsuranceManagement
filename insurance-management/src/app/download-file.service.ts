import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DownloadFileService {

  constructor(private http:HttpClient) { }

  downloadFile()
  {
    return this.http.get('http://localhost:5250/api/download',
    {observe: 'response', responseType:'blob'})
  }
}
