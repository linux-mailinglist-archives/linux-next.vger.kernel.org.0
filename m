Return-Path: <linux-next+bounces-6995-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E090FAC964D
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 22:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9E2505A64
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 20:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771E5283FD5;
	Fri, 30 May 2025 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yAeRa1Fg"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456928368B;
	Fri, 30 May 2025 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635410; cv=fail; b=lUhaAMIXkbNtVPPEgF1Y4kaVPh6qX2Ka9GV89rnvSkNwBK8OiC5LwCW4+IwJq+0ck8wSaDIRR1DjLr5xPeNKvi+onLYiOgKTozfRmOjxVt9AvPyxAHFzwg50fHRrCcO0SQhf5tbmuIJjUDictZGMmyASmGgGruronbLhxuXD/Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635410; c=relaxed/simple;
	bh=tNU7tYHSsWuzPAfUgZa6z0PW5jXAvTwka6iI4au1c7Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OfPX7poJ0/qI+lgDrfYyyUK+G+mRpIJAKkKSZmXdJ/tAyiKqpBoAMAx/Q5cSsKbgtilCk9yQyD+N6GKMLGZ7FO76lb4JsyjokKpczS3lXdOhBAbZqne3Ah+/TVlMfu+CthP6iEOdAIvpl2wqYQcmdP22Bnups5KWdtURScsXi4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yAeRa1Fg; arc=fail smtp.client-ip=40.107.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKzyhYgc4uqatdlbg4l1jV7d3odAJmIgY9t5Qo+7KB5IPWZsRsGb2JVlENmFMsZV0ypkXCTuWiH340kSaY9mAyl5QxCM2J8CgwSV85N0LN+mQJwlK5tszZDerMjkbJKtBklVncOmCl8s4jsPhnP9LuHWvGapC+2goFBbWDoRQFk+QrpedqjuueShsV+uotar9eIfU9tzlTSXJ1iuznCn7ZtJjg30qVcaJ8TlQFcHfvCSJ33XE69ipn940Iy176JFPRAT4oQczV1HXNc44yDCtJmd0Z7+qhVRyaA8ioOIpHIFZ30MJt0/UsbP+fmfQpjTtuKDqWh/Wxp6PageOjS2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd5Xtlto35kGUha0AZp33jlyHtpe7m6RgA03yO8e/2w=;
 b=rdczVIBdGeJPg4WL2dICHy14E31uMhLuhb/F7B8dRF2DwRa5HjwYTOm6EDcu7ZwVZIBPeoOjFK5QHSrgkQXK6WcabavgLexI4BBTOc8cDEhwnP+5jFOO17jitPJyewvNYkCDfaa9UUYT+/1qrz+/tvi1iHP74dFjAzr3N8kRoVHligf6ZE/K6DZOCHCWZg4K3eCvg24Qe3iZ/qj6dxfvar6qkpoeXaeVW/toRSFHQzyK/9Fs0EaxEyQ67Jjt6YAgZuNwH/YnAJHnpPajnbJ2xfB/G3OuSdEhkOovnbLTmobVHDv97fhMomdohpi2oNYbBPkpcUAlZkbSOM8X/lgD+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd5Xtlto35kGUha0AZp33jlyHtpe7m6RgA03yO8e/2w=;
 b=yAeRa1FgGbPoT0Ilg9xftB3uq65Z6k8y8ScF5jR1F1oYWKQJ2z7xlP7iwJHZ0zUJJ7rJiMhBkGupxVYCCVcCvw0phILtLhpaTvaRkVxiOeO1WAhb5XatijZSwXVYWRicSWQxaqgv5GCNEfT5TOlNUjV28/m5JzLJi6IDPIpdvHA=
Received: from BL1PR13CA0069.namprd13.prod.outlook.com (2603:10b6:208:2b8::14)
 by DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 20:03:18 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:2b8:cafe::97) by BL1PR13CA0069.outlook.office365.com
 (2603:10b6:208:2b8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Fri,
 30 May 2025 20:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8813.0 via Frontend Transport; Fri, 30 May 2025 20:03:17 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 May 2025 15:03:15 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH 0/3] Fix build issue when CONFIG_MODULES is not set
Date: Fri, 30 May 2025 15:59:49 -0400
Message-ID: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 28027c50-5c68-4c93-2453-08dd9fb504c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mp7GoNyO9UIBDBmEmgm4zTF5ch03w4wGqOT+R2nRDeYUF4ohdRO6IEXhOhmr?=
 =?us-ascii?Q?JO99V0521CN6TBoPVHiJY8U7grotUYLTYpGxT4dDkUBEkfPrBS3oGdw666Gv?=
 =?us-ascii?Q?vbf2OfS/3s8CJi1jgl114ZQKg2i1OxT8FHaMwyeSVGyJTDerS3DuUQBF7J1S?=
 =?us-ascii?Q?Up58LEN9Jr1yCVd9Y0C3tjmyINxjHwcPXY7mXZCSSEKOAz022n5mJVNNt5Zj?=
 =?us-ascii?Q?EUbfHY4BGpeic6CfjzoRZPA6VvuDtkNLF1wzYD0T1CqPXTVR87cO4aKVmXZj?=
 =?us-ascii?Q?is6V6dxdMNNFkIgsEWHT3lwBzB5dzrCzRy/oan3WnCBoByhvvsjCbHwY39/H?=
 =?us-ascii?Q?cv/NAWlf1PneAr8C9xkdYVYS17+3iM0BE4Fm9zrYexPIZ2WmJVCx5xC3lpM5?=
 =?us-ascii?Q?1TI+le2UHImMvySR2gagl2KwJcJixy/MZX6GEP1V5kNSVp6t0ksf8eurObhO?=
 =?us-ascii?Q?o57kCLVcRFLESx8JfXxEHIYxRfIbqAnmUpJpPe9i1OLuytnTOvQhsxkizwap?=
 =?us-ascii?Q?bmMfWNhrHrGm6KaJsUfpszpd5cxZm/t5gH+U3reQb4PR1uW22O43kdFrNxmC?=
 =?us-ascii?Q?gl30U9s8RmbUjIJj+77nYdHaW3OmA85IApgFszFTlWk/R7pEWi95bj6NZC6J?=
 =?us-ascii?Q?smt4MTWP1HT0tGwEKmF3bOoCVQ8FG3RjKeiQWVG//K9ALtglIsX3QwqmKVi7?=
 =?us-ascii?Q?HWXmlSJF0rY9oQxjClM7LctAVx+SFXybpZhu0b3Bo+XaaX69LHjmfsr2gYCA?=
 =?us-ascii?Q?i6LlYEXPCZmcoiSsm6a8LXwMTDo8JzZED8Fi06CwRT0r0LlVTkCw1noyQ6MQ?=
 =?us-ascii?Q?d+G0jdpgbQzaGrLduy4R5x6TFL0vgBRBEiXbS5xXo3TFrl6uvUDW3nCOgBfe?=
 =?us-ascii?Q?aWwik8lHDQ3cAtTOQ5dejg2xsuZeoWN6fPx4H/fE4L6tz2E6hwwg78CWeA8C?=
 =?us-ascii?Q?5cG4TL8lR0HNuO4hEGpraLgn7SafFWY6bbJRcL/CpsXv+3mewAOy9w6qg+fp?=
 =?us-ascii?Q?ek0KwfQo/p6uXnP+wEVXrzGnpvjOVOUgMG0wAWFExDHQb+Bt+MlVRKXB2iNY?=
 =?us-ascii?Q?D7JLrtQMQifCJVxAUAG/GZn9X9KBeezh5Wm2z2Ra3TcUK5dqGGlox2ldkFV7?=
 =?us-ascii?Q?vJ6e/bNo4S+kXq9BIkwGSQkrLdGc2QusdnEqplsKHAy1sQ6q198YqvqVrVs+?=
 =?us-ascii?Q?aP+aEY0p4BoULxzsmuQxH8IIDq9fdtuFSeZmSBNex8D2hzmdXzOC4i2kAtXy?=
 =?us-ascii?Q?aRXDdE3of8GZ/fdYpS9QL4T4vp9SEJqo1StsG34LlFq+qFfA0UH6sLRlUxxf?=
 =?us-ascii?Q?0SAAj43Kr514BwcpYUknhKMoE/uF39zzSDfgBWGxh3hZvrwgNsu9xB92w3MD?=
 =?us-ascii?Q?/djSnegE1r7Y0tSv/UZvnh3mtixqurRYyCO1x12qxB+Di5PSYFHwdqw4dWlU?=
 =?us-ascii?Q?uxxhXuTUdgYK+d/L9vj2IUPgvqb9tyO4GMbpHbEB9zb0TZFozfCgG2gA62t9?=
 =?us-ascii?Q?muZx6WE3sFGv0hd7+HFstWKxoOJWAMt9Riks?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 20:03:17.3794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28027c50-5c68-4c93-2453-08dd9fb504c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421

When CONFIG_MODULES is not defined, 'adap->owner->name' used in amd_isp4 platform
driver will not be valid and is resulting in build failures.

../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of undefined type 'struct module'
  154 |         return !strcmp(adap->owner->name, "i2c_designware_amdisp");
      |                                   ^~

To fix this issue, I need to make changes both in platform and i2c driver modules.

* In the amd_isp4 x86/platform driver, replace 'adap->owner->name' with 'adap->name', this removes
the hard dependency on 'struct module'.
* In i2c amdisp driver, initialize unique name to i2c adapter and also make a change in
i2c-designware-common to avoid overwriting with generic name when adap->name[] is already set.

Thanks,
Pratap

Pratap Nirujogi (3):
  i2c: designware: Initialize adapter name only when not set
  i2c: amd-isp: Initialize unique adpater name
  platform/x86: Use i2c adapter name to fix build errors

 drivers/i2c/busses/i2c-designware-amdisp.c | 2 ++
 drivers/i2c/busses/i2c-designware-master.c | 5 +++--
 drivers/platform/x86/amd/amd_isp4.c        | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.43.0


