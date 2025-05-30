Return-Path: <linux-next+bounces-6994-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0773AC9649
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 22:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86961505B83
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 20:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84192283153;
	Fri, 30 May 2025 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3ccrkZRb"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E1280CE5;
	Fri, 30 May 2025 20:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635408; cv=fail; b=TTqbMpTauTiKstsZPmGgvDHHVIla3BBsKZo7nWk67EZwT7rEWzRuAke+cCweETEuD/wMuJCnVS7b73xmSb3mZ9eXB9d2t4V94myM6wEJSYjd208FAotQKGpFyK0D/xr44tRShC11divJsbBpx3YcEQkyL1HCt4QmL3nA78iCc9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635408; c=relaxed/simple;
	bh=vqV8hWYCN64Uni4uQoEPliECY6X0MSUK6Xp2W39RjtI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ceCaKsbRK6q/M6QL6oZFkAyPGeIczLkBPw51V2by1zf99NLYD+VSBOg3ufkelhVT9gn+dNHlm/FoPVkK++aoUCm0uaHxzhA8Oq6MIf5FiQLK5nxZd8x1MZNCOQI0oi5Mb+RGpYBU1mWL3QtpD79IdbcF4MrwewandEqQ0/RY2Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3ccrkZRb; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpSyG8YgliAoVW/JmHBNWq3LxRoWrYVwFmc1eQgQ3pTNj38cyfnINae7GR+o4J8x9PGgaLawCRVKxFPQ0PkXW936V2N4iNog2FJ2wYIXNw0e9OazIfJ7sLZgRoVNWsWdpsEqHm6vHjBDDuEP+2Q3pd1iak+Aykt/6RuPN1NXkMpCdIqalht6dY9jxseH+uIcs6gddBIJEcW+WYmd36sPj6byIFqiqWm+1rYPDXc2JlbpLxxQF7Qz7Atvb62XtO3j3xfxchvjMg6lx/u9D1ydIpl+Lf7uVnjNVbH8NaBF3W4/zRAvdXnY90Bs5kOixafWhlmcYKVN1GnRKtIbASU4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1sj2sRmlXJnInp/dnk81ey1aKahJzJVfrPAQmhgcLo=;
 b=fshASxf/28enFqJEg7lrX6axfVgCf7HO6NpAiB880vtEI0+uS0kjpiy5pdHRVX0A7q50bSpYiszficqN28Awj1tXthOavKSvQZ1gjJwZtstEAyRwChMDMkG9lQiVaARBzJ7kRFP+m4fSC7kDyBAnKOaUVl6c31zfTmnoC3/Hd/QyfinRoYxgC/N3EKOOY2bU7dhByspN+vfn2SAtsnAVfwXAlEtVZpn8P2xaRHuqmRfmTo++qppAsqFv/Iw1YlTLk8WT7QT7rZ+IYnjsI8GzjBtnqJUCzE3oZjtS5u2WeiLRaIfL4IvOcdrv3q9+P10qDc1KRFSPw+GPI2N8YUecLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1sj2sRmlXJnInp/dnk81ey1aKahJzJVfrPAQmhgcLo=;
 b=3ccrkZRbTZkK6QA/Vj25hsqvGTSF4G3Qt9FQeAEiDBa/pu8hrVVP3w2BDLadx6IlHu8q5mRERB4EHkI3hiCsX3S3nf8/67iy/yhKO1DYOsAz9KZrElWxGeFF/wnosgIlmI+npwhk2o0ocTE2q3DMobvHMgnVzpIMALZOgSHgw3E=
Received: from BN9PR03CA0238.namprd03.prod.outlook.com (2603:10b6:408:f8::33)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 20:03:23 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::67) by BN9PR03CA0238.outlook.office365.com
 (2603:10b6:408:f8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Fri,
 30 May 2025 20:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8813.0 via Frontend Transport; Fri, 30 May 2025 20:03:23 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 May 2025 15:03:22 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH 1/3] i2c: designware: Initialize adapter name only when not set
Date: Fri, 30 May 2025 15:59:50 -0400
Message-ID: <20250530200234.1539571-2-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: 3108f131-e2e9-486b-a011-08dd9fb50841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kd1g5R4GOLWmgEdLeY0bBa1tT0hUEed2AbQJr5LnSgurnJBCLdob9yEpPYkR?=
 =?us-ascii?Q?LYA3wS95NEhfLk45ZZAxMB7reizGWPnn285Eslah+ZyF70Ozp70/Ma8v+tao?=
 =?us-ascii?Q?rTzoMVXStQSODxHnq+HTDgYBxuNHAqilTROeKU+LkdkL5uNbxsvqFVF3eovT?=
 =?us-ascii?Q?t4+/T+zEtoUOJbziSi3RikVQ+5+6PUqNlGLCBZ8fkcFPO0zBWaDgfrgjP6D/?=
 =?us-ascii?Q?01V7EY+B8F04UfrtByNoe4k+q2zGLpOYZDCb60+C2mQnW4xTVByDNQQgWNeU?=
 =?us-ascii?Q?D6aSvbzcMDE7b0oyfzqpQDFVDbvO/xnSIhZQ2FK4y6mMX0GaJ5ssZUaqLr4U?=
 =?us-ascii?Q?2hw9Cmj3D7hHUZZnUEwdgkwRGaDNbW7Z4FDoTSzxmxhoo/PKb2ItgyfoIpP2?=
 =?us-ascii?Q?ROzuDHWSvBt5lEdZEpaOu/WFy2YCl+qhRRmz/Z68HwVCKNc6aQn5Ex3n0oti?=
 =?us-ascii?Q?N/s7K47MP6/048CX4qqm4u0wae/nPJE4M1I8yo3B/OTI6k+yGaZGx0yanHiO?=
 =?us-ascii?Q?kj6ItLtSvwL0pIXjDe3ZNuJ4/uLUvCSfEcfNVUuJsoAwKazKhO9rZdnTWm/E?=
 =?us-ascii?Q?/8GBaEOdrf0gfOqauf6OnGtJDl/zLB7KPlyjfX7U68rIb3DzpuwAB5WJkpRa?=
 =?us-ascii?Q?KeKM9NT4DOr1fWOeBHmKut5r/55Ixc1lehYxCLKoj/Qc7W6Ja32s4ifU5Y0K?=
 =?us-ascii?Q?300unx0PF6X8wwBNOreY2kao9QRsAk7Is0l5aXt7mWAGDRHH5Mqv7FxgZKPw?=
 =?us-ascii?Q?ZVjScL7zNs2q6ex9AEXpu1qyffB/Nnjj1nkhpvhRs3n7AvN3pr2tNBLSmqUB?=
 =?us-ascii?Q?1s3kZi5Hk08CS+zu0MuMbwBDEyKFrZkdsoDBMu7lB6NMpr0ZuIkr5/nJK8RX?=
 =?us-ascii?Q?ZvWxhoQhVQka5P4+8GH6Omkird3QvWB3ubJniSkygURIV3pdnCAJWe8+0oK7?=
 =?us-ascii?Q?Hq8z42kqewT/qfNtP5UCimYgVmfUZNlOQ5s7eJs1buf791D4bxIZucPAaGni?=
 =?us-ascii?Q?HQEvcKTLadzoHGDp54u+9ub1eba9PQG8LDJzfOgPzZcOR36kROKtNWgYSd3y?=
 =?us-ascii?Q?KWWIhzuludu3HLO/KiG1Ztek4/qOwV+vuamqMTxNBThal8HsgU7Vd5hKTwI9?=
 =?us-ascii?Q?NYup8ppWn/v9P5CaFrH0EqTneLqniU5CeO+nJzaOj/75HuVCvNj1OGPiKZz2?=
 =?us-ascii?Q?EFGM4wvRFU+swsGdMGKIq7NpTjWyhx+vq3lgC1cZVRB7l1GUPewgdmOG/JAB?=
 =?us-ascii?Q?HUkzz683enowDOYSUK/HDfFhbGJW8cwb4jArb2SeAux0f10u0WpOIfjlfKY6?=
 =?us-ascii?Q?I3PERS1/nhKMKi2MbGYWYjJHGpfCSjFOueiNcoZmaFnCLG/37m3rJW3S2MBB?=
 =?us-ascii?Q?QXK3rVqyQKe6zRmeJZhSxFI4mWg28X0PrhYiqNiLJ85X/k4doym+2/7GFHq5?=
 =?us-ascii?Q?yi7z8/GT62xYX59byCh029YSEkt/ZQ7A0JyOwZ1ynTkQzGrgu/0HYSHm0SoX?=
 =?us-ascii?Q?TXW7oX86uacqWBNiwIlKHtLYwHx4fr79+Td6HCZlkYPN2I13onBjGeCKNQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 20:03:23.1398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3108f131-e2e9-486b-a011-08dd9fb50841
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626

Check if the adapter name is already set in the driver prior
to initializing with generic name in i2c_dw_probe_master().

Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c5394229b77f..ab03943d6aaf 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -1042,8 +1042,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	snprintf(adap->name, sizeof(adap->name),
-		 "Synopsys DesignWare I2C adapter");
+	if (!adap->name[0])
+		snprintf(adap->name, sizeof(adap->name),
+			 "Synopsys DesignWare I2C adapter");
 	adap->retries = 3;
 	adap->algo = &i2c_dw_algo;
 	adap->quirks = &i2c_dw_quirks;
-- 
2.43.0


