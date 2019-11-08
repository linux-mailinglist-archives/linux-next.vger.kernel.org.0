Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE778F45C4
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 12:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfKHLeV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 06:34:21 -0500
Received: from mail-me1aus01hn2088.outbound.protection.outlook.com ([52.103.198.88]:40576
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726149AbfKHLeU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Nov 2019 06:34:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXXkV1UafCr35SC4ow6vYY5z6pOjBFvU5KcR+0K3cZ6rVMhXJl5ykHB+qOlqV6aDw/095hbJCaC93dLE3GKagKN8DhNUIpqoAgmsspqGZm1n7KvGz3MjWPC/QUYG4T9FXDCIU6pSwtRe2Gz1s37Vva3dE+h3PBWPLQaUwOlZTiYMrc0GbbxZLh1eV2NAYSKo98KzGn4YnEUDexPUQ8Q4pCG2l31/jNIbdnu6s2JPXPSanaHKhoicO3bBTLJTEeCk9IeqjakvC/iPiOtw9xr2ncmyzAQmVx5/T5HYS+QFXgnNm/g7un92xj9tvLGSf5CNjcBOLXG7X5x+aLDJzERjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdbfA+fykNlUA3FEBdra9pcf9T0w9b3HpEa8CayfVK4=;
 b=Na9APdUOMzMlNflDH5HuV+Y8hvmcUyAojFJKRCpHvp32Va7pQbJZModl1971unB4h7OtjYSrDlOxj+qj218XNP4QFhq8U7rGLEGaPlqTqyOznxUik0YUzilhtvWsm/lJnEBPUllUuJJTqdz/JJJPBNfq7fub6/vnyV1AM/zQFKkTXWszBcVKZEDL3Po/0Ttcd2xg/F6YtgKp44BccLqB7gcW/G8uUgbjlD3Z8zxNN3KuYPBfDXJVIlbmYS10Z7jTCYpKm4xgxUD+WBgp+ogBXopGu71KwO42vm3/AVUvaYFDbdWqpyCHzcFTs/R8i/quy5CSsVgfvACPvc736QeKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector2-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdbfA+fykNlUA3FEBdra9pcf9T0w9b3HpEa8CayfVK4=;
 b=TljULCyyn39mdcpB2DppTyc4bE3dSn8y66GuoQ930smKM2MY7LwxYxkWoleh0yco09JHjLlxdj/ZVeVtzJfbNmIUzoTWTLYAR38WOqgNL9ZTe12NslVDfCXzyd4FijwqUbATyVNG9Mj4XS4U3ZeDCD9+08oA0RVToilyWJTFax8=
Received: from SY2PR01MB2314.ausprd01.prod.outlook.com (52.134.168.150) by
 SY2PR01MB3082.ausprd01.prod.outlook.com (52.134.170.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 11:34:16 +0000
Received: from SY2PR01MB2314.ausprd01.prod.outlook.com
 ([fe80::91ca:a903:df56:79db]) by SY2PR01MB2314.ausprd01.prod.outlook.com
 ([fe80::91ca:a903:df56:79db%2]) with mapi id 15.20.2430.020; Fri, 8 Nov 2019
 11:34:16 +0000
From:   Elite Finance Group <12563363@student.uts.edu.au>
To:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Wen es angeht!!!
Thread-Topic: Wen es angeht!!!
Thread-Index: AQHVlhPuHyk228MTIkakGyGdVBNQ7A==
Date:   Fri, 8 Nov 2019 09:07:22 +0000
Message-ID: <SY2PR01MB2314E54BBEB7A6B288B43D1DAA7B0@SY2PR01MB2314.ausprd01.prod.outlook.com>
Reply-To: "therobinsons199@gmail.com" <therobinsons199@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::30) To SY2PR01MB2314.ausprd01.prod.outlook.com
 (2603:10c6:1:21::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Emi.Chiba@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-antivirus: Avast (VPS 191107-0, 11/07/2019), Outbound message
x-antivirus-status: Clean
x-originating-ip: [176.216.208.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73bd2e39-090b-4ef6-4346-08d7642b1101
x-ms-traffictypediagnostic: SY2PR01MB3082:
x-microsoft-antispam-prvs: <SY2PR01MB3082E5BD46178E0B3BBABFDC817B0@SY2PR01MB3082.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(386003)(6506007)(316002)(786003)(26005)(9686003)(102836004)(52536014)(81156014)(81166006)(66556008)(66476007)(66446008)(6436002)(8796002)(8936002)(66946007)(305945005)(7736002)(55016002)(5003540100004)(5660300002)(99286004)(66066001)(43066004)(5640700003)(66806009)(22416003)(2860700004)(186003)(64756008)(8676002)(88552002)(7116003)(52116002)(7696005)(74316002)(6666004)(476003)(71200400001)(71190400001)(14444005)(33656002)(6116002)(3846002)(2351001)(478600001)(4744005)(486006)(561924002)(14454004)(3480700005)(256004)(6916009)(66574012)(25786009)(2906002)(2501003)(81742002);DIR:OUT;SFP:1501;SCL:1;SRVR:SY2PR01MB3082;H:SY2PR01MB2314.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6eA/PlV4jg3h2HIka8C7yUKuOB6/h79phSPI57Cdwbyk2p625driD64JRV1J+uMJfpDXovEYUBazZNd10kv0dZHDblRFzswL+aEaN8ScO2yrYaOzeS5GvtJBp35M0hhaNq9Q+QYIqu2jJMIVX5aL0K9fS10TigEQ4IYObtzSyCHdHyxM6kFTec40E0R4lPhRprh4UzTKx1wkeOeM3CVlQfmdy+o5XkwSFghey0Kq0yQYVxgyh4tyNWV9RYR4Q7+vq27ooMRkqSKunqSj9cOTlsQ42mYgI6Y94ivGVEghupnIbKOhCtumYyYsOdd7VqHMuY87R5h+urncE6R3bksyp1lP4ozYyERx3HZesXGiqIXVJyoB9xRSTM6r4aB2ZgkZBwf+tuTyJpAvM62xxEDpCiMC+8+CpOqgaxJmyPGE/9o39PeW287m/C9BSIw5faR
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A367972B1823D94B9565EF0F0EE98A1E@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bd2e39-090b-4ef6-4346-08d7642b1101
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 09:07:22.9090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWQ449HJo19ywIme4oLdjVhDobO5jh8fIRZic8qWmv3l5XZmVgj5IpA/ewU0G95HgZoREZ4OopnoFUiQR7qer/rdXKb4lLfK3Z732ncz2g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY2PR01MB3082
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
