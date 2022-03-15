<?xml version="1.0" encoding="UTF-8"?>
<MethodPresentation classId="MAIN_DOCUM" formatVersion="1.2" shortName="S226_DOC_PRINT">
    <Properties>
        <Hotkey>Alt+F2</Hotkey>
        <InterpretBufferCommands>true</InterpretBufferCommands>
        <UserDriven>true</UserDriven>
    </Properties>
    <Parameters/>
    <Variables/>
    <Controls>
        <Form>
            <Properties>
                <Caption>S226. Выгрузка документов льготных кредитов</Caption>
                <Height>170</Height>
                <ValidateName>Form1</ValidateName>
                <Width>474</Width>
            </Properties>
            <Controls>
                <Button>
                    <Properties>
                        <Caption>OK</Caption>
                        <Height>24</Height>
                        <Left>176</Left>
                        <Qualifier>OK</Qualifier>
                        <TabIndex>1</TabIndex>
                        <Tips>Выполнить операцию</Tips>
                        <Top>132</Top>
                        <ValidateName>Ok</ValidateName>
                        <Width>140</Width>
                    </Properties>
                </Button>
                <Button>
                    <Properties>
                        <Caption>Отмена</Caption>
                        <Height>24</Height>
                        <Left>324</Left>
                        <Qualifier>CANCEL</Qualifier>
                        <TabIndex>2</TabIndex>
                        <Tips>Отказ от выполнения</Tips>
                        <Top>132</Top>
                        <ValidateName>Cancel</ValidateName>
                        <Width>140</Width>
                    </Properties>
                </Button>
                <Label>
                    <Properties>
                        <BevelOuter>0</BevelOuter>
                        <Caption>Отчетный период:</Caption>
                        <Height>24</Height>
                        <Left>8</Left>
                        <Tips>Надпись</Tips>
                        <Top>8</Top>
                        <ValidateName>Label3</ValidateName>
                        <Width>236</Width>
                    </Properties>
                </Label>
                <Label>
                    <Properties>
                        <BevelOuter>0</BevelOuter>
                        <Caption>Дата начала</Caption>
                        <Height>24</Height>
                        <Left>8</Left>
                        <Qualifier>%PARAM%.P_DATE_FROM</Qualifier>
                        <Tips>Поясняющая надпись (Дата начала)</Tips>
                        <Top>52</Top>
                        <ValidateName>Label1</ValidateName>
                        <Width>140</Width>
                    </Properties>
                </Label>
                <Date>
                    <Properties>
                        <Caption>Дата начала</Caption>
                        <ClassId>DATE</ClassId>
                        <Left>164</Left>
                        <Qualifier>%PARAM%.P_DATE_FROM</Qualifier>
                        <TabIndex>0</TabIndex>
                        <Tips>Дата начала</Tips>
                        <Top>52</Top>
                        <ValidateName>Date1</ValidateName>
                    </Properties>
                </Date>
                <Label>
                    <Properties>
                        <BevelOuter>0</BevelOuter>
                        <Caption>Дата окончания</Caption>
                        <Height>24</Height>
                        <Left>8</Left>
                        <Qualifier>%PARAM%.P_DATE_TO</Qualifier>
                        <Tips>Поясняющая надпись (Дата окончания)</Tips>
                        <Top>88</Top>
                        <ValidateName>Label2</ValidateName>
                        <Width>140</Width>
                    </Properties>
                </Label>
                <Date>
                    <Properties>
                        <Caption>Дата окончания</Caption>
                        <ClassId>DATE</ClassId>
                        <Left>164</Left>
                        <Qualifier>%PARAM%.P_DATE_TO</Qualifier>
                        <TabIndex>0</TabIndex>
                        <Tips>Дата окончания</Tips>
                        <Top>88</Top>
                        <ValidateName>Date2</ValidateName>
                    </Properties>
                </Date>
                <Frame>
                    <Properties>
                        <Caption>Формат отчета</Caption>
                        <Height>112</Height>
                        <Left>256</Left>
                        <Tips>Рамка</Tips>
                        <Top>8</Top>
                        <ValidateName>Frame1</ValidateName>
                        <Width>208</Width>
                    </Properties>
                    <Controls>
                        <Check>
                            <Properties>
                                <Caption>В формат .xlsx</Caption>
                                <ClassId>BOOLEAN</ClassId>
                                <Height>24</Height>
                                <Left>8</Left>
                                <Qualifier>%PARAM%.P_XLSX_BOOLEAN</Qualifier>
                                <TabIndex>0</TabIndex>
                                <Tips>Логическое значение (Checkbox .xlsx)</Tips>
                                <Top>32</Top>
                                <ValidateName>Check1</ValidateName>
                                <Width>184</Width>
                            </Properties>
                        </Check>
                        <Check>
                            <Properties>
                                <Caption>В формат .xlm</Caption>
                                <ClassId>BOOLEAN</ClassId>
                                <Height>24</Height>
                                <Left>8</Left>
                                <Qualifier>%PARAM%.P_XML_BOOLEAN</Qualifier>
                                <TabIndex>0</TabIndex>
                                <Tips>Логическое значение (Checkbox .xlm)</Tips>
                                <Top>68</Top>
                                <ValidateName>Check2</ValidateName>
                                <Width>188</Width>
                            </Properties>
                        </Check>
                    </Controls>
                </Frame>
            </Controls>
        </Form>
    </Controls>
</MethodPresentation>
