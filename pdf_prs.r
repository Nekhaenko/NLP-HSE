check.and.install.Package<-function(package_name){
  if(!package_name%in%installed.packages()){
    install.packages(package_name)
  }
  else{
    library(pdftools)
  }
}

check.and.install.Package("pdftools")

# install.packages('stringr')
library(stringr)


base_dir= 'C:/Users/User/txt1/'

files <- list.files(path = "D:/freelance/pdf1/",pattern = ".pdf")

for(f in files) {
  print(f)
  f7 = "D:/freelance/pdf1/"
  f1 = paste(f7, f, sep='')
  txt <- pdf_text(f1)
  pos = grep('.', f)
  file_name = substring(f, 0,str_length(f)-4)
  
  dir.create(file.path(base_dir,  file_name))
  write.table(txt, paste(base_dir, file_name,'/',"full.txt",sep = ''), quote=FALSE, sep="\t", eol ="\r\n", 
              row.names=FALSE, col.names= FALSE)

  dir.create(file.path(base_dir,  file_name))
  
  i= 1
  while (is.na(txt[i])== FALSE)
    {
    file1 = paste(base_dir, file_name,'/', i,'.txt',sep = '')
    write.table(txt[i], file1, quote=FALSE, sep="\t", eol ="\r\n", row.names=FALSE, col.names= FALSE)
    i = i+1
    }
}
# getwd()
#system('python3 pars_table.py')
