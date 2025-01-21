Return-Path: <linux-next+bounces-5279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B4A17956
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 09:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9DDE1884275
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 08:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EF21B4258;
	Tue, 21 Jan 2025 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ddn.com header.i=@ddn.com header.b="kUH34XMx"
X-Original-To: linux-next@vger.kernel.org
Received: from outbound-ip191b.ess.barracuda.com (outbound-ip191b.ess.barracuda.com [209.222.82.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60E716BE3A;
	Tue, 21 Jan 2025 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448731; cv=fail; b=ptZsHt1s6KwtQ89dkCVZR9YAQKqYfXeyW8lr5U6W5dV6hRxtjF6ji6+qKdPkEncxaPV5x+e43OFNzghigqPyO0X3N66zLykM7kCfffCCPjLwZ6mlwXhWg3KaQTtdZiNVoQNr81ykQzu386Sn53LMmlg4+avqn796880jcLT+DEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448731; c=relaxed/simple;
	bh=oU53OaPRIPQP1RidWag6ftLwd+bfAs/uU0KwA3VJXec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1G1Nk97RDBfcAOmLpzshF0n1KWiT0+1rNZey1jl2x5fEayFUutO42AmCRTUHMLUpkw7c2eZKesMsDg7JRLDuwWp3avyv6KfIz5VT6Zbw4D7LNGYr5+8BiErJI8gVJMBPfv9ncg9txMo1GM4DcDnbMecUp3pRk97Pkz9NsBO6JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ddn.com; spf=pass smtp.mailfrom=ddn.com; dkim=pass (1024-bit key) header.d=ddn.com header.i=@ddn.com header.b=kUH34XMx; arc=fail smtp.client-ip=209.222.82.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ddn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ddn.com
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47]) by mx-outbound41-141.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 21 Jan 2025 08:38:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laDS6OVWMJLuvGOEwG8VTWs5B/5pdVHW3fnfxKpnr1LJ6jhUD7/IfKNgijdgU/vJHPCHFZVtRJnJmGusQJHya/fwUTDMfkXdJhMyCIzMXTNX51JS0UY5FDonsKUOcyzuBO335OAXQL5iIBRx4u/kAyOd0Eor1E/DkR5fzV+PoGk+saa+9E4tC0/ZevQ8cCPQ5wR67jO6O7fenuosjCar+CklUis7xHTWojv6p4bmi9FZjiC2LZETjQOnVYOOOk89ZQ6ERhN3MQibd3YkMRir6YBMiOloSpls/DPACEpZIU0P3XnYnsR1bjwzglnTon986HrMYZZk/F8ug3QPr8NfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXn62A1TCJjfvrSAf587F2gaZuzmEKiU/oYCDKIGj6c=;
 b=DJOlWnS5gn7UOPoZbeQnZBXYxnoBigbCPK4Om0cr3TUsAoHca6k+8+dH5tahYRuouvbDKQv1SfFYyidgYPaN3mgZz4N3Zi1ejinmDuG7Y6NxG6PkyrrHf1QyfVvYIQDRTJQuKPLQY4VN4s+m35ZaM0zTkqJ8A5NC4HH9aJXySvuO0pRJ3SSwpnp+bvsHJqs/p5z/3KF610PUzmqfeECoS8teaFQzKCEriNmXr863JQR89+0C0OVXPQUG9m5MNqvHVanlprKOyY/lxY1GuqwgsWdNGt4IJxmRBW1oXdDxEJJIe8r8VdhcJuULTAf4Lz/1zIsMcTChGyATo+YYbk2A2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 50.222.100.11) smtp.rcpttodomain=bsbernd.com smtp.mailfrom=ddn.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ddn.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ddn.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXn62A1TCJjfvrSAf587F2gaZuzmEKiU/oYCDKIGj6c=;
 b=kUH34XMx245O8sujegppH/EMVfdgUszdvvNVYvoPYpyiSvIofvSwpA4mIslDAFn015zAMFwQgUO3d/tHF44izq2Zn3o5ymosbXFH5C09ZTpBjRfE3BYFdRsHeCNq3pnHvMOvl+gFvYb4kupFOW8LSpl+9NbYRUq6sZfhtxVgxOU=
Received: from SN1PR12CA0043.namprd12.prod.outlook.com (2603:10b6:802:20::14)
 by CY5PR19MB6542.namprd19.prod.outlook.com (2603:10b6:930:35::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 08:38:27 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:802:20:cafe::99) by SN1PR12CA0043.outlook.office365.com
 (2603:10b6:802:20::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.20 via Frontend Transport; Tue,
 21 Jan 2025 08:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 50.222.100.11)
 smtp.mailfrom=ddn.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ddn.com;
Received-SPF: Pass (protection.outlook.com: domain of ddn.com designates
 50.222.100.11 as permitted sender) receiver=protection.outlook.com;
 client-ip=50.222.100.11; helo=uww-mrp-01.datadirectnet.com; pr=C
Received: from uww-mrp-01.datadirectnet.com (50.222.100.11) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Tue, 21 Jan 2025 08:38:26 +0000
Received: from localhost (unknown [10.68.0.8])
	by uww-mrp-01.datadirectnet.com (Postfix) with ESMTP id EF96C34;
	Tue, 21 Jan 2025 08:38:25 +0000 (UTC)
From: Bernd Schubert <bschubert@ddn.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: bernd@bsbernd.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Bernd Schubert <bschubert@ddn.com>
Subject: [PATCH] fuse: Fix Documentation/filesystems/fuse-io-uring.rst
Date: Tue, 21 Jan 2025 09:37:46 +0100
Message-ID: <20250121083746.2196931-1-bschubert@ddn.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121174848.382cc2c6@canb.auug.org.au>
References: <20250121174848.382cc2c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|CY5PR19MB6542:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 67d81343-3826-434b-ced2-08dd39f6f97d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QgXaGQtL74WMNuXmaPV8O/mFtl+pvhvZxwvQs63Xvbm1AkYCp9mJNvropgRp?=
 =?us-ascii?Q?zroLjvmQHE88n06ez/TX6iPPg5w7ytLwSjn5BDhATkZLPicxwBW1hI3y1U52?=
 =?us-ascii?Q?sVEn+crn/HPym8e4ut6Z97j96r2yb7yOZ3Tzj9H25ARLCmWU32tWLIC+Wnn6?=
 =?us-ascii?Q?0X0Lbm0uoUK28Ge9xSF8llfzWJMz6EDtu7zLn1Rut92RUXBMYY/8s+mxUENI?=
 =?us-ascii?Q?alHszYZKj8kVBpLkLnhsFInsboYUlC9H0eam4j0YaAywRbBdMr/3SvZzmDtz?=
 =?us-ascii?Q?ec3jV/M8f1+Gu050n4cfSMVrULWXxMOMkuE2yU2+tgZYxul2jA8Z+honYrjI?=
 =?us-ascii?Q?uyTs7ZfpkAgOL2sk1/YUEnbAugwUlCOHhS8Jce4eai3zuVA+mD40Vr8M/32j?=
 =?us-ascii?Q?lzGIlad9/Jw0Dr2VH76GXGo7PMZQBQgpO8BWl8csFsp2ZJ83iQIuirl4/jm9?=
 =?us-ascii?Q?9O4T03gYjKyIsc0quBIqsXamP2GOqli2WLwbb9bxqxorxLxiyNPkn1pV8w3D?=
 =?us-ascii?Q?LembCw7ZGp9bMHINCMnzypRj3yKwa7po20VuE7phx8WaCpW6uX6jvX/6+VH6?=
 =?us-ascii?Q?rTuoZb0cToiDnKwoPx1UcEsvepeUEKG5XWxDr0Pltj/bxEsLCf/LXeeMyL8J?=
 =?us-ascii?Q?y+ZRsy4AfE/fQ44Z1iMhUHciOpn9Ts6utEleLRyuaY2ocyjgu/6rFakdQKF9?=
 =?us-ascii?Q?DjzfVLptpkR9dQCcTZTuhJ/AD4BV3yPjs+MiyjK+GayTUsYGWS+q50UP46Av?=
 =?us-ascii?Q?cz50nXtT1vdP3fBSdgyBnCmIzAh7xFA7aT5HBAMq5JOaGG7fIkJYPVd+D4Ce?=
 =?us-ascii?Q?23f6G4xTIrgnP8AIKrNZnDzEw3o8r0YJVv6oeulwl1RvCQVMVMIrV7pTnbvE?=
 =?us-ascii?Q?HUFi+Ee9kiFc5w7PluWpQyDqWcN1vuVdScrdGFeq2NAvVlZA1LIhxE0tBHxs?=
 =?us-ascii?Q?wfWhSrH+A3joxua4k99invgvSw6VFp5y2aagedLzFhcoBIw0Ul4U+pNxYz/B?=
 =?us-ascii?Q?FybP9ShWYpO50hTnisX+rbblwHgWSbrG7+yjs9aCpv0MYwaY5psZtlVNUv4m?=
 =?us-ascii?Q?3Mk+pX9DiU0AfVb/5iXAECwXoht80BwoMO9Qv7NZuG4OCrFniWTdromjV+eo?=
 =?us-ascii?Q?KEUi7ylW6bgCa55LLcV60Jxbbkdq/Jqa2QX8ldyU4Rhzn1JtnaVquCmZmfe5?=
 =?us-ascii?Q?dgnkcnzAl7N/XhFXwrz88YMbP20p+295cXBn42lp/AenKLypph0++JsFeZlI?=
 =?us-ascii?Q?DphjTRvaefXPEPgYpWpaThSmFMnFMr7Xtp3qAxCFIGLqCpt86sClpRqMN/9L?=
 =?us-ascii?Q?fD6BSjHoZXYXjCVsDiyXCoCd+EUsJSKXbdWXtjls0iOEj3K3xvurQ8utX+tV?=
 =?us-ascii?Q?n7DDKuV9Cw3JqnoeVgGlP0uP5V3yuMj2Gys55uqaoPKhu7qTuIbvFDXLrhLf?=
 =?us-ascii?Q?GneSMcvANEIrSYDJ/h22nrZLYO4V5X1qFAjrWX81t7hknbh7J2JZCSIBnXod?=
 =?us-ascii?Q?F4b11flRFCaB0VY=3D?=
X-Forefront-Antispam-Report:
	CIP:50.222.100.11;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:uww-mrp-01.datadirectnet.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KUZIh0IOGz44fu+p3qPXU6iBpN5e3SyrkON69vAZikKOxE2N6E6lxku+qQ9+jBFY9WaChCKD8mCSq4mIQTdJGgVCN9ttTyfKLUNFTENQy6xdzuHwAbqYXsdjvXxfZ2Y1OqH8xY2Y9iFySAj3JKLqyrwXmHAVsEanCb2iJKoS9qHHVvt28pQdwN3HGQPBYQfMC5vSggGt/FMmSB0VJSqERmje1qj7drbJ+wbqqyKBqsXzjQ2wFuSk4aqMhdQgIeAi8FseQj8baW3mmdEoNTnTAeaYIQSsHfCWIDLD5tl9oAjPbYYeq1/IxXKPVyFNMovYYWkx6Pr6OLveg0fxS7Mrojy3/5d+U3LzmTrMV4GL/tZVc0bceauKs/58h8V2hGDwt3B7A8tBcRhw88wrhm+6a2Zp63xN2vbCjr8RQKY/47GVs+1X5AkEtTc945rxdSKHy683YIoBNrSOaZU9+/WH/USt4HIqTaTy2nrlavWcvGXH/bNcLHZpGmXu7aleGvzNna9ouDv0HPSl7M4F/TRycv8QKbENlfLWEYZ+akYJB6u79yYdRN82VKndcSbH8R4bvgnTM8+/cqRaPa51yHB6SaPtHVqS+y6ogrmRNz1qoLGAmiKRvrAbFdj5ggKxv1vivXipmJBgLRPDORoJmVFzbA==
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 08:38:26.5738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d81343-3826-434b-ced2-08dd39f6f97d
X-MS-Exchange-CrossTenant-Id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=753b6e26-6fd3-43e6-8248-3f1735d59bb4;Ip=[50.222.100.11];Helo=[uww-mrp-01.datadirectnet.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6542
X-BESS-ID: 1737448708-110637-13403-120094-1
X-BESS-VER: 2019.1_20250117.1903
X-BESS-Apparent-Source-IP: 104.47.58.47
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVqYWJhZAVgZQMMXY0MAw1czU3M
	jS0MQkxSjVMCUxLTnNKMXSzCjR1CRNqTYWABe9TMJBAAAA
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.261948 [from 
	cloudscan17-102.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS124931 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

This adds several documentation updates I had missed after
renaming functions and also fixes 'make htmldocs'.

Signed-off-by: Bernd Schubert <bschubert@ddn.com>
---
 Documentation/filesystems/fuse-io-uring.rst | 84 ++++++++++-----------
 Documentation/filesystems/index.rst         |  1 +
 2 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/Documentation/filesystems/fuse-io-uring.rst b/Documentation/filesystems/fuse-io-uring.rst
index 3c6b127d68a7..d73dd0dbd238 100644
--- a/Documentation/filesystems/fuse-io-uring.rst
+++ b/Documentation/filesystems/fuse-io-uring.rst
@@ -15,8 +15,8 @@ Limitations
 ===========
 As of now not all requests types are supported through io-uring, userspace
 is required to also handle requests through /dev/fuse after io-uring setup
-is complete.  Specifically notifications (initiated from the daemon side)
- and interrupts.
+is complete. Specifically notifications (initiated from the daemon side)
+and interrupts.
 
 Fuse io-uring configuration
 ===========================
@@ -40,7 +40,7 @@ pending requests waiting the request will be immediately submitted
 to the daemon again.
 
 Initial SQE
------------
+-----------::
 
  |                                    |  FUSE filesystem daemon
  |                                    |
@@ -52,50 +52,48 @@ Initial SQE
  |                                    |   >io_uring_submit_and_wait()
  |                                    |
  |  >fuse_uring_cmd()                 |
- |   >fuse_uring_fetch()              |
- |    >fuse_uring_ent_release()       |
+ |   >fuse_uring_register()           |
 
 
 Sending requests with CQEs
---------------------------
+--------------------------::
 
- |                                         |  FUSE filesystem daemon
- |                                         |  [waiting for CQEs]
- |  "rm /mnt/fuse/file"                    |
- |                                         |
- |  >sys_unlink()                          |
- |    >fuse_unlink()                       |
- |      [allocate request]                 |
- |      >__fuse_request_send()             |
- |        ...                              |
- |       >fuse_uring_queue_fuse_req        |
- |        [queue request on fg or          |
- |          bg queue]                      |
- |         >fuse_uring_assign_ring_entry() |
- |         >fuse_uring_send_to_ring()      |
- |          >fuse_uring_copy_to_ring()     |
- |          >io_uring_cmd_done()           |
- |          >request_wait_answer()         |
- |           [sleep on req->waitq]         |
- |                                         |  [receives and handles CQE]
- |                                         |  [submit result and fetch next]
- |                                         |  >io_uring_submit()
- |                                         |   IORING_OP_URING_CMD/
- |                                         |   FUSE_URING_CMD_COMMIT_AND_FETCH
- |  >fuse_uring_cmd()                      |
- |   >fuse_uring_commit_and_release()      |
- |    >fuse_uring_copy_from_ring()         |
- |     [ copy the result to the fuse req]  |
- |     >fuse_uring_req_end_and_get_next()  |
- |      >fuse_request_end()                |
- |       [wake up req->waitq]              |
- |      >fuse_uring_ent_release_and_fetch()|
- |       [wait or handle next req]         |
- |                                         |
- |                                         |
- |       [req->waitq woken up]             |
- |    <fuse_unlink()                       |
- |  <sys_unlink()                          |
+ |                                           |  FUSE filesystem daemon
+ |                                           |  [waiting for CQEs]
+ |  "rm /mnt/fuse/file"                      |
+ |                                           |
+ |  >sys_unlink()                            |
+ |    >fuse_unlink()                         |
+ |      [allocate request]                   |
+ |      >fuse_send_one()                     |
+ |        ...                                |
+ |       >fuse_uring_queue_fuse_req          |
+ |        [queue request on fg queue]        |
+ |         >fuse_uring_add_req_to_ring_ent() |
+ |         ...                               |
+ |          >fuse_uring_copy_to_ring()       |
+ |          >io_uring_cmd_done()             |
+ |       >request_wait_answer()              |
+ |         [sleep on req->waitq]             |
+ |                                           |  [receives and handles CQE]
+ |                                           |  [submit result and fetch next]
+ |                                           |  >io_uring_submit()
+ |                                           |   IORING_OP_URING_CMD/
+ |                                           |   FUSE_URING_CMD_COMMIT_AND_FETCH
+ |  >fuse_uring_cmd()                        |
+ |   >fuse_uring_commit_fetch()              |
+ |    >fuse_uring_commit()                   |
+ |     >fuse_uring_copy_from_ring()          |
+ |      [ copy the result to the fuse req]   |
+ |     >fuse_uring_req_end()                 |
+ |      >fuse_request_end()                  |
+ |       [wake up req->waitq]                |
+ |    >fuse_uring_next_fuse_req              |
+ |       [wait or handle next req]           |
+ |                                           |
+ |       [req->waitq woken up]               |
+ |    <fuse_unlink()                         |
+ |  <sys_unlink()                            |
 
 
 
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 44e9e77ffe0d..2636f2a41bd3 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -98,6 +98,7 @@ Documentation for filesystem implementations.
    hpfs
    fuse
    fuse-io
+   fuse-io-uring
    inotify
    isofs
    nilfs2
-- 
2.43.0


