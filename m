Return-Path: <linux-next+bounces-3013-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0586930F3D
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 10:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A9BF1C211AC
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 08:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F96184113;
	Mon, 15 Jul 2024 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZjDo29Et"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51CFC11;
	Mon, 15 Jul 2024 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721030522; cv=fail; b=QnPjqkdWBJlVm3v7kP5QRJUwotV2kxK7iNXH3UM719d8XW39yVefF+Exk3VHsXIzHYCmnSNwd9ULpKhHVXimjeSIo+Mfdq/eCDkpGXHdH20Evwix/NshY+SJGiovfDkHl11XpDLJySWfdwg9P1p522NCaqBJKMrwGhKf9t/SwQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721030522; c=relaxed/simple;
	bh=7JOyxPF6i76aNIb8uWlmYYc3TGKbQS34a4xk9WGt7TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UG5EPf1sIRhhzPbmlTyhjxpm01Lfh1zk8Hjo9nK/Y5be0pA223Lnbixawjr/gbGpXZqahPIPG4jJ1B0ABQUqenIjrxZ+3FLuDxF1vYwIizUB6kcyP6gSKgucI3GdVpQ6vGr3eMjKBvhuiaiIN++hfDOEe9T967Fhb0nYLMYqHFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZjDo29Et; arc=fail smtp.client-ip=40.107.96.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2Pc7QCig3thCf1jrLsaw18T5Zx7+x1gjtZiE0X22zBeaogdoU1tV8hme8MxHQI2tbRS+lQ5vOnjoxCfPy/psbPyqYYQR8Ny4U3CLzYIclSHvxmTp/9jY5ssOMNWRMYkUK0WBHREfZ2te4KTAoZGxTgcRaca2Hqnu2w0H5Sa30XhTQkSsAarsTqeeqXMc9WzA/6OeunSZ5G9rzKNrusmwebyFRbe5YpPJQ5qUbUklNhT6dwrQjV7invHWEge3fsEo+YNpveGjD5oGTbNS4wL1VTr2euMc6sM7CucAqS7rNd0bArypWgAZnxACYN9TNiDdmxQwlFHRDpEA5ohxwkXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQdXYF7r8+JA4xB8gxa9UC8gf+9YX8Fj0htVYzBL7KE=;
 b=ls1VbJhKsKuXwtrxXzQcvNoxfPhIf15JvDeIyke59YhbkEtD7B7RfcNH5Szxny3u8ejnIpDUL87luLeWH2KT8+csjEHKbUYcfYZ+8MsHxdNMUqOu9O9ogfOTank2QbToZ+ow97dHKmuTqm02eZwQ9Fv0gIpaYjnNmroQX1Eg15ySPG6RkP/97JCRKRg3KdyySSi2uMudk+M7qX3iaLMUh0bC8dIi+u2Ktvt1Kzini/jsScvQ+Dmc1t2DUhDQn0AWh1WRWXm1cw+kNztvaAyfw8GIhpfY7fFwqsu8gE81u9S0I/4KidXZ8a1Jy/e/ZYN1lqrZGF/Qp909hH7KzfCJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQdXYF7r8+JA4xB8gxa9UC8gf+9YX8Fj0htVYzBL7KE=;
 b=ZjDo29EtH+pafyRMnF/mOfHlX45O3G5gej+i5yquvXfSZR0U3NLQh8Exe5OLwHfqPH0UBWivw4kowVZPvO1rEhrz2pj0cClqUQSkAcGspjgD+PhEL0nBii+CvxF6AKHPHtGK22iGMJWNX1t83OC+hmzU6o/uO0YAAB5hv+wYsY8Z0eUNxa6U3aZDo2DOy2vUzc2JZVByjV86KUShnRL2ZAa8vWJVV8LSsLiBw57PCfXJBPzGGYmILog35m2F5MHyuGS+hXGf0m9VYeid3XKDKJAW3Fz2HSi4jVVBdKeclqH2MN0YF5TAouQfRcAqDxhvM6Gwlemi5CaXh8J1Wkf8kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Mon, 15 Jul
 2024 08:01:54 +0000
Received: from DS0PR12MB8815.namprd12.prod.outlook.com
 ([fe80::f6e3:bf2b:a789:50d4]) by DS0PR12MB8815.namprd12.prod.outlook.com
 ([fe80::f6e3:bf2b:a789:50d4%4]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 08:01:54 +0000
Date: Mon, 15 Jul 2024 10:01:47 +0200
From: Jiri Pirko <jiri@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vhost tree
Message-ID: <ZpTXa-E1SpFJfVBw@nanopsycho.orion>
References: <20240715171041.5d0ec5a1@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715171041.5d0ec5a1@canb.auug.org.au>
X-ClientProxiedBy: VI1PR10CA0093.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::22) To DS0PR12MB8815.namprd12.prod.outlook.com
 (2603:10b6:8:14f::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8815:EE_|PH0PR12MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a5997d-0024-4d69-a534-08dca4a46407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XbIbynBjNQ7NCoKqxZLVuiOuV8+LJ1cYDtbIaZO1aSLuLrSsCHUl+LSmA9yb?=
 =?us-ascii?Q?XqWz+tXy7Zf7ISNZ/B8zePRQduqiNJsh5Y55bxuW033H4zMaBStb4ESrv58Z?=
 =?us-ascii?Q?i55kydL+XnZpVckEQ4yNGgibflCHs+U5lU2DzgfAgB9yLHj23XiTYDkbvpHg?=
 =?us-ascii?Q?y8cMPO2HNCb9ZFSB7W2jlN6Ug+o1qnMEU9RY/KzktOIA+Th86ueWCF4Yc2LN?=
 =?us-ascii?Q?3gPhXChqwC32wKuFNLmrCwuWRKTlBFcqKqef3mDyV/4U52lwho5fpfNgYTRo?=
 =?us-ascii?Q?jTMBkt2PpsVz9jxa0ZGhENMOEyYqB8buBAgAHUgUT2aHnhs4oQXFO7AD4LFw?=
 =?us-ascii?Q?4iAYU5DdJM5aTvkEThy2gYFJ0vCq8aLLFMV3h1WOW6HikRbwtAIAACHHDSHj?=
 =?us-ascii?Q?LoGVVQToRbIcWJL2wDtxkl9sOWAMYQPvMm2qcFhDZtmTbNd4JKrAQHEmN3Fd?=
 =?us-ascii?Q?5mrl23Hmb9pR35I9IPyxv/ezCJfx4F3tZ2J/GHgjkH8c5ZOICPa5UyN6r0cT?=
 =?us-ascii?Q?R+TGKWpexplxF7yK/M1xDzLTKlq35HBLmlklM1LKdlFv7y9a7pqdDHskJusv?=
 =?us-ascii?Q?rMS+tqHEE20LfoXmPOJTJo1u228Wu2aodp/gqLCKBP7pT54KT9PJEND9gJ4k?=
 =?us-ascii?Q?WlobaIxN/c91KHxxqXU0icsbM0BqGO331o3CMqcvHEph30cePaVCO4Q4SCuJ?=
 =?us-ascii?Q?5TTfEMuJMTR2w09iRdZk988jZyQmo8NHNh3MchJICdhKM9V4JSRNbd2JwSAd?=
 =?us-ascii?Q?bU7Lr0/Ir6uJKKF2ahkbNCdbyjNTWvkyScjJuMM3cVAqIOZmi7oGQI+7B7Z5?=
 =?us-ascii?Q?szjuWWOy4A3ppsMWjkh/NpKikNB1L3/kquEphpXJvfymXv8koxh6hVtjLSti?=
 =?us-ascii?Q?V8lMUPT8pPijPZXnEjGkTC34avTstuWMH2yNqUorUkGRoG+pWdgG6tq+LkS9?=
 =?us-ascii?Q?mw8ykwxF50reB4zi9iXGBD11+PElWNkHwc5kaRLQSo8v26YWca40uJaOcatv?=
 =?us-ascii?Q?sDAz+TgLgKkaNVVjmyn11XNZR8aCe2okYg/ctnrVE2RZ2tYvSRO8wEfPD5V3?=
 =?us-ascii?Q?Ko0b3sz1gEieykquK2je2Ef7RKtXHvsCEl27XQuKQJlTBNXGRffR10sTLnDB?=
 =?us-ascii?Q?FF3dNg67PUA8IIhN3U8IKCKkhHGXQOKMJBL6BHGudzlbrJ0sH5bqNnFbJ9CT?=
 =?us-ascii?Q?umDROCpfBJ2PNT4feJi+hj3CooZrtIpbYk3t7EO0SIdWAViTm+e2itXA4e6l?=
 =?us-ascii?Q?3UhIT0gvqHcJwN+XuNFVk3MIsrExBK6Bph9l5nxM5MToIFEaV0zM51/wyXcS?=
 =?us-ascii?Q?G0U5V3f8K/Xy5ePiJ5yYte5aRU6KYI3SqTK8WQUKwyM7PQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xfX9WZRYuDsa1FoNqh63Yvf2YcUHvDDFQGi8qxP1Rr6YKAKsPQMHtayaoGSu?=
 =?us-ascii?Q?AonMwEVRZkinzwaCcUshbbNZN+bjyAK1s4771lrLiDeNExjiHvl56RAL/5Zh?=
 =?us-ascii?Q?rOGUOKR65sl4X39kjDDOThebLs7E+6tBAmp9gam1JHSg4YeAAXzMvqoJHgEx?=
 =?us-ascii?Q?6seVqIWjaDiQ4MC22QnpInDnJ5vdo/q5cDgVqRvjB7jDR2EV5DXMMfSYGACC?=
 =?us-ascii?Q?LteQ9fL7dmhzbb/A0LOy+eHxBgHhqB2JSnTW12/cgqKgoBp09f58FdECLNbi?=
 =?us-ascii?Q?8LuaINX0f1JM3zilNETobOtpByNin5srpe3ZbQedWCH6ylo9CS8uxA7gYKJJ?=
 =?us-ascii?Q?USVjkLp27gmTO6o6kR5amWG8JcYSGFXs0CGNaWSrF79f6XNoIdSctHdATg1b?=
 =?us-ascii?Q?CYa6iQptmdzqxZWiUhDU0BGyV2h7Aye32NinzUkmsuwTgCS5F3/KIdgX/6+U?=
 =?us-ascii?Q?twML1EbPBfx+8CBmdWRNVapWyXCH2CX3xUMcfmOkK6xv0MTQLFGuRaRMD+1B?=
 =?us-ascii?Q?jNc6tg1Oma4qqp70rsrocxdaU6/ibFvYocGI6W693Ob3oaglcEqnb5+Azh4m?=
 =?us-ascii?Q?TUr7Mw2w/OcU7GcuPazzkE4Ljm4Br3zEWbsEePasprLIRHBiZyjh2UwE2t5b?=
 =?us-ascii?Q?LMjtSTUlbFBgwlDXH+57Ax1Rx4q2EjjPQZUKIXTquFySVtSftP3wHRerD/n5?=
 =?us-ascii?Q?r64dEhDf7sToqg8IFjjyrKR2ZFRFyPnIAjZ8Ll5IRfN8eOwPhQA1qiS1hdwv?=
 =?us-ascii?Q?niPhskuAwV4Fl/3FRI1Qzvn98q4RfpnWU+G2+t6HrIAh90C4Kth0HJLoHDEy?=
 =?us-ascii?Q?oCOY9mpoyb+FzYdC3KLLOcEmwy9pPyZkTQ2ZJaHjK6Ia+7eqkmYw7DWIhFm7?=
 =?us-ascii?Q?pGrDhyrhj/O3JVJZy1O4goVtcOHa0kRemYorLsQzlCPGzuTexPKZSR+2TcqY?=
 =?us-ascii?Q?ibi3+EX1H8tJ5A458VltmK5Kk2Kb3cGWyJLHVHWZlUpz60jwfb9xRAZR6Rho?=
 =?us-ascii?Q?bbwD4R/UgS/DRQLAXlbTz+onHkHPXOZFo4d95BBzyMnp0EF/H398WF/zS3xV?=
 =?us-ascii?Q?9q62fi/wsLRWBj0y6RISQksIzzuPDrse/7aH0rKAX7rMIckrr+KbzkLaCfRZ?=
 =?us-ascii?Q?mcM40YFnG09TChVX1WTSkp9diaVFOHfKq/oDRY1f89r1nAMqPvmfYbMJC2XJ?=
 =?us-ascii?Q?qtZ8ewvqH1OfqHFRmFDNprW4EhhuefPPz7tLDqb94pj+9j9mpeLNiUgiqg3a?=
 =?us-ascii?Q?aPx/lBFmBs+anyTPqqKzfbSzaHICqObObajWK4c+JpM5gYv5zEnEZesrUwYV?=
 =?us-ascii?Q?Wpwqo50uYQkFgAJvTveEAvkE8KEZEpGgNYTBlP78GA5532dTYKy3xaeJ++42?=
 =?us-ascii?Q?Wr7KKLKS67mgk+LsxQn9kFeRE1RL9ioozfUIqc8oQQ/dBrfsGiNRUNDm0MJs?=
 =?us-ascii?Q?Ac0yfzLapffa8VWCC5P9+6GY9+FW0ZDE81bZO+mdzNAoEsbgrOQh4nXWyqhy?=
 =?us-ascii?Q?H7u4rXNOlH4kf5KIvUY73jOAIMJZDSHiDEBBSRokaUN/8h754uzXUTiUHAjZ?=
 =?us-ascii?Q?XupWB57ODth571x6oIs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a5997d-0024-4d69-a534-08dca4a46407
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 08:01:54.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rvz58xG2rY93My6iQiH8ejM5wnpRUsoz/UDwB5prL5Onyv3VsnpxdoM1FAPKg9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607

Mon, Jul 15, 2024 at 09:10:41AM CEST, sfr@canb.auug.org.au wrote:
>Hi all,
>
>After merging the vhost tree, today's linux-next build (htmldocs)
>produced this warning:
>
>include/linux/virtio_config.h:136: warning: Excess struct member 'create_avq' description in 'virtio_config_ops'
>include/linux/virtio_config.h:136: warning: Excess struct member 'destroy_avq' description in 'virtio_config_ops'
>
>Introduced by commit
>
>  e6bb1118f6da ("virtio: create admin queues alongside other virtqueues")

Ah, leftover, will send fix. Thx!

>
>-- 
>Cheers,
>Stephen Rothwell



