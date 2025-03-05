Return-Path: <linux-next+bounces-5657-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FBA4FD87
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 12:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 887997A40C3
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 11:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A6021421B;
	Wed,  5 Mar 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xjth+CbW"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F11EB5D4;
	Wed,  5 Mar 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173881; cv=fail; b=C1jI9lgpm7kDA5+Gf7fqVenqTZF7yzur1CB23ZRXfiz1OKBasa0s8GgUQfRI1Md+pSyjTY1FUNmksq6ZV+c5EMnoDnJDaas239EjhtjSnBzKdu5N+w9xESr95eMAt9LxZzS8bWZgTiAIGzOxDLnAzpJFvOWSIHfh+9N9wcfRS74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173881; c=relaxed/simple;
	bh=Ky469EvayZQ8hs1i+c/Y5ktB4W4KeNbC3znqkXkpsi4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UiomZegN6tt6AKLdY+2ejCy+eOa5vQZnvil9X+DChxsPdW/s6Y0/s8c8HCO0XEEVigVqOTsLffOtj/oe7GZUOKqMJL6O3viUY2l7TAY0sW/4fqOsNZ1QA9WypGdhTM+plyuYCKrQIESKkH5hEnP3hEkglcc7ixu96vu5y2B0UpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xjth+CbW; arc=fail smtp.client-ip=40.107.237.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLrGQkHayhA1IZZuh4EuFi9LXQpMl0r5OB6DjylINbxZrpDt0ukNPEeLA6iq4qEp0WDc1drY6/qI9h3B/WONrX0lUCNVA05aOfSWZ5n0pLGLsc1uFAHwZHFawkhf2nj9f4Uh7NDgDFv1nZkgc9fhIdKzNAZYaqQ2LTJQud5DVE292IFo/qxq+IaBtU0X96/vEXt6EN8Mg+ON8ZjJyihCrF20EwVtvcOKu2/kyqqj0keAme1aYseYoT+NRiYT4dtxQ83VVD6u5n/STjz6L+EaCZSDy5YZuywy8QVZO6uFYILiJmIl0llgG08AOKsC7XSvBHQMjB/YH3LEnOW4AILSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6Yp2dv/G+ZFljmjEqKZkdg9la8fVQO14ePdBjG69as=;
 b=lEIXHm2eL1pFuKqcQMLfiXJLx6EUxlotmqw+Yr4fZJNlmJ3/ExAyhE+bthtIAP2w9P6+eltJfoQ/xqaDr5kc2Oyz/nHuir5vjjZh43MzhS6LzMCVZvFSrS9uvxFbsW+/bS0pDiLliZrMyYbC+ROt2F3KO6/fQ1s279ao1pEif6P2qKCh6yfpZWG4s7qQh03KeZQqF4xCcTCBvrKSkp/tqM7STYJjKHRm1GiTq9VnRB2qk25sYRIfvOacOMkGw15xXBvN/Zku7K5HBBRL7VRwhfV/Q77eIGWqPcFmxJ+ocSM9iJIDWa3V9aglxH3LwjsVF0H2tr3xqCdkVrXueBk94w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6Yp2dv/G+ZFljmjEqKZkdg9la8fVQO14ePdBjG69as=;
 b=xjth+CbWmQ2hNuM6dJlh9WZxNqpOGExNy52pg8rdEuL2LqSsqcaDntYpkXLfMtd1ybBzG5DeTpCo8d+TfXFsP/NwZ00V7u6CCww12BvDEP17bwxS42C5xQyKULTi7UkU8SEr3AgZolR1A+jGD4hGbTxjJcWtNexuBmKgTyuqEAg=
Received: from BL0PR0102CA0042.prod.exchangelabs.com (2603:10b6:208:25::19) by
 DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Wed, 5 Mar 2025 11:24:34 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:25:cafe::14) by BL0PR0102CA0042.outlook.office365.com
 (2603:10b6:208:25::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 11:24:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 11:24:34 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 05:23:44 -0600
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Oleg Nesterov
	<oleg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	<linux-kernel@vger.kernel.org>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>, Swapnil Sapkal
	<swapnil.sapkal@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH] include/linux/pipe_fs_i: Add htmldoc annotation for "head_tail" member
Date: Wed, 5 Mar 2025 11:23:01 +0000
Message-ID: <20250305112301.2897-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305204609.5e64768e@canb.auug.org.au>
References: <20250305204609.5e64768e@canb.auug.org.au>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc57dcf-e4a6-4889-a683-08dd5bd84e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ewcZokXVFgD6ix9XFySep2o3QNS1mwZz6GkU0YR+q+f8e0TxZHRvfaBV8rFL?=
 =?us-ascii?Q?oYXx4Yqy+NulOrlRL9Ws2qxgwLcT/sJzPmJ0/sIu1fc7fu2xrF0V8MY5/g3T?=
 =?us-ascii?Q?2R+J1pme3LjIwOMsA+q0u/oBHVbvy6dRcqiLvUwqWzGmj/Xrmvmz/oemVEtz?=
 =?us-ascii?Q?fXY5mWz4vLbOvCxDZf2WmeA8dPlhCqKxaterW45aXDM/X9yKv/QZN/eOuxIf?=
 =?us-ascii?Q?Ls57bmPtOj2hgJGFMmA/beNvjxxUIoOk+sVa09reAKyjCFGI1lB9TH46HBJO?=
 =?us-ascii?Q?EUuGReS7yJkXyCJE0beNA73vNEgjyaSq95I3HSadUaZPYebR3rHJnwhKzSa9?=
 =?us-ascii?Q?iuXHAekWjbUjxvTh0kCLXueoYiLMOZ1EI3WHp07stgvY6dsQAVpYZB1x5FWw?=
 =?us-ascii?Q?SaEgZoXqOE+9MhIlxViazC4oHN01v17BNtVXJTTMFzORq+57+/CxpvyP4zdE?=
 =?us-ascii?Q?ncIO+/raB1dG7Z95DuT72Gx42okYiD6ZOiBBBax2MOnbQIY/hri1Msre8TXk?=
 =?us-ascii?Q?XvJHxJ6tFnq2NIxkw2JR0iY9f/BE3/P6ovTmN0Cvz8wNwKp4bgHl57OHv+oR?=
 =?us-ascii?Q?JP+KKqs1EIQx0qevGfgfIOvwC5rDb+kRJDu6D8hwKSqIa5eoJBlF7yln7Sif?=
 =?us-ascii?Q?351KGeGsD/d5DdJ4nqYAJ0NJCsFWAMOxVwQAGCnyuRSs7qpB+Hpnp4LZW4FO?=
 =?us-ascii?Q?xbdGabt4pjvPVcPnJOMQUmlI32npJ3toNvlXOsGOBpB560LDwhplEx9AmUeV?=
 =?us-ascii?Q?sv64sbSROCaIlAX5VT2NNtO4aHu0LwL03dmLQ9zXYNbz+gJd2FmcFq2XJmFl?=
 =?us-ascii?Q?dFO99egbrmdOEoWu4zpsVsucNTwGnxXYzWqFOUSG40Gps0OIpeFyFb3q5ABv?=
 =?us-ascii?Q?7Mc9MK1uK6sJY40mhKdzcpzOubkDH9mwrTx1B5FNBy3jD3wfkaOfRFps+uWw?=
 =?us-ascii?Q?1OyqJZuJ7ifjvpKrwUtvNh97yerlTmG08oETP1I7KFAxmsRbo9UuclrvYJ7C?=
 =?us-ascii?Q?8xL+fxuA/4IlaAJ+VdL2lWzhJ3ZRcakJP40psc8M7j5c+glal6lhbjneCHzF?=
 =?us-ascii?Q?/tnJNzlCKSf+g7PuiXpfTRGnG0IWs84CK1lEhTMdeVDu9c5IsagDz307gdUM?=
 =?us-ascii?Q?4oRzhsQu67n+YDXoc9rxA8B7IBhiknXaS3LbZR0j9GiC0OR0u0GuIH56cvov?=
 =?us-ascii?Q?LblVKktbWOZ+R6IgG8kKsK9B0ETjgxMESVjJNDwbIDVzxJ++KZ8e7gYYdYPu?=
 =?us-ascii?Q?w+6lUiWDzKK8gFmNoPIrOoRcIVJuc4pAMC+0ESgKqiBpVWwDtty4r1taOCWr?=
 =?us-ascii?Q?/l8VHZO2wfcbM7H/4KE+cOuK1DuOfhbFvV+5dOx5kiuBXkZAnF6aEEbxf3Ln?=
 =?us-ascii?Q?WSr6t340Racnetquw/DBlloaqBf6JMvy3F3CBKvv4VKi8jdWENcNLALTcTpZ?=
 =?us-ascii?Q?ieV4yoWU+wYajf+H/7SGMT3i/hw9Xr8Dw93fNM106ZnWOL/2iFN0EBCmRrJx?=
 =?us-ascii?Q?NsXvQJLHuDpXHfc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 11:24:34.0916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc57dcf-e4a6-4889-a683-08dd5bd84e4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526

Add htmldoc annotation for the newly introduced "head_tail" member
describing it to be a union of the pipe_inode_info's @head and @tail
members.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/lkml/20250305204609.5e64768e@canb.auug.org.au/
Fixes: 3d252160b818 ("fs/pipe: Read pipe->{head,tail} atomically outside pipe->mutex")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 include/linux/pipe_fs_i.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pipe_fs_i.h b/include/linux/pipe_fs_i.h
index 3cc4f8eab853..44b8c346ae2d 100644
--- a/include/linux/pipe_fs_i.h
+++ b/include/linux/pipe_fs_i.h
@@ -65,6 +65,7 @@ union pipe_index {
  *	@wr_wait: writer wait point in case of full pipe
  *	@head: The point of buffer production
  *	@tail: The point of buffer consumption
+ *	@head_tail: unsigned long union of @head and @tail
  *	@note_loss: The next read() should insert a data-lost message
  *	@max_usage: The maximum number of slots that may be used in the ring
  *	@ring_size: total number of buffers (should be a power of 2)

base-commit: 48a5eed9ad584315c30ed35204510536235ce402
-- 
2.34.1


