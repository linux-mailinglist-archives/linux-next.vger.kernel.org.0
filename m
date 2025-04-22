Return-Path: <linux-next+bounces-6332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112DA97318
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 18:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF8311899E07
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 16:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983002900A6;
	Tue, 22 Apr 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IYrN20I1"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E862918FB
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 16:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340745; cv=fail; b=J85GpaRWDZF8zua+96oHiKmvTmOwTpEwpx4wFaow4uBS/Gqggcq61nZ2yl9RGMF8sjIkbS0yvxzaPsclRhZ7qrJ/nhbq7u3JJvOF4tGNmQOYZKUyGOxlg/MgEk8G2hUtVHryFQ2x9qc5FR9Y8jK6yPlmN9KJE51lruXudQ4ErJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340745; c=relaxed/simple;
	bh=YxpBjL9u2sK7GrNRSOUAwaYMgtjVonqMjrUiti5Q9mw=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CBnRUOR5MUEybDznWdPp2WwX+OXXzICDkrtQFZs+nMib3bpU//9BLRDvT5o914dsX9MaFVq1yMQm2PD+tXQsd3mcrGbHkNjpW0E5D0uRY7mHFtrexnC4Fob4fAhutW/f5PuJqNQVDEazWX0ncagBE43JCv4Qdxf+a0if8EtTMHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IYrN20I1; arc=fail smtp.client-ip=40.107.223.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaL1mEUm7WPKyIciy18ka2JQNUmqVxI6iz4ToV1ubII+h7Bdfm5S/y0x+06SFh6AiJX0Z3EFprjF6U4SvMPOjwkkWUnLQIBRVLsCDCSftUnYJA87dqAFQrBh6He0/l06Tz6IimbHtVx2mLLUAvseXhAp2yEPVV9H/gUB8RSqW8AYJi1DmLY3PUFyW0XIq+Dt2AoZPU/YdOM4HOXROobkPcv3n8SfTGs2UBKMr/74GdKGn3rDK8dyyeK/bq92OO9uxcdXtSSq7gxakRkxHY4LgJ2k1SrspGarekUhmQw23YyHnUK4KnzhrVdGCK/Zo0cV+VMnBQ2P4pGSDlWBMfpI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxpBjL9u2sK7GrNRSOUAwaYMgtjVonqMjrUiti5Q9mw=;
 b=qClGnM1HwcO2zoDGOOqfglINPDQGSUgl0Y9AmS+fR5KgXY7fA8KrwNosRrla7YgOUdKwA271741jblA7X2s96FzHSdWo+XvyMdPiooRIaoV53MeOTvLk6FRbz1H0iqBjtHuUNJppeX0vCvAphTfB8vY4sMF98TwUIhEhvsq00xmQM9r72s1/+Nzl+4f48eMvRi6iDIGttGj+ZpO9RnXsN5PNIV8TCor2Hf6iyd7dwD/8184JgT9x3V19/DZGuUXFs2VUnYdbx4zIcOf8ZJIzFTOzJCVYgOP0ahuzoEcmcq1/srCDu4nu5YTaBAlf6xFyM9XNMQTPHeyBWWRtAQNceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxpBjL9u2sK7GrNRSOUAwaYMgtjVonqMjrUiti5Q9mw=;
 b=IYrN20I132GH7PmIapq/co1qWztDMkfAZNmbWLys6sV+j7YPSDrcvl9hz/Wc0jXEJ8RrSNfZZRBANt5LFInDM1sjjWGQSrBcpKQAcSmC44H05TzFi0yq7UGhb/5pLfDfng9FPOaaOhPOQRfDFWmCXJeo4842hHkwccxbYyTR4uAHWJPVKuWutlc1BfKSmj3ClDdVbOcD2tlVlIxwzxCLNgogfunZjP+U1NGUQGbsqPOAfIZdySa47ryDjtoXyTgE7bDGg4BTlG7nmRVtI9ulXDxoJjIFQxSw/nO449UjCLbt6qSkGb4tLQeYqioRd1anRkqOorLOuRUtOpX/I6CJ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 16:52:20 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8632.030; Tue, 22 Apr 2025
 16:52:20 +0000
Date: Tue, 22 Apr 2025 13:52:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Dave Jiang <dave.jiang@intel.com>
Subject: Please add fwctl to linux-next
Message-ID: <20250422165219.GA1645809@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BN0PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:408:142::35) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: b637285f-5fea-428a-383b-08dd81be0c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e8yu+hzdzJILfPjvHVmaoarheaC8JSJh5O67NtrHLm/utzGiwJ4EJO/2T4aZ?=
 =?us-ascii?Q?/CV9hsGtL+5ZxvbE6Kn3+x5Ge706zwVgLqzm3ZmQIwja34/EfuVdL6BcxYa7?=
 =?us-ascii?Q?85+TK2c4SL0+yG/b0hlQ5Wl96f7s/X4SAiVd8PnhDrq07BmBm83aO55WGMB8?=
 =?us-ascii?Q?6lxpliRoB/mmYc6K0sX/Dl2eXu/9ZZEuFcp8lsBwH94mx4YZSwmbD/1G6NQK?=
 =?us-ascii?Q?OX2m91wTJPkMUlNR7/hWUXE7UfRsh+ZRtA/QrlHluP0wVetn+sKfBbVBcCrd?=
 =?us-ascii?Q?LTCkjQu0mgQYPCxY52KqtPAnLXkAnqXvHfKhkBhNvYLecJQwsfYTKiN+l7lM?=
 =?us-ascii?Q?CKxghEQ+yykYu/fnEat9tVcGNfoYaivM5VT56ZQ+OlDNYKoHvtW6k7Xic79J?=
 =?us-ascii?Q?Viq6RIbYy72kaie6518oTpWrnZ6EJ2e1dR8KMpSEe0Icmz9T6w+m4dLrS4+i?=
 =?us-ascii?Q?IdQ9h6ZIfD3HoAy2gWw3jKrfE84LxRwsPgJrnWmJjJ6OlveVN4vCsS4NbcEK?=
 =?us-ascii?Q?cvPvC8SKixBHC0JH53LV3gIkAAGg4OxTZtrmTCvFhn1Ik/pWguvAs0icx6J/?=
 =?us-ascii?Q?IqTU27Qe3fU3DI8JJldWH7uU9NIksd6mD+/kuFLF+SDM+cDJTuP/dMHYfiCC?=
 =?us-ascii?Q?eWhFiqHwKZrkx7PePnPsr6NtKwgRGs814NCDojRV72x3WLYDNRMA4VRzGrv9?=
 =?us-ascii?Q?kGm74/dNtp1l/nE7rUkrLDM5KJAyF4UwGK8gwbl3VHPnXw/c9Lkym6dPWqDz?=
 =?us-ascii?Q?mppWmJAou6JPJAAKoDbfsmeQZR9Fzto9GWMJbZaW65wfeKLRB3J+FOiz6v9P?=
 =?us-ascii?Q?5gt8LfhXPsR4eMPlFv858zWrLgwRI3A3OvIG2kweCPphwq0aCrfZD/hxSqUr?=
 =?us-ascii?Q?qsMoNnS5BuSv+qxov/IfD2hcSIPt2CorP9I3ok0s/Vqn/QYZZq7man+e0JlE?=
 =?us-ascii?Q?B1/hq7oMWTWyjdK+pgsk/JoS8Rk9iH85sCsTYuP1ZJRj+zcY2YJqiiRup8bE?=
 =?us-ascii?Q?3EAMnlOkeuubPi5l8i6pcBzxRk/IfqLwbDOwW/yZGqY7kmRWG/AvOva5zq/Y?=
 =?us-ascii?Q?ft4OlBXSKJhm4/pfCGBIT55ypFrf8XYBpxoeyiaTAHcHkidAegi00pFwIZLf?=
 =?us-ascii?Q?hpMEO4I6X9CrOaGjZg1/wrR+sfFD4unto8vGERBpXMEFiFmT39Gvl504YH5U?=
 =?us-ascii?Q?IOOviCYLJsrUSzptj3TlTqXZSjJ1TDnXyHbzu1wZyHRyJWFxd1XV0ObHF85b?=
 =?us-ascii?Q?FmU+xTxRp/h7x9j7O6JfjEOl3GPHDxCp2fMgVIE56o06Uih46xDP8V8VQtFs?=
 =?us-ascii?Q?eIpudNs4lWS3N0+8LP521g4WuwiXBKu4bhatqYypfPzv8IMT7cFB3fUVunyh?=
 =?us-ascii?Q?tUZ58KB9BUXEe6svxZOtlBb3RecFY9Eq2CMGlhm54Cc5v2Be8/c5x+pNCC3K?=
 =?us-ascii?Q?qDp/8+Bo+eQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+UOI7pRf5EKZAKHOeXm1PftO5rmv4BpSWFBJVrfHTj7OfxfkO+4enZAcZ7ux?=
 =?us-ascii?Q?r97drctWnvAVIY/E8pkwv9DKDgdmeiPumNbJhfT+7HTviikn/ZTjyTG3XTuW?=
 =?us-ascii?Q?SBJLCUQKXZqhMTBrrXmuLpBcS1+CmZfpMpvGJLhISfGckk+wpQMLwh+BSsIV?=
 =?us-ascii?Q?Cvl5Lr82ozTokquADIy3+Iy8bqkq+haODOn260k99sd5Rf8Ff5oX1Hj5oFiY?=
 =?us-ascii?Q?YX57ehGYTptxMGT5+6xQ/IjiwHKq9HzDTPhWiPlUFeXbcNR+iqboNWBTMYKK?=
 =?us-ascii?Q?CuhmS5SVXxHZ1vTrhnxuCtNTegV/55JZkJ6RV002+CePxYHnjT8oqoJIaOAA?=
 =?us-ascii?Q?1196IIXf6I0rdpO1ekMO60J6yrrfvTXP1rVQgALk9u0X2E/61CP7Cls27VQr?=
 =?us-ascii?Q?c1ObHWcalbnhAUr2oGt2kxUvRM7ssB2VLy2rVqMg1kLTfRcIPolib5jGUJkX?=
 =?us-ascii?Q?9qSx/hosFzekxflHx3JG28nVn3dWQ//T/6S8/Fpk2HAEvkPCFPg/+AvcYK7g?=
 =?us-ascii?Q?KLwQokHidgXkAHlxyArvtA1XBzG2xyL6UeakC0tk33dTKWEsYpzLxZLqA0JJ?=
 =?us-ascii?Q?ABxZ9v7kgvC2xlvIPCo/8pg3x86j5M3bAI07lB/5bDbzjlUSZAdcZO8JslNB?=
 =?us-ascii?Q?veMW7GUhq7biOl/bnZpUlYgh6MqKu/yOdbnqyzqZbt6UWJL39bgRUesu3Rhl?=
 =?us-ascii?Q?dOOItdhwrbAfMJdz9qYPRwTf1pWH9ivKgny7VcZRCBQhlwgqyM+4cgj1pQbU?=
 =?us-ascii?Q?WB8Wjb6qcR4gpY8ahO98GRf33J9RGQ05gnipxmxvspxr5OEI0enWkViCbx18?=
 =?us-ascii?Q?7xWwFn11JfhNZeLyxmZGg4xVFjhJYdF8234eBH+0MFsZiuBO4b3BuW0Nj1UB?=
 =?us-ascii?Q?LPrxptX7awgyxBhkFuq2InPeW3yCNVu2LlzH3XGQDUWk8L9UyzOlnZikerdt?=
 =?us-ascii?Q?pQ1J3vEn9Vm0XPVhbhL9GbhFfCowINntcxOhZDt2gtzr82CI0b0YfnqRNCjk?=
 =?us-ascii?Q?CbROg6CMogx2axXmwRBRLcs7fSFEX5bwtrLIAaDzbcvPFUKsg7Fn02Ke2W6o?=
 =?us-ascii?Q?D3ssc+ltm1OkTfuI42VD3/mgEkoHkn8gQ3mHSXFD9dJXx9EBWCugsXHtZQWs?=
 =?us-ascii?Q?7hse4Ryywnctyd/ESr5DvU2SzF+M4IAXxty7KQTWgiQ6lDuhYefxnJ/CmIdp?=
 =?us-ascii?Q?gRgcMAQQBXSmLO2/16L/tjIS0G0EnsBt6/TilH3VlZSfv/HGYmYXJT9rm13K?=
 =?us-ascii?Q?KKZnqPKDiDcT5i6N+CpXmVi5PiYe7Pz1ZIq4/BXvjYr50ApCHKLX0Et3DBCp?=
 =?us-ascii?Q?QBvkGXFT1N5NTvBbFp3Gydt2kgNryZnGW//NBOQ63Ue5kQ6i6bYUgpjEZZdw?=
 =?us-ascii?Q?vzF7a0lZxXYiU4Ue7nwrooDTE5BI9lCSk7pmcjHFeOpsW8V5ubRnjjyEfI9e?=
 =?us-ascii?Q?jF4OBqs4bXEqgLfs8jqbPROJGlJunNYvIqsWdudLyFFinwW0CQPwDxXQLPXK?=
 =?us-ascii?Q?CJvGYPMvvplLGi4TVdWSqK0/zT+wUeHDhDKGGU1ngQNANN4BOhZ4R/NDjqJ0?=
 =?us-ascii?Q?Fx6D0+A1nN9iMjFh/hbEMuTVmNC/byLArCE/eJk4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b637285f-5fea-428a-383b-08dd81be0c30
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:52:20.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4CdQgymsp3HdK2tPAFZgLAFZIfx8a5ywg3zkm5DWfYJMqmCp+x/KWcBK9gZXGKU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622

Hi Stephen,

We now have an official tree for fwctl, can you add it to linux-next
please?

https://git.kernel.org/pub/scm/linux/kernel/git/fwctl/fwctl.git/

Branches for-rc and for-next

Thanks,
Jason

