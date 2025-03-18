Return-Path: <linux-next+bounces-5856-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2EDA67235
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 12:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C5727A56CD
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 11:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F75207A0E;
	Tue, 18 Mar 2025 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bqHstbKx"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586FAEAC6;
	Tue, 18 Mar 2025 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296148; cv=fail; b=Df5IBRl6xlbxLxXbmiH+qH7jHVu3sIliEqCKK4Z1euT5L361USh8XxKc9+0F5GL4kClW5KsTNXR6CwA5KVO/glXdLHZyGKNxBNG5WS8E1R6TIq5iH4JtQ6tCh1Xz7HXHH+aHjZn3Ir/+RgCg0VEHtKuOqS6zzU6uhLJYaJQbP8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296148; c=relaxed/simple;
	bh=dZNjTnNvy44XZQsaLbBJvWNBZDThmWWb5Vf50AaGuFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bbj90djTpgE2PmIdprEq1kQNMo6GejRm5QoihTWtRulGzGuEEvEWISFzqW3EHz8b6/cq7hf77BrM2ehEsjnh2Sgr675Ca4bI1Vqr1O6cOtJNwjDsI9yHAJs0Y4CBQWwJ+fUl4PKAjs55r1wdN0/Sh6W3S9uu4thtZy4y4qaHt6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bqHstbKx; arc=fail smtp.client-ip=40.107.100.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3qd97rroddJECGr9FIMMjcGEkaXjumT0hlJ9sd7cJ7sBoFkKDsfKd677QaQXOOOKF2qMgAO1ozka2ZGvrJnaOMOdTb7Vsy1IfCcAo8GkA0yHP/w4yvroeNpBpjZqSfPvath5ZXsDLD8CcmbI119OMPU6gxKSIbs8hrjIKiXQ/uzy2J7bLRq5Khln73VJr7wXi3xERDJrkFfwZnmjXg+uuqIuNDknpVZqXOaE50hFQ6g4a79WRidMAKBeZSpxUNJVitkB2FBOZM4LzvRpy2pCosDq5hBczrPM+QTxMWENu8NamRtf3M/faw+oSxAMmqXoVuozLijXIHazUaRup4+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYFdWftdcMCX0bPCugQWuGeEJe4n4qOKg0dsby4NbBk=;
 b=RyG8w8GrMrGPkMRbI0P2YXNg/p4dtqZzPh+HFbyBQoymalOfvCGnoLWHAkRrlnwzu3+oPNeZZor8oSbjZWPWG8SGq83GFoaWPUZcIvK8stJpKQlxkcsS585S646E6pHB9VBuIjv43wjCQ58ffzSipFfdiTixprYKN4+yrPeUhUaVJSAkKimrUrz7mjx2baeAtNwwX51hwcwbHPPyK7KFHFZUY1k49iqTU527x79aCDsglgGWpWvWO4ivvLK0cM/HflEXsC4knjuiojtJpzKDLvAYk8eUVYg97J6VZs+8nAa4BKKsE7D5V2gr0eTRIBYn+5e2czkwXvsX5ciXsEq5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYFdWftdcMCX0bPCugQWuGeEJe4n4qOKg0dsby4NbBk=;
 b=bqHstbKxRjL3qwr//NxheLOD1dBu1B1LpUlVcjqjNeMl6sIDabflbNlHR89OPgSelXeKRaHMEVhzgsXHIsagVVkV+/5lohyCY4wwzhWmRDJPcRgaTwglGGTN1h0XFCxYpvkUAj/2/ueguRRiQ0m1+xM2RXxXjVZqtOv4OrD/G0oswk6VTw0lBFZ3X14DugJyBkiiIkev4brmZUP6J1R+5Vwyry1WRHqImPepx7p1pqXueclScwpLELR5WfsK/a9rPYnFN3SkLtqbIA1GzInUqnwQqwh4rWwN4kGjhFPGDO0C4EMLhlOSAZ/MhydidR9px4H/5cTSC/tCgHoMktfxPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 11:09:02 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 11:09:02 +0000
Date: Tue, 18 Mar 2025 08:09:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Shannon Nelson <shannon.nelson@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hmm tree
Message-ID: <20250318110900.GB9311@nvidia.com>
References: <20250318213906.6e81f517@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318213906.6e81f517@canb.auug.org.au>
X-ClientProxiedBy: BN0PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:408:143::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH8PR12MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 4459e202-a943-4603-d5a6-08dd660d49ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i59cMGPgRtMqT9A1shF5Z8dMFedfE8/eSbPLhOSTHR/Y9f7WjQIHXIJVyAmk?=
 =?us-ascii?Q?Z8EjMpO7N2vcCAMKG3VdrtJdCRN/eW7nz7+kJLtABlHzdrmPfP9fEC1bp/YU?=
 =?us-ascii?Q?hJSkQNUPWnMRiJkjEETMCJYFATlY/aWRKXojVlR83KtmETIPhidasQrZfG7M?=
 =?us-ascii?Q?Rs21Gy63WEp41rM2Tu+cJHt8/XLsBj9uKQePlTABzRPFNNV0fhQc+sDD7X1j?=
 =?us-ascii?Q?nQgXqJ2OumrcP+WLX1oFFk9Q/zA0dxiqHgkGHXmrcC83TmqeES6OG18YBY4U?=
 =?us-ascii?Q?0xs4+YQ5qhZdZcHf8FYqn4t6GPISWG79Ga9pjig5yEXz9sQWIlwjWi7SJRJP?=
 =?us-ascii?Q?FeM6qoLR6uTsiva0ytfclr+gRWdbPnhUQAiiUEmBQPvplb8Bgc21OVy4TyC1?=
 =?us-ascii?Q?Yd3p3XzBFyGQM+R5Ga6pelSMnnGDKxd43A7F9Wa+MPQpJx0bYqjFbXkYuLlL?=
 =?us-ascii?Q?mQUzOf0bH32E0nzlk9+UxOgJ3PHsB0UtfuCu06I4Gjp2l6dOVcnHfybd3NC/?=
 =?us-ascii?Q?0HpTF1hq827WL3c9zjSAUyz6nWoF0xOwno8kFQsjMiugKsbpwq8AkXcb7Ysh?=
 =?us-ascii?Q?YFo0VGzqk5WNjgx5oqF5WLAyUdcQWogTETLJFu5wDWspC9rwnd1TBcx4xj+8?=
 =?us-ascii?Q?nlttWmnL16FYXtFB0O1CiYFvhwBhGCbXZKCeLlDCgVXJgYjpfFhIzzM4PkCY?=
 =?us-ascii?Q?E9Se35gvPKy0aA/Z2+FB/UBHKT8MwVFdw2mdyFD8bMmDHr9ygX4FutWT4Uar?=
 =?us-ascii?Q?AZByr0egU7qPv9AMv5R5wFtBWEP+eXWvtzmcB/BLT8m/hdLjJ98VTn+aYGKj?=
 =?us-ascii?Q?18VJH7GIEZFWqA/fhfYjUkvyIivFa+zMdD/CUP29Jskfbxxkwq9jFP2gK7Vc?=
 =?us-ascii?Q?pX6q7hq2DU2v+y2znQQ+4eif9guQ0FC/TfbdEwRjniRV8biwN9xV4f2YXKDx?=
 =?us-ascii?Q?DNo+fWc5LRyrj6k/v5XlfCjHYUjhyZXaM80TkYaXYomS1bLsUOEMQQV/7017?=
 =?us-ascii?Q?q0f2daIK3azIOIO7gBiYIsxiKy90cHX2WbLBChG+7JEgZ1JRmN5+RJExGGsM?=
 =?us-ascii?Q?V2OM7dwhUT1eESk35oKp6A59NdX8COhUnQjSdO/kZhwqSAI2JsgJyivSDaCc?=
 =?us-ascii?Q?eoKsBELot4EtklKC1qut+/GfMRWiYLOWvtdJxZUNGuL0nUfnccbw+UTt4/nZ?=
 =?us-ascii?Q?AWAHtYcVlpupwCZtuCfGekIcADemD1XWpBA0cvCNRehUr889uWIbEzzIwsLo?=
 =?us-ascii?Q?zzmsD8jCHOtLsz/CrMelIc+Q0ohbaU3TrrMjIEpEw14UzsRPoQPzwHztHkmn?=
 =?us-ascii?Q?7FTwGkwotuePRrRE7lrA3qGpQ1Rigf8yWokqmMBaIPLXzeCStpSsbXUYLEIw?=
 =?us-ascii?Q?wQJhscV3AlVBpyyt/l8DA7A4sP6D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9r4BvBzj61OZ7wdz6WE2PXG/S895e2TJQcL3zJntuN8F3slmH/iJ4RcgLgPw?=
 =?us-ascii?Q?Wx1Xp1BQnQL8ET8Mumk/rjImDb6v5EE3JxCXaI3FkOKndegaYlpU5Y+ZNlHc?=
 =?us-ascii?Q?nQlniourLRVGP8JKTBLKiz4qdVn2tsd8wclATGwF0MdwmQYv+YxHp0HlXoYX?=
 =?us-ascii?Q?TTYK9kZ+KHpY8cKjQgPe7xbuEkW2f6ITG5v4HCKCPT4MK5Jd3oTynAs1QMg1?=
 =?us-ascii?Q?suZ/X6mRFp1t13XLtfr4dSgO70H8nhQVR7Z2BLnBcL8KkX19yto/3bqrYYR5?=
 =?us-ascii?Q?jkIMOQfum+NbuXbzf8I6aVMQyVNiey+FETgwgwg2B/eFzqjCFGrhH1Jd6yCl?=
 =?us-ascii?Q?sjsXqNKbfH0AOLZBNcK5ZQpEFkHLAdl8ethawLAARvp7unMFSfW3PauQgbPv?=
 =?us-ascii?Q?o5WHcrvJrktyQqTWqvUQzk4yJI9o53MrptSFEUmeAGiWZ/eAGxRQl8QRwanf?=
 =?us-ascii?Q?1hKz722CcUJDSf3Vfz4uk4WFA0GUrtCb83sX4Iokr4ldxhoCWYu/ovdiPpmp?=
 =?us-ascii?Q?AC2jznkoGJi6ukrc7pHorWv9+uJSl8vpohh71zsDyIshhoqd0LLld9X3viC0?=
 =?us-ascii?Q?vnlD6306NuvlmuXaOxNjVabRQ9IBRnnoLcjDEEaQfEBFEVVTraHAkPV8gPXZ?=
 =?us-ascii?Q?FQeBH46PXWueNIQ5bBPa0k/IFAJa7vo/8C4Em8IKOXgy8IWXQx6c+i//pBgQ?=
 =?us-ascii?Q?/pmSZlBK5W/UtUtthYOKeKDCqjx19nB4cmDlLFeNMJNgJ0La/6Kpnnhhlkfo?=
 =?us-ascii?Q?202VCvRXKOYZtBOe7eihzVjCCBcNoRckaBqnWAkke6T/4PqSkKKv/2rBtSnT?=
 =?us-ascii?Q?l+khDBcEO4WRoHCfrS/eLVeFHs4tZMksTcXBBGOFMxG/Ap0UF9Gwz6QqUJ5V?=
 =?us-ascii?Q?sx418ofxUijDIv+7juQdIUxxa2qh/qWoUw09oanPjlBQaa6AvCN76xbT647h?=
 =?us-ascii?Q?fBHHsz6HlOgkwO6ha+SKCOO01Kp8gcbEGazYU+xuYx+8sWEOCGB5FcZfs/HN?=
 =?us-ascii?Q?zIR1JCyZM3eSf0EW0UQamRNMcl7Nsb1adzFuILwbScCv0yFTnWQF4ckRLOBD?=
 =?us-ascii?Q?Tfm+IK0ndLypc1d0Xn2ieJ/tJ3smTQbf1uwGCbEbqD2QxbnYCjOWxno+qddG?=
 =?us-ascii?Q?vwtxOxAcmOx5EwYyBZ72Jxem4y2/z2kny2B2bntWvHbtuTqiiFTDUpyPEsnC?=
 =?us-ascii?Q?ayon+wXkuYt2KOAycho17SMHymzX9ijO/2HAEjSK540zQTneeMNq+S3cJMMj?=
 =?us-ascii?Q?suLtyeyc2R74hN8K7ixust1Vl9EjUFHi66rHDJZHruBiscPhO0cFeJRkCzZZ?=
 =?us-ascii?Q?3HWoNBHSCQliYJIqqnwZ379Ao/+l2SbxK9Gd4lejWoFfTX0NVIZyVWVHxWTh?=
 =?us-ascii?Q?wyN4mFRnrpswFQN24ZZpZ1B1eaWITuJdxXNIVp4qWTtxN6dnkv2zmgysZJnB?=
 =?us-ascii?Q?D+3ChJ3+pNJrYruBAX83tuoxHawaM9oZtrI8XZPGrjrs60Vo+fSjn64dCZaZ?=
 =?us-ascii?Q?GnuRsgcoQS+56ri8a5W3lVjVVViOULjUhKDK36TN3HuftC6YpsiARDv1wJFL?=
 =?us-ascii?Q?RBd0kHtou6HUGBzr2M4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4459e202-a943-4603-d5a6-08dd660d49ec
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 11:09:01.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vv4+fiGQ4CFo0eJ9xLSdp9eITRwEWRtTscr6lgpPWkn1/pblSBAmPdBQMGIX9K1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7301

On Tue, Mar 18, 2025 at 09:39:06PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hmm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> include/uapi/fwctl/pds.h:1: warning: no structured comments found
> 
> Introduced by commit
> 
>   16384467ec8f ("pds_fwctl: add Documentation entries")

Thanks Stephen,

Shannon, this is the same issue CXL had, do not include C header files
from the RST side if they do not have any kdoc comments.

Documentation/userspace-api/fwctl/fwctl.rst:.. kernel-doc:: include/uapi/fwctl/pds.h
Documentation/userspace-api/fwctl/pds_fwctl.rst:.. kernel-doc:: include/uapi/fwctl/pds.h

It looks like in this case you should probably add kdoc comments to
pds.h

Jason

