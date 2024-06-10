        //if(topLeft.column() == 1){

            //rel = model_rel->relation(1);
            //model_rel->select();

            //model_rel->relation(topLeft.column()).tableName();

            model_sub = new QSqlRelationalTableModel(this, _db);
            // model_sub->setTable("T3"); //toString()

            model_sub->setTable(model_rel->relation(topLeft.column()).tableName());

            vv = "B1_D15D14_Признак_коррекции = '" + topLeft.data().toString() + "'"; // Обязательно заключить в одинарные ковычки! // QString::number(0);//
//B1_D15D14_Признак_коррекции
            qDebug() << vv;

            model_sub->setFilter(vv);
            model_sub->select();

            qDebug() << "Row: " << model_sub->rowCount() << "Column:" << model_sub->columnCount();

            if(model_sub->rowCount() == 1 && model_sub->columnCount() == 3){
                qDebug() << model_sub->data(model_sub->index(0, 1));
                qDebug() << model_sub->data(model_sub->index(0, 2));
                model2->item(2*std::floor(topLeft.column() / 8), topLeft.column() % 8)->setText(model_sub->data(model_sub->index(0, 1)).toString());
                model2->item(2*std::floor(topLeft.column() / 8), topLeft.column() % 8 + 1)->setText(model_sub->data(model_sub->index(0, 2)).toString());
            }

            //QBitArray *ba = new QBitArray(0, 4); // model_rel->data(model_rel->index(topLeft.row(), 2)).toInt()
            std::bitset<4> bb{static_cast<unsigned long long>(model_rel->data(model_rel->index(topLeft.row(), 2)).toInt())};
            //qDebug() << "ba_c: " << bb.count() << bb.size();
            for(size_t i = 0; i < bb.size(); i++){
                model2->item(2*std::floor(topLeft.column() / 8), topLeft.column() % 8 + 1 + i + 1)->setText( bb[bb.size() - i - 1] ? "1" : "0");
            }

            //QBitArray ba(200);
/*
            qDebug() << model_rel->relation(1).displayColumn();
            qDebug() << model_rel->relation(1).indexColumn();
            qDebug() << model_rel->relation(1).tableName();

            relD15 = QSqlRelation("T3", "B1_D15D14_Признак_коррекции", "D15");
            relD14 = QSqlRelation("T3", "B1_D15D14_Признак_коррекции", "D14");

            //model_rel->relation(1).swap(rel2);

            model_rel->setRelation(1, relD15);
            model_rel->select();

            qDebug() << model_rel->data(topLeft);

            v15 = model_rel->data(topLeft);

            model_rel->setRelation(1, relD14);
            model_rel->select();

            qDebug() << model_rel->data(topLeft);

            v14 = model_rel->data(topLeft);

            model_rel->setRelation(1, rel);
            model_rel->select();

            model2->item(2*std::floor(topLeft.column() / 8), topLeft.column() % 8)->setText(v15.toString());
            model2->item(2*std::floor(topLeft.column() / 8), topLeft.column() % 8 + 1)->setText(v14.toString());
*/
            //ui->dec_view->set

            /*

            model_sub = new QSqlRelationalTableModel(this, _db);

            model_sub->setTable("T3");

            qDebug() << topLeft.data().toString();

            model_sub->setFilter("B1_D15D14_Признак_коррекции = " + topLeft.data().toString());

            model_sub->select();

            qDebug() << "rowCount: " << model_sub->rowCount();

            model_rel->relation(1);

            rec = model_sub->record();

            qDebug() << rec;
            for (int i = 0; i < rec.count(); ++i)
                qDebug() << rec.fieldName(i);

            //qDebug() << model_sub->data(model_rel->index(0, 0));

            //qDebug() << model_sub->;*/


        /*}else if(topLeft.column() == 2){

        }*/
            break;

    case 2:
            
        bb = model_rel->data(model_rel->index(topLeft.row(), 2)).toInt();
        //bb = new std::bitset<4>{static_cast<unsigned long long>(model_rel->data(model_rel->index(topLeft.row(), 2)).toInt())};
        //qDebug() << "ba_c: " << bb.count() << bb.size();
        for(size_t i = 0; i < bb.size(); i++){
            model2->item(2*std::floor(topLeft.column() / 8), topLeft.column() % 8 + 1 + i)->setText( bb[bb.size() - i - 1] ? "1" : "0");
        }
        break;

    default:
            break;
    }


        //qDebug() << bottomRight << bottomRight.data();

        //model_rel->setData(topLeft, bottomRight.data());

        //model_rel->setItemData(topLeft, bottomRight);

        // ui->dec_view->update();

        //topLeft.model().

        //model_rel->dataChanged(topLeft, bottomRight);