Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87F60BC569
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2019 12:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbfIXKJh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Sep 2019 06:09:37 -0400
Received: from mail-sy3aus01hn2106.outbound.protection.outlook.com ([52.103.199.106]:29216
        "EHLO AUS01-SY3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbfIXKJh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Sep 2019 06:09:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLe0kKNSsM+7QFffNMwM/S6hyZvBUjak0z6mumeiI4sBMQcDrwTpiT0S4zBScodZaBYoQRuoSv1CNnmyVco2gI/pBZ4t/zyYbj2B0Bpu0D2mkpf+xrFtSCDCIrc9Ztj6KODDib7dZni7RhC6zCYlNmVpgGEjEK7ciCl8i595XuyYUp+LAboOEpbmndQbYac02cdgXBAL1UNfr1uUUCng7j9P277/rnO4o4b1aqUN8xTmN9JWYwmH//KKHa8oreKuQEKz6qiAiIzwfpDWlfqU9Zkq2BLGZ0as0+fqZQnERT12XB2YrsIdc+3TbpExuExkGxj02lN1H/WY+ucWcY1YOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTis2hDlzDbOZylZXLbkOP1X7ancLiGp1vb/prFDiE=;
 b=MumIy4T5KEKD8XDiM07FB4TFTnlQAI/9pph4ZsSZFzuMJPXGa+cg866be72Noqj/UQTuSf8dBXsZG3tqzf9at+M5qQfOznTYKtW4PaEZ008MZb8IxzBmkzc/yP+JXT6NopNxY2+SSfTiDQfBsFsSuLVFeE4CCpbgXP5X7/lQ2EODEs9H6VmtHTy8Xc8hEO2AzQOJRlyAV4oN0U0f9MKQ09YK2BZVbKIeyXqlC9PvQ1o5Rf3+q74n/HAkvlW7dHDsja61LJWvsKly5k+sMlnQyyw2NSCqXAZcSEomOEYSJnt6Rj2HG+be+6Wuw6Xj9WetbWG4DieLxxd8h1tulKBEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector2-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTis2hDlzDbOZylZXLbkOP1X7ancLiGp1vb/prFDiE=;
 b=TIq0fJTklnTlAwPbWUlZYTuQaPq8vbWgczn/Yd4d3BvtfR9xVs/VMTP1DIo9kKCi3qyU6Zu4kt+rJESMztJ4Q1ABbWWmweejLJ5bHSmZ8Bj8A885CVi5+zCQUH+OiWE1rsjueNHWQfT3cmZ5nw/aqdi8TCK7MLIIv/U8NVpM294=
Received: from SY3PR01MB0795.ausprd01.prod.outlook.com (10.169.168.137) by
 SY3PR01MB2204.ausprd01.prod.outlook.com (10.171.0.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 10:09:30 +0000
Received: from SY3PR01MB0795.ausprd01.prod.outlook.com
 ([fe80::346b:f200:1bf9:a608]) by SY3PR01MB0795.ausprd01.prod.outlook.com
 ([fe80::346b:f200:1bf9:a608%12]) with mapi id 15.20.2284.023; Tue, 24 Sep
 2019 10:09:30 +0000
From:   Google G Winner <13541533@student.uts.edu.au>
To:     Claudia Carozza <Claudia.T.Carozza@student.uts.edu.au>
Subject: Google Online-Ziehung 2019
Thread-Topic: Google Online-Ziehung 2019
Thread-Index: AQHVcsAnpHqu/VOUtkqSBvTyJkC+cw==
Date:   Tue, 24 Sep 2019 10:09:30 +0000
Message-ID: <SY3PR01MB07956141106614E0EA8D6E2EA8840@SY3PR01MB0795.ausprd01.prod.outlook.com>
Reply-To: "g00glegewinner19@gmail.com" <g00glegewinner19@gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0078.eurprd09.prod.outlook.com
 (2603:10a6:802:29::22) To SY3PR01MB0795.ausprd01.prod.outlook.com
 (2603:10c6:0:3::9)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Claudia.T.Carozza@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [176.219.47.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cea2aa86-a6c0-463b-f8ed-08d740d749f1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SY3PR01MB2204;
x-ms-traffictypediagnostic: SY3PR01MB2204:
x-microsoft-antispam-prvs: <SY3PR01MB22049BCCD8F974E82B3CCE4CD2840@SY3PR01MB2204.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(1496009)(366004)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(8676002)(66476007)(88552002)(7336002)(7276002)(71200400001)(66066001)(7406005)(7366002)(102836004)(4744005)(316002)(25786009)(14454004)(66946007)(66556008)(2860700004)(64756008)(6636002)(66446008)(486006)(43066004)(7416002)(6116002)(66806009)(478600001)(3846002)(5660300002)(71190400001)(186003)(561924002)(2906002)(305945005)(99286004)(2171002)(22416003)(52536014)(5003540100004)(786003)(6862004)(6436002)(33656002)(476003)(81156014)(7696005)(81166006)(52116002)(74316002)(256004)(8796002)(6506007)(8936002)(9686003)(386003)(55016002)(26005)(7736002)(81742002)(48574002);DIR:OUT;SFP:1501;SCL:1;SRVR:SY3PR01MB2204;H:SY3PR01MB0795.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J9GhXnEiHHyvTtC6fx27PM+Z/E0D32OTmhyXAp1gU8Dn2BXImhCbFvdfn4aB8XrHumvpeXXXLcwKrsIFcfzQ1xeL4FZ3B69ZNBE25/WWWaV4FgUNuFRElmPUaRxgxLOKerZUcqkmUrhHMLngDDL+Jf0heyzBGVH8w70SiYVw342G0g2zeZROGQOowS8p2XCe2ot3mkRytbEGIkMCbla1qHPDEP+fRpea9D4i3a09lqtKXvlsaGb2XuGZvUMth4tXgSPmfr51ZePmd/AbeAe2M2Mow27sREaRfpZHLLk2UTMRRmLC/LM07TzkMnuf9lfnojy+v6SElNu5gSn7bX2gJFq2C1FFSWkYD5VR6+W0asIl8eaPh0HfxILcJEsyZHHP6YCgiHXcblBR3F7Tf4O/JDM+qwHEdYGv+3JcrYSQGRc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <30C3C0A0E41BF5489C317137657791E0@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: cea2aa86-a6c0-463b-f8ed-08d740d749f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 10:09:30.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMPOsNenFwOgF/UEUkh3qVRoEm7D1Bz2GXvn3PBR8AMXZcA/jaMiP/t90VMKAewoFEFPj6Y5lzIPZ/cGTuluMLQBac9RK5nV3lIwEjtron0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB2204
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
