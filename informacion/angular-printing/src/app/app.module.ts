import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { PrintPageComponent } from './print-page/print-page.component';
import { MainPageComponent } from './main-page/main-page.component';

@NgModule({
  imports:      [ BrowserModule, FormsModule ],
  declarations: [ AppComponent, PrintPageComponent, MainPageComponent ],
  bootstrap:    [ AppComponent ]
})
export class AppModule { }
