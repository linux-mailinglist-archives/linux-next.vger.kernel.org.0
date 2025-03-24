Return-Path: <linux-next+bounces-5953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EBEA6D726
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 10:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF823AEAA7
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 09:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990DA1A5B84;
	Mon, 24 Mar 2025 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ojqQqJxP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ogTNBk+S"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57401F5851;
	Mon, 24 Mar 2025 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742807935; cv=fail; b=YuVN7YtU4y43A076rZ29Jwu2MBCzYMNh8ZSZ8imLBU3NXA1sO8asYOUosYDoemzEaiH/6Ecs3chRsi9sQRE0l++bA7zbri+tHZoHZsPSsSTQ3vyp7VmiVaq6IdD2GjIfde1dTasXChawzMxUYxsd0Y2pMF0FefD65I03u9oKjyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742807935; c=relaxed/simple;
	bh=IdfmLp9Ppo6cOxqM+s9EphrxXGtgy/6vOqn6XrR20Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAxrwLTHtDBnO0TPnTYAiczZG04qVOhHayE2fmZYTTdCNinEGJ23aFGzq8HvCKDBIhnv5qW1EtsIMv+zfP+SVXuROjim77K1m3IPfuMoGKlImvCW8aiCpE3bXQuyF3MVujKX5HyHgzxs0QqHsc8Cc73I92ZJjsPF6HBeG5v+38s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ojqQqJxP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ogTNBk+S; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O5AD0i023043;
	Mon, 24 Mar 2025 04:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=PYIoygcTHEHGNH5qk/
	JqF7fVRrNbUMfUuKfq52RVTiE=; b=ojqQqJxPSyjiYgLvrcNTE815z6dFyT2Qqj
	yVY1WHPin/oq8Rnv5C3eTNZN6FbSh9/U4UiDH3BHgGFzSbM16WA/KT5JZsKfmm1i
	3ZNU4XnbT7y1bFGzKlFqbUk2GCvGVv50nYWxykQXPfUDcMurLqimLmIM4SvVsBur
	JgWRbdTSiBpOij57knP01kBL0+n8k0adNYIsiYUK8N043OfMQBp5z0+k2sHetJCL
	q8ZOTzZN9vaK1nIrapjK2pT5w/M3Vrbgt1f1/bOMcn81IpTmshTMuFifxGiuH72I
	exlfgERNghvVbFTYGygHmRB1TF9Jusn7tz3QwoN3KpTGvmNPbplg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45htm1k2cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 04:18:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XX06vlKyvOoP0ucDiugeTL3E+oqOtATMJcDdY2cbqa9RQLUu/j0Nc8H/YW+nnKmq0UMU9sATbdZVVbtTC8yXBndUS/u7KKMq8cDY+atzpXnilaQzj7SeMPJmGRLhAZZhu9bTTpCKtr6QYjGjIXuO9+Qjy6tZkEKRSoEBtTJmC34zNIOgO2o7GCznJgu5kyT6mXEMnv6ppNqEOseaQt+XNKGFAlc02FMykVlwOwwuoOAWleHGZVbBS+sNc+K3IjdOa0gVzxKzk/eIFBGRgpu56RS8P51b0idwqAyHqepIvFzAl9cINJwSwjvmU7wOtIGNMZ1N8JWK5NT9r70trj7i8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYIoygcTHEHGNH5qk/JqF7fVRrNbUMfUuKfq52RVTiE=;
 b=eKJSXFcbk96p4DNl0IHRrJRaEsCbJrwD8GXO3dKjcyHLiblwCd0VssHMKfyA3aauR6qkAI2GVNUu5q/trcGQzqnbNmJcJURpRLc4MEKPwfrj7LobOtakpUnD/dQQ7D7fW9qqxGL47YhDxS1BaAbKB8nBBxsbqlXKncZcps1IRdAzEpy1LBgr5ZazN1jA8CnrrlO2pJGGi/J1+hUm9Uqahc+ydaCGwYkYLHvuSRfCi8FLg1mxAPahGzD/IAkyWcL13FSrntYwYzYb85OrPhDTTz8fHOLit5Gn+WriccZXjzAH1xoYrODA224Z7xUFLAQHYuQQkNl5BuDUv42ZpuKI0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYIoygcTHEHGNH5qk/JqF7fVRrNbUMfUuKfq52RVTiE=;
 b=ogTNBk+SQvcev6oc7yD6GIOhN4N+Nv9UIpP2FieLyP5SZ6mzlnkWe8x2prrxbVPLxtKAqT6T1+L+OXPzLLGIlsD9EF3qAghtl5Ii5HC0PS6yeZmnn3yir8621Z2/GII9Ngn3q8NzaPaMvzHUku+Pnp3KMcTdiXumbWt+XS0zpGY=
Received: from CH0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:610:b1::28)
 by BL1PR19MB5819.namprd19.prod.outlook.com (2603:10b6:208:396::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 09:18:27 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::b4) by CH0PR13CA0023.outlook.office365.com
 (2603:10b6:610:b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Mon,
 24 Mar 2025 09:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 24 Mar 2025 09:18:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D239F406540;
	Mon, 24 Mar 2025 09:18:24 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id AEBE8820248;
	Mon, 24 Mar 2025 09:18:24 +0000 (UTC)
Date: Mon, 24 Mar 2025 09:18:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <Z+EjXzXlocNTUQUz@opensource.cirrus.com>
References: <20250323212937.4f182bd3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323212937.4f182bd3@canb.auug.org.au>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|BL1PR19MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: cc69793f-ff45-4ea8-dc82-08dd6ab4d550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xd1mHmKRZo7hfCoc9HT/I0ZZlxrg3+sofmca8r4g2QHuh/82imItWBnd1otP?=
 =?us-ascii?Q?nMSvHJCJuEaEqUFqIlB1dGWfwwBOde5Zws2zQ1j2okERTNGJ82uzZGcsvuCE?=
 =?us-ascii?Q?S/YtzZWScWGqoPxk7osViAJFcr8bFJn+28YcM64zLs4jJHPuWUmd3VU6k6rF?=
 =?us-ascii?Q?MwJgOpWWOc4hkyhE6f0pdqIXRZPzkOTV4DfpjPB2+ZiqS8yvNC8wOF4KoMdk?=
 =?us-ascii?Q?oxlL5bdMU36ErG0Rfd6IXiPQoyg5QiGW1PC6TByudZeRD/urpSqOt13medsr?=
 =?us-ascii?Q?o/BDGU38Go4fp2QZiivlPMnSPmcjJwXO+Uj5ktFLe/7CXZz920HITnrXHcTd?=
 =?us-ascii?Q?CTuvIYVqFbfXoA60jjRO1YOd5v9/FB2FeabdT9quQ4jx4WAva35ATGlWoWel?=
 =?us-ascii?Q?mbrVQi9ikED1VtRqVk4+bNsAk8PJRH/SjUZSer2EdvTQ+vX6CjPMKUSmAai2?=
 =?us-ascii?Q?5sA0srso6BL2otKDaeSofY+AKL2bCiwum0olA1x1fiRi3VLg9awwQi0DOoq9?=
 =?us-ascii?Q?pK0/ZzEBB4Hz0U1TunZIXE0YG/trgWrH5/d/mIEbUFbaHq9VQuaWfVdnGCbw?=
 =?us-ascii?Q?YFEYZPy/onoEOZ6mopBsin6LjuzO30SJkEbY1pqZuSFiiCPaenNxSNE4ihe7?=
 =?us-ascii?Q?5g8ZcmGEXKNxBgwfIl/V3vTqp+kNtVIcDcwNx/Q6jhGTLd8UxUSf+rmLmDqQ?=
 =?us-ascii?Q?z71yoTIAaQlfVLsSwukRIP+snEC9ODgurXAPQVuyLE/ikdPZL/Xt7yqW0mU0?=
 =?us-ascii?Q?D18kBj7jdTgN8rF8HqWdkAkgiMo9E93kCjRc/nWR8eDVVRpQWjYLaUqTgMLY?=
 =?us-ascii?Q?a+0CNta7BSXP6NNoXlU1ueqHe3Ga2fRqwZCgP6AUIQ0k7ZvB8+ZCXo0XWZro?=
 =?us-ascii?Q?jstPB8eld1wIAFO4YuGSAWrN8qQu6jGPh2KSDi4pEAxcfUbG6dZTBy9wjSp+?=
 =?us-ascii?Q?rvRQ4+6tQ0fCOWrXkiipO9gdCTOEIpbFODQoOF9+AukO2vsg+YOWrZOwXGkT?=
 =?us-ascii?Q?0mwKCzhBisYXpXQRhFwQ1dJn1iIFH4sVkbcuTjKoLltaBXyH/ZnTphFm47DG?=
 =?us-ascii?Q?kypVy7sSz92oWcPsgN+2yCIoOlB+okb8RE+xo2woWgLiUkr/omPWKHq5/dAM?=
 =?us-ascii?Q?XiwO0HkjhoQOkWUO6G3uAXjzFff/he2VjYwovZgSfEFdFA8A2N3PEY7LGzES?=
 =?us-ascii?Q?hPdvZxs6kMNrWSnAeKp/HD7GGzqaWnoAjTtLRXBUqcNVVBZYddgyk3ArRZ/h?=
 =?us-ascii?Q?t5QbxOPMTmPBP8keexbyy1FSlWxPJz+rW2RSCrx/R2RMCE5WU/udD0l5/mdr?=
 =?us-ascii?Q?UkFPXPh8awTun3ZnvyPD1a3BbbIA8wapZ0Eh/XXeO4U1Ug6Jea6g7s2yPJJS?=
 =?us-ascii?Q?WLZD/PXh2S6Ef70aD6aAqBu8A1I7CCwgoKMJffon0AgdKAX+tg8/3VfNRiUR?=
 =?us-ascii?Q?YBaQ3rp8g2GXxKiPxgbn3SfQ98V3PeQ+8hyDGuZfhv1fN5LLMxVyeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 09:18:25.9638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc69793f-ff45-4ea8-dc82-08dd6ab4d550
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5819
X-Authority-Analysis: v=2.4 cv=WvwrMcfv c=1 sm=1 tr=0 ts=67e12367 cx=c_pps a=IwUfk5KXFkOzJxXNjnChew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=Gxnh72ctYIMPAbpiJgEA:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: Z68lwlBYZ_Qmya0r_hah1_Cwmly7S98S
X-Proofpoint-ORIG-GUID: Z68lwlBYZ_Qmya0r_hah1_Cwmly7S98S
X-Proofpoint-Spam-Reason: safe

On Sun, Mar 23, 2025 at 09:29:37PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   9ef52d529bb7 ("ASoC: SDCA: Correct handling of selected mode DisCo property")
> 
> Fixes tag
> 
>   Fixes: 13fe7497af19 ("ASoC: SDCA: Add support for GE Entity properties")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: d1cd13f80dc6 ("ASoC: SDCA: Add support for GE Entity properties")

Bit weird, not sure if Mark is in the middle of re-ordering his
tree or if a script has gone a bit off the rails there. Looks
like it had the right SHA when I sent the patch up but it go
changed as the patch was applied.

Thanks,
Charles

