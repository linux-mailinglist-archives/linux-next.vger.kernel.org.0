Return-Path: <linux-next+bounces-7555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C03FEB05801
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 12:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E32573AA2FC
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9931230BD2;
	Tue, 15 Jul 2025 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L5ZDbnx6"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35122CBEC;
	Tue, 15 Jul 2025 10:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752576050; cv=fail; b=LaLGdHSpgKIIqsD2BkZfgm5yN2Tc0B/Bk4MNgWrN1l3kbXhXwuMtn90Z1Sc6UVjFz/bekWSfV2vH6nL1AlGIxc6eFetFp3oWZYibC94OI3cvk0+PTMMRgSEQzPVjDQeUOV6WUdLe24uBzVTxNovTXPUheegPseCG5tJsDIgcms4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752576050; c=relaxed/simple;
	bh=sWT6gNIBk/MxcQ3ZYg/uXXSFHAumpiGv53FuJfWjd04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFfu94ZufpnvnTq5HAeSOP8kSwzO8TURrAFyYbJCBhoxe572OUWBkLavE8VJ8eF+vctTNOU1o8qlTKUbcLz0Eowt0C25JYjTn1xYuNQkOho05jnWl9ChVMBryO/5zFhMTWNQf53AaHTaWrFqirTrp9cZHu8x9VqKfHhYdH25QlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L5ZDbnx6; arc=fail smtp.client-ip=40.107.92.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2YUDIPGHJ3VUV0sB8so/vXNRJNZmsgy1h0KbVVhz6/+E29Wpb7N+rhYB8tAJonbqGgyJnUwEyzg9PnEnqtwYnviKU45AtJ3+HH4jlgefmfOmQBIP1mtyptw5LmENAFo6+t0ebb6qCol9iGACBvdp2GpgI/AZCrj+sISqwxsTnvxrMCOLdDH+5DlW5rXZ0eDJKq23RMcDNlQnQ7VhU4vCsfyxGWo5Cr+jTgqZyM6gBqQjkmoG3xmzQ5GodDwhXKfepvKl8AbeVO1mmSFbjfCLUMEehYIEPPFf3pqIWNQ/zYRdiRS7Np8uG7jbuwoP9cbeu88oOgWb5AGxr/F85j5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSMtYNObPwonyKcZvjaFig0dhk7xdBX9ZhGLh4IHNLQ=;
 b=UYC+GkI8lU9GDU3QNv63iCPRjsvELBrFDVV9Xed93B+6sRg+oR1TckjKpyj0JsJiV5RKLAemhZmDBSfkiIFsp/PE+YRI8Iza6doO1JOUN22/AhoMY46T9iGAQb+ug0Y8YubosFqttETyyi1e1tu2TZTtNkMTDXfj3BQqzAOEXBro5YmCa3EqZlZmAB7bbp6uZEZz2S97jZhnSd7a4sPH6tghmCLHzuK5mC9vjavb6dBriJPUKdv0xl50Fs1+RYFktQL6iHmPuE6FvbFUJZ4Q3g0ZTJjYrzmlu1kKC9uuCCwCVQWrZ7KQZiJno+4Suy9eW2zy0pel0XWvi03t1Cjt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=stgolabs.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSMtYNObPwonyKcZvjaFig0dhk7xdBX9ZhGLh4IHNLQ=;
 b=L5ZDbnx6eme/cL8WybBUZMZWSKSPaZlppMY7TwhHBK5/MnmCApUL5cCTIp6al1kWDOdHgOPycYzrB29FdYfHBPcJ6ENDJ+fVVxCPWlqQaKeX63x9Hk4ovtqsE3mJI4OmmzROt1gbpEXdET1yS4SlRolSp9SSLfLUoDsfDDsVPKY=
Received: from BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::10)
 by SJ2PR12MB8805.namprd12.prod.outlook.com (2603:10b6:a03:4d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 10:40:41 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::a1) by BLAP220CA0005.outlook.office365.com
 (2603:10b6:208:32c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.27 via Frontend Transport; Tue,
 15 Jul 2025 10:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 10:40:40 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 05:40:37 -0500
From: Robert Richter <rrichter@amd.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, "Alison
 Schofield" <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>,
	Robert Richter <rrichter@amd.com>, <linux-kernel@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>
Subject: [PATCH v2] cxl: Remove core/acpi.c and cxl core dependency on ACPI
Date: Tue, 15 Jul 2025 12:40:16 +0200
Message-ID: <20250715104018.961634-1-rrichter@amd.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715185737.5d9c75e4@canb.auug.org.au>
References: <20250715185737.5d9c75e4@canb.auug.org.au>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|SJ2PR12MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f4a6fc-b68f-4821-5b3c-08ddc38c0b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3MCmOa4fXKLn+CL9QXwPcF7a6dBZmhe6udLwHvkVVTuBbXXfKh/uR/BHiZvU?=
 =?us-ascii?Q?z+us6vu1og7eT71J9davt6lYzDf5iwI1xV5LcZmksw0SPcLL/kdMWa17+bP6?=
 =?us-ascii?Q?iJPm495R0lrlGDLFYVkSXXUT9GWXFPSo1Y1srOmsfdPFbde8ZaU/Dn0sLTCA?=
 =?us-ascii?Q?qluDctbJvD28d3gcUuZXgGmRYCdp1VrdbErFe+wLhqjlb+RMR5jAqemCGqye?=
 =?us-ascii?Q?ZS9DZudBUYgcy0FTR3NDKHLeqN3GMLi2/03oKbJmXVE7p6ZHoz7GVa95knQF?=
 =?us-ascii?Q?JjPX3g5Hnl08avDybgUzWv8CThgRoXYp20Hxky6JcRd5yf7cypmZ3ei5t+wZ?=
 =?us-ascii?Q?lYqhuidebB9VQIIqnaRShYFJAu7M46qWN/gv2iDa7OjeDnP2GEWiqd8X35Sw?=
 =?us-ascii?Q?J3eSnqVtPzkZZK09FkTt9K7joS/QsnMOjhWEU5IMKlRqEi4AMRzk+TycjO3j?=
 =?us-ascii?Q?IPKPogRPkubR8Wan3jkJFMBPFJ3lbcDJ3UVD16jbxl2atzNZCraDV+l2zlPe?=
 =?us-ascii?Q?xYu2+CH2WrqO1TRVFIDVqAI9tFgaGlKfyklhxbcDHIZ6XzwUaS+415hsK5CC?=
 =?us-ascii?Q?+oJSNZXUbtj1Q1P1lrj5NMjm8n3Kpp/oqqNcNw6dvAgryotbBwTT3V9VW7JA?=
 =?us-ascii?Q?htqrHnyTuOayWjjofiJBv42U6xu9MDPlOVGDB8h79vZKLi+rIAipgRJkITfs?=
 =?us-ascii?Q?PZPD3spZxUcSU4iccl7m6uJS1fwnQrKj9Rc1eOLAi7x0u9hkITVOo3wHxKLR?=
 =?us-ascii?Q?ZG9kSoMBadRZnKtZSxg25zBj45+Lpf1XXTSg78ARs1tXcHySWlrLhCZjLt/h?=
 =?us-ascii?Q?gxTpLm5k5irsc5fOsi6acbbWKjpkePzNux80SNprth9MGMIs+BQDTS8mju5u?=
 =?us-ascii?Q?lur4qw2Yn3Vso5Ik5NAYJco0KHcufAf9KhiEY00vVy/WY56SltRJo44R4COs?=
 =?us-ascii?Q?Fi399szQphwjWvSL84MG2+P5EHbrUo19sZZKhWlM7lnSAfZ1+YkNiw+TT2tg?=
 =?us-ascii?Q?aXe0liyNWYfzT+z42YKo2ZTaV1bDdJcOCFEucYbaoq/+zMP4tRdnIA2XP2bT?=
 =?us-ascii?Q?z/ur9qF4GvkKIlrjad5ROzEp8gczIeop3GBxKpdc249oYbeOsTFVi8jrvaer?=
 =?us-ascii?Q?M5cyD+VMs0Iq9e4C9luJR7sQMlnT0Yz4TaAIqEcepd/QXcqYpoIgF9A+0HzU?=
 =?us-ascii?Q?GnxZNufxAoieKzMaq7JY0+F0u7+Hun3Tjh7Fk+CbjkGgGCr76TC0VJEtxS3E?=
 =?us-ascii?Q?5/j4dKp1IwzOl8E78n6TMKZZFXr6O+4p6KQufQmMDPPwZIymTGpcl8cwuFGR?=
 =?us-ascii?Q?NmhjG+F0tFvKsAMZ/Q67R75TNGITsfgCiGYvWaUrtEwGtDcjgET8Plcs64NE?=
 =?us-ascii?Q?vVPyvn8qctM+FIB11iRD+czz2GzPvAT++gYJh9NCxUT55ktb2qLUplyl3hOw?=
 =?us-ascii?Q?XYSgScLudIC3U+Md2DmDjxINx205B1/zbA7U02meOC4FjPPTwNRzQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:40:40.4510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f4a6fc-b68f-4821-5b3c-08ddc38c0b10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8805

From Dave [1]:

"""
It was a mistake to introduce core/acpi.c and putting ACPI dependency on
cxl_core when adding the extended linear cache support.
"""

Current implementation calls hmat_get_extended_linear_cache_size() of
the ACPI subsystem. That external reference causes issue running
cxl_test as there is no way to "mock" that function and ignore it when
using cxl test.

Instead of working around that using cxlrd ops and extensively
expanding cxl_test code [1], just move HMAT calls out of the core
module to cxl_acpi. Implement this by adding a @cache_size member to
struct cxl_root_decoder. During initialization the cache size is
determined and added to the root decoder object in cxl_acpi. Later on
in cxl_core the cache_size parameter is used to setup extended linear
caching.

[1] https://patch.msgid.link/20250610172938.139428-1-dave.jiang@intel.com

[ dj: Remove core/acpi.o from tools/testing/cxl/Kbuild ]

Cc: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Link: https://patch.msgid.link/20250711151529.787470-1-rrichter@amd.com
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
---
v2:
 * fixed linux-next build error (htmldocs)
---
 drivers/cxl/acpi.c        | 59 +++++++++++++++++++++++++++++++++++++++
 drivers/cxl/core/Makefile |  1 -
 drivers/cxl/core/acpi.c   | 11 --------
 drivers/cxl/core/core.h   |  2 --
 drivers/cxl/core/region.c |  7 +----
 drivers/cxl/cxl.h         |  2 ++
 tools/testing/cxl/Kbuild  |  1 -
 7 files changed, 62 insertions(+), 21 deletions(-)
 delete mode 100644 drivers/cxl/core/acpi.c

diff --git a/drivers/cxl/acpi.c b/drivers/cxl/acpi.c
index a1a99ec3f12c..712624cba2b6 100644
--- a/drivers/cxl/acpi.c
+++ b/drivers/cxl/acpi.c
@@ -335,6 +335,63 @@ static int add_or_reset_cxl_resource(struct resource *parent, struct resource *r
 	return rc;
 }
 
+static int cxl_acpi_set_cache_size(struct cxl_root_decoder *cxlrd)
+{
+	struct cxl_decoder *cxld = &cxlrd->cxlsd.cxld;
+	struct range *hpa = &cxld->hpa_range;
+	resource_size_t size = range_len(hpa);
+	resource_size_t start = hpa->start;
+	resource_size_t cache_size;
+	struct resource res;
+	int nid, rc;
+
+	res = DEFINE_RES(start, size, 0);
+	nid = phys_to_target_node(start);
+
+	rc = hmat_get_extended_linear_cache_size(&res, nid, &cache_size);
+	if (rc)
+		return rc;
+
+	/*
+	 * The cache range is expected to be within the CFMWS.
+	 * Currently there is only support cache_size == cxl_size. CXL
+	 * size is then half of the total CFMWS window size.
+	 */
+	size = size >> 1;
+	if (cache_size && size != cache_size) {
+		dev_warn(&cxld->dev,
+			 "Extended Linear Cache size %pa != CXL size %pa. No Support!",
+			 &cache_size, &size);
+		return -ENXIO;
+	}
+
+	cxlrd->cache_size = cache_size;
+
+	return 0;
+}
+
+static void cxl_setup_extended_linear_cache(struct cxl_root_decoder *cxlrd)
+{
+	int rc;
+
+	rc = cxl_acpi_set_cache_size(cxlrd);
+	if (!rc)
+		return;
+
+	if (rc != -EOPNOTSUPP) {
+		/*
+		 * Failing to support extended linear cache region resize does not
+		 * prevent the region from functioning. Only causes cxl list showing
+		 * incorrect region size.
+		 */
+		dev_warn(cxlrd->cxlsd.cxld.dev.parent,
+			 "Extended linear cache calculation failed rc:%d\n", rc);
+	}
+
+	/* Ignoring return code */
+	cxlrd->cache_size = 0;
+}
+
 DEFINE_FREE(put_cxlrd, struct cxl_root_decoder *,
 	    if (!IS_ERR_OR_NULL(_T)) put_device(&_T->cxlsd.cxld.dev))
 DEFINE_FREE(del_cxl_resource, struct resource *, if (_T) del_cxl_resource(_T))
@@ -394,6 +451,8 @@ static int __cxl_parse_cfmws(struct acpi_cedt_cfmws *cfmws,
 		ig = CXL_DECODER_MIN_GRANULARITY;
 	cxld->interleave_granularity = ig;
 
+	cxl_setup_extended_linear_cache(cxlrd);
+
 	if (cfmws->interleave_arithmetic == ACPI_CEDT_CFMWS_ARITHMETIC_XOR) {
 		if (ways != 1 && ways != 3) {
 			cxims_ctx = (struct cxl_cxims_context) {
diff --git a/drivers/cxl/core/Makefile b/drivers/cxl/core/Makefile
index 79e2ef81fde8..5ad8fef210b5 100644
--- a/drivers/cxl/core/Makefile
+++ b/drivers/cxl/core/Makefile
@@ -15,7 +15,6 @@ cxl_core-y += hdm.o
 cxl_core-y += pmu.o
 cxl_core-y += cdat.o
 cxl_core-y += ras.o
-cxl_core-y += acpi.o
 cxl_core-$(CONFIG_TRACING) += trace.o
 cxl_core-$(CONFIG_CXL_REGION) += region.o
 cxl_core-$(CONFIG_CXL_MCE) += mce.o
diff --git a/drivers/cxl/core/acpi.c b/drivers/cxl/core/acpi.c
deleted file mode 100644
index f13b4dae6ac5..000000000000
--- a/drivers/cxl/core/acpi.c
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright(c) 2024 Intel Corporation. All rights reserved. */
-#include <linux/acpi.h>
-#include "cxl.h"
-#include "core.h"
-
-int cxl_acpi_get_extended_linear_cache_size(struct resource *backing_res,
-					    int nid, resource_size_t *size)
-{
-	return hmat_get_extended_linear_cache_size(backing_res, nid, size);
-}
diff --git a/drivers/cxl/core/core.h b/drivers/cxl/core/core.h
index 6b78b10da3e1..2250c05cecc3 100644
--- a/drivers/cxl/core/core.h
+++ b/drivers/cxl/core/core.h
@@ -121,8 +121,6 @@ int cxl_port_get_switch_dport_bandwidth(struct cxl_port *port,
 int cxl_ras_init(void);
 void cxl_ras_exit(void);
 int cxl_gpf_port_setup(struct cxl_dport *dport);
-int cxl_acpi_get_extended_linear_cache_size(struct resource *backing_res,
-					    int nid, resource_size_t *size);
 
 #ifdef CONFIG_CXL_FEATURES
 struct cxl_feat_entry *
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 91ff3a495fbd..08ac7f483562 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -3282,15 +3282,10 @@ static int cxl_extended_linear_cache_resize(struct cxl_region *cxlr,
 {
 	struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(cxlr->dev.parent);
 	struct cxl_region_params *p = &cxlr->params;
-	int nid = phys_to_target_node(res->start);
 	resource_size_t size = resource_size(res);
 	resource_size_t cache_size, start;
-	int rc;
-
-	rc = cxl_acpi_get_extended_linear_cache_size(res, nid, &cache_size);
-	if (rc)
-		return rc;
 
+	cache_size = cxlrd->cache_size;
 	if (!cache_size)
 		return 0;
 
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index e7b66ca1d423..b3aab7c7d17f 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -423,6 +423,7 @@ typedef u64 (*cxl_hpa_to_spa_fn)(struct cxl_root_decoder *cxlrd, u64 hpa);
 /**
  * struct cxl_root_decoder - Static platform CXL address decoder
  * @res: host / parent resource for region allocations
+ * @cache_size: extended linear cache size if exists, otherwise zero
  * @region_id: region id for next region provisioning event
  * @hpa_to_spa: translate CXL host-physical-address to Platform system-physical-address
  * @platform_data: platform specific configuration data
@@ -432,6 +433,7 @@ typedef u64 (*cxl_hpa_to_spa_fn)(struct cxl_root_decoder *cxlrd, u64 hpa);
  */
 struct cxl_root_decoder {
 	struct resource *res;
+	resource_size_t cache_size;
 	atomic_t region_id;
 	cxl_hpa_to_spa_fn hpa_to_spa;
 	void *platform_data;
diff --git a/tools/testing/cxl/Kbuild b/tools/testing/cxl/Kbuild
index 31a2d73c963f..d07f14cb7aa4 100644
--- a/tools/testing/cxl/Kbuild
+++ b/tools/testing/cxl/Kbuild
@@ -62,7 +62,6 @@ cxl_core-y += $(CXL_CORE_SRC)/hdm.o
 cxl_core-y += $(CXL_CORE_SRC)/pmu.o
 cxl_core-y += $(CXL_CORE_SRC)/cdat.o
 cxl_core-y += $(CXL_CORE_SRC)/ras.o
-cxl_core-y += $(CXL_CORE_SRC)/acpi.o
 cxl_core-$(CONFIG_TRACING) += $(CXL_CORE_SRC)/trace.o
 cxl_core-$(CONFIG_CXL_REGION) += $(CXL_CORE_SRC)/region.o
 cxl_core-$(CONFIG_CXL_MCE) += $(CXL_CORE_SRC)/mce.o
-- 
2.39.5


