import { AfterViewInit, Component, ElementRef, OnInit, QueryList, ViewChildren } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { IncentivoModel } from 'src/app/models/usuario/IncentivoModel';
import { LoginService } from 'src/app/services/login.service';

import { Clipboard } from '@angular/cdk/clipboard';
import { AcoordionModel } from 'src/app/models/AcoordionModel/AcoordionModel';
import { DialogContentComponent } from 'src/app/components/dialog-content/dialog-content.component';
import { MatDialog } from '@angular/material/dialog';
import { TranslateService } from '@ngx-translate/core';
import { FaqService } from 'src/app/services/faq.service';
import { FaqPortal } from 'src/app/models/FaqPortalModel/FaqPortal';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {


  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private loginService: LoginService,
    private clipboard: Clipboard,
    public dialog: MatDialog,
    private translate: TranslateService,
    public faqService: FaqService
  ) {


  }



  ngOnInit(): void {

    // localStorage.clear();
    // sessionStorage.clear();


    this.mapearDivsEAlterarValor0();
    this.mapearDivsEAlterarValor();

    this.showSlides(this.slideIndex);

    this.showSlides2(this.slideIndex2);

    this.carregaLista(1);

  }




  slideIndex: number = 1;
  plusSlides(n: number) {
    this.showSlides(this.slideIndex += n);
  }

  currentSlide(n: number) {
    this.showSlides(this.slideIndex = n);
  }

  showSlides(n: number) {
    let i: number;
    let slides = document.getElementsByClassName("mySlides") as HTMLCollectionOf<HTMLElement>;
    let dots = document.getElementsByClassName("dot") as HTMLCollectionOf<HTMLElement>;
    if (n > slides.length) { this.slideIndex = 1; }
    if (n < 1) { this.slideIndex = slides.length; }
    for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[this.slideIndex - 1].style.display = "block";
    dots[this.slideIndex - 1].className += " active";


  }



  slideIndex2: number = 2;
  plusSlides2(n: number) {
    this.showSlides2(this.slideIndex2 += n);
  }

  currentSlide2(n: number) {
    this.showSlides2(this.slideIndex2 = n);
  }

  showSlides2(n: number) {
    let i: number;
    let slides = document.getElementsByClassName("mySlides2") as HTMLCollectionOf<HTMLElement>;
    let dots = document.getElementsByClassName("dot2") as HTMLCollectionOf<HTMLElement>;
    if (n > slides.length) { this.slideIndex2 = 1; }
    if (n < 1) { this.slideIndex2 = slides.length; }
    for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[this.slideIndex2 - 1].style.display = "block";
    dots[this.slideIndex2 - 1].className += " active";
  }


  listAcoordionModel: Array<AcoordionModel>;

  carregaLista(key: number) {
    this.faqService.ListFaqPortal()
      .subscribe((response: FaqPortal[]) => {
        if (response) {
          const filteredResponse = response.filter(x => x.IdKeyFaq === key);
          const listMensagens = filteredResponse.map(x => {
            const item = new AcoordionModel();
            item.Title = x.TitleFaq;
            item.Conteudo = x.TextoFaq;
            item.Open = false;
            return item;
          });
          this.listAcoordionModel = listMensagens;
        }
      }, 
      error => console.error(error));
  }
    // var listMensagens = [];
    // for (let index = 0; index < 4; index++) {

    //   var item = new AcoordionModel();

    //   item.Title = "¿El directorio cuenta con una clasificación por sector económico?";
    //   item.Conteudo = "Nam sit amet neque auctor, dignissim augue eu, condimentum justo. Fusce fermentum tempus sapien, a sagittis tellus mattis id. Cras et enim ex.";
    //   item.Open = false;

    //   listMensagens.push(item);
    // }

    // this.listAcoordionModel = listMensagens;



  keyAcoordion: number = 1;
  selectKeyAcoordion(key: number) {
    this.keyAcoordion = key;

    this.carregaLista(key);
  }

  changerItem(item: AcoordionModel, open: boolean) {
    item.Open = open;
  }


  numero = 1;
  min = 1;
  max = 999999999;
  duracao = 3500; // 4 segundos

  mapearDivsEAlterarValor() {
    const divsValor1 = document.querySelectorAll('.valor1');

    divsValor1.forEach((div) => {
      const numeroElement = div.querySelector('span'); // Supondo que o número esteja dentro de uma tag <span> dentro da div

      if (numeroElement) {
        const maxValue = parseInt(numeroElement.innerText);

        for (let i = this.min; i <= maxValue; i++) {
          setTimeout((nr) => {
            numeroElement.innerHTML = nr.toString() + "K+";
          }, i * this.duracao / maxValue, i);
        }
      }
    });
  }


  mapearDivsEAlterarValor0() {
    const divsValor1 = document.querySelectorAll('.valor0');

    divsValor1.forEach((div) => {
      const numeroElement = div.querySelector('span'); // Supondo que o número esteja dentro de uma tag <span> dentro da div

      if (numeroElement) {
        const maxValue = parseInt(numeroElement.innerText);

        for (let i = this.min; i <= maxValue; i++) {
          setTimeout((nr) => {
            numeroElement.innerHTML = nr.toString() + "+";
          }, i * this.duracao / maxValue, i);
        }
      }
    });
  }


  openPopup() {
    this.openDialog(1);
  }


  openDialog(dialogType: number) {
    // reference https://material.angular.io/components/dialog/examples    
    const dialogRef = this.dialog.open(DialogContentComponent);
    dialogRef.componentInstance.dialogType = dialogType;
    dialogRef.afterClosed().subscribe(result => {
      console.log(`Dialog result: ${result}`);
    });
    //  const dialogRef = this.dialog.open(SearchDialogComponent, { disableClose: true });
  }




}


