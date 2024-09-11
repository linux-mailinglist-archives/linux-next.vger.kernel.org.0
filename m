Return-Path: <linux-next+bounces-3756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5590974FF5
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 12:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29F381F25415
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DC718132A;
	Wed, 11 Sep 2024 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="efsCWfON"
X-Original-To: linux-next@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD3239AEB;
	Wed, 11 Sep 2024 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051346; cv=fail; b=HuVmV3lwsQSlSJ9XKq+DaBl6DNI508iwWLR2Ef3JKYu1JCEnXH40OXAe4BszkHrI0RBPBc2edh2gC3ggWxHj1OrMi9IdvB/REwHgiHG+GU1Az4JjcPzFD6hMGeoFvdqiUZ+OOFb6oE3dAySgCVA9Ezme6f82fNaASIpC9tb8c2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051346; c=relaxed/simple;
	bh=sxadQpVgZJCgqOD+rNGmdEVWjTF9MwLjpfbPgXZ5BKs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qil9bqPHVzxm6BYNFDieL+bFczPIRSntQh7k2vN+e6GAzvdXj4ES0pYzn2Lp6GbVkQbPcpJCln+i3xMVscpK3omdH+F4pd+zq1NOlyX177H5oo8eRE3UoxaF9ZMUNQ8/mnjKFSCxwCw53VL3fggvmYCbw9yaClyRtsVjpb7FLlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=efsCWfON; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6C4T5agUCwJWNFO/l4RwaDPcHN/2Xmv2/ZRgDJ9KvdrSXg5CnVq69gljEzTujrOuxhL/2F/prEXNjPcFqNvIvvDY6qluFiNT1vykkW5kXSjpNzv5LKsw4aCT35tKUOS/OnARmkxp0jLw8jRzUN+ePsyDntiSI/4xTf7JYzPgUuNlixEFooQOlgynT6dYjlUM2P2ThMxfgx9NMTyBRKoKGFjlLdKXl0OTjH3mTosLBh4EGEO8/Vzs7TqA83RLevaKynYBjGRtB4N99n65rvdUMjs/wlroBhUqIaqNiW1jKK/rGIomkUEQPPw4N3jVlWGKCNnOW5fpz4O7j6+XoZrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y38BczweV50JGeLxW5/itw9Ypt3IdL0GlvHmAW1aeDM=;
 b=Hp8Rfg4TOpGExzE5lWGnvwlo1H9U06L2aB3eDaURLz5x3JKY6o0qILH7g4ht1ZeMLxU/d2U/SckqxyegRHS4rlK1htJhOtMGCSTPwwqqkL0rVtJlNforD9g6oMJBGy2iJojOalteOJsjPsnszONbpH63dqKroPj6x642GXKE8CZCjqfRFM1hsNXaoFdiHr9CTVR7oJAEoiZDa9RecfQ0L0u430h4vbB07GrDkPQnARU8gVG72oZn2JquXMpX/RpArzwXMJn+tR1SRCEOI4HtoegueAGOgdZFPPAxwXLYhp58laZqXnY6MOqfY4pZ+UGZf3p8puF3FMt+ivIcnknPPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y38BczweV50JGeLxW5/itw9Ypt3IdL0GlvHmAW1aeDM=;
 b=efsCWfONNty7SqrFXlNx491Es1JENQ+g+oGFYttseFhHv8WlUlGij5jmuCUx/L9X/+7TqEC98hkh2daKCBo8VZVZtJ2mGWhWAv1fdNGHYS/eqNYRl5I75TQ+xGbiJdr2maCurLPV8/1Gr1mFweY2A/6ljhfyIu6AR8DS8hI2qVs=
Received: from TYYPR01MB7024.jpnprd01.prod.outlook.com (2603:1096:400:dc::9)
 by OSZPR01MB8548.jpnprd01.prod.outlook.com (2603:1096:604:18d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 10:42:18 +0000
Received: from TYYPR01MB7024.jpnprd01.prod.outlook.com
 ([fe80::39ac:b8e5:61e:8037]) by TYYPR01MB7024.jpnprd01.prod.outlook.com
 ([fe80::39ac:b8e5:61e:8037%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 10:42:18 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>
CC: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the watchdog tree
Thread-Topic: linux-next: build failure after merge of the watchdog tree
Thread-Index: AQHbBAbhL4ip24uQK0ynRtwhjUDNZbJSZktQ
Date: Wed, 11 Sep 2024 10:42:18 +0000
Message-ID:
 <TYYPR01MB702455E1EC2DC714B41490B7AA9B2@TYYPR01MB7024.jpnprd01.prod.outlook.com>
References: <20240911145543.270c9c9c@canb.auug.org.au>
In-Reply-To: <20240911145543.270c9c9c@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB7024:EE_|OSZPR01MB8548:EE_
x-ms-office365-filtering-correlation-id: 6c41ea90-19f1-456f-5a78-08dcd24e686b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?N6tb4KSQ1lvghgQx0MVXgSq00XJbNI4/8y3OlS9v2eWy8J4ZfyB4ZZQgk/EM?=
 =?us-ascii?Q?WP2HPF7qb3LjH3gNfTKK29dkPvg2bjb97z9PEa4X7SMvnUxLv6AQbV94uKCi?=
 =?us-ascii?Q?L41oZXIFSLXZH19TWsAITfJr5QaOdR4ma68sH1wfk4xscAwDE1eJlvRTNivS?=
 =?us-ascii?Q?nUY1FtlUdwzQUflhvhTmZobQcVN6jdR9atEGGhEwupWa80ZAemwxo0kI/K5v?=
 =?us-ascii?Q?vRYNh6yGhBkPRAiSNnnKp/pPrdG14FfHUrAxmKB3EBmcBp/vMmhPhPCrC5kw?=
 =?us-ascii?Q?/xLlRClopXkVlC/60GbmsGhPbI+v6OHbWslFVfpYbARVoqthdkOJLXqnydGr?=
 =?us-ascii?Q?2xZySNmfmA4X2B4s+nLHq/VfAsJNRZE/fIXuUzIbFCr3rhtM2ocx974cNWyn?=
 =?us-ascii?Q?nSAsYwaUBpb54WMOiTHW6xIE9AEPD6T4JWsTo+Yw0DDirJnb5nv04MdDGleN?=
 =?us-ascii?Q?w+mOS4uAfZi43nWjmHNBEVyapWAuPFJuY8st0aTbSCEIpdYP5ynJgGZivy+9?=
 =?us-ascii?Q?TzVwxNMQ4BLzCYURYu4g0lTs9ULT1jJS+MKrlmEFn7VH86Z+yzc3MYeFAiwh?=
 =?us-ascii?Q?L2+RX40b/zjxOJCDn0nW36TrQ6qFAu9T5YE/QqfHpDcEoMk+xTT7UXS48zLL?=
 =?us-ascii?Q?yZKMqT2F6fxkcIBTkSOsKJiMJCpYcVEZ47EpYiGz4uIJSANXFP0YT1lLblyi?=
 =?us-ascii?Q?aqwLTd8Vjq6oXNKmugOTJ4K7F7XPG05eY47wUjftkl49LKtMA0+LTFHYG1m7?=
 =?us-ascii?Q?Kcrs84eGny6+Q3l/gCopGzldpAImBGHWpYTFmq9H6Y3soTANNjqf4HAZ2mK6?=
 =?us-ascii?Q?Wf0l54I61KkOzLz8QqCE/KyI51qg563T0r8DzeQeiyaLfE671wcmGbjoVD/9?=
 =?us-ascii?Q?LitMioGNn10qq6pETLLhBu6DjzpDmmRjFJWe91hGFlvno1Kdix0KDfVrBdJt?=
 =?us-ascii?Q?4kjMJv7he3p0Br2A6DoHJURRxtdgJhT3cBVOoomEBfC86JNRPdzB4qgZqRx2?=
 =?us-ascii?Q?UZCPP7myquz3iBsbHkOJGRZDDuPJ4zh4Itq0Adn3GBvZ3QkbA/zwpoi4FRZ1?=
 =?us-ascii?Q?VMffAyMKa6k8u9CoPq1yilJ2cfz6iU4waL+JiD8jvJP2nDG2/5tpyUM5SrRb?=
 =?us-ascii?Q?lD71pxyFLrq/betWH+kJGrnNCMSHUNyE6tk4JlC3kUZIro7K4aKhfDR58ul9?=
 =?us-ascii?Q?et7slYMkaEZiDTJt42gmcCKp49xInXzDBYNf8VXrJQXiTw3DLscGywJjZvgR?=
 =?us-ascii?Q?HtG5GKe0agk3NSSBSAZc8H8VDU8prcBY0xmIHXtn01zm1RzfELCTMltOEpt0?=
 =?us-ascii?Q?avKHkC05oOrjj2w7l2gzm0FaCt0SYKyYtqm6GmWncwZQwbKQSQnrLYuvz56C?=
 =?us-ascii?Q?6aslnchRwUYW9oanOyrysm96VfuAdBVNM2iLfizGFL4sZBo+4g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7024.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qTXQJUuw5GouxDmCnENB71tumN5gnvWe4PtOn6ii9SXG8EAFULRrlpSq0MQb?=
 =?us-ascii?Q?+VCZpWfUbJyucSnLrzybqp7woEzCYSUK2czqPUh3sXNyPXgYdAklzDsW68IB?=
 =?us-ascii?Q?6kN/FG/OjI5A+7JbUEgTxC4VaYqm3T8ApefiJQnEtW8hdeOISliJLydpLiJB?=
 =?us-ascii?Q?/UhHD9R/ALvtFdNCCEhytmFXEtGa/xh3pw7NT2ksmS+6tt7SGsNFOAohsoWO?=
 =?us-ascii?Q?VZ87Q5Cn7diVnDTWi3QjmahkRkDE0bSPRo0xe3SqzblbyC0Z3S+39uQPiHJn?=
 =?us-ascii?Q?RQOHZDWKo+I+076mM/jtGJk3oR2aerUfpM7l29Kje2ijJELZwJLMGXwG5z9d?=
 =?us-ascii?Q?Ip6Z/YpH93h9jo7Oa+IACPF1JE/DFCtMmoWdTIwisXujvgr1I/FcWmcoNsni?=
 =?us-ascii?Q?f2XpAo0E9w6FTvpUacn8X0Xa52iDgfTEGRrmKhZglrdpdtcnbfxX791leUfR?=
 =?us-ascii?Q?NE46sAg+xpCxWAS8zKxndXE76At4lQSEaj2TC8BpALMzA0Ez4/TbFWRB73el?=
 =?us-ascii?Q?Gtlc9pNKeQWO7fjKiNHnFH/f2ii9a4kBJLCau5WrdSG9euWGt3BPudZRzxAH?=
 =?us-ascii?Q?lXUki419tc0GuwpdvV5rzIaBpUXKz0SD/slw2SnMRRNo6sVnZTHzVL00Ld+Y?=
 =?us-ascii?Q?KK1b4xEkTWCcYieYKh4sJ4KSSX0zRZhYxF6UA6ihWdEeaWWrmvJpiCRs3feH?=
 =?us-ascii?Q?gWaux3vvWtIHKZmo0xfrLDPbyAsbBfnK5f4aWpAbQ73hzCTJCIUMhwzTENtd?=
 =?us-ascii?Q?bA3BQXkVJq5PCnobpnf95iXPDrHpr3rmasMMQoaeMZf9X65wwuUkIvx3XzCU?=
 =?us-ascii?Q?hA6lr5jhXfAV4QwfTpfDYkjtTqqSy2PVu592vmuJH8zAmVloTjfhHxldx8ga?=
 =?us-ascii?Q?P0OhQnMZ7XbMDMiYuLemIgMrYyR4zqaCSOiQZMe+BcU2SQcdZ8nYBOXMBwGl?=
 =?us-ascii?Q?1ZV4yBHMqsS3KIGol6+7F/7QwyzRDpPE76l82x/kyghyk5JJfxov556j/UFl?=
 =?us-ascii?Q?bhp0Z74+1ApHyRa10vHnWv64S45FUtRYJPRSMAiBoI5vkCHbk7PkIWdlEPyM?=
 =?us-ascii?Q?XjGqD+zt0g83JaMGy47skP5X9oxFz8WJdyRpyBIUdnJNkYxNoh2jUHCfPVx2?=
 =?us-ascii?Q?Tz6C5BiasVbfNjTQ6CwADOiSR0RhV0aMvktoNpueQ/RTt5+c6rkygLqW8bUa?=
 =?us-ascii?Q?fXAt0NFxdE0b8hrYqPu8w++51IPJC6MR15WOJ/Q3Ja8fcJTMzPzfBl5iZXRM?=
 =?us-ascii?Q?3x51TEeTFDzckvoU8TPB6jorjVxCd8K2K3iXoDTzF4Ior5OVbfUqU9aGg1Pr?=
 =?us-ascii?Q?k9p7uPCgSvVf48g7OhBwFG4WaW3riUKsHgthKeAUC8AmPdLYxc4bj7RMG0ly?=
 =?us-ascii?Q?80hjIjjtjWpUJK6u+NE1l5fVRdcvybvo59eFIkR/WM5sduwfo48DUXa0ADjZ?=
 =?us-ascii?Q?RwEx9NceQwMqxHoRvpcOWP2l2JJRm/rKIJRV4+BIhV1hbb8HdA+dguH5HbaQ?=
 =?us-ascii?Q?QGTms0/GnSCyEZiM9Eofi2R/SBn+fKOE/Wk2Zl2NTW73BraAMq8ohwtT9Zju?=
 =?us-ascii?Q?OK80kvQBc99Gdc6pJkj9pZ+ejLKVUimQxDoPOFdVh2PdS7QOV+bEPkg5nhlC?=
 =?us-ascii?Q?GU8YPDLtUbHKyYTgGt7y9ak=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7024.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c41ea90-19f1-456f-5a78-08dcd24e686b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 10:42:18.0595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CfoeDLlf+CDApcEtBZtQFllfxego3TGK8jWCkn+rElKAt87O6KlpcNdRZYLnx+oc1921VWjZjVR2oNZA3Ha283PY5wsEWenf7GWhwZzYPiKDvbkLyYgmcnwzpajl72Cu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8548

Hi Stephen,

Can you please point me to the watchdog tree.

Cheers,
Prabhakar

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Wednesday, September 11, 2024 5:56 AM
> To: Wim Van Sebroeck <wim@iguana.be>
> Cc: Guenter Roeck <linux@roeck-us.net>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>; Wim Van Sebroeck <wim@linux-
> watchdog.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>;
> Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: linux-next: build failure after merge of the watchdog tree
>=20
> Hi all,
>=20
> After merging the watchdog tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: missing MODULE_LICENSE() in drivers/watchdog/rzv2h_wdt.o
>=20
> Caused by commit
>=20
>   f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")
>=20
> I have used the watchdog tree from next-20240910 for today.
>=20
> --
> Cheers,
> Stephen Rothwell

