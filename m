Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13962FC3C5
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 11:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfKNKPI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 05:15:08 -0500
Received: from mail-sy3aus01hn2045.outbound.protection.outlook.com ([52.103.199.45]:42624
        "EHLO AUS01-SY3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726024AbfKNKPI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 05:15:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCqnc35ch8/NR/PK8kFVj+6A9+5BYmGsmIpIhwKbILVi67BljdkJ96F9BzPseKiW1P2ZtSUmDVRr6vpC7HbsKdzLTls/+98ZtL6rxLGu3OOitPtJbia97Zvrz/vUfmsPLBrtZB7yEkZMhHNAwS8iVT6HpHz7p5Ul5eRbUXMFmHQPZ2YhmEpl26ruQ1+50C3nomAZYv9LurnpkjQqRv4S8jofA5MiAZAMD50KaWHSHyKPEhcfmbcYHlnUNJWdfh0adeH7coQ0DEcuro1Usu2loxg99+7GvueGaZ0XCw5fliuKM0vkSkCNQXal0mM7IibSOr8CS+rLWP1m6MAMJIHaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdbfA+fykNlUA3FEBdra9pcf9T0w9b3HpEa8CayfVK4=;
 b=EV/NY4al3QCQZ2qnnxX9iv+f7FvBAl7b0xOICl49UZ/Ukh2yNPobTPtUSI3JZUh9+jcH/l7KEuh9MnuNsNPyL6WXhp/CxE3zHB2gZExgNd46LgijhRwhjT0fyYBz0qgLu1cND8W8Vy2caUtWRJ9X8EkmEnj27elOlq68R/gGXtMj91gOL54ZIevNbKg8JnFKGCPqEIoYHP8FoLqfec2CpOIWtXDM0qKhgqmg5EyE2kDvlvX2MrgZ+GLISFtFPTS/ekT2t29yQAvOmPdmQKLdkx33IdNgCfa2AX9rb+LlQ1M26IbpzVjZEuJgO3ZwAYXxB40OILQRuGFPLopH9axwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector1-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdbfA+fykNlUA3FEBdra9pcf9T0w9b3HpEa8CayfVK4=;
 b=uy4zyDTZrCGddAQAVuidLML9GJVMwhN2LpFKsBjKZsHgmUKrkyOyCsVE8uozfjMSWhk2KfeuYiNvL4/ansCem/bKxVXXY9aL2U6kF31PAiszdsgGaVvSejnnaqO8uxD+y2EEACFRsw09vqW9z2nLODTJXv75cD39MNyfhDjzQV0=
Received: from SYCPR01MB3470.ausprd01.prod.outlook.com (20.177.140.208) by
 SYCPR01MB5200.ausprd01.prod.outlook.com (20.179.229.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.26; Thu, 14 Nov 2019 10:15:05 +0000
Received: from SYCPR01MB3470.ausprd01.prod.outlook.com
 ([fe80::a0c4:b049:fa02:1db5]) by SYCPR01MB3470.ausprd01.prod.outlook.com
 ([fe80::a0c4:b049:fa02:1db5%7]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 10:15:04 +0000
From:   Lisa Robinson <12891065@student.uts.edu.au>
To:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: linux-next@vger.kernel.org
Thread-Topic: linux-next@vger.kernel.org
Thread-Index: AQHVmssI4kgotKP+6EWFaL5adV3lOQ==
Date:   Thu, 14 Nov 2019 09:08:09 +0000
Message-ID: <SYCPR01MB3470D73AE469D39605D22A17AF710@SYCPR01MB3470.ausprd01.prod.outlook.com>
Reply-To: "lisarobinson50@aol.com" <lisarobinson50@aol.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0085.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::26) To SYCPR01MB3470.ausprd01.prod.outlook.com
 (2603:10c6:10:33::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dallas.Carroll@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-antivirus: Avast (VPS 191112-0, 11/12/2019), Outbound message
x-antivirus-status: Clean
x-originating-ip: [31.145.225.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58b632b4-83f3-4bfe-7ab3-08d768e22b47
x-ms-traffictypediagnostic: SYCPR01MB5200:
x-microsoft-antispam-prvs: <SYCPR01MB52009A142559C7D2211B9649FB710@SYCPR01MB5200.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(376002)(346002)(396003)(366004)(199004)(189003)(66066001)(2501003)(4744005)(2906002)(6436002)(486006)(66476007)(64756008)(222073003)(88552002)(5003540100004)(5640700003)(52536014)(3846002)(2860700004)(66574012)(14454004)(66446008)(55016002)(9686003)(71200400001)(66556008)(66806009)(71190400001)(6116002)(14444005)(256004)(66946007)(5660300002)(7736002)(2351001)(8676002)(25786009)(74316002)(102836004)(305945005)(33656002)(8796002)(8936002)(81156014)(478600001)(43066004)(561924002)(52116002)(26005)(99286004)(476003)(81166006)(6916009)(386003)(6506007)(7696005)(786003)(186003)(316002)(81742002);DIR:OUT;SFP:1501;SCL:1;SRVR:SYCPR01MB5200;H:SYCPR01MB3470.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1nrujVRk/rTtJgoz5VMBF7UFUlXrwXRBH0iTs8cbrsWuTvsgE9apc5qXcQtIZx0viqu9f33OS8mzslUos/lHdx7lZQGdBgSkyDg1hONjoOeTx+j7fAMhzdlKXWrD024LRjpkIxTWXEL9V7RKzdfmzFbxWSYRh03WsB00zdrHW7R1HCH4it9W3OJe+I+EqRg9C9XSzeKGuKbQgyKfgwdFpkxtLSj7qIHk7v08dyTQzoqBubc1/UTOAvSv77M/sjp2PyeOYOr+WIrKT0+bHpr4DbT7o7XFc81zIzrahsK4IupA2l+Me8dKTAEq3KCqV8O51wrGkTNRBuKc4N3AaGFePlBOWzNbTDLHEv5rV1IxhFArS7kin2dalPgemKsg8Cd44Cc+te+snHzDFAZ0mFw2JBJlYWOrksiLDbo7Au1hPolJZRwRZ1kf4KcW+yZ9akUo
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <64999E866DF87C4897104E5BBD6EE1FE@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b632b4-83f3-4bfe-7ab3-08d768e22b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 09:08:09.5326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IU0KBZryNdNQcCgK2er5bWgt3lfj1rpEjwgsKy/djWcv1ETXClSXib1Djgv16P4neWOtY97LrypHJabOKQTiGxlAGnozBXN0MjSUZu/TphM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYCPR01MB5200
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hallo (linux-next@vger.kernel.org),
Sie haben eine wohlt=E4tige Spende in H=F6he von 1,2 Millionen US-Dollar (1=
.200.000 US-Dollar) von der Robinson-Familie in Munford, Tennessee. Ihre E-=
Mail ist als Sieger hervorgegangen, Best=E4tigen Sie, ob diese E-Mail noch =
g=FCltig ist. Kontaktieren Sie mich dringend f=FCr Anspr=FCche.

Mit freundlichen Gr=FC=DFen,
Frau Lisa Robinson f=FCr die Robinson Familie.
