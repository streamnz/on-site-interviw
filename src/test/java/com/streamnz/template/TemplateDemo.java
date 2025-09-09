package com.streamnz.template;

/**
 * @Author cheng hao
 * @Date 09/09/2025 18:48
 */
public class TemplateDemo {

    static abstract class DataImporter{
        // 模板方法
        public final void importData(String raw){
            parseData(raw);
            validateData();
            transformData();
            saveData();
        }
        // hook method
        protected abstract void parseData(String raw);
        protected abstract void validateData();
        protected abstract void transformData();

        protected void saveData(){
            System.out.println("Data saved");
        }
    }


    static class CSVImporter extends DataImporter{
        @Override
        protected void parseData(String raw) {
            System.out.println("Parsing CSV data: " + raw);
        }

        @Override
        protected void validateData() {
            System.out.println("Validating CSV data");
        }

        @Override
        protected void transformData() {
            System.out.println("Transforming CSV data");
        }
    }

    static class XMLImporter extends DataImporter{
        @Override
        protected void parseData(String raw) {
            System.out.println("Parsing XML data: " + raw);
        }

        @Override
        protected void validateData() {
            System.out.println("Validating XML data");
        }

        @Override
        protected void transformData() {
            System.out.println("Transforming XML data");
        }
    }

    public static void main(String[] args) {
        DataImporter csvImporter = new CSVImporter();
        csvImporter.importData("name,age\nAlice,30\nBob,25");

        System.out.println("-----");

        DataImporter xmlImporter = new XMLImporter();
        xmlImporter.importData("<users><user><name>Alice</name><age>30</age></user><user><name>Bob</name><age>25</age></user></users>");
    }
}
