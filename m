Return-Path: <linux-next+bounces-6996-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230DAC9650
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 22:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263381C0615C
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 20:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B395A28313A;
	Fri, 30 May 2025 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iG1JFlP3"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2088.outbound.protection.outlook.com [40.107.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1F283139;
	Fri, 30 May 2025 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635418; cv=fail; b=R2+MPDCs3BM1jNJTrd6DiyOcyn6WdsMFGx44Gt4keec7wXtvmDuTouDfKDjLtiy49EKMXuAePwXbiS31sSWx7ihzUj+W5//eFIoirbHi/6aaXP9z5tPPYLOAaxf++DCST2CQ72Zdgy9kn0RCIIzAht0YmDr4kvXh/ETLj7S5lVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635418; c=relaxed/simple;
	bh=LWfSte8T4olcR1t8fo/TFiJZwXH/Ey3mW3w6OSLJ9N4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ej+Qsx83eoyDqpLGEqi/sN4pnn8L+VZ6lvKGEc8ggcDivWMXl7A/HRiBR2LDe5B8NDb8IHf3HFkt3LdzNweQaTbncPe9LRc2CTVwAMcIDELjPkWdbz3Fv0wUGii8U6plAS4pZPFt5R1cDDtgGmtdmt6E57pckhUYVwQvwjnrM8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iG1JFlP3; arc=fail smtp.client-ip=40.107.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBQRz33r1JXSY+mo1sw8zleO71xDwLAcYosNsPlzB3zOQ5p6pmdfwd+UvkM+lQc9PG308gGge7dPIhSjxqVJ3j884lhw3d+N8PFP7P46YLSujta34fOVRYOAJFwb6cbDfEnEgC4dyQTX08zopGko48dwDQcOkQDs4W97ff4diGUkATi3G+kPYqiRKYSSYnh6sARygrwCJDLfuof7ZOYFeJR5ETFiujapUEs6UQaXjswmsZwz6nemnioX2jsoMzD317t7Dy44NpGTZzCgHbVZPBaY/F4X+RYScCf9Bc+a0+THSUAc391Xgx5Yi43JnDY5uyTGrYMhsn8IrOBoE338Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoqP0TZ3Pvjhg+rxwswI8UXxKX1jUKe6ILj6tyxMUIE=;
 b=YIBhLftTBvCSiKSJEe82oAW/Bz8nusHXWRv4YuxVGaJnC3+CJyjNepGhVuCUKVG+1E5CLXA9juqxpcZIOwlJayNFocUFj4uwWIxzgwA8PPACyrSVJxMWCyV5v58qWpvaTu/VM5V6wiR/Nc9jGIBRVspDWqmFUcfnGFvmB7P+jr6UKw5lf+81MNhNun0OnO3zlZoh92rnrsyM3b1c1lbtU1BxJUybOyoIPxTEcZnCLVa1iVKixrNA2UYjkU2rzWUdTAWwlenM7lH5ps46luVmxMeLEpufG9G3ds5WvU5pcH8o2AntXzBpecoklLgCqAgkh1wk2o5F+Ehm5wZ5h7BzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoqP0TZ3Pvjhg+rxwswI8UXxKX1jUKe6ILj6tyxMUIE=;
 b=iG1JFlP32pDESQYdAMbUFowVRnM2BJLm7lZOCeRFyXafOkzCSVS/MrmZMORuIzFTQYopSdyB+e8d/QgaMZyTCSZFO5uF7g0Db0ymEDXuo7EsJWBbSl0S4wV2C7KS9uKJFEfoMUbMCtVwnOqNvTsrLaBORc0gtNAS49wChqvS2ks=
Received: from BN9PR03CA0214.namprd03.prod.outlook.com (2603:10b6:408:f8::9)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 20:03:32 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::18) by BN9PR03CA0214.outlook.office365.com
 (2603:10b6:408:f8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 20:03:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8813.0 via Frontend Transport; Fri, 30 May 2025 20:03:32 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 May 2025 15:03:31 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH 2/3] i2c: amd-isp: Initialize unique adpater name
Date: Fri, 30 May 2025 15:59:51 -0400
Message-ID: <20250530200234.1539571-3-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 7143efaa-2bbb-41a6-5a26-08dd9fb50d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DTzs+Kt6bBDNhtubt+yfhEyAi9jj+3KJDn2PbO0ORkE8zqlT8Fsx5eFE9Uk+?=
 =?us-ascii?Q?hwX+HGAQgnuDQpIFpRhATCnB2HeJksfl1PuIPkh8L/sFVUN+j6+o2AcTo/TY?=
 =?us-ascii?Q?YnB7I+QMj3256tTmHNqTHBQT2DUrobs8u/EQIblt6atBk7Cnqx4P4J0Onh3z?=
 =?us-ascii?Q?L4QG4HqAlBsClIxOH9LCd9J43tfaR4tNuCLskuT7gu2BMT5fUNPVyk21Q7B5?=
 =?us-ascii?Q?igx3p3gCq/jYTXywSNbAYJChzlA5EN+9qWbYemHMbteUVnlq9xEz+V4NnmY3?=
 =?us-ascii?Q?SUWLNO2+tw53yIapCNq6NidlERD8m2T4caqL/8p2Vk2JcWJJKuz8CHGpwzvM?=
 =?us-ascii?Q?CMBKvLlAawwZY71k+/Zb12HN2YSBzItrfvBk0qQ5syBFDWhNq62G0z6gFS5i?=
 =?us-ascii?Q?ZGJDtlzX+ZXmw3QvSvyExXYqingpCtEQTUBh/dYudghR8RwPryyVpTgRqZM5?=
 =?us-ascii?Q?sDyxpQ6K3HPR1M8hImV7v8hd2gKiCPc2h703EZhqYw2f1k+ggzbCtGcrWxDh?=
 =?us-ascii?Q?VUKxg1bmewloB/6jh9m8dVYmfd/uBZLfjSXGdTAUnurXMnMNYvMFmJrv0cwg?=
 =?us-ascii?Q?TxcPFaMN6X8rySF+OZf/6NB9kHN4T+lDlOiTMAtyBqrxSPj6nIAUGACG743K?=
 =?us-ascii?Q?3vP19MrpAMLlS8WS0Ct01WsmAuFNznWJsPnJLXp6bXkNNI4nefRW8Rvu7w0S?=
 =?us-ascii?Q?i4TMD+X86hDOXRJ/5YWXg9pHE90im4DWn23V72P7jX60LG2joqpjyTT5424J?=
 =?us-ascii?Q?Dsrk8FxUvben+0XiZIT2k5Fj0BO/Av3Qwude649zjoH8f5gl5fi5kSRoto1P?=
 =?us-ascii?Q?bU1qjyvHRevWCCdDrVi9h0FdTc0TLrjCXjwawp3G02ercKtRlfePOER/MMiZ?=
 =?us-ascii?Q?chhTNWi5mdR6S+jwgfdJSCoT1IOwK1d9Mea3SYYg4QtbUGqmH4mMXTplg//z?=
 =?us-ascii?Q?9of4bc9EwN/UFSxFXOYp+6lI3sI0UiAeUdU9mkVl6Vx8lPUcog8uAfJxAy23?=
 =?us-ascii?Q?R2c93+OWg54JbtJzD6OftoOh9IX56vYM+2kuz+ytQm2yF4+aWwaIl/C6XhLW?=
 =?us-ascii?Q?8uvTTo5g0tk2DbozdCCqPR8eYTILkBxI9ntE3YNRF0tLHjbTZRSdpU9J/pVH?=
 =?us-ascii?Q?W1IttiFhix3QNpQ5T2Sl1F5ZSeDHAr7f1PhCecMZ3mxEmxeMLWzt0PZSwXRo?=
 =?us-ascii?Q?T3J36+mHnaQkw0wgTGRqNbxFM9MXzt0uEiat2dXwr+AJx/kYX3n+T7rk/PWr?=
 =?us-ascii?Q?UxLbWzF00XSGnPxy2Y7AY37U8Hyl2nO2JzbzTIymgVww6dNPbW5EfW5e5tF4?=
 =?us-ascii?Q?NEB53Vu1gIsQKvQOhajLJVNBsUIu5M3yKuV9G3A0i4xWY3p9soeO3hNzhTvE?=
 =?us-ascii?Q?9fyp6y6WXUptQDCU6GWqrfin8KDTcOqxl7BoXgGBQz+j0pJgvl3wruAXztp8?=
 =?us-ascii?Q?PCpn375GUb2bMjzcfp9/IYcJ1yGlm6tARg59Y0VscMYS41XjA6Kv05mp/OEP?=
 =?us-ascii?Q?CiCh2n0awO8uGSMiZuLNxW2+AK/NayXtn4nUIgDj0xXQt69fgcGj+CrZ6A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 20:03:32.1710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7143efaa-2bbb-41a6-5a26-08dd9fb50d93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958

Initialize unique name for amdisp i2c adapter, which is used
in the platform driver to detect the matching adapter for
i2c_client creation.

Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/i2c/busses/i2c-designware-amdisp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
index ad6f08338124..e8cb3785c740 100644
--- a/drivers/i2c/busses/i2c-designware-amdisp.c
+++ b/drivers/i2c/busses/i2c-designware-amdisp.c
@@ -62,6 +62,8 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
 
 	adap = &isp_i2c_dev->adapter;
 	adap->owner = THIS_MODULE;
+	snprintf(adap->name, sizeof(adap->name),
+		 "AMDISP DesignWare I2C adapter");
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	/* use dynamically allocated adapter id */
-- 
2.43.0


