Return-Path: <linux-next+bounces-6997-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B09AC9653
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 22:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5151A3BC04A
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 20:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE6E2857FC;
	Fri, 30 May 2025 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F7+OajZ2"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4252857D2;
	Fri, 30 May 2025 20:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635422; cv=fail; b=PekvFZ/lDb2iZYfgQK58at/eYsojcR0m8Z/MPmDkL8CRXg9SU+ZuFnNtBNmLHLwerEBsO3h72ZX45gHTrNk4T5bcpliGy7KRikLPahxLShOxHgY1+k+DAgWScRecAVBxiE35Jh34bNwlBnFJn4XSbs2b10xtQxnt62e94LC5Fsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635422; c=relaxed/simple;
	bh=TU+Pl0+BnzmgGlrRezJcwZ5WzNmh09KyxgajooZCDQE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbN20+eJ9X9ENbHucLEYioPvRT4jrwegAfCEEasw9xjzpMR48bwy/xkHi0YgKMEv7ox+EO9EQN/A0tqYULEA16RnxiQ61X9mtFbl/4F2vStoA3OolMM84ciICk0YyXMSUAcBtvbWlQyg9bIyhu5z761KEiQf4bZhMar5KgvkN2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F7+OajZ2; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmBsToUWOsd1zyimfaqx6QSOGE5fr9Eaig9Hu9LL3XnEQXL3xbgRT1LMtoUOMt1fdoF7Kxmy9TfPQo9LDJ+Eh3P6IHQP/NUJvYeuynbRdE/KoqwXRF96zAn98LM28v9EtXl+q5L43SBallEB0IGvoPaRZGs4ajhA3WM6vA5HKCpQJ7d+KpwXBs3ywWvmHcypy8SKBJc5eIUNBPO0kulhAdVh+DLpO6uwEu1dkYEy/eF34H5VHWLxT12Z8OHGmIKzZLUzsziH8VjlSTqAnxuHkXYJCYYhqsB4P27kk1sEmIH0MyNxS3TQ60obICON4qOam1JNa9LOGY7/8VNXo2K1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGcmMQLhsHfzzceRVmAqG2W6K09y3M25b0ibOli8NEQ=;
 b=yLFpDaWtyC0rIO3MNLgr8nu8JhWZIZ/M9njT+YIgUv45pg3Sk7t61y6nQ7qeklVu51b2nHX7gmpzWaxZw6bfpJzYxe3ori6uZXLB0yjj36xwzNZZjdJ/CKl+s7gyP6M/7caQibTRzNeTFBUP3aVMzzq4IEYi9XA9foD2hC/JBpbYzxaRKg8xkloIrQ5YvY6I5BZdPJo9EWu9jpjXD3g8Jyxj/PtKRZRMiWe3p1luBxbuyhfayQkFrNN50OoDYZWkX0uzDXfFYvaI3eA1i7iLMgmMn2/5TSi0P6MUeyHNNwSlEWzbxKVlTjIC9xpXgYh5ai6Lvf/qmQY3XoIkNyqQOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGcmMQLhsHfzzceRVmAqG2W6K09y3M25b0ibOli8NEQ=;
 b=F7+OajZ2YC0PKrn8FGxZDtZJ3KtWV/RwLENnAZNuOVJePPTrPqIe23PycudIh1gteI0rlqOHQv60pKTUE9Btl8s/a0M9EvYr78r0g8BDzWbrr1GdU7cbnJ0oKZzAb0O3eMeXTV8uDo+zSkLXuUgkWrXlZZ6ZqVYX8vepf/Gtu5g=
Received: from BN9PR03CA0238.namprd03.prod.outlook.com (2603:10b6:408:f8::33)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 30 May
 2025 20:03:36 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::9) by BN9PR03CA0238.outlook.office365.com
 (2603:10b6:408:f8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Fri,
 30 May 2025 20:03:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8813.0 via Frontend Transport; Fri, 30 May 2025 20:03:36 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 May 2025 15:03:35 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH 3/3] platform/x86: Use i2c adapter name to fix build errors
Date: Fri, 30 May 2025 15:59:52 -0400
Message-ID: <20250530200234.1539571-4-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SN7PR12MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: fe28d220-c331-4d99-ac3e-08dd9fb51008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hsjj1mjsMHtarr/sis6pLwAPfKfTn76tTl1NFGix4tgdHH/0Wn+OGat42Z2f?=
 =?us-ascii?Q?1rXpEVNBZVTmrDC39iPrGGLYrr8vDvZrYLc/N5/AqUw9EyWJb2rfgPk57wA4?=
 =?us-ascii?Q?vzsWY7FkOonYaEp4hHZ6xuhdsk6PNcUOl2Pxndii65XtENea5EWXgkZarvzD?=
 =?us-ascii?Q?H8Etmh9lp3a5PBuQ9KLWdxDNyYHOY777h2Uvfgiu/j3EiarUmQtaO5QDTlZB?=
 =?us-ascii?Q?e1F82peVLtB9uyspx9mlpUswqsA5els7ZRroTZ1W81UNbBkJyZ3mlQLLAJxr?=
 =?us-ascii?Q?7JeKaow6+jv32l9xdR7oykcXVKP+Vj2jpn2TPfeQzeq92j7z05lb5WcDCQB6?=
 =?us-ascii?Q?jfQFTBF12PnHdjjw8jBkgzKcu2/zJ2amxkRhDtJ/86DOcfzypO0huwo9yG92?=
 =?us-ascii?Q?Xm836KOAc1H3mGzSNhcZy0QC6OGbcFVW/Boh5IWyeczb66/VhvMkFv1ZxADt?=
 =?us-ascii?Q?wvFqv6Z+qH8f9hug80CW54FYfqeYgG6O6W9NoEDKYvC5TrCCxMATFKBSF0tO?=
 =?us-ascii?Q?zlLG3Jcx30j3gTBw7eNBp7MPnD9Rem4ipj1rTs2zWqLwbcpYV1nRXeh+fwSW?=
 =?us-ascii?Q?WKBhCh4LHE2MsXXj4z+1DZYtkFOE8k7ppOxCI8tbpG2EDoOyMFXWsdPAqSJ6?=
 =?us-ascii?Q?K32S9gSFhHYjwvE/MZD9zemuRwP0PFm0ybqiwm5wh2mgRSFcNl6T8XqxYlNv?=
 =?us-ascii?Q?aqLN/tIOL5cZO/bSkU9oRpSr5FWQhaXL1RMaphJC6akyOfol44tH61WDQH9N?=
 =?us-ascii?Q?OzobmIfUE3rLVldUtrr96pyS/CO+4Zlya6PdbKRZzBCTuCZNqStQ/DaQSSoa?=
 =?us-ascii?Q?MmFDAmD5rzqA0GP2/Eq5AXqa1jUVXwBrqiezI11k9lKHjaR+EZKSo6UMCI8N?=
 =?us-ascii?Q?TWDlAXfkvAbcUfPdsTLOh9V4bEmAmH4Etw4hMAPWhZqxK2eJuCJOhM4fGgmO?=
 =?us-ascii?Q?NnzsMW3/DBJh3CHn7zY3wszR5lBHGPrWjPNbc0ZK0dUvIg2JGYyj+BPth7U5?=
 =?us-ascii?Q?8IqVkUFzV+j8dm3xdY8AAn5n16NZcjkcWW1XSWMF8NpVWk44c9jsPfxAm+Dl?=
 =?us-ascii?Q?VhZaovd2aExrNqS84jL2oAPc5inojmPbWhJzqyzBteHOZplOCcwBrSyatECt?=
 =?us-ascii?Q?Z+zEgpXb2px6CV1u2c6DfMAmAa6hqNf2ggh8I8QM4alMZKzKDbDczH6NZOQn?=
 =?us-ascii?Q?Ld4vkefyIqG7bRQ3cqiK2UY4wM6rX2PS6kKtdP+KUmNH8dcJtqJrpkdZ93Rd?=
 =?us-ascii?Q?K4esPgMdvqdocM+Z7WEvmPmI/QqoS4Wq+Zgcg7a0s4tQysOo5+xH+5akvJ4g?=
 =?us-ascii?Q?XW6jtgswYrvnj1DqfLsnFIneHsNp8DJxpFG1hgamcAwG6D/E8PVo03j2eaDL?=
 =?us-ascii?Q?0Da/sQTlIvSlQnIpqL/SKps9n/UUPXAbpnzxCBWeDbQWbX3eQKUwlBb5X4gp?=
 =?us-ascii?Q?w6tkRFVS5E4UUsh/niNGkkiMqKu4x05MsT/vTqz5D260DmeoQY/Lu57umnMx?=
 =?us-ascii?Q?MuAVDNJ2WgZ/c8a5DRu4hMIp1D+VPYhXPDd8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 20:03:36.2961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe28d220-c331-4d99-ac3e-08dd9fb51008
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957

Use 'adapater->name' inplace of 'adapter->owner->name' to fix build issues
when CONFIG_MODULES is not defined.

Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/platform/x86/amd/amd_isp4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
index 0cc01441bcbb..80b57b58621a 100644
--- a/drivers/platform/x86/amd/amd_isp4.c
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -151,7 +151,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
 
 static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
 {
-	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
+	return !strcmp(adap->name, "AMDISP DesignWare I2C adapter");
 }
 
 static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_platform,
-- 
2.43.0


