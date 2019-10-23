Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F52E16B5
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 11:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390292AbfJWJyZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 05:54:25 -0400
Received: from mail-sy3aus01hn2059.outbound.protection.outlook.com ([52.103.199.59]:6308
        "EHLO AUS01-SY3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390278AbfJWJyZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 05:54:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmAd3sOs0y05cVuMrjUi1E5A4zeDTHpz1x2fDFGdUjYwDrCNSDlWPZHlFBCMTzAQ4HrxmQgO4VHMRpuVaFu30d9Bez4g+wpIdv1QJudLuo2+HcJ8QkTH2w/n+l7TRq2iNix12fHn0+iCMq2H9VaxA3ww2TYQc3O7z2TjPAcXOV6U4/D8fkBg6egyfmBLwdclHrocbZft6/DPherFUXqqv21NySRdeczxwvAZO9AYs+z1p/1Wq8YAV/p1SzjR7cD5mkB/xLDreD87qTJ4BjXEqNPOIuFMirJIXxmS9vXgsA3BZz3jyGDVuinn4uMemh7zJP1hVGoAp4Quq7U+cQWWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4h5WPSTprBAdOlUNC33jkx/NlH9XsoH8BknTohjtbM=;
 b=D1WDPUDXuqQH9G3zkJIDNe+Vl0gZoSsaQBeE4kxUSdvJ0fUZoEvu+uJMgr4SOt5m+z90cWkFASzUCBtj3EEhksfQ9WLVH89eLCoGC9RlVzwzSWhclW9bS++Df04RZX3Oh3TpsHkT0t4bZyBt2cV9snnpu42jZVpdIqsdSLw+4GjNGnn6Hz+/N3LULmp/YmQkB0aPz43usaQQFbGTHOQ5VZgHf4xl53yDbUlItlYbwit6inD8vQ+8IoP6ldm9SE4vVtPH2tXzGOqfChwiuRTQZHFB/ecwJ6RSoqOPASyO5fFtnHBrvt7VrnP05IX9rOH0UN9FAMv4tQhBM9Y7CTTcFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector2-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4h5WPSTprBAdOlUNC33jkx/NlH9XsoH8BknTohjtbM=;
 b=pKCFYj7u0WwUaQRVTovITjyhK5kmizDmtBWHOWs/oBEcT7WofrLU8g3lz//sug3G3Yfoc+4t86FDAcA46ovLPFp8JiQ7JFvG2N4T4ykUrLOGDJHtis6fCRh5khP2pX7+G+/mgfufTfTk58ImEJgeo9TuMBqufYTVXE1xPIDKUnI=
Received: from SYBPR01MB3497.ausprd01.prod.outlook.com (20.177.137.78) by
 SYBPR01MB5004.ausprd01.prod.outlook.com (20.178.190.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 23 Oct 2019 09:54:21 +0000
Received: from SYBPR01MB3497.ausprd01.prod.outlook.com
 ([fe80::ed27:78bb:1615:a42a]) by SYBPR01MB3497.ausprd01.prod.outlook.com
 ([fe80::ed27:78bb:1615:a42a%3]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 09:54:21 +0000
From:   The Robinsons <12929321@student.uts.edu.au>
To:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Wichtige Mitteilung!
Thread-Topic: Wichtige Mitteilung!
Thread-Index: AQHViX5wx1s6Lfdg0k22r3UPkf5TsQ==
Date:   Wed, 23 Oct 2019 08:47:02 +0000
Message-ID: <SYBPR01MB3497C096A934CED51B55E117AE6B0@SYBPR01MB3497.ausprd01.prod.outlook.com>
Reply-To: "therobinsons199@gmail.com" <therobinsons199@gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::32) To SYBPR01MB3497.ausprd01.prod.outlook.com
 (2603:10c6:10:25::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Kumar.Chhantyal@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-antivirus: Avast (VPS 191022-2, 10/22/2019), Outbound message
x-antivirus-status: Clean
x-originating-ip: [176.219.83.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebbb9cc8-3ea7-49d1-95be-08d7579592b7
x-ms-traffictypediagnostic: SYBPR01MB5004:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SYBPR01MB5004DADF771C811DA420125F8D6B0@SYBPR01MB5004.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(396003)(376002)(136003)(39860400002)(189003)(199004)(102836004)(66446008)(66574012)(7116003)(64756008)(66946007)(66556008)(66476007)(476003)(966005)(26005)(2860700004)(186003)(25786009)(52536014)(478600001)(14444005)(256004)(7696005)(52116002)(43066004)(5003540100004)(386003)(6506007)(33656002)(71190400001)(99286004)(2501003)(8936002)(8796002)(305945005)(8676002)(81166006)(71200400001)(6666004)(81156014)(74316002)(2351001)(486006)(7736002)(3480700005)(6116002)(3846002)(88552002)(2906002)(66806009)(5660300002)(6916009)(786003)(22416003)(9686003)(4744005)(316002)(14454004)(6436002)(6306002)(55016002)(66066001)(5640700003)(561924002)(81742002);DIR:OUT;SFP:1501;SCL:1;SRVR:SYBPR01MB5004;H:SYBPR01MB3497.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tve3h8yvQiFj0d9YY6ozE5nrggxI/bi4/Amilt1Liff48AFcpVILtYF4XhIpOdTHHXGuzyB1birWmNNEtfborjm85R19leklB9RO+dEa1JEae2HmW3LTvne8k6lUFxIcCCBj0uXIs9YBm8wg5vWW8CrQaASu58DGZ7sEeLgacVIcDSEmcdwdJpD4l3QLBBmvQ5PHQQRv3li3F6GQkG0hm2pA6rtDLpwHqMJAK2FUOqq8MWNP6mL5u0C4V4bBI8n/QSZkrj1g83N9ZUU/bPUNdMks5HSPu3Nilnkz90scLkE78iOGEmBA5M+ubrot+06mE0QAvb/KBKq+gviZZiEAI/ZXtPx0tCVPaW3Isq7V6ZeyEOp6NBsgZfJJVXvFB+OrvHh07OmOZp3RGcT5Iua7Rm1jQrv/UOhOfxnDDOSvZ3wOAkrMgMQ/zNl9iaAWLgzl
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FC74901E8C4EA5468D441FD5A486664C@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbb9cc8-3ea7-49d1-95be-08d7579592b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 08:47:02.0652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jP/Y49hvh1ft+klyMSMgos/iqRNFCPEmE5JTZFvNX3OUpYmTUTHGFVrGJ5bYsTWx3CHMA9ovyBUlMmo2jn1dTHCWJgZzebFDQzhC7M1hoZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBPR01MB5004
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hallo (linux-next@vger.kernel.org),
Sie haben eine wohlt=E4tige Spende in H=F6he von 1,2 Millionen US-Dollar (1=
.200.000 US-Dollar) von der Robinson-Familie in Munford, Tennessee. Ihre E-=
Mail ist als Sieger hervorgegangen. Kontaktieren Sie mich dringend f=FCr An=
spr=FCche.

Mit freundlichen Gr=FC=DFen,
Frau Lisa Robinson f=FCr die Robinson Familie.

--=20
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus

