Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3256EF5F9B
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2019 15:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfKIOy3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 9 Nov 2019 09:54:29 -0500
Received: from mail-me1aus01hn2064.outbound.protection.outlook.com ([52.103.198.64]:34432
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726282AbfKIOy3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 9 Nov 2019 09:54:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+S+WS9LzyTFk05+/fu/qhhh7gD6meNYoMufnPkIOmLbHAbjfY+D979S1g8m1cSi+Ba2aeyI6YJ3R/TIV8QcW45uj48Vvz2LKC9NK3BAuTX9bZNoX/URFg5BZigZAjO9XIzAma+1nj7F2HmJJa86QL8bMXIf51PysgcXJn6DqX7dYEyEHco5ABMhTEbKlFq/66TCEt9PXSnxiCMyz4A0+n5yOPwNT4QAtJz0a1pLRvJ9DPksuDm6rZXKHlS9as/pYT5nqXw6a7iSETVEc06NCqzYJrCahKumFdQIDenS6f40s0ZEjCkI5c+ujbTS3KSdsz4vpeqK4LWrhIi1Ak7d/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdbfA+fykNlUA3FEBdra9pcf9T0w9b3HpEa8CayfVK4=;
 b=bOfJ1274ibNM41vG+rhOAAt+kV5orUH6WZdA93fokQ9C/1FPenqfDujntjLPnOi0exc8TJMt7pWFvs8WYyxnKndudBMX+/HjjxJegvKkBIIpyeMgVyaVgzW8Z34otqQB58rZ8LQ6S3NqRldL1OHOzCgBnQaBXOcKQboxzvsKlZySkgF28RkgneFU2EXw1WujeLwTsiTdzLGUCPf48fCDb3LfXdErWrKrdBnC1RTV/TLj2kt4EqmgoTSDzIS8m1nT34qyP9NXpNXxAZWvlcWqHlSNsxk/AAWr68BbCC3knQ8wusToqm/Ykaf6vtJ3Omfj0ZKJbzCyPpE5f3PExA/CYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector2-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdbfA+fykNlUA3FEBdra9pcf9T0w9b3HpEa8CayfVK4=;
 b=Uo13RB/l2060yVBXeJDYXAvvWV9h6sJIzjTCEPtD4uAglirGBCvO/+0iSdDseH5PyY1jVuHmBFvMOaIsMUagb5uZM8itYFhHBvhwSHIZrwj1RBU0OWCF8SfrN1fsFDfJRi69vIUIrYnUAn5hnGKmRhFfH3wEJp+tCEgPoHQoAZE=
Received: from SYCPR01MB3470.ausprd01.prod.outlook.com (20.177.140.208) by
 SYCPR01MB4573.ausprd01.prod.outlook.com (20.178.185.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Sat, 9 Nov 2019 14:54:24 +0000
Received: from SYCPR01MB3470.ausprd01.prod.outlook.com
 ([fe80::a0c4:b049:fa02:1db5]) by SYCPR01MB3470.ausprd01.prod.outlook.com
 ([fe80::a0c4:b049:fa02:1db5%7]) with mapi id 15.20.2430.023; Sat, 9 Nov 2019
 14:54:24 +0000
From:   Lisa Robinson <12891065@student.uts.edu.au>
To:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: linux-next@vger.kernel.org
Thread-Topic: linux-next@vger.kernel.org
Thread-Index: AQHVlwimsiguecomyUynGSuwAqMNiw==
Date:   Sat, 9 Nov 2019 14:19:08 +0000
Message-ID: <SYCPR01MB3470D8BD45EB1F8210A904AAAF7A0@SYCPR01MB3470.ausprd01.prod.outlook.com>
Reply-To: "therobinsons199@gmail.com" <therobinsons199@gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0061.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::38) To SYCPR01MB3470.ausprd01.prod.outlook.com
 (2603:10c6:10:33::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dallas.Carroll@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-antivirus: Avast (VPS 191108-2, 11/08/2019), Outbound message
x-antivirus-status: Clean
x-originating-ip: [176.216.208.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1768a99-632d-491f-636a-08d7651fc8d0
x-ms-traffictypediagnostic: SYCPR01MB4573:
x-microsoft-antispam-prvs: <SYCPR01MB4573897A99FB79C3CFA0F280FB7A0@SYCPR01MB4573.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 021670B4D2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(39860400002)(376002)(136003)(346002)(199004)(189003)(14454004)(8676002)(305945005)(6506007)(386003)(7736002)(43066004)(476003)(74316002)(102836004)(81156014)(33656002)(6116002)(3846002)(486006)(6666004)(25786009)(478600001)(6916009)(66066001)(81166006)(26005)(99286004)(66476007)(88552002)(561924002)(4744005)(8936002)(2501003)(8796002)(2351001)(71190400001)(71200400001)(186003)(66556008)(66946007)(66574012)(66446008)(64756008)(5640700003)(7696005)(52116002)(66806009)(786003)(55016002)(316002)(5660300002)(22416003)(2906002)(6436002)(222073003)(2860700004)(14444005)(9686003)(52536014)(256004)(5003540100004)(81742002);DIR:OUT;SFP:1501;SCL:1;SRVR:SYCPR01MB4573;H:SYCPR01MB3470.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WT4lSUzr5Z0STUCeSL8hB8sjw0uW2qh/qzjeBTEBDAygh496Da4Uu0yLt9/bs8WKC2fB/oGZN2p/j6uyg9Sp0CsIn0+ojM61uFnFhIgvwHIYL+7JvXC7ytmTqdELerbTNkBJmEccc8VoZ8nBcAzgGo9f39I4o/HWTKoyVmS04a/PWmIYlG/8biq8Pl7uox8zwwRAs4Te97SsP7oUaQ4GZ7caEFocPRa8ZWHAPQ8o2flMV98mR3/XzLOF/1Wg9rim6pMyL2b/ciFR8dvirEyfnLcz0HkFhX0Etuts4WSwWKPCxWUVejOydLKkv/UwWWzI+CQiDwuC9nHwbcYUSDPaBaXT2LjDR9SVZt1der97kcX6FikwiLk7VFdiJNzJiby9z5Eg/fzS2OG1xZ4iHw/3LQ3iXUumuE2Uzd4Dgn7fLI05povXgigOLvvqNFD+aQhB
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <62BCDBBA1769EC4ABF591D68CCA86FDD@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: e1768a99-632d-491f-636a-08d7651fc8d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2019 14:19:08.4785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKPsj20M1oTHPNpJDkGHxrwov8IcldRjrBhaoGX1OpPpQYkktAbto+gYdOEMm1OlJb9ckcgVznEvY4AUNRB6JGzgz4cFC5tGdnvY+liESXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYCPR01MB4573
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
