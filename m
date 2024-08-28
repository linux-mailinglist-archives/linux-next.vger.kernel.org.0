Return-Path: <linux-next+bounces-3469-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA8961E32
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 07:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFBC61C231DA
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 05:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE87D14B955;
	Wed, 28 Aug 2024 05:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dygfUCl4"
X-Original-To: linux-next@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92D014A4C7;
	Wed, 28 Aug 2024 05:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724822977; cv=fail; b=sAB+UbYh+X7KnLvvVkkeVLw3fWt0sxNO0XDqgxmj1WTpkXpYZR2vqTSZRWmIsNeFeFVuv9oPLIyAGf+DuRHzG19YQ1J+VsCRpihP9EwaukCrpJwmXdLZkRuLpx9CrdXbi2NQa8J22Sh4ZQq7qSvpKvfo1pci7173uNRTLlqG00Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724822977; c=relaxed/simple;
	bh=oXS+lLdFdumKgpadO8dXImo+Gv92U9GDFIPelOjpQkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mDxAE0gTg1G6MiOrEYbOBXUk854HwN9HV7LXMzDE5GX5tlUgwINrEkBFELwbzAkXIbktw+M5tbDZ+HvghQ7EfIocZZI0ZdM8N5STlZbGbTkySe55jh7Od1PXVBeKXHhnvI9J952mMNz4VqpUOw0I+IOppUBnVNDkWO+JR1+6aV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dygfUCl4; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJT+9tVJvcQVa12poouPXBf+b9XWMjNgE7+6c0yAAl+WSlnXXcekySmaeVXhj9cBWJC59eP0i3BKPZGbteBCqMjqqOYEryNRMhM5eXrRbot2lRE9gZOVfJsxE/TOe//21S7GJW/zKgDfJ1dzqMNax/LAdAtzMWpf4lkKyBN/mH2fXuO3vYL5AmcipyUHYRc0BUy5Z2uQL1aSDoj3P9y6LaF6f5ZCIote70HBinIxOpcOeGItA1NJ7U32Anj1sL/8MDKjSdQdfqkyI3k8T+6aNC96JJ+UQZVlHluTUu/FF206jks1znC7iFDQxj+vFOsnqNFOCYrsZJmAgluVjPqj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vB9AqRiQj6COevpvryqI0CREV71HMWIm/s+eRcG1AGA=;
 b=ZDEidmv0U0lwU2P6Sxuym0w4OBmDUm78JSLlsg0bwRvEtFket5HSgBDz95/oaZur+rtYUXSN5LRRwS80vRwfwrNj5HSlA0PungYQBRVy4U9E7neKFl+hWSEXbYDyEeZulLMKenthVRhPKBK1+I0UjNtweXk5QH3vU9mRgkKiBiJNRqKvXGotMXGlaV5nNMID/+n4LsE1gjt1S02gNv2WBJr2RTYUrORG1YY0qn5muaBqG/2YwkkbdPyrUajeP7ALdrhKnOCaA6+SfybI9xzLNT3fnkrbOL0xS2kiwqLF9qFZDPf+M6Bq6IWnCazUEXU1IHVEqctIXULQhGQA5dmY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB9AqRiQj6COevpvryqI0CREV71HMWIm/s+eRcG1AGA=;
 b=dygfUCl4hy9DCDXMKHrDYwtili9RtpuvDSyFzJ+08SrChzhwOjZ5ufKOIR7uBMslEL2hwRHaQHajesU0UmSAyauwFqgjd5v/Nko5ZNEkS8idPC67MTxoLu3sjIrhJAqKICbGv/PXXZoHOiHivFbtdO4uY+UUhzwr0/i70wlka/OAsDEn5dg71Mh0icEA+3up30NfM9tKSKVDKAH976P4cy6uJBypYEbzs7M4ZVlD2riYk829feYaKBKEWlbGtlBJybkrKOPODx5KW5SoksVKdLmiriDUIprXGIMZQdZBbpnVa4+Y+PGqFmbCoHzNXELMosiCUgvCAC+ppzHLmG/xiA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 05:29:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:29:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sudeep Holla
	<sudeep.holla@arm.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the scmi tree
Thread-Topic: linux-next: build failure after merge of the scmi tree
Thread-Index: AQHa+N9q6gyZcMQxl0iy8gx08qeQ17I8JEcw
Date: Wed, 28 Aug 2024 05:29:33 +0000
Message-ID:
 <PAXPR04MB84593DF3B21C047AA6E3328488952@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240828101531.38e633d8@canb.auug.org.au>
In-Reply-To: <20240828101531.38e633d8@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7653:EE_
x-ms-office365-filtering-correlation-id: 8c1746d0-7b72-4303-d2dc-08dcc72265e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EF1OjgD4Jgp/31fFezW98w97T1MuD8r2Px0EMEvzM6Gh1dMk+maqOW+3W80b?=
 =?us-ascii?Q?5so/AtXaT90H2Bdltb2v8AZdTpzKgPrhfrF0IpL9qM8AF0P3SZRn/+gP0V8e?=
 =?us-ascii?Q?nAqHyXk6MckByr2K/pZ+TRulJGjnJZxacm1yyY7IpoXvAv5r/bW5yZLgO+ET?=
 =?us-ascii?Q?lOhmB/BhH/NYMNmmq/xHHR2VqU8tiRYsI2RRgymYXw0tZvN8OXJu1E1kEAJO?=
 =?us-ascii?Q?bYjV9pv8commfeX1Mr8wwcnDaNSAvl19JTq3c5UgeK5ara7ukLaIcky+WHXC?=
 =?us-ascii?Q?SMlZEQno6Hiz+I3Qx8/XVK38hqQmZA4yLqNsnB1I6xg+u3Kd9tz2ITi2/gsr?=
 =?us-ascii?Q?o2PVoL38asF5/73YTGXJo0Pu4G0XRZu+jc2aARvpGEM9rS9kWxYJRTMWAujL?=
 =?us-ascii?Q?Bh2v246jadKdVp66X8MzlKLMzVYfNLuO9nUgBfHSssEXUu/s0yR9YxKGTRYk?=
 =?us-ascii?Q?yGvyFzhtWinuRE6h9f9gVPYNdQjDkwApiJ9YCc8zvHp84UyPe/ZPyW0KzRSF?=
 =?us-ascii?Q?dVfjPQFRjJxPJzhSS7CimHmxz9cc+Q8g5yQGt3ubOiqjMEhEhS808DhxRtPS?=
 =?us-ascii?Q?ehsfDihG5fVCvS1LsU+w4wyfAGlFDrWAr7B259hsivDtoGmizRsKFE8ArWaN?=
 =?us-ascii?Q?DadahFx05ki/zM5iHMg6l5KG8tU6VtjK4nPX/CRraVPq9rg5HhumWXNtLkAl?=
 =?us-ascii?Q?H82SDu7NOc4Li7zKW8cIuGsSNWHZ6xEKRhsePqtQJFNhpWL5aRx10x5NG8dD?=
 =?us-ascii?Q?qqbx7MOQn+vVuMJ78eiCfyjwyHrUprjsyEyuLVzh0V2V0pMzwwE3vAm7xUq0?=
 =?us-ascii?Q?7D8iEIxtglnSo33dC3UFALEHg+ipAcBpMl4hTAgp8BabVHWZBm5EaV3dKC82?=
 =?us-ascii?Q?860qfwA/d8F1hY/mxbKhXzdbO500No8we9zyJbusuFV5GA/CT0ZYMl/ta28c?=
 =?us-ascii?Q?AAUjX85bwstJE6XXdorYwPh39rl3P5cJe4DPWHStN4dVSWviE6c8XKV/PQfg?=
 =?us-ascii?Q?Y5k4sckDANqFfX1H6B3W5OKVizLmdOeObggLbZzpM/tWD0x9z6K0akeHMfol?=
 =?us-ascii?Q?IfVBUA8sokvut/X7g4K8CS6PqTIftdRNlMP6aArS0BDkabDe0+T5pwPTY06F?=
 =?us-ascii?Q?b/uwCF21bsQbGnIsiMSa7GT1C+Q2vOHhjXLDR5KXitsQo9afWvvnORydufAM?=
 =?us-ascii?Q?px0TmRo0sCs7uNB8RkfSuFuMEltXzvmaoHHwzyuqzeQ8uwWmlKpz4rge7Rtw?=
 =?us-ascii?Q?wZlCznwNm6scX6iU0pcFap1aD6LAtbZDGoZj0GDIGDDR0H8Duj5Uedgsd381?=
 =?us-ascii?Q?BqlfDcBUxMHnZ6dzaEVNHTpFnPbQ48SKDdMwl6IC0IRqUONXRDRmK+kRSC3M?=
 =?us-ascii?Q?LIbsg7RM/pe7S0f/ItmqIPTiA9TTSGAFvMC9PL6Le+qTvrB15A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gqL7klVkrd1UBtbuducRulwIYsSTYgnRr03WCghMv1ab+ZVOfTTLzqSXEBSm?=
 =?us-ascii?Q?ls70pZ6yyhQkwJl09hwKIyau3q8E/K85uMvWjLqkDozU52t5kLioRHMTHNSL?=
 =?us-ascii?Q?CFTp4yd/4ymsJagozpQe30iC+1/OSk4IfLBu+kyyb7K3w63zz/h5EPvA5n56?=
 =?us-ascii?Q?V68t8YCRHuMmvNu9j3A0wp6fy5hdhc9ttr+swOjFerhqkoOus7N5EZhQfFie?=
 =?us-ascii?Q?XJj80LKi0jKWoikG7j1vacSmHSSBrRz4fcrGO+zBFjkg1ANG1vE+l39ropAp?=
 =?us-ascii?Q?6BP77eU1igirFsmcdTQ0nvfHKcpIGWoSrV6AGseCqO87QdJQftdGLNAQ6UI5?=
 =?us-ascii?Q?HdvYGfgcOIF26Ov/b27ZvENV1AMn9IrGrzR4TsDbfVEd34UktJsapQzXVONu?=
 =?us-ascii?Q?itWzCcYO4KILZa/BEE7pHTRK8ZygkJyfl/KJccwQdpBIiOTat/11jDPzlidA?=
 =?us-ascii?Q?xGTN8HcZS5Fa8ennvLeZIxd55POlzmmSDtmMiJAA66zfrya6QVS5bmVNt5/U?=
 =?us-ascii?Q?mqvtGB5GsUC4aDtJB6IQe38ZA8Gh/Aao+QEnY/z4TpZbLhv5sKo10kuuAAEp?=
 =?us-ascii?Q?1y0Pg21P31YzlhoCRmYVCwIsB8P/LOiU2gPeMDu55/Yd5BA4QhKnpBZCi9mS?=
 =?us-ascii?Q?OOLGSRRfU/e3vscDiXemmpsPw+DTdUnsZSKtpauKyM5H4s02U9PrL7hjt9mP?=
 =?us-ascii?Q?rtiImWi4nVKnmtQlj3sZcAXc/9bNTg5b17iier3IT9CsJCNSmXHN/MzAf370?=
 =?us-ascii?Q?9V8/287LQ2WIYFFt7C0gNmj0D7iIoaMMV2r3jgXGDW1IHK9QgZ3iclRoiPoa?=
 =?us-ascii?Q?FJnCt5LWZ8eQEy+qVSXggLNOBcJPje3SyAAQHdyYBJqBxikaZdLY56v9LPyU?=
 =?us-ascii?Q?CdCmGqqTf28xc2aPfhS/mHC6Cact4Bj4fpdvgki2wmvqqUUQpndrNXLCzs6z?=
 =?us-ascii?Q?7OuNP4tX66W1N+5h7IUYCoUpfff+7VB+n82qfld4MYkWmzvi5qG37xXGm+YQ?=
 =?us-ascii?Q?SYcCHGT3HOAAvLpzr4JxXv8ie/putelFeq1B0BkjB8STpB5nUB0sWAXVguTD?=
 =?us-ascii?Q?sdpkgNjhpZI75Dqh3AE8Z5qSqxgdXNWVdGHlmRmd7uMJgx0YRI9ZeZ9q5h9+?=
 =?us-ascii?Q?lx8I2LStFG6y+Dk0+1KdU1vrfN6qtsw7kwt8Vt9rcv6IyJZXdpq+lZX7ldQ3?=
 =?us-ascii?Q?ajpgnYpfFzUflqTcQiee9Dv/KzrspPN7TyJbHDRnfc/bHtegsr5dhxfjzgja?=
 =?us-ascii?Q?eVhYlHXEO2oq5zQ3VAyIdGLt3rZEAvy6hTKTLiSrWsba9r0rw/ZHvU7AnSu1?=
 =?us-ascii?Q?vG0Fh6F3QsIlhOlGiZ5bPMyq7aOR9unERw4nggbaRHCzsLcIk1oEtIvFq2fi?=
 =?us-ascii?Q?qOcQIryFo0YuEOuwhAliXlvdGAfRiuhDDCavQ/+7AsgIRakZdQp5/bWHJnkK?=
 =?us-ascii?Q?gj+e5u5j82KEG2NpZNNXz9kZ13YI/8C95sx45d+5J7xqtGr4j45Q3Gf05gsQ?=
 =?us-ascii?Q?uMu/ulv2xHvLG6QyrWrCcVXGq6cwQ8BIsr86KeATZnWgpqtNGT8Qi2tykJ6o?=
 =?us-ascii?Q?gc7bMQwdUEK6ovvBIdk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1746d0-7b72-4303-d2dc-08dcc72265e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:29:33.1605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipl/2BIB20TtbsgxoOvq0gBHG6qrTk+HK+a82q5X1YlZiL4b3ONtQDzlcGnxOG2y655sQWkflhHdlH4Zg7Cfgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653

> Subject: linux-next: build failure after merge of the scmi tree
>=20
> Hi all,
>=20
> After merging the scmi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: missing MODULE_LICENSE() in
> drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.o
> ERROR: modpost: missing MODULE_LICENSE() in
> drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.o
>=20
> Caused by commit
>=20
>   00bdb213e944 ("firmware: arm_scmi: add initial support for i.MX
> MISC protocol")

Sorry for this. With [1], the allmodconfig build pass.

[1]https://lore.kernel.org/all/20240828014746.1713728-1-peng.fan@oss.nxp.co=
m/

Thanks,
Peng.

>=20
> I have used the scmi tree from next-20240827 for today.
>=20
> --
> Cheers,
> Stephen Rothwell

