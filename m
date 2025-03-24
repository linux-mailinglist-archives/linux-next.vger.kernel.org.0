Return-Path: <linux-next+bounces-5951-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF7A6D6F7
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 10:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4DB81890542
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 09:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4539625D8F3;
	Mon, 24 Mar 2025 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GI72T0NZ"
X-Original-To: linux-next@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C8014EC46;
	Mon, 24 Mar 2025 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742807407; cv=fail; b=oAu77QGiFRzkp8mEgv9K52PzNO5fFQh0Y2OjEP4SCkBh1Bm9dqGFLiDiEo9/yQzI1FDGAQoBR9tRc7E+0LyI+8AcUv38b9zpjdKy2HXpbmnMEFcLO3tDhdkJ8l03WMN2RT9EKhUTS7XW3zAzNuP0Iqn0bZdPdCRS50nDwovKclA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742807407; c=relaxed/simple;
	bh=fIgVHoVYWvvw2guf18GbLW6tRBImcMQGkQ4RPU8VAjE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=doTqzjztfx2y3beJb7Ig5LLYyhrqioHCDy6T6cM9fSibOu0DHoznMN4auEZALMWdpAps1tuBMOTiASJsmbsqiftrsKQkZM/YnvRFk4UGkYXruIb2GB783nxPQO0+bsgi9xu3hAeRZt8/tCE6MI+sAk7CcIE/UJDStTaAgunU4bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GI72T0NZ; arc=fail smtp.client-ip=52.101.70.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/hcNIbX1D7yfR2uHH/19pnoiGgw06LvtIaO2OKBuWxy9/cC+VEAPqapnzkoflvzgpMJtFFYUMiaQ614mfLO8OxTz3kFvkrnOXIwvID2EagoHApxzszKzyYhYVPR2Lj+Wgg522oNJwLAQcfpYbqT9SdqHsp+59BdkrB/7gogyQfdIp78c3PsItBYcI7VULnIAC6KgeQKmdzz+/i1b2XZGInltRPVvVcxp6rka+ZOkmAF/17Y6NXOU+JZzylfqO51iD5qtZPivQzxiNlwGii7KGuRjWheTTCsPNqkcYUstv+70NWyJfT5NeUbBK79W9ZA+m9pYL0FPWG8zW8RHbfWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WLfcklirGNaDaKR/t97UpfMdONVVW15L+p2P0iK7WQ=;
 b=X2jfGYnnmfmD0TyvHh5+vfI3oGIhyu3LTiGXzfvIY8IzUEgTUqSQveiI4OPOBsAHcxGI5AUls6/7gI68FgryM4HWZF5jGJfdKldO0vvE5gICXLPl8v4sMcugA3VpJM0G8vq1bkkrXDg8NUfYR9LgdhtHiMPXFyI2Qmtgv+BzqVKbTnyJN13u9LDw3qa+UvPmBUMz9LqSZKHAJrFFpGS4BLuAhL1K0C8nUfyAY50qwGwo1qEZEAjiIV0iyf/RZlze/3Z5ZSlGalhDqstOUqmNbuAqtFxC9GnA74VJoXsZaOYCwDEt56+wRntGj7uTpKyuFSZSJsfsG9SIu3dDr1KEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WLfcklirGNaDaKR/t97UpfMdONVVW15L+p2P0iK7WQ=;
 b=GI72T0NZPJ3jlJanpbG5bFgMd+NSn4mBKWVYqIpt4jf89WIIkxdNc6kETgsG2uBICpEk87pAavaBMSFAssfyq77H2o16FNF+ulQm+TL9eTqXFLr+Jz0B5l3PaBffzqH6LS4eWciQuPd+9Im8xyZuHUuTpPDBzvHtpK9WD9N6AN8+NXz3+Ok6dSpng8MG4UvjM7H5gzYLZsvHIzZ8ddtPBQxO8qjtZLxwIQwLYaN9T4oFi129FAufSoxOcyG31yoblQx6p5Oo4a/ODhz/0y9bB8wpu4C7sIf/mjbSBih3H1JxRgepBP6Oipux1Ex29rBXF02euJlwbMzpRTM66x5jOw==
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19)
 by VI0PR04MB10832.eurprd04.prod.outlook.com (2603:10a6:800:267::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 09:10:01 +0000
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37]) by DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37%6]) with mapi id 15.20.8534.034; Mon, 24 Mar 2025
 09:10:01 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the tty tree
Thread-Topic: linux-next: build failure after merge of the tty tree
Thread-Index: AQHbnJgAlDuKaogETE2eSOuyLfaex7OB/x9w
Date: Mon, 24 Mar 2025 09:10:01 +0000
Message-ID:
 <DB9PR04MB8429CD5C790E85AEBD7A7DE292A42@DB9PR04MB8429.eurprd04.prod.outlook.com>
References: <20250324193728.4af92ccc@canb.auug.org.au>
In-Reply-To: <20250324193728.4af92ccc@canb.auug.org.au>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8429:EE_|VI0PR04MB10832:EE_
x-ms-office365-filtering-correlation-id: 270580fb-1fcf-49ef-d755-08dd6ab3a899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/jqd30rTwIxtPZDMpSqQ/MaTnVSOkeTcFysOLvzr79/Wc5oPcDwjDuFQB+ZI?=
 =?us-ascii?Q?AEPLYPg0PFLjlC2pOVLJ8wAEHKrv7XAwskYJThL8jyiTXnRPbLaHLbZJovck?=
 =?us-ascii?Q?w6HJV/FqVO+8wIs8XH6wUh+yaiiDjuv3v0sGJ8Fs2lhUNSBO3ilH0+8IZ1ZH?=
 =?us-ascii?Q?fE+VscAXm2y+BIXDujf44EH1fqflGc1qnXhdknW7IEVOGRezx5HPqYKdS6DW?=
 =?us-ascii?Q?FBwDLXTsuwtHPCfaB3D1zpas8ryb+EQpLrcGlIzbOHrTgWHOetPU/aHNVqdp?=
 =?us-ascii?Q?LXUz4olBZobHKjANpdSZZ8xuLYERHzxTyhfpIs3sJKRXDc8bDtMpb3z3HZfV?=
 =?us-ascii?Q?obib/zCByH0z2+/NEGKdgqisyOIUHQbMu8N+OUSKSRjUOzhJmsu024D9EdJZ?=
 =?us-ascii?Q?m/bi2smzvZ4nOkzRH+pCKeug8ZP739A8Paa6VyjWuQfwMebkVhCDJs6pFnOf?=
 =?us-ascii?Q?JsrrfcPtwibcjP0PtDmN0UMJW1jSeYJz7I/jyMybkMwtyFyztIiNjfuaTBAA?=
 =?us-ascii?Q?wbQEbith9GzIHoWuQxjAa76vFpS7P3iU4L/P+NMXusb5BJX0JAbHlScfFWzG?=
 =?us-ascii?Q?rRJJ7FZW/yH6Mr2lMineVcseOCFdvOP6NuACoIQ4AMYsKyAwwa25jvpcPmA+?=
 =?us-ascii?Q?JByxGg4jwfRK8JrvUuzJCPEhEdNo2JN5HCK925MiM0+hJ06aLILUkHzsDup5?=
 =?us-ascii?Q?10ConG5sXHI71Lf1cfwE1U8iF6vstp6IhmwsMFLLZAiiimd5tOm2613mbTfB?=
 =?us-ascii?Q?LVJ0t5HD4zWfoOOqJCdrXQIN5rY040KVoRhR2sxoyQwDOjNCG08eQT7VScRo?=
 =?us-ascii?Q?33mhiqilDvnvmNbVFJ8mIvMI5Qe52k+S1k6vQWteJxizZK1jNmRsp8O3HkPr?=
 =?us-ascii?Q?bglfGYN3HIR3Hyo6MCO1TJ326At1h22ykjdTxabvGcY3IFJJIf65SLmfqdAx?=
 =?us-ascii?Q?ISLIRdjNpvGjBPRCJsG5ZQ7Uc6MNmaf3XYyIXtpYBYmqOtuP88iqaJ54ZmhM?=
 =?us-ascii?Q?ahkPEwX9uNy2tdoxcfeam2QQYGVLks0nfnbEzVhe9n8D0/6dushDmOalUBDJ?=
 =?us-ascii?Q?yrgw+JENtBoWJ1P5B/RFtU+Qh+d8nJZewjXLN2G6WtB9CLtBX0d9LNSiD/2g?=
 =?us-ascii?Q?ktfwtpsAYgdYc/zUP9ySh9gjkgj+ejMWY7vx409NC+AAiYCvQELgRBnvmnpM?=
 =?us-ascii?Q?6V2eMH4zafifp0Fn8/TdiHBXXqXdJg7tVU0ww/Tdj960mD9lOw1SpsfEyWl8?=
 =?us-ascii?Q?xHq+96GwuleZETEiAFq0dwsI5w/Y50fQa8HIggmMLjD1UTU0JRrLNqOV6Tol?=
 =?us-ascii?Q?BNkL9uEMlyHOxZXS9b0COFAs1H/7fDV7W+YZ438kz9mGBaGAFhCEJlro1Ct6?=
 =?us-ascii?Q?4sBhJXA2k1NzDUnddnuVLaEA+W4+wH3GA8gECHKTyWrywcrBnlvD883qlc28?=
 =?us-ascii?Q?mP4aUumXLZGWXxNxIB9k7zW6hDz2vQdB0OvrhGOCDf/qhp50jYIBMA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bgiBKqwe0UGaRN1CxhyLh23grrlp/EucgwMJpE55BfQPPUy9uSggPxWhyO9j?=
 =?us-ascii?Q?mwgcVj8XJ38vE2CZwcOBzV4qpyrSfoW/nf8k6RZM0QPYhv8slIae5rwzrDQx?=
 =?us-ascii?Q?JMrpocDDB2hpPRM3pNlBrOMFTvzIeC7efYiO5wjtPNvAYVnBKVyYIdZIz8Je?=
 =?us-ascii?Q?ISKyNbmG90QjqiEGkY3e19qP7frXxaeDPQLUva+Zo2YCiCXo+BYi7JHuoqrd?=
 =?us-ascii?Q?KD4wchzq3HsaCig10ykEF3SStTCY280EnM1ZwVSiOzdLGAWa7VVDaHewfgxh?=
 =?us-ascii?Q?32bAIzWkNyFzZ2ZLdNu+inWE2hFCxze47lS+lr0c2D85uLYnkO4nU3kb3jyA?=
 =?us-ascii?Q?6U42UmtmuJEZ/zWkkVhRuMNDE9BMxh4K7luhhbWaXgg1V8vnKTdH2DO51OTA?=
 =?us-ascii?Q?MVFOk4VoP21sOUlZqXUt9R8H5b/1qKtI6cJQjCgr546WrttrO0MTFVYXqoZ2?=
 =?us-ascii?Q?zXjl8Obczl+AIvb3ddRr1Y5C3FibRxn5mFrh4PCy6lIiUkEQKLXO8kkQGxu1?=
 =?us-ascii?Q?CV5irOUf88tJyrDzP6P/BLPKz06/d+fcSOXlZlcT3ASHkKpMJFFVubEVdCKA?=
 =?us-ascii?Q?pSMVknTh0BA0vdUnFI/5vygzAW/GlFzfFVgKAdNeY2tkRn8db/TWNsZExCuD?=
 =?us-ascii?Q?m9gOvsDNodmdXWAvKz5dWOtl1Ofd1iTPWZAywBVA7AO702XJNkJJYWS3QtU9?=
 =?us-ascii?Q?i+zdmgVm+I/qT579evV1YNZ25r6EMkSAEvkg5ImE5xu2Ml9yO83ezHhzlEvk?=
 =?us-ascii?Q?e8Rux1UgUoSyaq+U9+izE+M57UOG8dvdUyy9L/ZsYzTlugOH8ntyffrLziq1?=
 =?us-ascii?Q?ALI3Y7tCpYxBi1FZQoWkqf/WQdz27Hh0kQX2R8X9u7GSeRTgS75yClP5VqGz?=
 =?us-ascii?Q?3KJhmaXbLZoOh/8PWrBVRa88wKcfgPM5k1tsmOcudhwuTNMlDmqjLSVLrgEC?=
 =?us-ascii?Q?n4oS88dGCIwDStGKzipI+WAcyYZoPlVbB/C9ig4ymgJfAZ+zN6iuIhxWio3a?=
 =?us-ascii?Q?kgj+sZTo1FTyv32EOblvB4xvg5c+ZxdmSAFjYwidm+24u+al5TwT/pW6lBvW?=
 =?us-ascii?Q?6MmeO9l4Mbs+SIGT0YyDA2z6vN4gReydVC6gLjyun+MqzdCNL03ok+TsVQpF?=
 =?us-ascii?Q?hSKABHIBZnboDyJUHBDbMhiQANa/8VzZLsyTjUIgL7us3tGgsPzxED/uaX9r?=
 =?us-ascii?Q?Pf4FURNc/JvuvH+px9dfz9ysjgwvAJv+RA6pLkUe511SSmAqYfbFEHleM6ep?=
 =?us-ascii?Q?izUXZ7ZZlPQvDq7H+W8I4MQxD44uU2hq312ZowGZUhUoQnDacykb8mDi9L20?=
 =?us-ascii?Q?uKgrPA3Hxh1p91yYfR5UBXjFTU8zDtTwOHU84mP6DY/wqVWRQKM1RCNyDguB?=
 =?us-ascii?Q?KxbSYP5/z+RGqHSuSVEBO/0JZiNtqXslW+zONrpJguBiStma76EmJfXBWZzM?=
 =?us-ascii?Q?3gJnLMd7ZSHuAIg0tT6rn0GpJDHng0LSA4ch4Js+9Tk6bR14xIfBNT2hQvcL?=
 =?us-ascii?Q?pP1O7xZS//qaJNq20U1FrSwRagwW3zOF2umrPNBIVRdFK0qzKsAOOZoZEBDG?=
 =?us-ascii?Q?nX7cGWCCTFIWb2WoUgk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270580fb-1fcf-49ef-d755-08dd6ab3a899
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 09:10:01.6645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHFfwvpZyZNHOi38lbLIaeGXfqnDT8IdNzxI023APm3hRCg3PK8WW6n0nqZD7wY4oUFltXgEgOk8ypPUMfgQZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10832



> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Monday, March 24, 2025 4:37 PM
> To: Greg KH <greg@kroah.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Sherry Sun
> <sherry.sun@nxp.com>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.=
org>
> Subject: linux-next: build failure after merge of the tty tree
>=20
> Hi all,
>=20
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>=20
> drivers/tty/serial/fsl_lpuart.c: In function 'lpuart_poll_init':
> drivers/tty/serial/fsl_lpuart.c:642:29: error: unused variable 'sport' [-
> Werror=3Dunused-variable]
>   642 |         struct lpuart_port *sport =3D container_of(port,
>       |                             ^~~~~
> drivers/tty/serial/fsl_lpuart.c: In function 'lpuart32_poll_init':
> drivers/tty/serial/fsl_lpuart.c:696:29: error: unused variable 'sport' [-
> Werror=3Dunused-variable]
>   696 |         struct lpuart_port *sport =3D container_of(port, struct l=
puart_port,
> port);
>       |                             ^~~~~
> cc1: all warnings being treated as errors
>=20

Hi Stephen,

Thanks for the quick fix, actually I sent the fix patch earlier today, plea=
se check
https://lore.kernel.org/imx/20250324021051.162676-1-sherry.sun@nxp.com/T/

Best Regards
Sherry

> Caused by commit
>=20
>   3cc16ae096f1 ("tty: serial: fsl_lpuart: use port struct directly to sim=
ply code")
>=20
> I have applied the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 24 Mar 2025 19:10:57 +1100
> Subject: [PATCH] fix up for "tty: serial: fsl_lpuart: use port struct dir=
ectly  to
> simply code"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/tty/serial/fsl_lpuart.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpu=
art.c index
> 33eeefa6fa8f..4470966b826c 100644
> --- a/drivers/tty/serial/fsl_lpuart.c
> +++ b/drivers/tty/serial/fsl_lpuart.c
> @@ -639,8 +639,6 @@ static void lpuart32_wait_bit_set(struct uart_port
> *port, unsigned int offset,
>=20
>  static int lpuart_poll_init(struct uart_port *port)  {
> -	struct lpuart_port *sport =3D container_of(port,
> -					struct lpuart_port, port);
>  	unsigned long flags;
>  	u8 fifo;
>=20
> @@ -693,7 +691,6 @@ static int lpuart_poll_get_char(struct uart_port *por=
t)
> static int lpuart32_poll_init(struct uart_port *port)  {
>  	unsigned long flags;
> -	struct lpuart_port *sport =3D container_of(port, struct lpuart_port,
> port);
>  	u32 fifo;
>=20
>  	port->fifosize =3D 0;
> --
> 2.45.2
>=20
> --
> Cheers,
> Stephen Rothwell

