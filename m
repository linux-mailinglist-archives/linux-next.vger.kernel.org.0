Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF62B1BC4
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2019 12:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387619AbfIMKwj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Sep 2019 06:52:39 -0400
Received: from mail-me1aus01hn2048.outbound.protection.outlook.com ([52.103.198.48]:20370
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387424AbfIMKwj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Sep 2019 06:52:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ws2hv4tMz4kTmlTyqtsjitkxiqZKeCpsjVhzOrt86+TR39tB2LwrDCVE3i5auquam0xEdCdbFn4vle3fI99YQdqmi1Abr5XBusYftcNwSZr5/FoQuCU6AStLuwNRWFAfVp0UkrEGjkZb4erXL3UjlKFLIyel5tn67h/Sl3TOMxVPVOVSO5d2z5W/4KGbsKYuBbOUlE0vYnMp1tUgtZfDJdIvZ22xJfPSwvS1UQoGNT4jaUsKsK6K40ADPJqpA8BC8z9p3y1oBxevB8znYTSenAfutkrLrlG9MoCUnwH23pU8BKIJGFSWckhZ9feG2jc8zR4rP0xdTD87I0UHP/LGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTis2hDlzDbOZylZXLbkOP1X7ancLiGp1vb/prFDiE=;
 b=UZf8gEt8zHfQxslPDqvUegXYMm1VmuvRfuXHrSpV4oXpoqzXmZv9mcAQgTZybLTPV6yU9YheELf55IqPaiuUoSloOnQvlkbHBF134SJr9ZLDsfOeBtR+11udTh7X4AvIzDoMjJc1yHdtPWCxtbkjyQmCjZHkmpLRnqIbB/e/82fo6Ng2TdINOUz/wHoOthvzA2xZ61wASEMbwzDKmX2aVvQbEbxzU4cpcZmTzHyqZhFIr2lFRjCyMJPpA1dOp26BSpmRBCtuS4mJG1RL7mD5nzf6g5YBhXToz08o4VkEjyAa70KjJ9kybvyv8nhZesmJffsypb71ffrv12zX1H0rvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector2-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTis2hDlzDbOZylZXLbkOP1X7ancLiGp1vb/prFDiE=;
 b=KF1XjvXoHTn3i9B4LmS/XkhhzoJMFNN2tWpaAyurMgIzlcY65kJYTXU6u2YTuaPj1Xz3JiV5QMieEupIJ4dbYEKerKlefI1KATIvOkg3X/qwdqwowku+2WMaBmxWeWdE9twUYvu+ElgjGqkWnaTVgBrA8VSa/Jvh2xwlbu8Yn9U=
Received: from SYCPR01MB5168.ausprd01.prod.outlook.com (20.179.228.21) by
 SYCPR01MB4862.ausprd01.prod.outlook.com (20.178.186.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Fri, 13 Sep 2019 10:52:29 +0000
Received: from SYCPR01MB5168.ausprd01.prod.outlook.com
 ([fe80::54f8:833d:75eb:3b43]) by SYCPR01MB5168.ausprd01.prod.outlook.com
 ([fe80::54f8:833d:75eb:3b43%7]) with mapi id 15.20.2241.022; Fri, 13 Sep 2019
 10:52:29 +0000
From:   Google G Winner <13600491@student.uts.edu.au>
To:     Emily Kliman <Emily.A.Kliman@student.uts.edu.au>
Subject: Google Online-Ziehung 2019
Thread-Topic: Google Online-Ziehung 2019
Thread-Index: AQHVaiFTELxi6gLj20a2gYfwCxOfiw==
Date:   Fri, 13 Sep 2019 10:52:25 +0000
Message-ID: <SYCPR01MB516838CF440227A46E4A9AC4A7B30@SYCPR01MB5168.ausprd01.prod.outlook.com>
Reply-To: "g00glegteam2019@gmail.com" <g00glegteam2019@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0063.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::40) To SYCPR01MB5168.ausprd01.prod.outlook.com
 (2603:10c6:10:83::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Emily.A.Kliman@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [176.217.37.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a23cd09a-1048-45fd-b9a3-08d738387478
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SYCPR01MB4862;
x-ms-traffictypediagnostic: SYCPR01MB4862:
x-microsoft-antispam-prvs: <SYCPR01MB4862BCFDD466895D70B86851B6B30@SYCPR01MB4862.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(1496009)(376002)(346002)(136003)(396003)(39860400002)(366004)(199004)(189003)(7336002)(7276002)(486006)(66066001)(7696005)(53936002)(43066004)(33656002)(55016002)(476003)(81156014)(66946007)(8676002)(81166006)(66806009)(74316002)(6116002)(3846002)(2906002)(102836004)(6506007)(386003)(66446008)(8936002)(8796002)(66476007)(2171002)(5003540100004)(52536014)(26005)(186003)(7736002)(2860700004)(9686003)(305945005)(256004)(66556008)(71200400001)(4744005)(5660300002)(6666004)(99286004)(71190400001)(64756008)(6436002)(561924002)(88552002)(14454004)(22416003)(6636002)(7416002)(7366002)(6862004)(316002)(786003)(25786009)(7406005)(478600001)(52116002)(81742002)(48574002);DIR:OUT;SFP:1501;SCL:1;SRVR:SYCPR01MB4862;H:SYCPR01MB5168.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mFi0aef4+1eO2Jhn7l+JuTL9T10lBvHQdxR6AP1pu4Af3qM7ty88Aow+YW/q5EtTb9zuUu1ZZYPXqxvg+XgAL2r7glwQMOz+r49QN3fHA2azthlC0rb0xeYd03y7YX0/Y6kbaIr4kR7QG0dTcEE1AYypxEfij/Ur6q7a4Rbom8pC5UoBGlcii0DPLUbDKCHP3Xx5JMpBlyosjoA92UJes1CH38EDHwldTPjgLksWy0jLYLUNGcrDTIf3suHoCAUS3L+AbFAtI6PJk8oWUDyXKT9BIQkxkTanYOklnx8dFYoQKXQUTBe1r2TKo/qjMOWmo42tYMJ8H8oYbhJyBApXlgXhlD6hlRZbzfwDqXT/4AnXu+mbqdF5tkMv5OK4ILE6eS6UqaQb5TBvKysHvtC87BH7AAE9MwLrmZW6nEPJA1c=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6FA3D6B9222D86408627E00E59E82A7E@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: a23cd09a-1048-45fd-b9a3-08d738387478
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 10:52:25.1459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8C8CYTKD5xipJIJTlrJ8aYyeXQ4GRVYMkno8tKW025zuwbE2xLaLbfAadIXpby6Pi4S3F/ikOxpLFfH+0CZ1pAUxnBOo785IaTbKO5JK/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYCPR01MB4862
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
