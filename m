Return-Path: <linux-next+bounces-8883-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD7C39882
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 09:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B70954EBC7A
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 08:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE753002B0;
	Thu,  6 Nov 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PVjXnED+"
X-Original-To: linux-next@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C0A26FDB3;
	Thu,  6 Nov 2025 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416530; cv=fail; b=q7qsglpttXcBDLwB4Nk1UOArSO0Wb3KgKb1Exj/g9VHnIcqqbq6Jt0q4rqadTanzagNb7FprQNFFwGBNV+bq+Sz4U1cRbMHncc0+qyiL+n2hzihsjDQHx4actmF7Ni4J6OT4CCuwJnvCTYZAaBf4d9s37DZZC8zquzAAXPKWKrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416530; c=relaxed/simple;
	bh=EUhHvzLtll/Uh1HlNfJH/spgA9NX6V6eJbihWKEgtUk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsMsfmjCkRhmBb93o3s+VszOLUudWJn5hjrOEAvOWIqYQBQeDoMpb6l+CERtS+YIyoQFbWiNI3/cUQRFlkBUAmmv+SacIq0SlCyT2Wf6Trlzr9S3yUwsLWqyU9DNeLWtPLkCi5OHwctMR6BhrdjVTByiz21TxNnqmdje/kkJzHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PVjXnED+; arc=fail smtp.client-ip=40.93.196.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrdxGEaIhRzx3QySJtSsSXjf62MZ6f2XV1Yjd2BI0IGE9nzzqB2zYGJGdup43426D9itSYPL9DQzh4rAYLWrjKS2YO4dteGLN5WrEvsO/JR0uxJ8+j69qUlJ4GfOZ4sKKB+MW5LPw9cwvgrQFa98fKWMRtt9sX1E+a98iCehlsvyPje6tRSAVeOY88x7QocCj3i1oPLgo934S5lcH5+0tw85RkcSYMqhxwcZAwtGvFMLILmUgSDpWSoIvLJfIvt7auy+gqHsFpeE4cuv6S5cUwQ74/wB6wtWu5iEF85FG0k25lTHgLSkeRVMOsFZ6AqOd2aX60+Ty8UY0NVFF3Ax9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wlgkw6YnVgvYze9tYyp3JnkmXMkxr21Jx9WIYMh1ZgM=;
 b=djuqUKxNvWW9Iupxd5WC+K4OQOLGZJmtXe2jDbyL+YWL3p4tDOTU1KoZkpGJX6MvBfiqF2yz4xaB+xheVZuZfCq5LxChOAZ/N/Q6LT0HJtXFOgnJ+0WOqBbwqURtxVo+7/DqCodUcAhWHxWlmsxr4NBvipg/aBUNa5+VQ4asz5RNSNUi5dsyvk2LV4TzCeZL2a3MkDv0tR4KSGJETDhFvIBL1iIvkXQqm2vZEyVCuWLeGvogs1jkElbGdeucnowXqbHym2XIplQSeUnRKoiOwt3jiFYyMPrt7f3kmcWQt8oXhLebc4sVmU7XZWXI6bJGCeGK1SousIKLcfCArVhxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wlgkw6YnVgvYze9tYyp3JnkmXMkxr21Jx9WIYMh1ZgM=;
 b=PVjXnED+nSYRzSjLmywAK3XHhIlH4iaGJ7vU2Nua5OjoSafvcFNlNFydYUYlK30SjYJfk6A1DI9YudX72gSkrbGh6eYGmTLYflIqXW61KuSZeIsNSMXO85FIioEUnKrirk+AA/W0RUTNiQ3EWZjl3n5LrddPCeEgb0//njWCdw+/MpYoyOXWAhopJjrSXEt9qflBejQJxqRQ513vBgbxbmKJxxpdHVTcj0Jr2LQQOnifhGDs8fxSv+CRKhPoSvLJW5kkNqXEyBEJIPK/Qmo0xIecNp7EIEz8wcSzRGKAGg/vdfjVWxRFbHUHJXJRT4FhOheqemhUjFBoYR0OmExPdw==
Received: from DS7PR03CA0115.namprd03.prod.outlook.com (2603:10b6:5:3b7::30)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 08:08:42 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::7e) by DS7PR03CA0115.outlook.office365.com
 (2603:10b6:5:3b7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Thu,
 6 Nov 2025 08:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 08:08:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 00:08:21 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 00:08:20 -0800
Date: Thu, 6 Nov 2025 10:07:11 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Jason Gunthorpe <jgg@nvidia.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the rdma tree
Message-ID: <20251106080711.GA15456@unreal>
References: <20251106082318.05ae9256@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251106082318.05ae9256@canb.auug.org.au>
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 315c8177-86de-4754-3685-08de1d0bb29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zk9+CvHt0zn+ncN6btkwgYhB9hfShhpS6xXgJGq7lxddK2lGv0vB0aW32Dpl?=
 =?us-ascii?Q?Xd9slwrK5ukNdFqbDe4s6v9o5RgkqpbdeZh+fJ9CGsxFcfoflhWl8F06EnAv?=
 =?us-ascii?Q?suSihj4YTOflcHeC+UM7eHenX70nmY+H3OEn42sfkWRib1k/nh/SvDEJxLtZ?=
 =?us-ascii?Q?gW2Fl0XsBPFEZapJ02c4pQkq3K1GgA73DDSnGb8TrvLkTv9CUo9nkmGOSCac?=
 =?us-ascii?Q?rhwkcwyTTlmIEukvmA3PJn9osr/BcZTrBfWh+xQ2rZtYm9EtFuNRIkBZAlA5?=
 =?us-ascii?Q?BshCdasL/QJtLFN1g5D3pYC8pj2AHtmeYQ5ic5evlIrsX2OTOGw6uQOkRVVb?=
 =?us-ascii?Q?CmK/IXr/+iMcjROqNIHgAn1MAN/498WfoMXkyx3rIqS8hMlDbDCgqruDE6dr?=
 =?us-ascii?Q?MCHZWAmx+v35E0/fcXSJcbvcaI2/xTM2Qc/D2vNgHiZITrt88GHOyOPuGHza?=
 =?us-ascii?Q?e+NQgweW7qpQkZon4L1YG4oXFm51YNyYGb6Hj2fCl8lmS2d9WCKHsXetfI+O?=
 =?us-ascii?Q?QmAFKi4J6UtVVtcnjJLoqonis5LVte5vVLwiwBnjFUDkcnw+IGGB4kpgUUYM?=
 =?us-ascii?Q?03O3752e25lHpdZ81YyuzaJ00xa6c3QDX44CXCqRmbim8vhk73yIDGveZqgR?=
 =?us-ascii?Q?TM697KbsUgxNzbU2657BA/d8G2CDt5jjZ//57PTQQzMgMjrXIjyNkPGNnZHB?=
 =?us-ascii?Q?P4YvjnU5nfSwgkHVriqOVyvWig1GZl7U4JVChgKZuoaVMAAN0AsCPHfMFy/s?=
 =?us-ascii?Q?wkF1Ba8DDLUmtP2rG8J9k769aNHE/lVO/gj58gAXDeW28sHm+Ka1j2QwM5xT?=
 =?us-ascii?Q?DAhmnDwU34AMY5DR93LV6F7Nl0CJMDRyTor8khL3eFisd0dcYq4+zQn2WGBP?=
 =?us-ascii?Q?kj3F8PSzITYknMI3X+1dXugJsoWvCJBJBjIKuyAjoFOtinAl+3XquAWkGNtd?=
 =?us-ascii?Q?L9wiGCu1RR+j6N5dBbDh4OF9KjswHO31F0ATKZOOXGyuMkqtn2uSlR380/S9?=
 =?us-ascii?Q?Lk50XYZ4xOBWLYfQHxoCkX3pWlZo8kk7Yesby6l4HvQ5jHBbKQnfNl5J9ngW?=
 =?us-ascii?Q?H1lhuDnc4rVONkxu/v0PwYm3qfmNngv+3/fQ7+jovShGOspfd/+791vDOVM8?=
 =?us-ascii?Q?xPeTBT9xEGC/OpbxH/tfnI00lKu8GGdwpLu8iqHlC+YZYnN0HwpyBNqFpZrc?=
 =?us-ascii?Q?xtKTLeOEX1/kSDOVq8UIOY9SuwFO79UQ518xJcCZ4nqp+pJya+zvrIh5L0oc?=
 =?us-ascii?Q?XnM3m4IyKYmH2UiAWBh9ln23HOaVfzwbl2PX1USdvfohUuqTnP4x/5MZx61b?=
 =?us-ascii?Q?REXYXYLF7OLBdPozfLsFa9ojFtRJ1Jf/5i5e9zbewvb1Pwcypk5UuYBh+Swz?=
 =?us-ascii?Q?qLPSLYkIAXKfdGx0qy6b15URZqj97VsJF9i96u8xmnw4f+0YoN2xnjfyLVW8?=
 =?us-ascii?Q?VWQdEhyyMI7whuBh4E2jpkmTzHYvA+MRtidD2GcdeoXWQmvG2dVNXG3dsVtk?=
 =?us-ascii?Q?eK5uxtcVtcc/X/F8Cx9E6N522c2y0PY+2jCzaJWyQyBinqQ6QuMCnryV1wDr?=
 =?us-ascii?Q?Ubpegz1Mzv2IZvfEYGY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 08:08:41.0538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 315c8177-86de-4754-3685-08de1d0bb29f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264

On Thu, Nov 06, 2025 at 08:23:18AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   b549c24d549d ("RDMA/irdma: Fix vf_id size to u16 to avoid overflow")

Dropped this commit from our -next tree.

> 
> This is commit
> 
>   320258783765 ("RDMA/irdma: Fix vf_id size to u16 to avoid overflow")
> 
> in Linus' tree.

Thanks 

> 
> -- 
> Cheers,
> Stephen Rothwell



