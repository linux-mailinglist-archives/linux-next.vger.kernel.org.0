Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0560AB8AFB
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 08:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394849AbfITGVb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 02:21:31 -0400
Received: from mail-sy3aus01hn2049.outbound.protection.outlook.com ([52.103.199.49]:27811
        "EHLO AUS01-SY3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394772AbfITGVa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Sep 2019 02:21:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd4T6hT0plxyWUh5GRal1TsoKumcZU+7c1Yv1nfD6bKVlvysjLoUVNl89DYhMqQ+q51ynrAaGvLjao+h2G6+/QCPeH2YnuD0/+KvSKd+s9h5lP9S9vnVuUYY3fn7dKwQ/vcR1sJuOu2EvJ7lrk/qlmC6vD1z9sd/CSEZ02ef+padLGkQOY3vM3TcWcsmz4E7diBSFHoakuT7Fe71cPm0TxigOj9o+SJBVUMiRu443YuszAHDiweSnFC/PK2zS62xLBu3B97OekQQfN7eUIRJpOn/hEllOeJ0G+kwQaGxM0SOI0VgEXH0yP7/KtM8YINOAu+e4VrbWeejegVcxB+TTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTis2hDlzDbOZylZXLbkOP1X7ancLiGp1vb/prFDiE=;
 b=LbBVN3Ds7CzktmGkyVqM8IRknbpiuR6E1KhejX8mVP2ioDVzfbSVjH5KEjGDEN7KSl7YJCtbecsxGmZHQK6MDKbn8KlJ4jcv6ngcZLwmTfsSfVVDzln+rVYBJuejR+D+BYOMubGOTjvAbM8jsjLGk/2dRTKfBo00cnlgSDBkT5YYGYdMYQIUcF6Rxrqpjo41VVEtUcWBQMpmtmoD5t8+jlGtd80YGMxhKnDq5SKzMvpaP5ZdOC2A7VQURiqegegLGTzyVMP4WetrpEisZZJB+zUkycO8fyuPhCXNH61G6dmPsJA3gFJE1gaK/51MRqNd1ALJf32eEbZ/ycAiJI3BLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector2-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTis2hDlzDbOZylZXLbkOP1X7ancLiGp1vb/prFDiE=;
 b=ZLFx+TndYKrthmL+FvGJnRf0QAFJZ2mQ+5wgSPDOZkdJkWBnWciKVuVpb2XtdzbcP/qtj2rJWMXpwbm+pzV3i1fdue9TCmzIgCStDQ+5lbfv/dycry/swyrgV/yvaJz0LaOGrFBiX7Q2KrsApowigRBb02Lg6cGLiQtgBI2UkPY=
Received: from MEXPR01MB1478.ausprd01.prod.outlook.com (10.171.17.21) by
 MEXPR01MB0808.ausprd01.prod.outlook.com (10.169.161.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Fri, 20 Sep 2019 06:21:25 +0000
Received: from MEXPR01MB1478.ausprd01.prod.outlook.com
 ([fe80::280f:8120:4bb5:b10a]) by MEXPR01MB1478.ausprd01.prod.outlook.com
 ([fe80::280f:8120:4bb5:b10a%3]) with mapi id 15.20.2284.009; Fri, 20 Sep 2019
 06:21:25 +0000
From:   Google G Winner <12924635@student.uts.edu.au>
To:     Billie Jeffery <Billie.Jeffery@student.uts.edu.au>
Subject: Google Online-Ziehung 2019
Thread-Topic: Google Online-Ziehung 2019
Thread-Index: AQHVb3uh72HUqkbpZ0qc9hBVw7BBgQ==
Date:   Fri, 20 Sep 2019 06:21:25 +0000
Message-ID: <MEXPR01MB14784E5B837DAA9E97DE9BBFA3880@MEXPR01MB1478.ausprd01.prod.outlook.com>
Reply-To: "g00glegteam2019@gmail.com" <g00glegteam2019@gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::14) To MEXPR01MB1478.ausprd01.prod.outlook.com
 (2603:10c6:200:32::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Billie.Jeffery@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [212.133.223.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80c487b7-5f44-46e3-70fc-08d73d92c3c1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MEXPR01MB0808;
x-ms-traffictypediagnostic: MEXPR01MB0808:
x-microsoft-antispam-prvs: <MEXPR01MB0808758D4CE099D259818C45E7880@MEXPR01MB0808.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(376002)(396003)(136003)(346002)(199004)(189003)(486006)(66556008)(64756008)(7336002)(9686003)(14454004)(476003)(99286004)(102836004)(43066004)(6636002)(3846002)(6116002)(66066001)(26005)(7416002)(4744005)(7366002)(5660300002)(66806009)(7406005)(25786009)(66446008)(52536014)(88552002)(7736002)(66946007)(561924002)(2906002)(74316002)(186003)(305945005)(5003540100004)(7276002)(478600001)(66476007)(81166006)(71200400001)(8796002)(52116002)(7696005)(6506007)(316002)(386003)(33656002)(2860700004)(71190400001)(8676002)(8936002)(6436002)(6862004)(22416003)(786003)(256004)(55016002)(81156014)(2171002)(48574002)(81742002);DIR:OUT;SFP:1501;SCL:1;SRVR:MEXPR01MB0808;H:MEXPR01MB1478.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UYOZX++y0qkoto3z4/uWKl/LtNAD9FxZfcnd/+xmzrmebhYhvvLkY7ZStFDLt9DRif+WpUahJu5ixL13KP5jWX8RGw+pJ28ZKdrV4aNRaGIc65n527VbtUhR8sb1qH5gRaHYAB6+hYU8lrUirZfKDG3dA1B3iD+Q6fQhqqp1r9Ft33XNasncxfQta5Z1COG2K8DRUsciU+Wj7AM0vTKz1RpiMdrPJwr84HECZbGEIsvDgzdo3i6kW4CT0dgEITjp9eecQmguM6bYNuokeJzJT7qdP/BbcrDn/XnSMgcmo9zscnfiVMgJaS1cE6Gy95Iyihj/Rc4vmaQAwtw0dnnK13mJ8Y+yt0ipfaP5a9Y1CxSY9DFKHYcsm+Idu0yJ5muxc4IsAc4KSpquISNk17ZJot9NaZXWZ5bx+/Da2lVmyiQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8EE3F1CB70807F419905F07B329C81A3@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c487b7-5f44-46e3-70fc-08d73d92c3c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 06:21:25.7867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgDPLZYdZ/A3NpXBsXsdPcEzwWNMAtX0wWMjpjDF2N/b+BMB+SBFeqVi0PEPSMjfh9fLHdcvLwaE8PhftZAc592L3Q33E+EgtmGykBOBj+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEXPR01MB0808
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Sehr geehrter Beg=FCnstigter,

Herzliche Gl=FCckw=FCnsche !! Herzliche Gl=FCckw=FCnsche !! Herzliche Gl=FC=
ckw=FCnsche !!, Sie wurden als Gewinner ausgew=E4hlt, um =A31,150,000.00 al=
s aktiver Nutzer in der soeben abgeschlossenen Google Online-Ziehung 2019 z=
u erhalten. Beantworten Sie die Details unten f=FCr weitere Informationen u=
nd Anspr=FCche. Ihre Gewinnzahl ist GBS/965/GPBWIN/US

(1) Ihre Adresse :..........
(2) Ihr Telefon :........
(3) Ihre Nationalit=E4t :.........
(4) Ihr voller Name :......
(5) Beruf :.........
(6) dein Geschlecht :........
(7) Sprichst du Englisch?:

Wir gratulieren Ihnen im Namen von Google Team.
Verg=FCtungsausschuss

Dr. L. John Doerr Gr=FC=DFe,

Google Central Google Inc.
Adresse: 10039 Bent Oak Dr, Houston, TX 77040, USA
+1 (979) 417-2671
