Return-Path: <linux-next+bounces-1715-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B26188AAE3
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 18:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C144344000
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 17:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057A213D2B4;
	Mon, 25 Mar 2024 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STj5q5j4"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B813D502
	for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711381340; cv=fail; b=TvG29zWCxtFnbLmTFL5KiObKmQH8vcEpB67xpw02DlJx9rrIz2/qbH6hVQLZbnkyjjFYT+4h3aRVFzpTdgPuifrPoTcM3LEzPJejMBqlszad+AGLmLXt+IVWkV2agll2qufAdKou5F//YmNc/zANcktZzfm6b3Ovf9MuIM7ebvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711381340; c=relaxed/simple;
	bh=QP/YPcOT+SYiCR2g+/ch7arRE0tTbrxuQSsnF7WMkb4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c/DWjwtB/BrTOJmYw7Ial0+nppT76slOTREDdFky20l0rdSnhCquPRmENMRDHY6psZdLMx1wiB4axgb4gB4WOqCEO3stZTkv03JL7+CuI3qp2qw+3lkvz99W64ec9ot7XP+LttjEPlF9WZ4v/rQMy+3cWRb+kEK0eu6yPyhXvd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STj5q5j4; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711381339; x=1742917339;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QP/YPcOT+SYiCR2g+/ch7arRE0tTbrxuQSsnF7WMkb4=;
  b=STj5q5j41TSSkw5Ds6G8/h9hGvPHgastFa+rZNjD0eq9e9oQOvTdKA5c
   FwsBcF+ZHabzFKQjCnZdtWYcJ6ZCja6Md9So8bkphHCLQ2099ABaPEvSE
   Z5s8GylGG5MLtPKVcLyPvq2spNbL/Lmm6kLVTWQ9f2QkAFuDSxHmmGm1E
   NLWMiVNdZj1hvI55iYDfOEMlBMS7rSnjKyOLKv0vPrdppmJqcXhdMCQ61
   zkSAMFfQf7phgRfjbaKPaeKnIFQ8VAnjoaPPuExlqC+KL4VDocUp0mBe2
   rfz+k62SxFN97I8zqP7dElDlx4Mr+V4clFTa2RIsQjtUC1rv+gMS8kBJ7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17826454"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="17826454"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="46805909"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Mar 2024 08:42:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:42:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 08:42:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 08:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYKShNgII71Hzfrgi6ny92thbrqhHQKBGE3fpLeySk8Dn/KO+u6F9g8OJUT8yRZtTJc4g8+TySf25Hlsfj3A4n0ztOxETw9Q8EOKp5d5iTvPzvoSfBse0EXBCzl1JIYIeqord1T2v99yJpU/dONktWITHlS18IWp868WtVjOL9Ph7Eyng6wSHYfUIOvYDP2iiV6VBXJH8YHAQ4FcFZ6bE3yWX+muBM+r3KVqUe2rK47A5a0Im6fQ9ZsY664UU2CpaqhnxDN+2UOCjAj7J8LygD1RwqcKyHLr/ly2zdZgPhWyfFnB49KODZBPXTX6sMIChw62ywkUGLaiCOVskBU2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3AQhYe0JjWuEcQPmX+8/uYpoh0umrRFnjs8pnUynNc=;
 b=X24tUlI6u0jLyRelQasw/ARnjpEw7AjrpZGVm4sKzACf14hDF8woMCRY1eLOTR4MrqycfiUix1mmjZ2EIMqz6Qb/ysCC/aHw0xrL/IeM+SyDy0zQ9muWXgkv4p3c0+5karP/vxrQ6MdUkCMHjnKvJjx61Nr7HSsaLthtaI6BU2BZIpbbY3SF50FcAw5ax62yQKZPxn6W9ZigyFEIqmAzvJs5F/6pCfpjLQ4g6qh7wN/qWHpuhQ7Mv1KTqfbsh/0e/sBmsuRVtYvXB6n79Cobla0bnjbtDbTSMyCreUrULlQzaconjcfST2PKoMdORBGWw8rTdyds3KDBA8Yl1s/qQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 15:42:15 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::4d4c:6d3e:4780:f643]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::4d4c:6d3e:4780:f643%5]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 15:42:15 +0000
Date: Mon, 25 Mar 2024 23:28:21 +0800
From: Feng Tang <feng.tang@intel.com>
To: "V, Narasimhan" <Narasimhan.V@amd.com>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "Aithal, Srikanth"
	<Srikanth.Aithal@amd.com>, "Petkov, Borislav" <Borislav.Petkov@amd.com>
Subject: Re: Boot failure with kernel BUG at mm/usercopy.c on next-20240325
Message-ID: <ZgGYFRuzuaawyGPm@feng-clx.sh.intel.com>
References: <DM4PR12MB5086E76CF24A39017DA8567189362@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5086E76CF24A39017DA8567189362@DM4PR12MB5086.namprd12.prod.outlook.com>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|PH8PR11MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc153b2-4761-4ddc-c5b3-08dc4ce22544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ROrA800ltkRHJg+8COAc/BjUch/ZUa3RhvEMQU3nn/jlEa+FAqcLFQCk1hKBTc3E4JPrv+BLcDxVoWfN/g1Y56qLx0cVzpTuNLoTiYJzJzGHXVzwGRwMY4Q6uYAUKluu6TRQGd+ugyT5qRSCFPrTZ1IcIsfLnDc3S9asQE43w1/azzv9vayzj5TS/miiw7eBSyMdvijd1b0CfAHQWvv21H4qmIrc9yDoyBzOEUXxmv53mydxEy/s1UN0hhGjKXr/w+7ukvzVPbzDEp1W3fibWsH2wa/a5BnRkVAacQrPlJoxFOqwuHU5672hlFLdfTpwlPlw+ZTeLe6Q0QrjcnegYaqMeiyCUF+9TeytTgislp2PC6F9/qF8NWeMQfJ7mzgc76T5XWzUE1Jvuk0ooXODrOu8BWrl2nGKXAPE97gipNjCKwxskuEGhbvPbueUprQI1JP+41dJfjiCHg6pB6s0RJ80fc7xx8b76SjPqZZQnKHiYM3tytcFHKzFkCW+/AibJu91NyUedyq/bk101VYNWir2gINlUwVaAeHFZiSbUqoEqmZVJM96iZpx3SGhTBtSIpfiOWngiwKfikjQ0yPl9k7jFxnY/2xEvAhm4jsQ4MAgxgl82JgipiX7vX4FcNrxWUz9nCtq1DLq2v8L0s1uV005pgbX2L/6e1MyymdrCMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bt/hPGsmbGNfPb0+qHZBYjPiqiSFEIhuQrvvLOTx8uOgN3OQeJ2iavdLlfDr?=
 =?us-ascii?Q?XHvJxA5EKaO93jytytHevRvYrloegZt0/EpdLqDqoofx2hyUdVgFC+K1pFc6?=
 =?us-ascii?Q?9bgj0e3+E1rORh22g/L6OYGO4wjb/3QUGDLlxwSFtTrIMEWfKAW/MIxXxKat?=
 =?us-ascii?Q?Be6c3cpODliMIAxDGPvNVrC7P7GBcBzs3NvLz1doU9yUzQ3cNhb+LPTDHjU7?=
 =?us-ascii?Q?6OG7UwgiO3VFqOZ9lC0AeTUZDcY7+k3QDetSZwB3HJoV7Y5KSi4C+DQwfpF+?=
 =?us-ascii?Q?1ZUk8+TbyR9ZtLafekD0hAZTe6IHDDQeS6GEfWar0FxDFIpta8ukshp6ac/X?=
 =?us-ascii?Q?WCdG5TPqbJCqV2uDz2eqIk237Vvmpb7/p5mGnLVg0/0Ec2aYsRRhMay6u96i?=
 =?us-ascii?Q?G+S+tml2dv6Rd32uter5qqZdDWlBQggYdf0tAeQRPpTNevkr/UePtkdQaQpv?=
 =?us-ascii?Q?KAu9QW/nfbBR++EX7q1hQ1gOgVCZzVZD+l7Kjhh+shUd39chmPwDz6ZQIEKk?=
 =?us-ascii?Q?x/qDPgAjvWW+R/SnfnvWFYX7kSmaVd66Wqv11jYW+M27eH0OuLXwfHTcWXTi?=
 =?us-ascii?Q?u5RcF0UR9eRQSfKtAVzZk5hL1DjOpeutkCm+8Qn6QXW5DRFdEXf14ccgRKu+?=
 =?us-ascii?Q?+QtgQabl9rZ5nm5h7XjGBrYcjDw3AkUIdVkb6Z4jHFOA+12qKdQIVavK0aDa?=
 =?us-ascii?Q?RrapiLaqY523FZCi1j61sDQ+4p5Nuh7CfI7b5nahVhGBBnSU4914mpiupV89?=
 =?us-ascii?Q?emnoETm7EYVH0rZcVkDKHcmv4nn0+tETmSl13ozp5xVRht35EwspdU4ElLKb?=
 =?us-ascii?Q?Bu2YhhUwICg/TN+gR/YoQ2KS6IwSvlKs9qDwSTdoEdBOdCGcj79mj3tdx+QH?=
 =?us-ascii?Q?cKkiw/797ioyKtI1cBT8TFzSW6z89qhlgyTll+j42XEhtws5G5OG58S0u+8A?=
 =?us-ascii?Q?ylysv12CfqJY2CZZByUjMNtG9uuYVWfJBT57ct09Fgr4OWUabc0QVxrGXh8r?=
 =?us-ascii?Q?x0ZMP1yG/b6Ch3SKESKxqA8rielkayx9OUuF9c780hxopm998Ai9rmFlD424?=
 =?us-ascii?Q?b/3AUPYCrfB0jT6eiaggBw7KIpHNccgJAli8kv5r3etZMuIpefD/9koHHUbW?=
 =?us-ascii?Q?DMJN5APj7iuwORQLPSBnvV6Brv1bUrxOavJQfykmt87ozwTeO2lYJSYDiUMi?=
 =?us-ascii?Q?9hHZ54hc13ZdNhUhQQoYbTuj8deBrvVEZcKTKxOcK5cJi+bFoZE5CjXd09Ru?=
 =?us-ascii?Q?HpocVOsQSHgqIu8xZMgOGExe+qslv+zRWBZPoc3mUp1xpYADbIB+iWKAvwOE?=
 =?us-ascii?Q?HfczSSOo33CLw3wLmG5PgBxyxIfumq3V1KUBkfo2MbjbXkYf0/+VclZjhvwe?=
 =?us-ascii?Q?qe/YQk5CeM/JLG+wL4oDDmcKRa2AlfX1LPqqKt5mk03jKiYzz/wfXr3vZROV?=
 =?us-ascii?Q?aE5azg3yEdzLjKu5kbEoc5CEjcmntskoo2+BSB1DxI8XHMvZccbp8jBjy5Fw?=
 =?us-ascii?Q?ZG4YJQAxvrV6ybQkjZ8GrPFL8JNLJxedtF61rwffR/z65aagjdCeLI/y8uG/?=
 =?us-ascii?Q?1jRPTxSy12gLEoysbZkUPPR+8NLJEZsInV0AF1l8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc153b2-4761-4ddc-c5b3-08dc4ce22544
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 15:42:15.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jpaz5mtakDtM14rCy4FbrX6RkgMAEMqJxjSNtm8LsZQDXbtW1SdO9IyjCGD7+dBBqKukeIMt4pAYVuBoJ5RvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
X-OriginatorOrg: intel.com

On Mon, Mar 25, 2024 at 08:40:20PM +0800, V, Narasimhan wrote:
> [AMD Official Use Only - General]
> 
> Hi,
> There is a boot failure as below.
> On bisecting, the bad commit is found to be 328c801335d5f7edf2a3c9c331ddf8978f21e2a7.
> Boots fine if we revert the above bad commit.
> 
> 
> kernel BUG at mm/usercopy.c:102!
> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 15 PID: 567 Comm: systemd-udevd Not tainted 6.9.0-rc1-next-20240325-1711333827684 #1
> Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
> RIP: 0010:usercopy_abort+0x72/0x90
>  __check_heap_object+0xd6/0x110
>  __check_object_size+0x28a/0x2f0
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  __x64_sys_sched_getaffinity+0xda/0x120
>  do_syscall_64+0x76/0x120

I met similar issue with QEMU boot test, and seems the root cause is
the 'cpumask' slub object could be copied to user space, and fail
the usercopy check. With below patch, the panic is gone in my test.

Could you give it a try?

Thanks,
Feng

---
diff --git a/lib/cpumask.c b/lib/cpumask.c
index f3f68c45caba..dcadcf7adc7c 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -62,8 +62,8 @@ static struct kmem_cache *cpumask_cache __ro_after_init;
 
 int __init cpumask_cache_init(void)
 {
-	cpumask_cache = kmem_cache_create("cpumask", cpumask_size(), sizeof(long),
-					  SLAB_HWCACHE_ALIGN, NULL);
+	cpumask_cache = kmem_cache_create_usercopy("cpumask", cpumask_size(), sizeof(long),
+					  SLAB_HWCACHE_ALIGN, 0, cpumask_size(), NULL);
 
 	return cpumask_cache ? 0 : -ENOMEM;
 }

