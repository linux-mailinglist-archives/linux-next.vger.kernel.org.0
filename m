Return-Path: <linux-next+bounces-3396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B395B00A
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 10:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656A11C22AA6
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 08:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175FB170A23;
	Thu, 22 Aug 2024 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NpPBlwdu"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB5D170A0F;
	Thu, 22 Aug 2024 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724314672; cv=fail; b=ilDscPJhNzvhFYERBasQ5RERDkGWPI4tOGJlacEpjQeIVOwzg76iOkb43z/00tT2Z0jiwOe0HgfHxCZZ72fFloCBaAQbk4/0WgdJYpnz7EjRR5nC22RYrxuE4kJQjpECtXrEYqQkGoBlMZjOW+aLXuD+6Yvx+rLynY6URm1Dnpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724314672; c=relaxed/simple;
	bh=ueOMzcvzgYRVb9RWp1jCZCmA1NYRjt9/EzPzf+sCijs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=atxHcJfAmnWbAUXlKRLr9D5vCJ/V/zeHxyUNGcBL+fGwjsNEXX8Rc/NrjmW+3DGolXbjeFdyZACVDtDRJ485eRy+LK+0Omq9GTRmn4E6GNVJHd+gZ256211tq9/sUPFg/8WWMlioMY+JN7F25LFAi/EEqFrhgpaGxyJb5lWg6T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NpPBlwdu; arc=fail smtp.client-ip=40.107.102.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHhqoraa+PfxCGGrhypovJL9d9UKUL0DuLzx3BwNU+ReBhTZW9jStt8IgiPweDap/vagQjFb0R7T5As0xDY4p9D+CotDvmfx1ptHsM2K4Eyjc1+4gQCbGSEDM87uNeVnXMJoaO3Ez+7X3gw1oNftLfmwy/5lDp+EbuvfjZphrdfFOeA4CIWBVku9SaHjejXwbtSoNfYPMgUU+j0Tz0b9Zu0Th2m4ukC8rVWwolWFK6zRABgpH1STNM5pSex1ywDiBplGy/xGhhZOxH3Kv8gZWnbPYpTK+yRoCm8VUtJZ8vgiEYKFu+qMkgu/cyHaigNe29HDDhzrBkc99fPgCEOgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1wp4l0BtztXGaD7VvJwFKhqu16AQwVwo7ikmHe3sIY=;
 b=zSpL2UoM1e4QEpXrCFSMTlzYipv2/e4QVWWDM67GIKRPxO5tRGmqk5TbUgJCcu3a7eJ5UMV61WtWSGYIgEr85Ql/ywII1acttfwlUjFRgSEXZtMXq1vp0gOp57Wm9aGWQwH/edvNdeNtgPx75Fii+MWwmYNCoWBWhzJmg6Za7Wqy6xDuKOUvcM8Eyb1AaehU1D0GMgwYXrCeV1TD3Dvph8EXFfTI4pUYH7fKCJILja3QvIPwYnaX0civERE6+UzG46H3uWjiMyVe/N21fZ+ySH6jUc0qyDDpa4XlCvsvFw6j38BEZhmjZ2Rfi8DpjVbW3BfYDpdED2MOdFFGMzANvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1wp4l0BtztXGaD7VvJwFKhqu16AQwVwo7ikmHe3sIY=;
 b=NpPBlwduDQlU7TnApIMJ56S2Qh5w7sYUHySM3SsC4ccSUnRGiDRBlHRZgITPhKTQyUfoM5ZJQ0ZpWfgLbN5Ovw2OdeRnF/4vZ0a1A90IwyoMIGJekdW78M4OUshvpQITT73jaGCzMJLuOU2ueqt1nzVFBAQU8einD94z512KxMLscqi5bXu2vGSgTmDLHqKgLaK8rNL4oBLvnleKDFeX/1G73RNbBsy6l0tyn0ijxOmLQB9XtxGlhkoPfnUCdjzVWw4H7sMEVTOhMmvrl8TXjIlQUwCtNN3yhCuUZRMMQMSo1Kis6vV1NJDDF3B0V9IHXSWNhSyQez8lPWWWp8vFbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22)
 by PH7PR12MB6694.namprd12.prod.outlook.com (2603:10b6:510:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 08:17:47 +0000
Received: from CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::9ec8:2099:689a:b41f]) by CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::9ec8:2099:689a:b41f%5]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 08:17:46 +0000
Date: Thu, 22 Aug 2024 11:17:33 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Machata <petrm@nvidia.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: linux-next: manual merge of the net-next tree with the pm tree
Message-ID: <Zsb0HXmnllt9SPWM@shredder.mtl.com>
References: <20240822110430.08a98b0d@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822110430.08a98b0d@canb.auug.org.au>
X-ClientProxiedBy: TL2P290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::17) To CY5PR12MB6179.namprd12.prod.outlook.com
 (2603:10b6:930:24::22)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6179:EE_|PH7PR12MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 320a9356-2bde-4a63-dc6c-08dcc282e77c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UjA5awPtzcQOIgUFQ7VaTL38R/dN/X3uK5r4APIr++c8RCQE0J95t0Uv9IRt?=
 =?us-ascii?Q?Fsb5OJRo7baazjG55o3KCaJ88ua4nD6p360AkEqqZDxf1BXYruW7a8mRIuha?=
 =?us-ascii?Q?WkdOevoofBrVz71fQJPRDe+qpGQQEJ2DBGcELMPeA442QfR9F5STAy7FRBp/?=
 =?us-ascii?Q?W5MFFAPFzkx1uvd0yuHB6Jmf0orVoEdJXHfUI/qHqP2K+77k3k2lrkDMKqDJ?=
 =?us-ascii?Q?UnwFyNq9ncYMpaDQKIsSOKbywmDQ/rwcZIvzt/czMujzfazO5mUCEVaNADu9?=
 =?us-ascii?Q?lyddpETkpxBW+1F0xYu2kaQc8ohb1qJGrSI3OE7tYCBrAsJsPO/VwwdIbV5n?=
 =?us-ascii?Q?gyIO7ImEWBzOykGOPabIDMKoQCMiEicsAhZSRvtPrtrePrNZFno7pR15LsrS?=
 =?us-ascii?Q?Yi3U+pROodF9FXmjCJEDBcEL3pEROFGDonkAs+9riXbFzd+bJd+Wv9g2bX8N?=
 =?us-ascii?Q?Kh7Djc8wqwDYJe1BDKLGYXcjoOYuCP6P5Mqj15C5jCZQfStTD3DvEVSu1Zas?=
 =?us-ascii?Q?Xj82msp8N2ei8oMUlqUAlsw8ZV16nHZvc7BXkXUQkmIgGJOWODf/geb4GNCQ?=
 =?us-ascii?Q?KDeUJwsIff11iD3t/KdwUWA9CEfgprOnfuRGyIR43YkbAt/z7THWw4UKXDUz?=
 =?us-ascii?Q?tDcQJciPUV0grzezqUWilPf5FAZVNsKDFMLpcIlj9zKfeut2Znou6CVGEsV5?=
 =?us-ascii?Q?M78ed8z/XgfShdBdsctzsgL7q+jcyeEjw76o/MnCCOODWfG/kXy49AHxNu0e?=
 =?us-ascii?Q?Uwy2c9NyW5HwzAcfShnR2DZsKzZhbZbRyPPnWF2TArZ/AOF1pTW+uhDu0GUE?=
 =?us-ascii?Q?5oV2WaqcPBavgFEy8oLpEDBqSJVYVeIUun0jV6u7xeU8RYPazHd/pBE54jM4?=
 =?us-ascii?Q?CmHJtHFdPsd0IWs9bMPOVXdgF4gMbUi5UVgFp+admulI1nOjOrUm78ZZX249?=
 =?us-ascii?Q?96BCGRQ8rciXac8nEqNjjMqiBHZOwe8y35vPuM53x1enqDZksIAD9WoeLHy6?=
 =?us-ascii?Q?ti5f7WqCrMppguafy7+8IvZ3ThvLQDjhkpkpJ+xX+F8zs9tml9dpU6U4dizK?=
 =?us-ascii?Q?3npmK2o8yUK+Zo7ctRqLXo/jWyOs5K90dSHNHkU3MRUP2dmNbUscB0+/DEMW?=
 =?us-ascii?Q?Dhcmx8dBnfSIaZRZ3WoqkRfulohrjoRfpvWyR07Dt9WA+SccCaPRTAZvOIIQ?=
 =?us-ascii?Q?S1Cw2kmYLeFLtzey//6hGhYo6SVbiJUg+NQSBFDiWXfXw/7w6lBqSJSrY75A?=
 =?us-ascii?Q?vVuePiYmxbHBkqiTxYQgfoWK8E4aCeXHIu7d72hGzpKCN4jMEUnvp/GMgbMb?=
 =?us-ascii?Q?qwCQawRIz2YDdbDpeXNMAUwqY1eQfoHcFx36+KWAsjbYAXVsTtN0D5ihzTgA?=
 =?us-ascii?Q?Y/yN0wQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pRR6FAZEoOwcA9xgTiTB6aMR8AuY8tGCIHr+TqJR+eaacLMWLdA0gYueOmBN?=
 =?us-ascii?Q?5AncCUf1eMQQGuawBiW6Fz1DmZyf0f65JVYof2tWcoRyRfZz9Yl64+xd4KFI?=
 =?us-ascii?Q?aS0JrtqcHs0+EO2rA8+DABrIjTvp3p9DPvFHnroQ2WTxbSnSxKI1TWwtbmGA?=
 =?us-ascii?Q?FWTyVRaYaKy5YXqzWVb62pCMSN7EmDsqfTSxIeOB2unHoWRaM3VEPnH0aBks?=
 =?us-ascii?Q?KmN+T4jCCw6sq3CC28tLxRVHj0iYb3rzT4zQXCybyR7/LIiwRGPvM3doS+y7?=
 =?us-ascii?Q?PE0Mvk1ZBm7WMEO/8zyemA3jK/Uw1N5mzdT3KP7HsUjvgQPwCXyoPlKIf8Hz?=
 =?us-ascii?Q?asnZ/t7Wrfu/3QLO2GU+uW0v/hsJQZBPGqJfJjosECQKts865tizlnFyQ3vz?=
 =?us-ascii?Q?X0Hf58SI4Klneg00Ksc4quyb7TP6t4dL+QOdpybqaSeYx6hQSpwVuodOJfBR?=
 =?us-ascii?Q?jqHLm0Kb1EqtKHAsMh2jXJlgQFsbDua0TmlS85BiNjXcN8gszBO2X/AQ8MY7?=
 =?us-ascii?Q?qflF4AzBhJ/wL+Afv6gCAlOtFJKJcA8b/yPmWYCZkWInAObXyfBDxc/f91xw?=
 =?us-ascii?Q?lokKONwVChtvhdrQ/fj8pVuTox0HYf/p/YD08l1sVMA3bBqmcfYt9J57qyga?=
 =?us-ascii?Q?Y22KUN8HS9EEZf+mKJ2Kei1odh5ZkLvZEAp/X393HZpzkm+dt4Bbx1gUZneh?=
 =?us-ascii?Q?C8QspL+5BXLUtUjopiDUilSa4rJ4ngn8uAH7l8rC1AusvqrcpGGfcaCHK+Xs?=
 =?us-ascii?Q?ngnobaKkGXDtrbw0EoGO1mLysXnJVRqQXGyCDEcN9fxvbnYgIv8nnNV3ttdp?=
 =?us-ascii?Q?6nimJSdGk4eQH/sqzjxlpUXf5qeJRHpVzCvHAt9HPniPbCYcROz02NvzruEZ?=
 =?us-ascii?Q?rwINpDeAYoLT43LVfi9cQ/+S65FCE22xzJQk21jT8We1eUrQNASj89VOY8V+?=
 =?us-ascii?Q?Lz5V+Mo2XuW5Y5VmKeN2hwiExU3mKoyfK0eNSLhJcuMn2hX0Jk67+oZTn7ge?=
 =?us-ascii?Q?mtQ1L+aA+sB4inHdagvEcYzMi3d2CddUyeOhBpIDwSc2kkvoOR+iZCnEF1sC?=
 =?us-ascii?Q?ncSK055s/JxZOQ1dD0I5JglnxRePyOXZw4PnCldU14eBtXgCAE0QgOiTLmWP?=
 =?us-ascii?Q?RGRTxNS1J8T1WxuaAgLuxq64giKg9zPf6JQ5wW1L84U2fLaFXi92e6HKIy4n?=
 =?us-ascii?Q?H2CcVCNm9tk+D0faAFHIyx3GmxI1WIF2ecIfUD7fcneIj5i35867m7T0wwTC?=
 =?us-ascii?Q?q3ebxM6OEkzonutZ+osrJZpdD5e4l+8XwN0JDYSypNqAWVi6s/JLZjsLazJx?=
 =?us-ascii?Q?tTXzQ57+frH5PqQ1A9EksftB+tOGjKJpAgjCDswmWj3rdAo/CMD0Cb4440Ti?=
 =?us-ascii?Q?QSO+RczE7qpDK75wn7Iei8eqE/ggRp9eiud07pS6mrBNF2DF3UyrCDrwB4Qu?=
 =?us-ascii?Q?HpzCvkKM/Rh9sGspbLb1uw5ad9a6FAg1bFHFwiel/QEUAoaQseANLO1Qm5+9?=
 =?us-ascii?Q?DNNUK05lBXMb0Ta020t2JD3qbsE3Nz4MSXXch3xVfhsgRGejcPNh9boDFxqA?=
 =?us-ascii?Q?fVeNFjkz+67FjYoB9GfEMVL3BmhNcfmzyH4xdzlX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320a9356-2bde-4a63-dc6c-08dcc282e77c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:17:46.6111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBwNq+hIDczgDtP5AHNnYY0hWxT45chOpeiCBiFKlAynARlIf2QTOwv0iz7rxQZ2VjXiFWbahSAC4WVMPpPrJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6694

On Thu, Aug 22, 2024 at 11:04:30AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> 
> between commit:
> 
>   019c393b17cb ("mlxsw: core_thermal: Use the .should_bind() thermal zone callback")
> 
> from the pm tree and commit:
> 
>   fb76ea1d4b12 ("mlxsw: core_thermal: Make mlxsw_thermal_module_{init, fini} symmetric")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen. Looks correct to me and also fits the one posted by
Rafael:

https://lore.kernel.org/netdev/CAJZ5v0hX+HyNB5Xqwr6Q44rgAThNLqp5PUQXN-uTC+cDqdjpqA@mail.gmail.com/

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> index 0c50a0cc316d,303d2ce4dc1e..000000000000
> --- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> @@@ -389,12 -450,8 +388,9 @@@ mlxsw_thermal_module_init(struct mlxsw_
>   			  struct mlxsw_thermal_area *area, u8 module)
>   {
>   	struct mlxsw_thermal_module *module_tz;
>  +	int i;
>   
>   	module_tz = &area->tz_module_arr[module];
> - 	/* Skip if parent is already set (case of port split). */
> - 	if (module_tz->parent)
> - 		return;
>   	module_tz->module = module;
>   	module_tz->slot_index = area->slot_index;
>   	module_tz->parent = thermal;
> @@@ -404,8 -461,8 +400,10 @@@
>   	       sizeof(thermal->trips));
>   	memcpy(module_tz->cooling_states, default_cooling_states,
>   	       sizeof(thermal->cooling_states));
>  +	for (i = 0; i < MLXSW_THERMAL_NUM_TRIPS; i++)
>  +		module_tz->trips[i].priv = &module_tz->cooling_states[i];
> + 
> + 	return mlxsw_thermal_module_tz_init(module_tz);
>   }
>   
>   static void mlxsw_thermal_module_fini(struct mlxsw_thermal_module *module_tz)

