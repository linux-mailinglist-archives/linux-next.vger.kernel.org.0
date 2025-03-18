Return-Path: <linux-next+bounces-5865-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F88A679C0
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 17:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0123A4330
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 16:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F1320E033;
	Tue, 18 Mar 2025 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G5+xeb8e"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A64B20E306;
	Tue, 18 Mar 2025 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742315593; cv=fail; b=BGCZ6XQdbPGd9BRgZaHeVZ7sDXe5dNJc1BZBd8KiCfurUz7eK83OBdD7ST9/e+IgUUPFxQs5D5hVsKst6+0yLqT06WUBIOkGHViiD31J1Tu0haKWQ8yLgJdybWEtAWMIJWRTe62LduhZddCYHxK5t/MEJXa4aQxmypyoP15+9P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742315593; c=relaxed/simple;
	bh=2c+tos3VMLZ1DbjIXstCDUmLOUDeY5l3cz8/hyh0B60=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s12DqGAOrlgTN3R7XxJSir7zdOwwRIRCz6pi/5x4EJQqyU7bjjfjR2yYkyQONh816CIDxSDjZs/QSos8bgV/dgFsLqZJs0db328KUY0hp9H6twpoo+1w1xfiKdza9LEgjTqqbzVCWGi1wZ+HN9oRMaR8bRQTXH5wJerUAQyGvd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G5+xeb8e; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fo6dnmuIVp6DlAGCrMXVfM9EYOyzVwMCJ9vTlLq6dI1/xa2H7aGRT/nbEFzFgd7iXXS/I0xA8hI3bWE3DRsefAtcNjKb+2yPuPnTjoMrHQlaLNAoxZWIdkajnG9W5eTOhxsB7UobbLHhwQgPnH1OjllS4YChYri2zRp39KUugYUbjGfDrUGeHxGzxu+nqSG1gHzabJsttpM5y5yjyCGwagYeZWOBDJoGj38oc6gZy8M7vgGVMlX42AwfUbYhKqR8PYNvzQRr2aZtrh6T+By/GYa3cBHQ4YB24G9jKVyoVIu3RgJN6xybHdUpBdc8U4aFWBrgxC0pk7BUY/M/DGx5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5HjvSEYbO7/NaZ1l1qsNI/pq7H6CFO4Mo/vNF8iD/0=;
 b=nhfeoQEVu7HISfvE575ZSiPZ2La1Zwj++gPyIxpj2qCKPdaWaEnXyW2sVsnswdVZdfpy0dRGFwcELP16Hv/IUi3kt343nmBdFOhQEPm3jFXJ5Hnpixv06F7i4bLl3+dCquk89hSVd6BjxinnyZJx47MC95qXksgOCbIYpPqtb5cVtTEiDklw8amIFBo3ULEKzMZGJZR9sKSqSB1fauD4xEMEJMnoXQN700xzHAlV1JgDwCQyKuw+VPzeLUF8bzx9/XabOuw6AihJHqYyFJxILFYQcobSu5LZgpAbLKVf5+jP6ns5vps4VSbrE0YZxwQrItTD5o8d6M08Uu8aYPgH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5HjvSEYbO7/NaZ1l1qsNI/pq7H6CFO4Mo/vNF8iD/0=;
 b=G5+xeb8ecguvTar7kVPsJWxC95aHJMeanXns+SGx4fcxk5aRnZSZLvDb4JXy7f7rcWLD8LaHlt3FIoAmo99MrW/XkcuRbaYKGUwGMgVhIEQyMyDybLh+EBc9EXxPXSstATHXrf2hp5byW9ggT/dw9jCDFAOwtllpCC2KV83PfThIOtRufNILHegYubjD7kSZP1FxgQLA2V6Yybt4vkHTSoRHTiUJ4mN+RlhjgVXBPfyr9k1EgzmN45e024uHAmf53gQ5sBcg+9SRqgLDHmLIWB+ZbjDwSnEzyUXbf4UQ4HZnXJrbJIPGgRKyCr7ZGjPESc8TvVc/Kr+vDX1SwM0OnQ==
Received: from BL0PR02CA0097.namprd02.prod.outlook.com (2603:10b6:208:51::38)
 by SN7PR12MB8436.namprd12.prod.outlook.com (2603:10b6:806:2e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 16:33:09 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::19) by BL0PR02CA0097.outlook.office365.com
 (2603:10b6:208:51::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Tue,
 18 Mar 2025 16:33:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Tue, 18 Mar 2025 16:33:07 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Mar
 2025 09:32:48 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Mar
 2025 09:32:47 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 18 Mar 2025 09:32:47 -0700
Date: Tue, 18 Mar 2025 09:32:45 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Jason Gunthorpe <jgg@nvidia.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the iommufd tree
Message-ID: <Z9mgLQlIDT596t70@Asurada-Nvidia>
References: <20250318214534.5476f9ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250318214534.5476f9ed@canb.auug.org.au>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|SN7PR12MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 53920c73-d8b3-4bfb-dc10-08dd663a90e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CrwOUA8feLlDZda5XHby90eEgHc8sz/pbe2GJWKntBVQAUKFdS+02eCihWwO?=
 =?us-ascii?Q?fdwnvrUboV5RidYNq/MgsAhe6J3jUTTEwbIpOrnAc6uP8r2jfk6zA4deHMyI?=
 =?us-ascii?Q?TXltiij8CnuIO4qDyMb7dVNJCv3WBHRE+1wiez5/326VMZpIcs/ogDS6tuET?=
 =?us-ascii?Q?hOyJpB4J7kawOW/HzGGGuqDuGc084sA5MjDt/FNvn3nkMp6pDSRJNcYEgU73?=
 =?us-ascii?Q?yfxGTV3onIpkPg2qm5B8uEpL/6ZsLg/cEzFPWL/+NbzjIILYnoX+YHgQvMtb?=
 =?us-ascii?Q?iCVCoVY19CIG55QMWIi+j7E1kbDX0YIf5kkSvd+CTgDZDT80akkqmqvupqI3?=
 =?us-ascii?Q?zD/TvRWmksqLHMnO62kqXwJdeifa9RBajOl58dZtDZZmiao4YsLJMJeQv8B7?=
 =?us-ascii?Q?+aA9CnvIe4v9wJn+uJLDHG85B3w4ICqbZj7T3DRmGsm9EwVpuI9OndUI3qND?=
 =?us-ascii?Q?VKgQ6Vn2fSvtiLWjUmI2u4mpgRX1/uZiSPiGWkxeUx689T+gl14QTVbsxNt/?=
 =?us-ascii?Q?AnxueRibr11n447p9MlRPap9DI3E+08qMT5ywpR7bmR8ntpTiv9JK04w+UNl?=
 =?us-ascii?Q?5r4tp0cDabONmvZTPM/zhpTiMDv0qjlHd+OlBh1gWlFAI//RWobmCwoSBi5A?=
 =?us-ascii?Q?7G4evly/eiHOa2KPjY3FE+zi2Mz9MGwsiQCqzX3cy4sAP+nIVPdI7jxmnJzg?=
 =?us-ascii?Q?uLON3K8YrPP19SwPzQf4XMSEzMnCAuoMgY4HTX43glpN/XTb3PmQbwNIwKp2?=
 =?us-ascii?Q?f3SmsYGeJYdoEF56itloahz19lWNCeq4e4gIsE0iZdZkxXuWuR40lulrrvDv?=
 =?us-ascii?Q?rBAGJpFBQVvbtQYiK59ik/ZrsJla+fIxuClpGuhh6lES5VFQbu+jogd6LtQY?=
 =?us-ascii?Q?y/AsVO+99TCj9DVOTNqroIlsiLCaMTrnov8UdvEbjBI8prECT4D8G8I7cd2Q?=
 =?us-ascii?Q?M4JDMHo8cIJyl7ImSpIFCKYEkVf7tFd/Gxv2gRzYJFgGsCS1FzJ6NZm/5bHl?=
 =?us-ascii?Q?+kaOBgQyxd6DtPiXWCqvrkE/COGxrdbaZBGP2VBdufs3imWqrzT42e3fiC8s?=
 =?us-ascii?Q?2xlq20pzlbdbtSrSOLKJrMa9rIYK9d/VBUN3vpNhPIEH9Tx08xvsIWp/79QQ?=
 =?us-ascii?Q?R9hCLC0XQ1/GkAoBwc0gRJBeyqVXpk1kBTnB5BIrS1nGkccVwofSx6dX61i9?=
 =?us-ascii?Q?28sE/YWEaWmjaQo1uJ8wvTY12rOTq2w39/Dw2oLX9ngQddxWhOKokgLPguK6?=
 =?us-ascii?Q?uSUnScgC0UBRXkhdQTc4Mnpyp4Z0vsZ39wir5pwmtd2avEZrzhFKtsw7Irph?=
 =?us-ascii?Q?BrGUVhDS0vr1+LUoyMFjAPEPyXFEtQAwozirmjXeMYQnJi1UOjI1uGoSIYtT?=
 =?us-ascii?Q?naStL1KuiJlon1Vc0zpXy2AIOGxSOkdqqQSxEeHZFVZNTnvw30Dkkao9GLjJ?=
 =?us-ascii?Q?Rd7x+fbOoY4i83Icla4EKp/FBCFKBcAxIKnMzwR/sVlfdtVgoHBIxafb7ZlR?=
 =?us-ascii?Q?YmuYzew7tqra6ko=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 16:33:07.9370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53920c73-d8b3-4bfb-dc10-08dd663a90e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8436

On Tue, Mar 18, 2025 at 09:45:34PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the iommufd tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> include/uapi/linux/iommufd.h:1024: warning: Enum value 'IOMMU_VEVENTQ_FLAG_LOST_EVENTS' not described in enum 'iommu_veventq_flag'
> include/uapi/linux/iommufd.h:1024: warning: Excess enum value 'IOMMU_VEVENTQ_FLAG_OVERFLOW' description in 'iommu_veventq_flag'
> include/uapi/linux/iommufd.h:1120: warning: Function parameter or struct member 'viommu_id' not described in 'iommu_veventq_alloc'
> include/uapi/linux/iommufd.h:1120: warning: Excess struct member 'viommu' description in 'iommu_veventq_alloc'
> 
> Introduced by commit
> 
>   50c842dd6cd3 ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_ALLOC")

Sent a fix:
https://lore.kernel.org/linux-iommu/20250318163022.709490-1-nicolinc@nvidia.com/

Thanks!
Nicolin

