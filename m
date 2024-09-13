Return-Path: <linux-next+bounces-3822-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F3977BA4
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 10:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80F2C2860E5
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 08:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4431B1507;
	Fri, 13 Sep 2024 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dNupocOd"
X-Original-To: linux-next@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0594D188A21;
	Fri, 13 Sep 2024 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217646; cv=fail; b=Uay9VKolNA2DgW+1fu6Il69F/V/9L/Rp8kiIb5htJtCy5UsfKSUJecsyt7uWDTjVZpWhXY/Batpsvo147PlfrG4+ZkLNPkX62FMZYzTFV0WIEwDcKLs4ZTiFZ2VA1cxahMkc23ZOpi/GVf1HVLv/0O7JpjFPqSUEMWD10tZPXv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217646; c=relaxed/simple;
	bh=+/cQ2Pixy3Son9Hc6FpRVB1unsmtg+xjR7SOJj3zIvk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uVdYGIBnJDRamrbLIN/xSnMVEZKuyViBTTSpOLWPXNkYgemPNxgVntOaNa2Tmq7sOIH3kJDC9SPl463z9Cx0mJYHm4siTlU6cw3+eJnK7Yv0DE271aDtpptpfze6Rwt56zT2L5a0RCKPnBJOlXqMWzXU+hHQT+8Mlg20ck/jr3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dNupocOd; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbe11tY+AEmWW9le8dOphaO2wedS9QdRLZrXr1IA8A+6yglHcSY8FVXCNQdBj/MnTsBRKsHJ+xvGH1x6QOeGK9cV2/kWaQu2WOua0eAbV93UuUF00LxsSsZ8RrZrEZBQcHGShAkmNBzPpKLxzJs4xtGW0D8fOWRfP16iBu/RO/OnDFd7Owa5uuuemS7mjqCtGXQYhvuv3JZH2loPOIVjTV5ItvJK6J3DlZYAr5FqWwZymq7/5EXt1nrCHBJyhvDGjU2zejpsOCwLk7867WDBiHaZmW2io8NjZlTxCOQ5J6Z+9F4KXRK2Tl31vcEVA83SxsjiTv88YoOCH+q8PdKqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuhLsOFKmBdcGJIDxukpStjNy0+C2xowakBKTef3szI=;
 b=ECIN9P30B2bullymBaq2ey29vktJ+kXN3VtXTzzRy+SnUIM6JmyIl7nrAuRadgxRwParVhiiVcnzlXQ3Xx8so8nH5dq5tV/slkfL5wvJ9J5GLdE8q9rbBCYtuwdWBQgTIVrXuVcE2cZx/Kc3e8gjjGZZe0bs2JIt4ls5durAQRytsgaeU/fB5RRL8dUj3aVLV5yXzSBVnVlUXwo6NSv3lI/NLtgTscgmX4nc0FK3RBxxn4D60KcsPJ0hsWsV0y4tzu9iPeW0d7eztq1xOpRsscwVL1P8FHPQ4Qs7l+YybvrdqDV6wNUDWuWPDrFurVHU1t7PHBCCuI4em34HqaFSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuhLsOFKmBdcGJIDxukpStjNy0+C2xowakBKTef3szI=;
 b=dNupocOdfpJpxT+eF1KLjLj6y9Q1a8Nrsv6sXU90YKd7mM4R118q4AbY0S28CTbzPsHPdy+q3Qw2FS+HQjqlbv96qtxuklqpzRFgSDZ1sxS8sY7nV+akfhXmUeiFf6WW5G7xrLAM7zQi1WfsTU+5e0TP+fy1E8yuYObk1e6Swcg=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by TYYPR01MB7973.jpnprd01.prod.outlook.com (2603:1096:400:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Fri, 13 Sep
 2024 08:54:00 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%5]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 08:54:00 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>
CC: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the watchdog tree
Thread-Topic: linux-next: build failure after merge of the watchdog tree
Thread-Index: AQHbBAbhL4ip24uQK0ynRtwhjUDNZbJVN/SAgAA0edA=
Date: Fri, 13 Sep 2024 08:54:00 +0000
Message-ID:
 <OSZPR01MB70194D7DDFFD3AA895179EB8AA652@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20240911145543.270c9c9c@canb.auug.org.au>
 <20240913154431.14297f94@canb.auug.org.au>
In-Reply-To: <20240913154431.14297f94@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|TYYPR01MB7973:EE_
x-ms-office365-filtering-correlation-id: 3807604a-76ea-4b92-476d-08dcd3d19c25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/KJrCBgW0fVJN5xWSyPUs9zsiNrJO2ZdSD33QfahpzGehHKRwmhXlFs3NxMK?=
 =?us-ascii?Q?eAMq+C4sz6rW5eFB3Ci/e9qBJcu7a6DbHk6WBYk6bCNYEPD2bg+GxlBYiMw4?=
 =?us-ascii?Q?++4v37YB1pqz0ojKtEIUBZa3G4l4e3ijlqv8WYYjSAbj6Dzg0vVYDLGq8lFo?=
 =?us-ascii?Q?XNdTDhko+AcltFTNe9DcudCBWVmqyX5Wf8oysnq0fVvLrCJj1IKXuSLPIwAB?=
 =?us-ascii?Q?LrB2r9DmInKBqpLd4Oku+4DFeZr4GHj9fRd2EvCuhoAhicEB8D6oxYZ++1f5?=
 =?us-ascii?Q?BqkC0qKWKvBnoFn2RmRtAzKh/R1wRrBC9j8yotOb+f06oSWYFBSaO7HTBUa3?=
 =?us-ascii?Q?Bu8elS2qVYJLwMDWUSNEdEvojo8+RMkCHrpdl6SWBWDFgJ5BEFlqurDCGif8?=
 =?us-ascii?Q?qIo7+OyzP37+AWz3b58wl/aUuaZNmyc3KmVwfDFR0+Rc86QyN5Rea7c569Hj?=
 =?us-ascii?Q?S0R5bJi+PTecfvxqzn8AtZutHlrG/AcjoOC89E94t0VNm6mRFdIunZUIcWQh?=
 =?us-ascii?Q?HYqyd5q4yEMAT1SAtBjDfpMfoSvDARhnNH1D/H7qqBqK2tQbpqNqLyRfBR7T?=
 =?us-ascii?Q?kQitycOySozEFg3bVcYqzmU0KkNa8UOpACaYYoMoWNNiH4mt9FCxOqAlJ/bZ?=
 =?us-ascii?Q?Bd1YdmffoNcXQ4/MXsfClxmuFbEI2k7lIiAhbJY6v7/xE5jpDnh7DkFLoCk3?=
 =?us-ascii?Q?E1D6sEdxr1NXRoUyJ83aMu8fmsjynZSmHGsi0Xw4J7AwcNLU/Xs/Y5ercMg5?=
 =?us-ascii?Q?l9kYVZ28UE2RphoKAfycvcUvqcdUVoE2iBW6ygLQE5tAMAyNtHJ2hbNx3ABO?=
 =?us-ascii?Q?QFu/J37JDQBLG0xYmlZlxCcFp4gdrbXsl4rk9fCoUKy5VovBxMH9IFr2ANzo?=
 =?us-ascii?Q?JtX5Qn3plpIegGPu1yS6fPMtHv9y52Qy0fBjfVrg7aNF+CgxWGBXZH60pYyQ?=
 =?us-ascii?Q?58fZXFnXF5eGuMLdTce2QP+jqoqcPWlPke/2NqK4PNAiQS/msZjjVYIDUinl?=
 =?us-ascii?Q?0Aya7wXMZQl+AlzOe8r8mo984bxBUC3Fm3aOp1vMN3SXWUiaqQwCYK/9R/Mm?=
 =?us-ascii?Q?ByBdpwTIfxPsucCJOxaBrOe1iCjnibbF3I0MahIk/UxneS0MxZsKz3bY/fCm?=
 =?us-ascii?Q?1u/1uYm6GBP+u74BTagfkGrvgFY5BwT520Rz2mPghsdqybDsSQmxjaxwa69R?=
 =?us-ascii?Q?1iEtAbVARCjJnvjtzF0/KI0zzoAxdLcnf1qisT+AJPpW2vylef7vlcia8iut?=
 =?us-ascii?Q?TPZOYF20sO/UOH+tWJjvrVFNl0DOb9WLHrC5lwswsBjvIb1pHnoX9pLfwQNI?=
 =?us-ascii?Q?AmNey21y7v8AlPbAecA7qor7pdIeIH/SqKPlkHx6F8RyheVSMLFz11d3jwDt?=
 =?us-ascii?Q?qW8d9U1Fg9UbjR1pEFUrasWXfNMd/gzaZdyz2By/8Yov9PlXaA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7ddNDSjvZTR6s0eBNX/4dKT1A9zoyyCCpc0iJut2cViP6vEfUsjXm3Wvt5Wc?=
 =?us-ascii?Q?RHAapHIGNHoaxUTu1RgKLv6BDKKNp82MRdmLmq9QATMq30XkVBp8BmiGruHn?=
 =?us-ascii?Q?5B8863RsBJaqYl1Z27UBW7bcW4ljtM8YAmz7Q0hCW1UDn+rzP/dSOySPSq9z?=
 =?us-ascii?Q?Peba2EDK2buqj4sfh1J2iCS/u9SodYUEOgQvp9XRfXphf6J3CwMgCF4dvs7M?=
 =?us-ascii?Q?MEm/Nuxk6o/CCQB59vQAxUzPn3sjrpHrG6j9KjivFF7PDKVYR6pPYUgQLwdF?=
 =?us-ascii?Q?OHxBunYs8/fuMVfrfj/o6H3+zvYokpL5R1a20naJMASSoSiqzMWXqJVPgP53?=
 =?us-ascii?Q?lJGiz3eOwEGNxb2060DNThgWGRVTxcJp7WOMCM9y1BqKt7rnNrDDdGYcBJ+x?=
 =?us-ascii?Q?QKZRIQHywojUkhb8LLnH8iz/wbus+WvlQJxGbWkzZz4tE/dJ4zokLn4SL4bN?=
 =?us-ascii?Q?LGkq2XFFpvUo1jyV1FW/wHe8YfBSSfU5aeKVyV0f0nyXwDkkgo7ruBu7j5KS?=
 =?us-ascii?Q?BxwAS1BYEcNH9mWSQTAs4ZAkgFtwCXICQSGGJ5IL37Iushxau4of/AG6OSFj?=
 =?us-ascii?Q?L79mbdRhN0QABHPUObNKsyosCnhF1LofHhoQ2/AAQRszGh2sS2ZFLFYLaTXL?=
 =?us-ascii?Q?ZErNWC9M15T/xqKT6zvvJMBjXz6gvxdx7S5m1DmTGSmpv2o35Rbczpz7v/ZZ?=
 =?us-ascii?Q?paWYu6tTZcaT2yr3FvdNhlRusZYGGxwVKnXYcbeS4oC/0aZpIf7DYb/u3PWX?=
 =?us-ascii?Q?LD/HTsqEghK+jLcaz83/A1kEEZjUDxL+MKLulCFTpOgHI2OUE3QpHEA3QdHD?=
 =?us-ascii?Q?wTrfMUEtiRLNuM0JZIeowOpNiOp4C4/lLbvjuXd04wMZG8aQfORwlhSYbWhY?=
 =?us-ascii?Q?HTlExz/p6rtkqhaIFBjj9D+2LfxnYF3l+Ad3JpUBae7gomM88ZJLbkNWWF+T?=
 =?us-ascii?Q?cqy0EZNPiWm6bfDLIG2zahIXICpC0Zt2mVpoaIqLoZeFP+4FxGn4FeLXLTCw?=
 =?us-ascii?Q?MHcWIvBLxpsIQwK9bKz4CMqHtdDVZV0NGtDfcWTPNxqApr4yotc13FAlG1To?=
 =?us-ascii?Q?AqLx0SkAY6YqiJ0hqhuabL9MfCQRi4Xak3MUe9LkPkfQwSY7WmDVbNevO6+o?=
 =?us-ascii?Q?HK7mWxz8ymEaW0lP7bonjQSFI7N+5uRIh8Feq+sKLuFWH/A8ZRUz9ke/kTVA?=
 =?us-ascii?Q?GBXCuGARR3d5YGs9TrlzHYbf65CpQ1seOUxXVDM+b3BYT52cZi9yf21pH9nO?=
 =?us-ascii?Q?NuLgmJZo3pYiSq0S5SXyEAXPgZd7v7rCBvbrfwXSXOzwLX/Ezx4kWFW+LzSI?=
 =?us-ascii?Q?tnHBsjyfiS51C6ImCoylfSLaiGqPtPeivEawVr+bG/1NXi1FYXYHdqICXZXw?=
 =?us-ascii?Q?DOf6lIUYv2ywajepEhoQJzm4cTOrem/sMnDWxzknjwiMxqVe+jBOk4SqWa7Z?=
 =?us-ascii?Q?BZu/qPYxM+UzNcJykDhGNREF26rN+QbU00GpiIam6x5/xW7c72gr7l+z78N/?=
 =?us-ascii?Q?mJVFkCLFz6pl8IZLbbeoMChQCkPPbbewUEA8xNKbGGpa5N7F708keLaAXpfN?=
 =?us-ascii?Q?6yQr/0hkMUhZbK4ZUYiRfEhhysTEXCBzstCBmORgWYXDDYcWYtHZBpLxcwX6?=
 =?us-ascii?Q?zZRRz0Jd8L5fom092pjnO/4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3807604a-76ea-4b92-476d-08dcd3d19c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 08:54:00.0501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fy3FUFuYJTmu9JAQfp2ejAMvvCrUMKK4+8b8sf/gnZF9OTWcFy52041uAgWnayMY2vnjmiwdq/XmzKkwi/GrAKdh+REKhX7pz5UVj/0WmWiTdBnAZIKSbXmrljOAhGiI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7973

Hi Stephen,

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Friday, September 13, 2024 6:45 AM
> To: Wim Van Sebroeck <wim@iguana.be>
> Cc: Guenter Roeck <linux@roeck-us.net>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>; Wim Van Sebroeck <wim@linux-
> watchdog.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>;
> Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: Re: linux-next: build failure after merge of the watchdog tree
>=20
> Hi all,
>=20
> On Wed, 11 Sep 2024 14:55:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
>
> wrote:
> >
> > After merging the watchdog tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: modpost: missing MODULE_LICENSE() in drivers/watchdog/rzv2h_wdt.=
o
> >
> > Caused by commit
> >
> >   f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")
> >
> > I have used the watchdog tree from next-20240910 for today.
>=20
> I am still seeing this failure.
>=20
Looks like patch [0] hasn't been merged yet.

[0] https://lore.kernel.org/all/20240911132031.544479-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

