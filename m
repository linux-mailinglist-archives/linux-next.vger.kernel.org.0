Return-Path: <linux-next+bounces-4616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD99BC2C1
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 02:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16B21F2231C
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 01:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C168E1CD0C;
	Tue,  5 Nov 2024 01:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MWEu8C0O"
X-Original-To: linux-next@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2082.outbound.protection.outlook.com [40.107.103.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440E13C30;
	Tue,  5 Nov 2024 01:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730771410; cv=fail; b=bbyq3RC6KUP1zB0aUrcClpsfXK+/oHBip3TBQTY2rds9hK6h09HVxaNr3v+U6a7WWUXVWYwZ6oIt35UW92r+3r8TOZGipmbi3W3BZiMzFQH1I2dNOjzfRMay+hEdId3QdNjoZDCV8komlUz+ObgUkFbb/9X0jb6X6Xn4r5MRQ54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730771410; c=relaxed/simple;
	bh=BkiChBy9TLFcIFDyU+t/xb9y9FVt1wd0lv7X3S0jODo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X08MmniAWM28JZx6SDlD0wWI96kxArQ/3/Or3KeuzHdI1vJfU/7X/1hTehn9K53jIWLEn1IzarcZQtqf0lAiMMQeQ0T7kSJhcjDDibc0dDx4keJ63Th6oUcumGDwV307Fw9y4VgIBp/gkLlH+wvXuP/lRi0NRpL4qRSRrN2/PsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MWEu8C0O; arc=fail smtp.client-ip=40.107.103.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzA4bWfP4wSbi0DAyMjT3uUNGBRQZpTFSLhgBKRZeaGzGNxDO5eQlbyvol7ku9LjtQUXfqEuFwElZglf5qi/xnGJuWhjjnves8TAEtP2ltBwR++1gsTw5jjoKCYDurmU5dtuF9HdAW1mBNXFXZMxbOpLwAbDQhajt0UY0I6ZRAme0zD19yIKjR4WORdtWxybl+KHEaY9vMOr9Y/nm9YALWJCiX4Nu7gjvWmvbivBLlb0/gCeNGwBbcw73hC4/q9xGJ98S00adgPt2Gt/pe4XrdH54vI99boTrCgwgGex8HObQ03t71j2MbqPC2Mr/skZPB8YBMm98fPkMRwn9fXxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxLyM3xJtfNXaTCA1M2vd0phAGDIOsOiZbsez0LoD88=;
 b=yRJNEWFap+3yHybMOcU09eUsCtyjhO0veHi4m8qzsxfMeWwEvFkUsH1j0r5v3ytBIuynbaMvBbvxosrQW5M89ac65Lx4qsi9hjgWCXRnRO8xc41tfBQLmp2bgtcAdoJvxNCFgKt69T5ErIY6LYkKH9sNxOWFgRDxkyOGaRHrMh+5fh/iq8wQF1WXJJsxxhPoCmEX7lhWfmILmRJwjHbHdyErjCHh9jLiFHoizi6SQFO0PkrUHlus+mj8GL4M6Bl7/2Eeor1euRPeHamRpngPw0s2tYT6A1uQ42oLEfhFQzKi2HX8HVa0MOiRsuD98zar8l6PJEa/feyAdqzA6WiINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxLyM3xJtfNXaTCA1M2vd0phAGDIOsOiZbsez0LoD88=;
 b=MWEu8C0OmWCAZUZUuGPhVYf7GbOy6qC9nhyQFH1lnUvmM9+2s9xdn38sVqNYAp8XmLB1yN18nmgeOt7m/ovEFbH/n0g4OvIHgNyJtU+NKMjtuFp4Aovgz6rbidUQY0W4BygujxTLMCIaMdJbVRK/Xc+R7tzm8TT6AquBAlmYjbC+BBAdJk4TIs/pCAzJ16mz7MZwS0dJljHc41ZkisS90B6hBHx892Uayfk3a/q1eTU9c+2rd75wj0wQxbcTxrJfD7Y5/SJrMGLFamtDGHhclerRM1S2Oo24nFSXkCx6ba8rrmWcgZ2OKuhlpc1VtTpOgUuFZKw1E6cJs7rmniJd0g==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB8153.eurprd04.prod.outlook.com (2603:10a6:10:245::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 01:50:04 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%7]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 01:50:03 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: RE: linux-next: manual merge of the net-next tree with the net tree
Thread-Topic: linux-next: manual merge of the net-next tree with the net tree
Thread-Index: AQHbLxtnX9HtILnTrEytegO15hPszbKn6rvw
Date: Tue, 5 Nov 2024 01:50:03 +0000
Message-ID:
 <PAXPR04MB85103E1007BD2EEFDE93D40C88522@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20241105114100.118bd35e@canb.auug.org.au>
In-Reply-To: <20241105114100.118bd35e@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DB9PR04MB8153:EE_
x-ms-office365-filtering-correlation-id: 6d374f76-c832-4df5-aef8-08dcfd3c2acf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8dUiniI7ASKcyC2m4YO5FnRL2L1jNYudRn5A2Qm27RbG7PUflLgWLng00Yyq?=
 =?us-ascii?Q?W7bz2MurAbRYpeRdLIiIuEpNxHTw8TOMqPF0AEVMUouE184UeieUz7aGbU2c?=
 =?us-ascii?Q?P6t4cg3ihFJpvN4tSdDPL3NW6YnZ6lcbnkxiABcclBzz1f4zj1xBL6KqL+Dx?=
 =?us-ascii?Q?Wgfr7oyqbxxqKyw+wyYiCx7u5Kl6ZdrrTKab3GR+6PBoyLzZvLr/M0TkKCRl?=
 =?us-ascii?Q?kyD4AKvzfPIBYUCLG29uMi5un2CvQn5R9Fc/SSiOIiskva+/sFZhP5oSwoq7?=
 =?us-ascii?Q?+zoXsdVRanclKFRuhXR6qk2bWvqK4uvPFIS5y4wV0nJAMLsPcyxq7O33xKob?=
 =?us-ascii?Q?mUWRov8MqFw2CbLiskUyB5BWPm4Yimm8LFJSEee3vXP57GedF3NLSLza3t59?=
 =?us-ascii?Q?OyRlE1Qf7R8zWDWwfgb4S97KSQkQXoWNWVTNRfrswwJQmiw9l6Z7VuJDgkSQ?=
 =?us-ascii?Q?5tOHQvODYmfxeU34/FJmc052kvDycv9gEtEODD4CvtvFcPmzYNkFNnKxgiLK?=
 =?us-ascii?Q?6mXqKlZNO8EhxHCg2g1cXKd0dp0iZXTQ/al8APwzzkusdsgnR3T5O7CCmgQ2?=
 =?us-ascii?Q?nBjwAFskBYu7BMJdTBWa8JG2H4diLrWu8KV15UgulAZabdrDS2G+0pZTs3ST?=
 =?us-ascii?Q?KEArQt+RCd4VsM4BIZqKOTwogSO8WqV8ft+qKYH/gYbNqGx+F3sQkKIbQRjq?=
 =?us-ascii?Q?s1ztH+ZD6v7WrmBNB+KlBxnABe1HKSKYjHOMLWL9POn+0EF/bsqF4YfvOO18?=
 =?us-ascii?Q?S9uafbDqlbZNMzYexpY/4P+lyMUnx5JZ4g7FSPbbx1xKRYvBSpQJWMFDcfmz?=
 =?us-ascii?Q?QErKAyr+omg4k+vzhchzf6FhEMTPmq3nzWeedrR7ZPxRHYx8SONxUhT5Drsk?=
 =?us-ascii?Q?n/0G3//CH/zCyvekNZ4eoT4dD3237/AINof+UXCvQs7VeMJSQXNWUpgatlVQ?=
 =?us-ascii?Q?MvykFL3qNqdmLsND6JdJbRKYNYKWvmBnwolBJrr6loPausrukVEuzjZpbvSW?=
 =?us-ascii?Q?+o6hSpKh/ClFHJKr8r+V9wFyBjCcINX2t7VGnOEZ1UBbejpjMeJtSrcIe72A?=
 =?us-ascii?Q?wF+qki83wErV04+5AlhOxzqEli4kSZFcytfsnA1gKsWi35Az4+esoAUAegvb?=
 =?us-ascii?Q?jD076fFkYKWPHXlRGwHVkJiOVpWdfprS+heNI8wW5Bs0TghD2glLPMuZnN2W?=
 =?us-ascii?Q?AZ+EfSvpyLBMOCihznr2bCt74LsUKhL+fxDfdQsiSMbRlavSl7LTrOziZr3R?=
 =?us-ascii?Q?JWx90w4wyU/Yjr2GJmdSrz4bt/5s3BSWa3gJebLyf2ljfmmVkBaabvwn2CZx?=
 =?us-ascii?Q?nJ0Q5euKVqI/iNgrnjtr3RKWcvOT6eJrszIkcrFqu6YMRTilFxgzZdM5jAA7?=
 =?us-ascii?Q?h5U0Tp0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iGQFVg1vm85bPLCn6XCqs7ptsnITHLHP+w8njAjxp16w4PrNIomA6XsB6CM+?=
 =?us-ascii?Q?UCSbhXw036ODSlhcYJ+F4lH6Dz7OJR63N+LTdO9SkONrxpNMNoBBoEoL8P/w?=
 =?us-ascii?Q?FSkvCppjSsrqDXMnwCphL3K54AYhHdSjIVEGsqTH6SDP/tOryEH+VrVzWgqx?=
 =?us-ascii?Q?egDeCx8YmJUAPlfKnGBs5jqCWvF2PQ2nrNRMuL8G5QBFdk4dba+un844wNze?=
 =?us-ascii?Q?1j6YsTQEEOnl3UYVdSypkCBqV2H/yUF7ajgAoYS5V19ZKTOQAPHzWpksIrX9?=
 =?us-ascii?Q?yTxJx4N96t2o1UpofhEkn8/uScVpne80/1Qj5KOlkxRO5S9Tr4bDqDqOqwch?=
 =?us-ascii?Q?0W0HLzN/zqeOh2W8JrqDp9ipVDyQ0MXr6DeAiUVq/BFpPXWhB2TUPB5CvOoo?=
 =?us-ascii?Q?fHswJgiTlItJZVgBO37atkSML8jGrnsdhKbPap9lwy3LvIuXwHo7Wv3UoLaB?=
 =?us-ascii?Q?WMODnERlbGmsHFSanW6vBYDPdoazAYIbXBJUmoNQzwrtM1q/UJqXBifSynYY?=
 =?us-ascii?Q?OsdcDnPfIENHS4z90dY8N5NeBsALbuAdZ6C5YAwgG9Nvj88IsKIe3dOyChC/?=
 =?us-ascii?Q?+5gVvpVCD0ruViWkqjnWCOdzJtrO/0XwWgzdFKiHxmUzXEV3puPf5cN7ARza?=
 =?us-ascii?Q?bz2tgd0ARHjmUGnVD5Ogbe0BzXjs9VqupQKhQiBFh1+51FVSuNgo3F62sav6?=
 =?us-ascii?Q?lQgi8PWErJVhCONas1wQqCTdFntIsXbY4SaRE1njZJEgvIVnPbGD7dKhsBd7?=
 =?us-ascii?Q?cGev4WmZKVEodqR5csiCCJwXnz3MnZjcaEGNUQ/IUd6lsowkyy5F9Gh0SLr/?=
 =?us-ascii?Q?dg6P9648MYujocxn90BakTMFYHzmgjXcS41s0wrKlofh2y03v2LXdJ4a/5YP?=
 =?us-ascii?Q?gpVVR5Zbs36fY5qbjgDfjSyVYj/JZ93SVGXl40aEUDmRg763hW2ilr/QBYHy?=
 =?us-ascii?Q?DsXDrtwOr3IsVi36QkJYXw1yvFKG22Y1teCcVI90YcUA3XHHJMTTNvtBZoqs?=
 =?us-ascii?Q?SbovLjtX1QDMqfzEQQCRuRpUzzLm4nsYHKK3CxIDA5MtzeGn1zxWPLlrgt4N?=
 =?us-ascii?Q?VNXoKGSc650aDZWJ+hluDirF0GUhpSqiDfISJ1pCU3te78SQsfcIbNEXdJqX?=
 =?us-ascii?Q?PCQCC9E4Z3GS5Xkb7TcxB99ev4ZxbghLVvVQE+GGb1K/FOimmABOGqx3JXtu?=
 =?us-ascii?Q?1C0FVz2mWcNRX+64O6DQlVRihyALa3GiAVbLzm7Fw7+0kd8G3fXCfIHKKhJy?=
 =?us-ascii?Q?fQzWQjMUjqBKNP+KWZtCUABRQajWbEclzYWhFP4ZQUWCxVm9/cxjYdG8HwLq?=
 =?us-ascii?Q?v8tLedn0JtTQIUSMBtvcUz07aThIE9mhtrcb8lgoLQc8P9wPBuhs+6mKcpkI?=
 =?us-ascii?Q?DuxVezVM2XplJRcooynFNWTt16zHbFzGb9MChcpX27sWQfykbl3hr6y3PjwH?=
 =?us-ascii?Q?qAIMyg1E3WCJnmoJs+PsYS2kSEgJ+SNv/dFdOL+KzGfVXBBpFKGpFlkjiFUh?=
 =?us-ascii?Q?tpIXlLMQ8K+mux1+IiaFoOqfMpDVGGj0q80usy38KDjFQdtJhiUnGYf+VA3+?=
 =?us-ascii?Q?MZrPCTvdjCyNDcpyftc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d374f76-c832-4df5-aef8-08dcfd3c2acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 01:50:03.7292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2WefcdexuE6WBlbojQUZuwW/rwtrzqzg+W+oe2lrexA48tq2rzSJZJrbkl1gr/t+T8ndLKLBjNWs8aACw12Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8153

> Hi all,
>=20
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   drivers/net/ethernet/freescale/enetc/enetc_pf.c
>=20
> between commit:
>=20
>   e15c5506dd39 ("net: enetc: allocate vf_state during PF probes")
>=20
> from the net tree and commit:
>=20
>   3774409fd4c6 ("net: enetc: build enetc_pf_common.c as a separate
> module")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20

Sorry for the merge conflict. I really appreciate your help in fixing it,
that's great.

> --
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/net/ethernet/freescale/enetc/enetc_pf.c
> index c95a7c083b0f,a76ce41eb197..000000000000
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@@ -1277,12 -1024,7 +1015,13 @@@ static int enetc_pf_probe(struct
> pci_de
>   	pf =3D enetc_si_priv(si);
>   	pf->si =3D si;
>   	pf->total_vfs =3D pci_sriov_get_totalvfs(pdev);
>  +	if (pf->total_vfs) {
>  +		pf->vf_state =3D kcalloc(pf->total_vfs, sizeof(struct enetc_vf_state)=
,
>  +				       GFP_KERNEL);
>  +		if (!pf->vf_state)
>  +			goto err_alloc_vf_state;
>  +	}
> + 	pf->ops =3D &enetc_pf_ops;
>=20
>   	err =3D enetc_setup_mac_addresses(node, pf);
>   	if (err)

