Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96979FFFE1
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 08:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfKRH6q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 02:58:46 -0500
Received: from mail-eopbgr770052.outbound.protection.outlook.com ([40.107.77.52]:10564
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726283AbfKRH6q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 02:58:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErTnXdwiOH32z3ozSgrk8Fgo85DBVTMRvhyBNmzRofHJ+g9q5a5Qki5skkcfSUsFWSnV3AYdkiWOMcjAF3U9yb042SsAET1AMxIedsoNojfL6+NSFnqW0EAYgnX3CHRN/6UsnZ+swtMQqvIk3WxEQXf7KoYZYCy4YBhavC4Q/OiBbx3KHl3pb8TqjuC73Hv7OdoV5ibAkE1pdTKa2X7/BZRR+HWjMvmQsLJMFpGwQJ6pDm9ZcGdrLCK98/hBsC5ifq/D/3V5AWlfG8/naH2wU0KTGrecDtVgG3SyXXs35rbj1DtNghZ+yzoqfgXefS7mIl9V9TxMQEYDKh7Oui02Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bZ0wN8HL0HWVhweI1tFWrPddm5erqWYC/XdhAmY/48=;
 b=aw4kYb7zvF37DcUt6H4dy/Ci5NT2hctxe8K39qrPry30BavMEnTnYHtstVYVTiozdQlmSoIsG+bS/c1IHmw/x7beLXSohqog/z863/tGqb/gwrvQABezvVuA/SmTanx6h8tudoznERvYJB1OnmKH2CnVxgm6tbijaIIrrY3Owdn7wKYP2Wa1NGLlc8V8+c1uqwSmU1ds3u3m80x057byxkG5N07bnlXa4G3H10qdStzVnjmrYbmgPMXj9plX5ZMbkVXv1Ll1axAPsDcI4NSokq6rDU3u4JZPa/5oNB9b0bQ750w7gOU0GzX8350+2ZC0daqTME8cpTosjgz0og7Dgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=verimatrix.com; dmarc=pass action=none
 header.from=verimatrix.com; dkim=pass header.d=verimatrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verimatrix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bZ0wN8HL0HWVhweI1tFWrPddm5erqWYC/XdhAmY/48=;
 b=xRBKig4t/ESKENn1wj/91eUIiZHNSsPiKKjjKULTe1BDyCWX+h++weFOffGbliiFA5Hyerz22FyEEM0WGIeP2FspaLpVNu0fjUAzCPADL7vbcr+kHNPRbCv5CCoS7wmb5ycGyDJ3EjJT6mPl8bPCwnmyXcxxEZ8XqgTu7NAhMKA=
Received: from MN2PR20MB2973.namprd20.prod.outlook.com (52.132.172.86) by
 MN2PR20MB3277.namprd20.prod.outlook.com (52.132.175.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 07:58:43 +0000
Received: from MN2PR20MB2973.namprd20.prod.outlook.com
 ([fe80::18b4:f48a:593b:eac9]) by MN2PR20MB2973.namprd20.prod.outlook.com
 ([fe80::18b4:f48a:593b:eac9%3]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 07:58:43 +0000
From:   Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the crypto tree
Thread-Topic: linux-next: Fixes tag needs some work in the crypto tree
Thread-Index: AQHVnAs0RpIhyjbL5UG1qmDAFZPm06eQk+WQ
Date:   Mon, 18 Nov 2019 07:58:42 +0000
Message-ID: <MN2PR20MB2973E1EAD50B58826FCEC763CA4D0@MN2PR20MB2973.namprd20.prod.outlook.com>
References: <20191116101954.33672f2d@canb.auug.org.au>
In-Reply-To: <20191116101954.33672f2d@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pvanleeuwen@verimatrix.com; 
x-originating-ip: [188.204.2.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5de45bcd-aadd-470f-1155-08d76bfd2196
x-ms-traffictypediagnostic: MN2PR20MB3277:
x-microsoft-antispam-prvs: <MN2PR20MB327710EEC6AD4F889CB3EC7FCA4D0@MN2PR20MB3277.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(13464003)(53754006)(199004)(189003)(110136005)(81166006)(81156014)(256004)(71200400001)(102836004)(76116006)(66556008)(53546011)(6436002)(66476007)(66946007)(8936002)(66446008)(64756008)(71190400001)(7736002)(305945005)(14454004)(74316002)(8676002)(15974865002)(55016002)(316002)(478600001)(52536014)(99286004)(6116002)(186003)(9686003)(5660300002)(54906003)(66066001)(3846002)(486006)(446003)(26005)(2906002)(33656002)(11346002)(229853002)(25786009)(4326008)(476003)(6246003)(7696005)(76176011)(86362001)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR20MB3277;H:MN2PR20MB2973.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: verimatrix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S4ZM50BmguVkKQAGFZO6bRbz5oAgsvT3LIWHipcGZqaQR62l2xE4B9z7SS5WklMPXEnO+vvcjl69v1RNZIZQLWTFtewK2ntRJeUNePjk80/2mvSCAnvZXJLFx8bNEl421RXG324GWNtUIbXq7OMsq6+9DUvz0SrCWlYD0nZN9fTwbWbqG2j16zrW/5q9EI++z8u0l+nFerDqgjVCearQyCavtqL5LJOZKotWlJ5ETcAEd/pVSLFsLZ7ST43zwneYEcZky0YS4G4bASmYICpcOLDH8RhN5YpLevf6sHzHhj9zIAgNN3naEWAwRV+4HF818W2TAWvFz9eLZHT0EFlkY+wvIXRYKygHUPkEljt3m1x42L2+yBmcENnA2huyhL1jAUCuBC29SLD5NWn8Oqj9s8TAracm1vdJax4gSQyc+LTU8luhb+hqdnLbbez6bXxD
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: verimatrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de45bcd-aadd-470f-1155-08d76bfd2196
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 07:58:42.9386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcb260f9-022d-4495-8602-eae51035a0d0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2S13AzVWoNCIWhvXz4zzrdB58pVDKXNcrnX7arChnfae9Kr+kQGzrpW1NtLiHiBltDsliGZHDIGw/1jaPdiKp2+BmbxsC7QxYmwZmB0k40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB3277
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen, Herbert,

My bad, I didn't know the Fixes tag should not be broken over
lines (and that rather conflicted with the 75 characters per
line rule here, which is why I did break it up).

I'm willing to fix that - except that I don't know how to create
a patch that _only_ fixes the commit description of something=20
already pulled into the cryptodev tree?

Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com

> -----Original Message-----
> From: linux-crypto-owner@vger.kernel.org <linux-crypto-owner@vger.kernel.=
org> On Behalf Of
> Stephen Rothwell
> Sent: Saturday, November 16, 2019 12:20 AM
> To: Herbert Xu <herbert@gondor.apana.org.au>; Linux Crypto List <linux-cr=
ypto@vger.kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Ma=
iling List <linux-
> kernel@vger.kernel.org>; Pascal van Leeuwen <pascalvanl@gmail.com>
> Subject: linux-next: Fixes tag needs some work in the crypto tree
>=20
> Hi all,
>=20
> In commit
>=20
>   8c2c43a5be3d ("crypto: inside-secure - Fixed authenc w/ (3)DES fails on=
 Macchiatobin")
>=20
> Fixes tag
>=20
>   Fixes: 13a1bb93f7b1c9 ("crypto: inside-secure - Fixed warnings on
>=20
> has these problem(s):
>=20
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>=20
> Please do not split Fixes tags over more than one line.
>=20
> --
> Cheers,
> Stephen Rothwell
