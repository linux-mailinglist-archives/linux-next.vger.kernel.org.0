Return-Path: <linux-next+bounces-7685-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74CB0D52B
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 11:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 598647AF7E7
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 08:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B943C2DA74A;
	Tue, 22 Jul 2025 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YCgDxoTz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QddaaXLP"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C716F2D879C;
	Tue, 22 Jul 2025 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753174793; cv=fail; b=Aof9VZsJDMGxUfC8mfxeqOZlyznlv26YHkwQaVVSgxAmuqFW/QJMJu0/vxA8FS7YmtMtLGJKIkksFmpLDAJT+yTg3aaDtLZjyYYjArM05eEIEWNUxD0KmJMTMtOoI76HhW8VcdOBtxvelMsfV3soyWGgJEVTAbg3d6CLnjNyUKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753174793; c=relaxed/simple;
	bh=x9GD2HHb4Ayv57xwwuR52DVXXpDUS8sHt4Q4+GWI7L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ml1/W2Y0XEdTugNmMOp4IuGfL8AVLxH/m3Vdsz/52iGBN6/kV+QGdt/W2/kL+PkhE+s+ByJlDXbjMEGNclI93G/mk6EIUsYryU5ooct66yBo3ZOF/VORJ6yPax4dp2X945fntG48Pygs94Uzxwy/T6o07Y9qsKYZgIDbi/5YGO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YCgDxoTz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QddaaXLP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M58ZSx032457;
	Tue, 22 Jul 2025 03:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=S/BDFEUov4spdnMOV5
	omp8cCxpJCJ4wy98Hue7dspDU=; b=YCgDxoTzIpI1D72lY0jSVsZcNiySzgo1Qm
	S4KoENSayqI5qsDans+1aLfUDUFpL+XLWkTEgF0T7vrulpCttWBikZoF5SuIp4f9
	dc/AsMjB4P8QEppwfI9gkkkG6BTOpxAgu5WBGkduh0HbEOOEFtskcAcTFEaFuRGb
	fL5xpzhXQgopqeqv+cKB81pFEjAV20NR71N7gutR5CD42nIiCOk+9Hj+IYNcwobJ
	gCE9VbD1ncHFt7rTxQpwTKokkjUFfwOg54UfPf0OulFDL0ASvsXpDil8PdRDSNkq
	OKuBkxa+k/vSNMDWmMknfORB3sHnVW1MFAdb0tAtx0A4cmg+cSOg==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2100.outbound.protection.outlook.com [40.107.95.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4807sg30gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 03:59:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/wz+IfZA+GE0zG2gTTV1lXAXWoq2TlzG7Ud6wZ4SWzyzin0kJgUAN3c29gy4u/A+wyUV/nuq8XyhunsAy+PhKIT/4U0QVxRssOZjVT3GGY2wnIbcuql3ZJbVzUVpQH9omwU+DiNImUENLhKeUXplV/sJVL8C0o5AXh5EUeATO0SSmbj+HfP7YI9rDPcxk1FfarxbS6nqUBL4GmdfmCtNNpfs4ldoT/K7OymO0plAtrTbD2yWIOHo/Sq/mAphYPH6twipXNOT2QFQRmBelc62hFp+6vGos2ySZTHvUziFWjZ/fmN4ts5MdSI+pAjQla6lO+PapzhwEH+enOO/ho7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/BDFEUov4spdnMOV5omp8cCxpJCJ4wy98Hue7dspDU=;
 b=wv8g+JXqzTlmeKrveRs2LBwrG9tA2eejHkK7L5emijRrI0aGLtHrawpUbeRAiVcXtpQpDeIYS9FBMPVCWr5xuiJ02cBkFdghDih2lGPa6kYw3BzA4KL31Ni2kDM7drWIPmSQtGIE25AH6MBFrupLFfthxrF+/UnhqlgyKEB+cnLSlzrWhz3e5LXQMs+NO+e4ZjY1evCk6qgwWHBcF8nK/34zeeByY3/emF3w4NUs+cVEPCMeGFwgkL9+2w32vVj860vpbFmgNktFsZaIvyQpEWzqXvcEWjm3CRw+hgFf1B8el0Ku7pwBP6FpjU9e84JiYKqtKsWYSFyne6onjVF92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=canb.auug.org.au
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/BDFEUov4spdnMOV5omp8cCxpJCJ4wy98Hue7dspDU=;
 b=QddaaXLPpYtVLOTEawHUzIzac6rdSzpC8BL90kCIKhBHrHdfEHzdWbupFN8ViNWRTbgzFhZbNs8lG6BopKwjz3stnNlkHUDMCM9TsOT1MFfjquIk3nbwqDQi2WRRvLJw9UkQ9VnaGzZfeAnC3mD4qx3qy4jjcX4XXrTUC2YxOao=
Received: from BN9PR03CA0691.namprd03.prod.outlook.com (2603:10b6:408:ef::6)
 by DS0PR19MB7515.namprd19.prod.outlook.com (2603:10b6:8:14e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 08:59:09 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::87) by BN9PR03CA0691.outlook.office365.com
 (2603:10b6:408:ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 08:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 08:59:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B488D406540;
	Tue, 22 Jul 2025 08:59:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9E4E7820249;
	Tue, 22 Jul 2025 08:59:06 +0000 (UTC)
Date: Tue, 22 Jul 2025 09:59:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: semantic conflict between the tip and sound-asoc
 trees
Message-ID: <aH9S2eqzmDbTAKfI@opensource.cirrus.com>
References: <20250722130140.74182f72@canb.auug.org.au>
 <aH8CZooigrI4mmKB@tardis-2.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH8CZooigrI4mmKB@tardis-2.local>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|DS0PR19MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: efdb9412-3052-41b6-0d59-08ddc8fe04e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B4eFmIxCNuSiOuycjKr9PzmeURzYKnuooDrPMZOsm+DSV/q/cSmdAkYPg18X?=
 =?us-ascii?Q?Qt5BA3r7Wfz31pNTGxYiSy8Fz5qy7LEYD6nFqxBVaIndN5VmIOZqDtTIr+0o?=
 =?us-ascii?Q?SJZUejmiMBlsKTIpopyND04uFaC84D5DJdPySFT9Fvl+8x2aTfdGlkysF3kl?=
 =?us-ascii?Q?XqdJY6hoeThp3h2UMOhFAC1ytFmo/PXvFSH8S3SwABNOHzIEYggPFNBUBwb4?=
 =?us-ascii?Q?Zbdk1iNncBvArRycoszNtiOOwqeo9ePuVl4otwL/Z0dxlR57WabzCwJD5yQb?=
 =?us-ascii?Q?I1UZ2H8yuDciU3wtTtwrUKADV9RDXVAbns8tPdZQYnP+nNwm+LaLO338QbSN?=
 =?us-ascii?Q?o05XEP0+Z60myxXs/8Bp4of13cMj8YxiMHUgKFlDwZzXB2N9CdqiVKsrF4hb?=
 =?us-ascii?Q?UMM6gPh2EyJ9EYSSvON7BK+7rf/W1oXZVrhdrRkGYICdO7RYoFyYiJ92bqmt?=
 =?us-ascii?Q?CVVs+9c48gPCzYUvp6N5jIOewqOltVDkIS07hb+7a3lFf8IFxIP6M9ny4JWz?=
 =?us-ascii?Q?vlY9iWcOMlWfBnVzcw8KbDEEgQbB63NR1SCOrfDbq2smAzi3PwB+sY9bxmfz?=
 =?us-ascii?Q?+Fd/92ZW96AcpwcxHONMHDXdGTUt3Nhd9XqJmrfYVTFlozczbKRy5+Hme7Fs?=
 =?us-ascii?Q?PSH9dKigP2ORQah8DciexuPOTe6sutgX1GOcoL/WF04O9sxACf6Xix+p4Qd9?=
 =?us-ascii?Q?5lkTmNohYQYBdn+xpy62GYctpkBAVxd94/Liwq+og9x5VIDYkm1lkE7ZJ2lc?=
 =?us-ascii?Q?hrD+u60jo+WMSq8YflQjy4Ihyv7XtHi94lqzumXrroznp9SXnJ6icT7Pcozp?=
 =?us-ascii?Q?HJ/4uN845+l4WdegGMEiSF63jAbru0L7BSiNmsf6v6sRzvz5iODDYi01A3bH?=
 =?us-ascii?Q?+OiNLYsUl6Tf67KuDkca6IbEzMZBQUiZP+Uina9wZKoYPkmg2r5hCw6pVK57?=
 =?us-ascii?Q?DY4Sy7CrftWhEeN6bC2UDVjrkQ+OL2McleKsRmTZoI3YR953lfbErS8+2jUR?=
 =?us-ascii?Q?XV4EkoKbRwrwadkweBGs758X6DkWHkpwHwMVaMEtFHeyM+v3WAweXN+tjLyw?=
 =?us-ascii?Q?yBWG7zbnATdqGsH7CaxqY8xFGB1SUf1sIA2Xcz99eO2NweNiVFZKzW9f3017?=
 =?us-ascii?Q?sUtP/stTPMKhAPn2KpfJKmpXp+/7GYWR9WVy1s4QPehIUNExZhzU484ZokDq?=
 =?us-ascii?Q?5brr+A6VpNHWPvJwTjrlYcGGgxKvw6mF1HIIDfSyIzJC5fF7Zam1+IYPeToY?=
 =?us-ascii?Q?OQn4/HWPc2il751UiijpGaRR1VoYXPxmKTwGcg9VaQdGQAH4Jy26GOWjtnUK?=
 =?us-ascii?Q?SVk5DbbaT3FTWe8x96tMiP4bNIEwsoAj6ShLO+29R2TFO6/mmzOvE+pFkbYu?=
 =?us-ascii?Q?v+bliywlvxmCdgN+OFIIOPMhNRmnE5zXvhzjjPg1n3dQBAmK8Ju7uIwc/QWO?=
 =?us-ascii?Q?B0BdQyrIAR9bcIPO2jmc6ItNAYKvjE7aeBAWZP+M90+dkKBM19uxHIa4q7nF?=
 =?us-ascii?Q?R6vevYUrL852WmmcJ2fdNeudDb1+Jj8WxgWl?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(7416014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 08:59:08.3566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efdb9412-3052-41b6-0d59-08ddc8fe04e3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7515
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4MSBTYWx0ZWRfX8ZN3OKoZMGEq 4ckAGxj6mzIJFG0SbBe90U5bAZvcuAIeTUEzSsYnTwTqg/dTnH3D5qaoJOBCdDS+CyM85AzSJ2C aDUy9r98XznzXVWVJk8kyIHDWwcldHxRV9gcmrP9K/dYj5gVuwCO/riYnoTHTJm6mvenjz06Tkn
 Y89d0StgEmCHiIxw2vHHPnZhJF0JzC4Uhpf7zcd2R67G/5j78WEpbUwdPh3S7GLRrz91KyUe9jB oK2eftMhEfsnU9i88SoGvXu+wZVk/7DIrDHNu2Ngxuhl9KZJbcY2nUL4b8GQUsDXHd03y1OWcxq 9alSrYZ1XoGBLgwBatMsPCGs3agOSLsxqATe29v+EF0QyAdmo31y6mVvvlmAPAWRBsyYA88Vz6v UCNv1NgJ
X-Proofpoint-GUID: _S3Lx7-bTh_iUutUf8einmf__u3zo0Ib
X-Authority-Analysis: v=2.4 cv=O/85vA9W c=1 sm=1 tr=0 ts=687f52e2 cx=c_pps a=W6CakaAfamuLS4OTPxFJoQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=beM74hIc8yKXoifbQlIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: _S3Lx7-bTh_iUutUf8einmf__u3zo0Ib
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 21, 2025 at 08:15:50PM -0700, Boqun Feng wrote:
> On Tue, Jul 22, 2025 at 01:01:40PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> 
> Hi Stephen,
> 
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > In file included from include/linux/kernfs.h:11,
> >                  from include/linux/sysfs.h:16,
> >                  from include/linux/kobject.h:20,
> >                  from include/linux/energy_model.h:7,
> >                  from include/linux/device.h:16,
> >                  from sound/soc/sdca/sdca_interrupts.c:13:
> > sound/soc/sdca/sdca_interrupts.c: In function 'sdca_irq_allocate':
> > include/linux/mutex.h:153:9: error: ignoring return value of '__devm_mutex_init' declared with attribute 'warn_unused_result' [-Werror=unused-result]
> >   153 |         __devm_mutex_init(dev, __mutex_init_ret(mutex))
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > sound/soc/sdca/sdca_interrupts.c:422:9: note: in expansion of macro 'devm_mutex_init'
> >   422 |         devm_mutex_init(dev, &info->irq_lock);
> >       |         ^~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > 
> > Caused by commit
> > 
> >   daec29dcc873 ("locking/mutex: Mark devm_mutex_init() as __must_check")
> > 
> > interacting with commit
> > 
> >   b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
> > 
> > from the sound-asoc tree.
> > 
> > I have applied the following merge fix patch (just a hack, something
> > better needs to be done).
> > 
> 
> Thanks for spotting this, I think it'll be easier if sound-asoc tree
> could apply this change (with proper error handling). Maciej, Charles
> and Mark, does it sound good? Apologies that I was a bit late for
> locking changes in this cycle. Thanks!
> 

I am happy enough to do a patch for this, will look at it today.

Thanks,
Charles

