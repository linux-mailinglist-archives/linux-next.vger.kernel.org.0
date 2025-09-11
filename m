Return-Path: <linux-next+bounces-8262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A40BCB52F1B
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 13:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8CF4189EE6E
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 11:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1974230FC3D;
	Thu, 11 Sep 2025 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cHXuIXDR"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C002DF12C;
	Thu, 11 Sep 2025 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588671; cv=fail; b=AbJmyOZaphTsHqhdZcGi7wfBNbsCy6Vrdo604zHbHNLlNAMjQjTEqE7zUAWTwMXhGEUbOnDQkCsHrdLx4dLTfcxO1Dj4hEU/tg2Z6qGMmeBeX9s/qHYo+iJoaR5Wpyi0HsohX7rn38b+xp6i21gZrAd4tYkLQGVbHX1sKJwONBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588671; c=relaxed/simple;
	bh=i0REmsCdxwmJR5KpT10++s7eAFzzAEfrQHW5Vi7MG4E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJUz/aj0qfHtOuOM6DjGTCLvIX0PBp9IMWy6cqTgwN/mQyh1TTxdUP4TLnS0k1VF1AIaSXxokjyN0sCuVis+SR77HPnX3RBUCA1sYgngy56MEaxF+UCtI6kdwuhURBYlgCjgObp5eoFQLZ4J6EvTssTKfvO+PUgFjVUNmP3bquE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cHXuIXDR; arc=fail smtp.client-ip=40.107.220.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZgq+dFNOaCU2gG8hCZCCXj3RkfSrAGhONBViIYpg/lOupudaQ0YMOJwxoSzwHHypJ3+bsuKCXSiNSx8K5334xtCTs/RD21lxB6B0QbvSc4GUqk3IPWTPZ2LdX1/giT1JT8e+rTcKCbBIs2/UjEK1LMuFwk8hZMc4oAcnQifwWKhxmZE6Q7/TV0iTwzsUqXmjH4B0gxe1873F/WURbDlO7sqPoXfkXQofa5gxh4zF//Ah+xMSpDAI2mDGoFRrEkzLJG0sYrf0HNQJLPwQ5zAHrR37CRX1UtyfGSm6vPCM+ykepNB0vpzKKbXWXodzH8NVWM1cFFYiw191xsrTrepYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zg4+azPrhjudwYMHRxeDnuZNubIZ1SZlA8A39ZB26JE=;
 b=E+QxgQFRFGVlBheGSbVvmQyReU3TBRrVkhVDMd6oinAJjoUxOqbEkjyi80y2z0IBD4m8UQMSB9Q0qRqpkD99m7NZeatxtHcSBJoIo6mbrh/s7cfNIsf73nC+sS2nPSIazmXbIGlv2ycfHAF1C9GXDs3nThqXxbPzIsbDxDJ3mrnz4Tm4rQSQQXihC7sI8LAl0K+n5Lx7DYYl47ZFRGl7KQb/KPkIXUrpW5ayNsj5qh0GB7SkscfwTqmB5+TpYrdcVx76/96Oqqa034Jo/X4phmZfRlYtI388M91vLdoNJWhK2lDL74nyAr6Fm5vdwowzCTSHQ8Tda2qMX+RkKmhJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg4+azPrhjudwYMHRxeDnuZNubIZ1SZlA8A39ZB26JE=;
 b=cHXuIXDRHQVOqgc6KK6ZgHfeQhRjThiEe1pOCaiIsxHeIQvXkXoxnL2KGcb9kk0VIbA32VXdshz/p4vApVPIHCBKbZeVAMmwXulK2sTwDMqvS3UnIKlBQBo6dLwc+YsHfcWb6P4Q8NdLDPss5MgCz1Peo5DtVULTH7zJji6QX1iUJ/ThkwEDDRdEyNQaRYp+G4J9TvleCcPJVNX5XD48aKFKOJFfVZvQ9h2ta7XrNB/5IiIGPgJb4BXcndTeOuzOWqa7Fh2E5KgBWvJBDO9dXehVe27w396YI7eIJ5L0p7vOtq0kI/IcyH/VjVCPNjoQ6LQPaBCLpicH1QuLQ0xPCw==
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by MW4PR12MB6780.namprd12.prod.outlook.com (2603:10b6:303:20e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:22 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:106:cafe::d1) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 11:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.0 via Frontend Transport; Thu, 11 Sep 2025 11:04:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 11 Sep
 2025 04:04:08 -0700
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 11 Sep
 2025 04:04:07 -0700
Date: Thu, 11 Sep 2025 14:03:03 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Jason Gunthorpe <jgg@nvidia.com>, Kalesh AP
	<kalesh-anakkur.purayil@broadcom.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Saravanan Vajravel
	<saravanan.vajravel@broadcom.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250911110303.GS341237@unreal>
References: <20250911122330.14834c0a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250911122330.14834c0a@canb.auug.org.au>
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|MW4PR12MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: a92b7261-aafd-4dab-2f45-08ddf122f5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6GJs2nDStViLaNpFElRWr3n5vreCNj+ScKFKNlkajOCN5xdResoUk7e8jySz?=
 =?us-ascii?Q?8PNINnZT/Ia4vUaUp5mH0yf0mCJ14/3mSpCx12wl9sm3YTtMtft42HIhGh7C?=
 =?us-ascii?Q?Jz6w+/MySEP8hJ5RFSuXDFA+v/VD8Rn0lmLLc2gx0RB9g60GekfYKxgmXB/i?=
 =?us-ascii?Q?fOH3RsCyMUV49yJ1rn9ZmPaxaSJslHSf5ZoMB8Pi+f+sx1Nt6870oXGtLl/V?=
 =?us-ascii?Q?MptaFR/3be7kA46yjgMWxbnHjmLPY3nAiWs3OfDSEGqIrReiIvsBXr59M75P?=
 =?us-ascii?Q?PNhwwckmpL+9KTrGB9Aj0caoTeyW8aT3v0owzrpmWyr+uJkXgqIDD8cmh67h?=
 =?us-ascii?Q?4f8HOUp4vXCOWyEfCNHE1ZYnEnzCDa4VOmmQc5Jvr5PhgFFIu6Q+yM6B3dQF?=
 =?us-ascii?Q?0yLDKX/Zg4RGXjFUsCVayOcLCQTIJK0YpvJw+J7Dh/IVawVZQmnaenB4CJYl?=
 =?us-ascii?Q?Sbc5a/nil0x+pX7CL40a8C6gnFVSOVfTdWMODnF9Gwzt1VwnslgVHRefUVhS?=
 =?us-ascii?Q?OdCGvdAt/eA/BahRRw4VtYBWlOrEqzz+M1NQj8hfLt5c4JC3a3IrOrDnRC/N?=
 =?us-ascii?Q?SEEki6Hql3CjpUO0mZp2B+teM5FSMZ3YzHa6Wz9uVb8/QkeX/j4TQ9t/I84M?=
 =?us-ascii?Q?C8eggz4T0KiM9JrCYfpGYdxo5jQ28knXXYY2gCfJnEde7MJ1ANRCQ7fsLvtB?=
 =?us-ascii?Q?YQWT0KvfeVD+oUsW8i87Aqghh9S6v4jL+ybPAX3B5MtDdDsPrUHiizWYQT5S?=
 =?us-ascii?Q?RSmWXI1jEWpq6H9I+EFZDQ5QgtUTrg54mvQCldNOki2sKl4oIG8tTwLPa308?=
 =?us-ascii?Q?sBB6O+YIVS0M9aCb4hND/MmccCX3aKJkg61S69MmjFdd4OT+CkhtD2AJ3Aae?=
 =?us-ascii?Q?wRM5z0MupBYn2m00Cmi8K6QgqwPAcKxpMbUZjZFR8hunIZvatwS982jne0+o?=
 =?us-ascii?Q?n2sNbf5psTbGd/Jyk4k3obc6zgvl2mNjTTBnNZNwdFcMeSM3SdSjZXzoGaCm?=
 =?us-ascii?Q?Ljz6ycidYKNoHeNI0UdNlFlvNIoYBpr4BFPoGLE1lRbzEMmr0D6D8OmoAa6U?=
 =?us-ascii?Q?qJQKXIBUuoaZcffPMVD3NRykRdhMnjAvx7Exs0sTzUx/ZDrgWMsx95aFxirE?=
 =?us-ascii?Q?o8H8oZ09ZjDPZp17bLwcwzppTC2Xw/1WJ0Fya+BEE6lF6ljg9u5yOYSXDM6d?=
 =?us-ascii?Q?oNqZ2j5IiCsTeAcufnDi457N1ZaAcemGKbSeQ5tFE8J8I+a5iD4mA7Q2T8yH?=
 =?us-ascii?Q?kGmjfNq57/I/ijIoqR8fAgmZ047TaMU1QaYFJWtpJkw3h3F3UpbUeIaIe5oW?=
 =?us-ascii?Q?eC9Lshk+74Zl6GzSbj2P4eZQv0NlOChwAd8J6RvwWy1tUeG8RxUkkK+g+Ao3?=
 =?us-ascii?Q?ggqlKawF7D6eis22zZ59MDSufQm3XiVVzmcpLCzHJEzssNBS/9JukqVu25TE?=
 =?us-ascii?Q?4MpEysIkd1FonV1ZkQ48qTMj2lTI/I3crU/s7xyRZSlxaqaRrHbRX70Cbcq2?=
 =?us-ascii?Q?ELxU4rExSEWLbkljqqDK2fAHmZgsVCL234+r?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:21.0915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a92b7261-aafd-4dab-2f45-08ddf122f5e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6780

On Thu, Sep 11, 2025 at 12:23:30PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got a conflict in:
> 
>   drivers/infiniband/hw/bnxt_re/main.c
> 
> between commit:
> 
>   ba60a1e8cbbd ("RDMA/bnxt_re: Fix a possible memory leak in the driver")
> 
> from Linus' tree and commits:
> 
>   bebe1a1bb1cf ("RDMA/bnxt_re: Refactor stats context memory allocation")
>   b8f4e7f1a275 ("RDMA/bnxt_re: Add support for unique GID")
> 
> from the rdma tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/infiniband/hw/bnxt_re/main.c
> index df7cf8d68e27,d8d3999d329e..000000000000
> --- a/drivers/infiniband/hw/bnxt_re/main.c
> +++ b/drivers/infiniband/hw/bnxt_re/main.c
> @@@ -2017,28 -2046,72 +2046,94 @@@ static void bnxt_re_free_nqr_mem(struc
>   	rdev->nqr = NULL;
>   }
>   
>  +/* When DEL_GID fails, driver is not freeing GID ctx memory.
>  + * To avoid the memory leak, free the memory during unload
>  + */
>  +static void bnxt_re_free_gid_ctx(struct bnxt_re_dev *rdev)
>  +{
>  +	struct bnxt_qplib_sgid_tbl *sgid_tbl = &rdev->qplib_res.sgid_tbl;
>  +	struct bnxt_re_gid_ctx *ctx, **ctx_tbl;
>  +	int i;
>  +
>  +	if (!sgid_tbl->active)
>  +		return;
>  +
>  +	ctx_tbl = sgid_tbl->ctx;
>  +	for (i = 0; i < sgid_tbl->max; i++) {
>  +		if (sgid_tbl->hw_id[i] == 0xFFFF)
>  +			continue;
>  +
>  +		ctx = ctx_tbl[i];
>  +		kfree(ctx);
>  +	}
>  +}
>  +
> + static int bnxt_re_get_stats_ctx(struct bnxt_re_dev *rdev)
> + {
> + 	struct bnxt_qplib_ctx *hctx = &rdev->qplib_ctx;
> + 	struct bnxt_qplib_res *res = &rdev->qplib_res;
> + 	int rc;
> + 
> + 	rc = bnxt_qplib_alloc_stats_ctx(res->pdev, res->cctx, &hctx->stats);
> + 	if (rc)
> + 		return rc;
> + 
> + 	rc = bnxt_re_net_stats_ctx_alloc(rdev, &hctx->stats);
> + 	if (rc)
> + 		goto free_stat_mem;
> + 
> + 	return 0;
> + free_stat_mem:
> + 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats);
> + 
> + 	return rc;
> + }
> + 
> + static int bnxt_re_get_stats3_ctx(struct bnxt_re_dev *rdev)
> + {
> + 	struct bnxt_qplib_ctx *hctx = &rdev->qplib_ctx;
> + 	struct bnxt_qplib_res *res = &rdev->qplib_res;
> + 	int rc;
> + 
> + 	if (!rdev->rcfw.roce_mirror)
> + 		return 0;
> + 
> + 	rc = bnxt_qplib_alloc_stats_ctx(res->pdev, res->cctx, &hctx->stats3);
> + 	if (rc)
> + 		return rc;
> + 
> + 	rc = bnxt_re_net_stats_ctx_alloc(rdev, &hctx->stats3);
> + 	if (rc)
> + 		goto free_stat_mem;
> + 
> + 	return 0;
> + free_stat_mem:
> + 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats3);
> + 
> + 	return rc;
> + }
> + 
> + static void bnxt_re_put_stats3_ctx(struct bnxt_re_dev *rdev)
> + {
> + 	struct bnxt_qplib_ctx *hctx = &rdev->qplib_ctx;
> + 	struct bnxt_qplib_res *res = &rdev->qplib_res;
> + 
> + 	if (!rdev->rcfw.roce_mirror)
> + 		return;
> + 
> + 	bnxt_re_net_stats_ctx_free(rdev, hctx->stats3.fw_id);
> + 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats3);
> + }
> + 
> + static void bnxt_re_put_stats_ctx(struct bnxt_re_dev *rdev)
> + {
> + 	struct bnxt_qplib_ctx *hctx = &rdev->qplib_ctx;
> + 	struct bnxt_qplib_res *res = &rdev->qplib_res;
> + 
> + 	bnxt_re_net_stats_ctx_free(rdev, hctx->stats.fw_id);
> + 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats);
> + }
> + 
>   static void bnxt_re_dev_uninit(struct bnxt_re_dev *rdev, u8 op_type)
>   {
>   	u8 type;
> @@@ -2049,10 -2122,8 +2144,9 @@@
>   	bnxt_re_net_unregister_async_event(rdev);
>   	bnxt_re_uninit_dcb_wq(rdev);
>   
> - 	if (test_and_clear_bit(BNXT_RE_FLAG_QOS_WORK_REG, &rdev->flags))
> - 		cancel_delayed_work_sync(&rdev->worker);
> + 	bnxt_re_put_stats3_ctx(rdev);
>   
>  +	bnxt_re_free_gid_ctx(rdev);
>   	if (test_and_clear_bit(BNXT_RE_FLAG_RESOURCES_INITIALIZED,
>   			       &rdev->flags))
>   		bnxt_re_cleanup_res(rdev);


Looks right, thanks.

