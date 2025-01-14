Return-Path: <linux-next+bounces-5203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6768DA11273
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 21:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB2F188980E
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 20:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B4D132C38;
	Tue, 14 Jan 2025 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nWR2K+fu"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AB232428;
	Tue, 14 Jan 2025 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887714; cv=fail; b=PUOkpz28v3p9VFbZww5YVXJPbK6qfRA9BuEX6osX3ekvt1tRBkuqNF3dm4cXEkeA7ibERI+xzjJikiJxWNIhFkC9TfgCnLlPcQpNGRHrqzaBiXlKrUAa4hcacnJQEUPEJ8maf99Qd0cQ2ZWgxCdDboBcq9Heecy4n6MR0iKwe/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887714; c=relaxed/simple;
	bh=SfmZXsN+u8IfAgaMfGlHSCklFkqR2erBkoQsnJ3LU7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MWl/X6lqjobtoduA5IKBHge1YzW6lW4CRyGefpOEYgt+3vNceFv2Bt4+10I4MlJvrhzPJ81cu8FzQkulKFvfjWfcoFr3EsFT4QAVpMFqNxNaWBefSFhAacJ1k44PnMG+hZcbwg6nox9S5elhyfjhYFqdDMcyTkEpIQGFBJNGol0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nWR2K+fu; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqfh9zoYpKSyCzsY6/65j7aNI78pQtxN5fxHFAani7D1E1h3MS/zloPHY/IGs63GrCcbLFTfA42gqxJfw3TT06G3+OGDnG5ND3wVGqHRze4s/6LhNS+3qm3KdT86e5bvO3ZVCuMlGtmLx6ATk0nyxueul2Oj5bMmu5BvNflRSwYZovGedjeNz3yNndxrX4PBGDFCqj2WgC+FiCnCF8MF3C0l7yx9h1YjF6T3XYJsTnsme/LkpHzCKW4nDcCNBTOWJk60art1rewwXg3GENG8On71za5xFVOdwk5sdF8VA0bjNT9FULSOXswsGKX0+GF/Rbyc7HclHlnI2SThTYPQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFnyCauiXLAgVh6j1sVsLPqHr/lEtm0YqIqM537Qefs=;
 b=pagTU3HdWlvwJtcVcLVIKhK5iC3KHjjJQZQbgtj49YejBmhDPUwSRY/wqH7T3M6HHi9LKGtIC0Cw6WxIM/FTTp6ow8p+mQlW0GkjEbeaXnGVWLhU3IMBhi8dtRsUBxvAL6HA/BiZzEqNYIV1GbuG4/AOhOR20TWRLZZeGNa3k2P5rbMWefBPuT/QyhHlm4rtxFTuYzOkv3yzX8JN59w2zssU1KO78/IULTzcNwijvR2FWIL38l6pOIlq+xQJv7CEBBofZjzY9MPjBe1GZDHpQhZkzkgLDr/sDwoHtc+B8uEmDrEO20SF574f/I/1DOtlAui/9PhTMhYz+WhDGttJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFnyCauiXLAgVh6j1sVsLPqHr/lEtm0YqIqM537Qefs=;
 b=nWR2K+fuwkYE3UhIbgWKZDHGAo0pGuo3nlSuM7qr4DGae9VTsNCk4T2FjKAzgCyk4bczXJQq9mdm/+/tfdaW2aFrVckZM5+7ij5hvqhckIYJ5kOJB0+ZRVMIHK4XoEkO+JtqxT9Jfwx+NwSj+r31I79mlx/2zpqXMQO4lJE1ac0KY1OokxG3lZSdw1Z23eyMi6Pa8lk66myNoLt1J+V//uO4nEzOX3CMrVVzt9JscLci6EEOUjKGvoNxidWncJT7yPDncKqQRyttylltHjLTp7kB3528zLEALj+WAFKGtZMh9j4ImZYS42zo9XEeEmKCm9Ote2H3G4JNarHb5cvmPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9111.namprd12.prod.outlook.com (2603:10b6:408:189::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 20:48:30 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 20:48:29 +0000
Date: Tue, 14 Jan 2025 16:48:28 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	Junxian Huang <huangjunxian6@hisilicon.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yuyu Li <liyuyu6@huawei.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250114204828.GI5556@nvidia.com>
References: <20250106111307.7d0f55ba@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106111307.7d0f55ba@canb.auug.org.au>
X-ClientProxiedBy: BN9PR03CA0599.namprd03.prod.outlook.com
 (2603:10b6:408:10d::34) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 363bbdec-be97-4d84-a55d-08dd34dccd1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mw4rhNQS4R/shwEy2KqMxk8VOkXJu2IseaYWx0TgoLv5aQvCOAmEtBJczbaP?=
 =?us-ascii?Q?drbtW/H4O5/Udm0++G6sW+dUxLqTGgvKFyoSac3Aj3E32J6SezB9DcR/91HZ?=
 =?us-ascii?Q?m/UeZ8R2hKNJe9c1ILzKsoBvjtloO+K/kDNjf4Wb/I05EWG2YTGE8zLrEkzl?=
 =?us-ascii?Q?1Chw+7fi5o4UmJnJrFC7Bf1L1VXj82B4qOI2sNkw4hbTVizsML/UGmshIISG?=
 =?us-ascii?Q?bjsnFI8hZogqO07ZyT2jWc+rLl6Tv8QC3PzvQx1qwdqm3X0HepzPSWSnJ9R/?=
 =?us-ascii?Q?LZ8fenOeyfPYat007WnFOPtoCv+wfaWhb4/bwdFPmVV4VsFIrrjBPYOnGKlZ?=
 =?us-ascii?Q?arHzgnk7OFAsxzUCU8qC38N0sL7uJtwyFvZt0CR/+RJM4ODpSnSbm+xEjruT?=
 =?us-ascii?Q?tC39TeqkLohjdSDNIIUb/R2qMdtMPEr8CCuP8r3FhynQVaAZh1gwSkVn+oZn?=
 =?us-ascii?Q?96oQoUaTtV6//emHoyH4YgVKtnApG/Tjbj7mpWCq6e8cJn0u13pYifQWu5Ir?=
 =?us-ascii?Q?+fCbzwrH0PU6ajr5/pxrhCBfe1l+AeRceadWQxTP3yHNGcZyczliGZJdSnTk?=
 =?us-ascii?Q?+Lojn2fILuKiIJrleT1cx+1RekVY4Z5Hw1TutjPEKrrhWtJQdd8tY7MDCjrr?=
 =?us-ascii?Q?uhPgNtQz1b2VUn1GSxmEoS+5oDSU1jb3GHhd7DYge8KU/ju7gi9g3ncgomHW?=
 =?us-ascii?Q?p5u4czUHb6dwvOPi1uSB3fYOGUtbZIvVrOTcIE+/1xfzGaTCypivIZq47DXd?=
 =?us-ascii?Q?hHowqGn20mM4fk913hGhMH1P6pgoYTNPbt8lBqfJZw9svyzkKEh6Z/vesrvi?=
 =?us-ascii?Q?eg/DpR41xqVM+M9iWyT8q4j04jlUrNiyqcmEwhaIfsqbLEQXqvfr69EeLnmN?=
 =?us-ascii?Q?+bk2BUPrf4g6UVfafcOHwbTgoybw9q4dfQbwqOg9iJbFN3WVlksc9l7twlBw?=
 =?us-ascii?Q?vKO1YxLbJ5k0U2qj4TU6I58p7vA45Xu9B8GBfg1ckkMUgK8RHuS0pH+Gypdn?=
 =?us-ascii?Q?bHmqEwShmhtY9iZG2EjFfIzfmsoGSFmPoiz9Hn3H2GBPuSFT1Lj8H9blHXqm?=
 =?us-ascii?Q?VWelG3mqG6lRq3XUh2g11c1mLYHWNble4Kl8ZjprSN7Ccla0cmaxb1Orx4AW?=
 =?us-ascii?Q?snNbcvyeDmIMflDbfsbH180hG7Ylxw6rcI17nTuxQXFovmWZnCTr/2jnAF1Q?=
 =?us-ascii?Q?hsOtgKhDR9Xwm2si6wet01PN7s0fp9DfFKMa7K9NdSTNQktX9KxjFnUjykKu?=
 =?us-ascii?Q?EhcG/lHeXDyX//HUlHnovlx0Ln3GTw6rwtnRrBnzqocILI6z59pQSf9gYsRJ?=
 =?us-ascii?Q?SbzUpiWgSbn16WGNYa3YzQd4+ESJH/r4GLMJJDLK0mgPTj6md78uaURpu+pG?=
 =?us-ascii?Q?/0heSe8ClLnwUrYSSTCctUGyGA9I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?js6Cnvt3T3in88sXePCOuBqwJ+bv9fSJLUHhtka9ENDA/t2Ksz9hLb98CRzf?=
 =?us-ascii?Q?sGjSuyrXmZ42dxhHuF9dadCw/tsSujEer2NFJhil/bUmPaV6dRCwTVSCAoii?=
 =?us-ascii?Q?eYHo1U0XAbZI7VYaSEEga1lFBiHIayEKqHEEX1NDOE45DnF1TLA69e38iZ/q?=
 =?us-ascii?Q?GyX5Mloy1Nj0mnp7CqcggAotqTCgq3KJ83Pz4RTYJAMGJHzfIpecuObJ0+SQ?=
 =?us-ascii?Q?VSHswe4DtAbPgJtla8afGJzxBZKGIZ2k2kxsQh+c7E9dsW2gt68ZzMxt8RbQ?=
 =?us-ascii?Q?7+cFAoK9S9Yr4ybAMu+0tpmoo44HZiLK+KSM1BT/Yjwghs71/h/kUroRlnCO?=
 =?us-ascii?Q?URpVfRy1tJfWcLqs+0Pas5c8z+a9klDmCjbgtfPLMqza0jxoI0I2e3NEcQve?=
 =?us-ascii?Q?GiBwPFvTfbo7ItMzzbJ32DyjTNS5+JyJCeUclakAN0cXV/8O8Mme3+OCf6M8?=
 =?us-ascii?Q?34TgNsYQqbp/Ax8BsyHwd4FUPgL07dZiXXH/pa4ku5kzkgKvUsZf16S3Fhyd?=
 =?us-ascii?Q?FNxvpIPgy2gNii/wpkYgvZp1MCjIrlXl8wCkgXREZ5aMPhiMaBns/pBrAwk4?=
 =?us-ascii?Q?niLPgEkDIqhnnZq/pfe083WXBewHaz/kmnHLQixUuIkzPTx4+AbHuZPcGmJG?=
 =?us-ascii?Q?JeblTZyaqoPM8qsJzndco3cl9bGXw9JTlwtUcr7ziwZSqSVyMe48eAJkYqji?=
 =?us-ascii?Q?EHtDiThEp4zw3dGEKITjofdrxPKV6mghV0+ZPYmcBinhLkAv+xZyj5Hq0IAw?=
 =?us-ascii?Q?2TkmvLgWjS2g9l5OOTdZHR1ygaLYfnMUzxeEf9ickeR7AQORvuTm2L158bsJ?=
 =?us-ascii?Q?IEuReDrWkgo5BZcGaZxZZLRQBkRgvl54+oOgO3bQzkuH2PIedPrwQgcJuC3C?=
 =?us-ascii?Q?IXzek2T3MkgVAfeDFhZtYmPNneTa414lCi8YuQj3DEz0G/MjassITlr0bnY1?=
 =?us-ascii?Q?UkbzY+T5V5WkzddEFq9SZrveAjc/UVTBoO2b7ZejQM3bYOD6eA+d0nNcn36H?=
 =?us-ascii?Q?y68Spf+P0LMcFDgd4hf5UrWAn6XCrSE9SzA9GaMiIdUxZA+rm7g3nPQDrd33?=
 =?us-ascii?Q?mgmbYCWwRomBc+ALEbksPAYE2jPgsYzDGMYONCT7+gZt7XjlRXxUVTmnliNU?=
 =?us-ascii?Q?558kzXcHIJYOMRd5PNkWStKgwk+zev2nAaFGbTvufFcn30qc0o0xYhXQQjme?=
 =?us-ascii?Q?Btzw+U4oluu3XOba8SEed6LCGm34God3slrjWL5+CaFL6BMY2ogEI3mrUjle?=
 =?us-ascii?Q?BNeZEBunegwZZa9EUGcyUsXhWpY+ouTozerQJrAD6XOpvleaU/lVftLPre95?=
 =?us-ascii?Q?SaHU+L7ZmaDHQS2voVvFmDorXxSQRYskU50Tfs/DAmgrEDqhWrC53jmkLAXN?=
 =?us-ascii?Q?50mq2L3vaaurO0+VHiaqbhgicPnq27Ph/QC/KNHNVlwmKsHqca7Su7tRO7dT?=
 =?us-ascii?Q?oQU33wSgFqy62+5XseVvb630zf/fakYM2/l/BTCk+fuz1IOZ3kzA3U44Dl2z?=
 =?us-ascii?Q?fWkJkbETzBtrBvSGN95iwORREXWaru2U8pY89mfKkENHfbHQrh4IUp3swEDm?=
 =?us-ascii?Q?68lvgqka8OYjfHLctac2lBU/SxaVuW76lB+EJ3Na?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363bbdec-be97-4d84-a55d-08dd34dccd1f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 20:48:29.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egPjaBkNPridqx58qkbI9DmWtdYlrgkWp+QgLL4kspaOcFI5LxM/H0sx/SxnSrm+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9111

On Mon, Jan 06, 2025 at 11:13:07AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got conflicts in:
> 
>   drivers/infiniband/sw/siw/siw_main.c
>   drivers/infiniband/sw/siw/siw_verbs.c
> 
> between commit:
> 
>   16b87037b488 ("RDMA/siw: Remove direct link to net_device")
> 
> from Linus' tree and commit:
> 
>   62f5d59d1a3d ("RDMA/siw: Remove deliver net device event")
> 
> from the rdma tree.
> 
> I fixed it up (I used the former version of siw_verbs.c and the
> superset parts of siw_main.c) 

I think we need to retain the ib_get_curr_port_state() call:

--- drivers/infiniband/sw/siw/siw_verbs.c       2025-01-14 16:37:02.023738738 -0400
+++ /home/jgg/oss/testing-k.o/drivers/infiniband/sw/siw/siw_verbs.c     2025-01-14 16:42:50.797896811 -0400
@@ -189,6 +189,7 @@
        attr->max_msg_sz = -1;
        attr->max_mtu = ib_mtu_int_to_enum(ndev->max_mtu);
        attr->active_mtu = ib_mtu_int_to_enum(READ_ONCE(ndev->mtu));
+       attr->state = ib_get_curr_port_state(ndev);
        attr->phys_state = (netif_running(ndev) && netif_carrier_ok(ndev)) ?
                IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;
        attr->state = attr->phys_state == IB_PORT_PHYS_STATE_LINK_UP ?

Against your tree

Thanks,
Jason

