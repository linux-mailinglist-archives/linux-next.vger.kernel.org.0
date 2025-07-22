Return-Path: <linux-next+bounces-7688-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3BB0D754
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 12:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0511C238E6
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 10:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364022DE1E5;
	Tue, 22 Jul 2025 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p8Ug9i9d";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rF6WBOk6"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB3E28C2A2;
	Tue, 22 Jul 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180115; cv=fail; b=llmT5lCCXLys8pOhaKaJB3p0kTFKt/e9k8pIaQwgS5oayoTUZpr7lobiBSuCcAdhy28wLy+hA98oQLm8Rmsym6hBcdY6gJtAjjhmEZGltKoPnEfNyK93mYjx6jOC+H7w12QZLOq3LFxCfZALqnEjKRSEl3z24KoE3lfGbZsDshc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180115; c=relaxed/simple;
	bh=M3+s8OfPHZXQBj8KuHRAODp06X9jkEfK2zOA0COQ29Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=etSghNUxp3CaXgeO3HpRX/XfLxg8S9IzA+rWf4jaKr1RtvAieXQT8aQWTMufLAnTnQAYkoSe1cEQtmPsAL5KvgvEuxW+58nbEebjMnNoRGz4bkozWvTLiA8mKBoQ6hqZ+HvOsv/LhhShWL2gCarO0J3rXe+PmeFBTvSwbGxO9TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p8Ug9i9d; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rF6WBOk6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5BMFq003410;
	Tue, 22 Jul 2025 05:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=V2wPAP8KlghU3aC2
	OJpXaprwSf3xdVlgJdgE5lgFbWA=; b=p8Ug9i9dmDwVMa9glYrPE43eXLYmr+Pr
	nJabwEb9NVF4kqZ7wBg0XJhrM/xOpamoq7+X7XpwHgEHpkiRDrF2YcFCtWxLiamI
	loSe4oLg2gpHe2OYNGNv403o4Bo531XJuK7vENkgi4nduuiCm38BV0/vBceCBjaB
	pDUSLG7t27a9a4e9K/CEwE1ZELl61U9sZ/nYo+fEH03M02Ug7PutP4rUMuxzaUAX
	SvT89bYHH84dPXwrs6mI6iQcxvFyIqtkVRLmYx2Iy1BCbfamt21wsNgDJew9PFJO
	Dx5z3BfQCGOmbDi8YEiDkXevXgeHOpRI1irNcFas75KbCedsWsrjBA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2114.outbound.protection.outlook.com [40.107.100.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4807sg33aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 05:28:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1RAdu/EhLHwh/iYkNQV7bGgctp6Kqznj7ZgseU5cKZvKkAa4ni4EDvui6h1xm04UTW8CgFDNS++Te2C0qNaFO5YB/AApqxQYqA61uW9SgLhOOK2XUQRc/rw1lL21w9Z0s7UU2EUnFmac0cPT7AJgXY8CeWtQUrwP0rbeQ7j77t5HnOWqgVgu8FfemrGFeIW5+mFDBvJsoPFzs9eH0dsuYVeIod+VgUi/cB2VilKTmwS+IAfewsJNV4qeoCWO2znAF6tt0qGYkstENkS86oXgevnubyQDOvdTOA11P9fn8aM5J8mOGIYx1tmweZZw4o8z0YpH94nrBE10H175DFrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2wPAP8KlghU3aC2OJpXaprwSf3xdVlgJdgE5lgFbWA=;
 b=zHLfBpLPzn2dCsdOCyunl5W0m1++XR1N0rO/Rb5L1Qt6PsdH7RFTCXQFluwAoEDT7dzUsvX/Yq2xZuYUyYZnGL40aodz882ajYmz+Lcih9BzX5oGjdI+H3X14SlpuH8ntV0pk4z96wE/d7KAzKZDHQXOBVLTb9dyL0UYyKkomy228ELMyfBo8aNGOx/gTcto1ZXTSDKefyqwGFlKaNV3YLXJPDF7ZoeTOYPAutff3Wm1TtyF23/hVLnDathlPMHadazDPi67s9hG0bA3ebGGm94hcpxx99g8KhLP8M1kEIG4ei7+V5QWQL6yU9jqiS4F4Vcho1YEkWopE6cr5i8DCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=canb.auug.org.au
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2wPAP8KlghU3aC2OJpXaprwSf3xdVlgJdgE5lgFbWA=;
 b=rF6WBOk6dGPrFxjsXmV0gyUYsYfXFGhLTE1S5ajrhiQsAzTThWnlfNjWM86ZNnlA2WpqjcbczrYZLSTTc1PGURJqfQLZPCTLPABSORO+Fai/drNqhx8SXCvOU6F+qFAOJ3WbtsmqKoQlF2KTJIFgVWwRQwi7AaMl5muDv7gDAkI=
Received: from SA9PR10CA0018.namprd10.prod.outlook.com (2603:10b6:806:a7::23)
 by DS7PR19MB6022.namprd19.prod.outlook.com (2603:10b6:8:81::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Tue, 22 Jul 2025 10:28:05 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::17) by SA9PR10CA0018.outlook.office365.com
 (2603:10b6:806:a7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 10:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 10:28:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1898406540;
	Tue, 22 Jul 2025 10:28:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C98A3820249;
	Tue, 22 Jul 2025 10:28:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        sfr@canb.auug.org.au, boqun.feng@gmail.com, linux-next@vger.kernel.org,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Check devm_mutex_init() return value
Date: Tue, 22 Jul 2025 11:27:54 +0100
Message-Id: <20250722102754.2514351-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DS7PR19MB6022:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1b0a8143-3b5d-4eee-5ffa-08ddc90a7149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BFCr88MuzMUwWkgx0a6MiTwk1r6nIFr5pE1F2tFdqKFDVxpW2YFXpYamZ+16?=
 =?us-ascii?Q?JpajP+l9CpMBc8iHBwHjW2oa8ChaTyviJ/ArNsojJxYZiaPrM/5xDUfz/0kf?=
 =?us-ascii?Q?j2WtKiIZSzNbgthQMIO2RSld5ddqooOgvep6A46AeeKISi/8pj+oOZ0U8V6t?=
 =?us-ascii?Q?zFIh5eUDaL03ohR6XIaoTMnfz5nGWIPLrntdi2dW3yjUfcTisAJVaLjzMsGI?=
 =?us-ascii?Q?RP7HVT+2MqMHb/qLTvc0qJi6eLRDQ1hr/7DWQ2t99RXVifERvDbdzzkvcu9s?=
 =?us-ascii?Q?7bK+V4w6WcG/jvepHb+OiCECsZuWMD/jCKaawUcn3bkJaIKeLvAPe08uIkIB?=
 =?us-ascii?Q?bTGWTg70rW8Sd49ZOW7LLWD4HWI4Ef7L8wjmHXANBhwLb9qLhief+KNsaCB6?=
 =?us-ascii?Q?VVUXMGBaYRmlLMDSy+V1WxVJyTQ8SNnsN/w6yuWbSPc7j/ZDH97vk+UIL0oO?=
 =?us-ascii?Q?KnwKRLW8G72hnXyCC1xekTIqwC3/dookJmAUA9+AL4rqxD/fX51lnRgSuXwf?=
 =?us-ascii?Q?cbAtCCy6PRhCGgyHv7L5RQwOotJD7kc1yTdAcjSL/db1qknN/p7Hqmlo4mnD?=
 =?us-ascii?Q?EoUO/pvNHIxAosRV+1NV8oLB9P1+4721Z7I+5bYXmadoCT/QpAfpsLQl9//b?=
 =?us-ascii?Q?r8i+fWTYIJEMGAw0oR/mAtP48LFwWWQ9K0A/SBAPtndEm3fgdlVOapIf/Myr?=
 =?us-ascii?Q?aw+ay699VB2HRGk01Unyba14Xcu0gIHStB3eACkdCbLoo6jPLHf5kMmJW7Bg?=
 =?us-ascii?Q?0Y/QcbrwZkn7iVBXzTY5GVy+LNBhUcwrfhuC+3fVwXfmUNLe8xYR4uWM3ptY?=
 =?us-ascii?Q?m9VF4xulemjX5T95KjfPTt0ZDX/XY8X12jpcRAbh3R/1vMi71MmF/O2e++fW?=
 =?us-ascii?Q?VX6+sJn+MLbZuPraQVF+AjNDle5+6MR2nd2HzSYxvN2RsHnfTtN+s+Vl8zJO?=
 =?us-ascii?Q?gJ3BeMj1mTPSyMypNCTvfc2TuK+IvB9I0SxQVWGm3JQYNPbf/jqqY9wrBiV2?=
 =?us-ascii?Q?RTRD8pCQH1B49zu6Bcm5pTKruTqB1ArHKwGZHtwnXRvwwi6Ixsw5HcZ69Cht?=
 =?us-ascii?Q?h5JCzjstMzemXag3Vl3arWeudS7iMgkA17NOu/MfS0PGqgZ26I9Npkq6jfOY?=
 =?us-ascii?Q?eoegNci63Ngcz4pGSu6to4C3Ag6BJKxZcMA3jqqihoMvN/MbAy4UF6T793/B?=
 =?us-ascii?Q?K2aqp/dSBnkm9SHPnbrESGn4VGlLNf1d2q83Wjel16poNjriQ6IM+RCgC7x2?=
 =?us-ascii?Q?OJxjVZN0LXcKAou4sXydFS8B0BI0cowvnfsG5/YM+TklMmzDB5SjPEMYL/dG?=
 =?us-ascii?Q?XmXyfCtmztqC92p1cuwo8S4UMVe9YaPUs3Se8BjPNIbWzehdQFs1iTBsallk?=
 =?us-ascii?Q?hz9jSotIwstmkjWOYJxuSC3JoFRBHOe6lFmV/3R8eDXzzbl5qPvoHdA6Wk1z?=
 =?us-ascii?Q?hAy+AxTcK5ju0TaIaLtcMbJXLeXN5IQSWkryMxs09Bj+0lOb843eO2NROJVH?=
 =?us-ascii?Q?FG6Shbh3gxDuO29ZtHJqNlhBZvZdU5q4ulDf?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 10:28:04.1211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0a8143-3b5d-4eee-5ffa-08ddc90a7149
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6022
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4MSBTYWx0ZWRfX6x7GDTtyWRmc FwJOkBfovraOTdgFp3k6QGQHJsXYjZP0+ggAuK87dUK+7mjY3MwbkoNGNbbeVkPmJ747EVynxyN xBfwJ9DbIrZAxti+L4KWDl4kZ3A2xrA8h2Vl91B8oaHks6sXWg0PnyQlRz48C35y0r7A1b0/vLJ
 F8q58iE4GcOnvxl0tEZ6pgYDnGeBRb2knVxPUcDdIJZ6NMc4ASjIcpkWZe5h13tgy58SCFNBG52 MXqpzkq+kPSbnsKAX3Aj0P8XDWlNW6iO3lqrbkEEVU/8+F3oQSSVLPp2f9bAdYAKPs4g9AEhp32 NLPL232vrviAjz7s2xlgAmIaMBuFiKKiPxORuaCP2EBrvKJJOZ2B3DnflvTjXPXKTbprGGffQ1d zxVLZz3F
X-Proofpoint-GUID: kHkSbiEIkYSojPC8uJMaY8IxDpJypXXD
X-Authority-Analysis: v=2.4 cv=O/85vA9W c=1 sm=1 tr=0 ts=687f67bc cx=c_pps a=GczZfS3z04NHlJvK0PxJtw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=rOUgymgbAAAA:8 a=w1d2syhTAAAA:8 a=vkIZT-QJro4gmxt-qCsA:9 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: kHkSbiEIkYSojPC8uJMaY8IxDpJypXXD
X-Proofpoint-Spam-Reason: safe

From: Stephen Rothwell <sfr@canb.auug.org.au>

Fix interaction with commit daec29dcc873 ("locking/mutex: Mark
devm_mutex_init() as __must_check"), add return value check. There is no
need for additional complex error handling here, failure to init the
mutex means the code can't progress, so the failure just needs to be passed
up to the caller.

Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

As Stephen's commit was fine I have just used that with some minor
tweaks to the commit message and removing the comment, I hope this is
ok.

Thanks,
Charles

 sound/soc/sdca/sdca_interrupts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index b76512732af8..d442ba2f5681 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -419,7 +419,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 
 	info->irq_chip = sdca_irq_chip;
 
-	devm_mutex_init(dev, &info->irq_lock);
+	ret = devm_mutex_init(dev, &info->irq_lock);
+	if (ret)
+		return ERR_PTR(ret);
 
 	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
 				       &info->irq_chip, &info->irq_data);
-- 
2.39.5


