Return-Path: <linux-next+bounces-6705-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39072AB3F67
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 19:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B304B46565F
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 17:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71E9297129;
	Mon, 12 May 2025 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJ0XX/cR"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB96296D1C;
	Mon, 12 May 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071660; cv=fail; b=NcGFoF3QMt8w1+lomo7sCcOT+tAPttqjUOAT1X5jhEqAhIcfLZ1So+sT7uzRmX3tfbnDDqpgGhZn7EWlpLuraAY7xvGBVg8f9sRJ6cqupCKookAK6vHAZeu5Eh+mobPSpQ5wVzwFEE3jK69FUX6mHrQAVBalNoNYUO+e7hcmp7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071660; c=relaxed/simple;
	bh=4QWENxjTBd8j2OY/Eoy4tShMSpkjIM+415GrvyBWA/U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nqhn5FLclqCgphbmHM8l6+TWGVxWTJdWITEtbEN6zjZiPD4B6JHJkGDloZd/NAuBXpkj/OfIxB9MN+kC0FfYm4JexIBbWbvEZtqEE1ZM+NfeXZigeP5vku/mJBG8QKxl3WAVEoyWeapGAZoM4bCKlKZrvwX6NZ4J7/SxV/ILAnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJ0XX/cR; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747071658; x=1778607658;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4QWENxjTBd8j2OY/Eoy4tShMSpkjIM+415GrvyBWA/U=;
  b=iJ0XX/cRxvQcWkesY5RSy27CT9iKPaKaba2n4v287sVGwFCcb4s35ayQ
   VNMX0K7EAV+vcLLxU1+NKW7gLSjrLof8ykzQnw0isvo82gNYhlRovNJh1
   FCR26e8PkXZ3bOhO5IQL9GwuPj54AAa+iTwA24tzBa/NNYbum3a6f90ny
   LKa4e/rZ4wSYNiOEGQfD6aiVXvSetJ9y7WxvhWJKujj67SSrTNFpKL+da
   L+5c21nx+hUBh46+/0jMbciYgLDYsdXmGG8JzWz7m7j40zPGZAGlPppRN
   BevUM33OvQaBZNsDf+HGu8zPFQByU4edNTYVHSza+jP7Xma2D3xFjAtzJ
   Q==;
X-CSE-ConnectionGUID: yos94jk5TrW/LQ1UM+3/aA==
X-CSE-MsgGUID: WCev/X5lTuWMCbWY9ndRYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66424330"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="66424330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 10:40:57 -0700
X-CSE-ConnectionGUID: LmDqyrYHR2K+l2PeWtzSKA==
X-CSE-MsgGUID: pi4NdkzSRXmVLNaDEpOVTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="138395609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 10:40:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 10:40:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 10:40:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 10:40:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dixt4y+ttwHrvDdrsth0OJ0s0LD7TutQiFAMjPf/OmZ9frbR05WFjk5BWxb19g387Xy1XFZMaFaYT6TGY6bhslsJVjMQyABx96mub2j0IEzm2d4yYSZE/yPKP7l1DycBol6prei2PKhDpMTsemJiAuhmeArRMvyF6wc21OR/ZodYCudJmvLk1zjHXqJ4moBeQV9/aqJC8W2yoeE29U5Fu8BZsH5MlcffXEYA1GB2RdJfKnlnGjzS9TAjgbs3YtxYP/np7Uba+Lvc/iys1qv0Hiddpaznrrbsv5e2aHqNQQNmqm+ztXetFDMEqjdLnDBGhdVZp28b2R42y29BT7w+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8clwcO6Dv/7gizmOQGR3u6fmeuuqD1PAoGmdf03fWZc=;
 b=NDqQiT3C8RtHVEGE500zQU/6EQM0RmANbZ8EpZgw0tIiksORBPfMXGZj32uR9XitTJrbWZH8fRQsQxPWDeUUFbtU3rQqkqC0+d7jBnyEly3XmM2VAo027HfcYX2LOMtPeyWXe4/z10Vrg1c4cDT0NMADH3wu3b8L+FtRUx98r6fnZp8FV73Isqgkvzx5F3R7jPO28H/nLo8ymuhW4WiTEETBTrJt1Gv7rBZ3maT5brB7O+c+TMu1SbzNjGz355knCW3Fp8FKOhxHiYbHOk3OoO7i4hHWWoqBFkiNuO2aEv7Cm7Di1iOxozmtZtMUR0ENQFMzfseZKgczq1MKsRiBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11)
 by IA0PR11MB7881.namprd11.prod.outlook.com (2603:10b6:208:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Mon, 12 May
 2025 17:40:51 +0000
Received: from MN0PR11MB6277.namprd11.prod.outlook.com
 ([fe80::9c5a:4ff2:f1f0:95e4]) by MN0PR11MB6277.namprd11.prod.outlook.com
 ([fe80::9c5a:4ff2:f1f0:95e4%7]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 17:40:51 +0000
Message-ID: <36988bb6-af90-4f1a-94ce-353fb5cba2ca@intel.com>
Date: Mon, 12 May 2025 12:40:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the devsec-tsm tree
To: Greg KH <greg@kroah.com>, Dan Williams <dan.j.williams@intel.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
	<sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
	<steven.price@arm.com>, <lukas@wunner.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
	<linux@weissschuh.net>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <20250508181032.58fc7e5b@canb.auug.org.au>
 <681d4e5584d46_1229d6294d6@dwillia2-xfh.jf.intel.com.notmuch>
 <2025050909-muscular-lanky-48ac@gregkh>
Content-Language: en-US
From: "Xing, Cedric" <cedric.xing@intel.com>
In-Reply-To: <2025050909-muscular-lanky-48ac@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To MN0PR11MB6277.namprd11.prod.outlook.com
 (2603:10b6:208:3c3::11)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6277:EE_|IA0PR11MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6fcdc7-1900-48fd-6463-08dd917c2375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clVtM0EzSWVhWi9yUTVBbGZwMFltVERjS2xDeUQybEtzd2UvaEcvNnhzQjc4?=
 =?utf-8?B?NjMvOVFOZi9SVHpvenlUMVRzUXRxaWd3Qm5yaklSVHRTMjFqTEhkeVhOL0V2?=
 =?utf-8?B?ZEZyeUNZQ0dGUUpvL3lNYlc0L25Uc21YeUpSR2Fjb21KNmUvYnJQSkFiUlQz?=
 =?utf-8?B?QmVvL1lBRVl5bzEvbS9XaXNoMVdTRzc2TEIzQkQ0ZEhPeXVjYmdNdnFHcWdZ?=
 =?utf-8?B?WWxzdGZnSTBlS1g3cUV5N0FoaUtNVjh5QlI4RVpQUEJLYm5FVms1bjVhcU1u?=
 =?utf-8?B?SnVCZHlGa1BCeG9rSkR1VWVzbGpBZ2pPOTFJakpBT1pGK2ZtSWxGSzh5UGlJ?=
 =?utf-8?B?SkFHZjZiOTdEekVMUzZ5Nks2WW1WaHZxdWlaNHhEYW9HcGJEVU96d3hFeSsx?=
 =?utf-8?B?djRpTGw2QmUxT09HMjVrZzZHSlkxK2dqOVl2dWpHV2hNVGpidVN0SU95MEhv?=
 =?utf-8?B?L2NsUmdnbVVmeEVrQUVoOVRxNldVS3Nxd04zNHpOTWNRTjRhQUNiQUVSYVV5?=
 =?utf-8?B?Qzk2d0J2b2owQVg5NzFHaGIxWE5Ib3RyWVBqZmtUd0IwdllSdUtkNE1LWW9V?=
 =?utf-8?B?V0JlY1AvdDlVWEkzN2tYRCsrQnRzbTN5TDhqVW5CTTFGQm5jdFR2UUVxTkFR?=
 =?utf-8?B?WUZwaUFMVk1KblA5VkNlL3g3L3RqY3pHRWU0Z1RSRk9VcXhNT004SW5GeVNo?=
 =?utf-8?B?RXR6bnZueVV6K3B3T3duWGxVNFpqWWs4NlN5eUNMaUM2d1BjNkxySWcvSC84?=
 =?utf-8?B?L0I5Z3FXWW5FM0Y3SnFPWVBmT0EvWFZ2djV0cEUzcXMvQUdRYWF4YlQ2Y2gx?=
 =?utf-8?B?cm5iQnpBRkp6RmNTanNaTXk4RWVJV2N1MDNUQXp3OGtjNldvRmUvdjczSFhH?=
 =?utf-8?B?dVdHQWR4Vkc2bTRVZ0lzOWdlSFl6NWo2T3hrUEhwZHBieEM3eWp2UzNUUWpK?=
 =?utf-8?B?NWZ1NGRLYkNvOHl2UytOdVh4TTdCdU5FZ1JYZ1dNUUpGeTd1TnV1UXpEZTVz?=
 =?utf-8?B?b0pDL3JJN2c4QkhRK09MTysyVkxaNnBWbTcrYmdtOGo2WHNYTjNhLzQxU0pL?=
 =?utf-8?B?L05YdmEwbStxaTNCSnJ6eWhFZ0s1K2lMdVRLZlRwQUhianRacy9idzZqSlkv?=
 =?utf-8?B?WmI0bUdrRDVTajlLeUgzYjJXdmlKcDdrbnlMd05ZZ21pVXBBcXZhVVRGM1Nh?=
 =?utf-8?B?eXFrYU10eW4vMkt3SmMvMUM3emZlVHNVK1dYODIrbk4wNmJ3N1NmYWpvbG9p?=
 =?utf-8?B?cE1vMmtmN2Q0RVdHcW9VcGJSN29BN3BVd0VHNFY5N050MnRpajF2RXFKZ2JL?=
 =?utf-8?B?ampkL0RnWFdoWklHSG5hTUlNc0VUM3VSUmdPczYrQ1VMNjAvSFhMaUNPZWow?=
 =?utf-8?B?QnNTR280a3M3c09uTFppZWFaNXRYTzdMU3dSRDJqT3UzSm53THRkREloMnBJ?=
 =?utf-8?B?UldmcEc4RGNkNUc4VUNIdHVMTldOeEV2SExXVi9yUldSQjIrdXVuQ20wbEFS?=
 =?utf-8?B?SnBZRmx3N1ZwLzlCYnhOMERueC91bFk2VFpzMTVodzI5Q09WQWRoMENzVVhQ?=
 =?utf-8?B?NGhwWC9VT3lpekMvNGFndzgrZGFqT29mbTFra1dqbkR0eW4wVlU3RFpkand4?=
 =?utf-8?B?amlYSmh0RHVnVFN4RE8vZk9nWDhyNEZqYWwxVUZ4ZFpTN1dyYzdNYkNIYUVQ?=
 =?utf-8?B?N05Ud1RyOWRsQ056bHljeEJyWkhLWmhXV1BpdGhzV0hwMkVEWEdFK2hvTi9X?=
 =?utf-8?B?dDQxbzVOVU5ObUVTam14M3RXdEp2Unp4TlV6MzZielg3dDRBUWhJZDVubXpF?=
 =?utf-8?B?SktNbkE1azlQQlFSYmRWaEJWaUVkTmZycll4T1RRaFpOU1Z3WFNLczcvcVFl?=
 =?utf-8?B?d3VUYi8ydGs4L1crcmxZZDdmb0l6ZFNVdndGeHlvNlRtNkJlV2FQemovL0Yw?=
 =?utf-8?Q?2GmYOMEl+Bk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6277.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk1aY1h3M2ttYTFRUFVvQ2N1RXh0aUZqeUI1SlZBY25HRlE5WENBanUwVGhj?=
 =?utf-8?B?Y0VRQ3FsU1JYMkpjb055bEVYWmZhL0FkTHhwY3JkYkE5OVoxYWNhS2V6ZVRj?=
 =?utf-8?B?MlNuZGU5bGdod0E1b2JXNFlLaDN3VW9UZVpKYmZiZDU1Vm51YnQ5R2I0RWlo?=
 =?utf-8?B?a2VrUUNQS0lCK2g1WkZEWnRlVkNRYTFuVGFmM0lNMVhNMGk2Y21BQVNsNHRz?=
 =?utf-8?B?d0IwRTFIWCtGSEtLYlBYMHNtOVBKMkhyWW5RMWhYOUNwTFJLZHM1a21xUWUr?=
 =?utf-8?B?ODJHeXpVWUkvTVlXc3hKdncyK2FIUStkUXUxYnZRMkdRMEhvR3VmYXZZVnNK?=
 =?utf-8?B?aHVNVmZrQUJsT0lld0ZVbUFZZGI1U1dGK09wbXFIUHkyalRvT0Vlc1g0WEov?=
 =?utf-8?B?RlVpc0MvOWhLdFgrM0ovUFlYaDRMOXM0ZHV0eUliRWpMVmw1bERhb1k4QkV5?=
 =?utf-8?B?dGZESy9sK0h5ajRLcWJmUlIwdHlKUnd5SlJmK1pRdVdQNXBzT3dZdTFKK3JY?=
 =?utf-8?B?Szh4UEpraVMzc1dBek5pSHRZTkxTUTBVNnl0dklRMmRFc09uU2htZHVnSWxs?=
 =?utf-8?B?TXA2Ulpud2piVGlrVkVkaUt6dHlyY3NabSt6RnlCSEZ3WDZlYVhPRTFRUzlH?=
 =?utf-8?B?eGVSbGdFL0g5bHlWcC8xQU1tZ3E0Sng3ajhBRXE0TFJ0akM2KzAwcE9ObURN?=
 =?utf-8?B?MFlmQ01mL0g2a2NvM2JDMUxHUHNDd1FId3pleTJPSHhuZWtRSWNycnVKWnJH?=
 =?utf-8?B?azFlL2srMXRvbkFKTGtoTzU2N2dqNHdpTmZFK0VLdEFhWEJaekZ0ellrTVlL?=
 =?utf-8?B?b1NLdzZ2UHVzcklPTi9TSEIyazhpakxuNVVVWE9IbkJPYndQQlFCeWNVZHJL?=
 =?utf-8?B?WkNJQ0xxNXg5dk8rS1ZzbjhFcmcvQTRONUFsMTNPSmZ5dG83dmMwelNiTnlP?=
 =?utf-8?B?cWxCSkg3ci8vbGZRTktaZDlkK3dZSHI2YThTaW5tbXhCZlZTMyt5anZHSkhk?=
 =?utf-8?B?QWNlUENsUGUrQkN2U2dZU0pOaWFPK25NSU54ZkZIN3c4b0NmbHkzRmpqV3oz?=
 =?utf-8?B?TWd0d2ZJNlpjR2ZJeVBndkxKWkk3NWJhUlBkeU5yZFVES284a3dsYm5rc2tW?=
 =?utf-8?B?R0ZIQW5Ea3NHbCtxYStHd1pHNkd1dFRaQ01yUG0zMHBIVm1KeXljcGZBdHI3?=
 =?utf-8?B?SGFpbVdJRW1oMkhzcmpNeTZURXF5TGY4QjBvT3Y2OXpOZ2lvWWdGOWc5Q09N?=
 =?utf-8?B?cENqSkEzVHBwNndhMmpOa05XVE00WE56WXBvRWdvMmxEYzh0TEtWM2VIRG9X?=
 =?utf-8?B?ZElUUndrVmhuWkRJT3dKTHdCam02Zk9wcVdXYVBTYkpHTGZPN3Fsdng3QUZD?=
 =?utf-8?B?cG9yMG1VZ2pRMnpCb0ZHcEpBUE41ZGZSVFBBMzZaWStRLzdQdCtLN0cvYVgw?=
 =?utf-8?B?ajBZdW5mRlA5eDk1YzJJTlJZV2ttZUtSQjVzVUkxK2d5NzhHMzY3R212ZWNG?=
 =?utf-8?B?dnhHaVg5VXozbFBOMW9hV1M2Q2YwRDVYQk5VaCtibTFNN2ZhR0l1UXZtR3FY?=
 =?utf-8?B?YmJpcysyWmo5OUFXZkI1Qk56QTV1T0doRHpEWEFUVDZhRW9IWTBtWnRKcTl0?=
 =?utf-8?B?Y2RMV3QwWkFhL2ZEVjBEZGt5clpBTFBnaDM2Z2JheEhYdjcyRzgyaFhWVDR2?=
 =?utf-8?B?OElHdk5XeUdWOFM4UW5xcDgzeU90bC9uVDNYR2JFYUJDTUQvNXNhL0xxWEV5?=
 =?utf-8?B?WkY2TXBxRnhJeU1sSHcvQ3A5eWRSVFZQSDFsTlhtVkJCL3dBdHpBaVRrTG1L?=
 =?utf-8?B?NC9XcEk5KzVCcDl2K1owUzNjMFFiZDM4WFhTYnRzV2pLRTBicUpuRlhwUnlm?=
 =?utf-8?B?RCtjZmlzcUE5akdET3FzTHlCZExxeW93VWtpaGJXWWpRWlZFQW9VdHBQTk5L?=
 =?utf-8?B?cDZVZHpCVlowZzZJTEU3Mm9QaVlvUnd0Y0pBVHZuVngrYWlHVzFnOEFJd0I5?=
 =?utf-8?B?Ymc2OEVOWkZETHlQaTVBaHY1Q04wbkdOT2JHRkNwVm05RDdwOVZ2ZHdXbTAr?=
 =?utf-8?B?K3d6YlJkMDlnWHJNVFhNdnZjNnJjQXBhMHVKWExxMG5VU3cyNEJmOVRiVDZF?=
 =?utf-8?Q?kZ54X/a3zqnEQ5hfln3ouiFUA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6fcdc7-1900-48fd-6463-08dd917c2375
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6277.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:40:51.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XYZT+zyj3fjv4esocCTjs7A859tyWjY08NxKihjnbvCVmLYvzA4Rn4hEilJQd/4ejmNqjHrTpMiq/5SNgRqqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7881
X-OriginatorOrg: intel.com

On 5/9/2025 2:12 AM, Greg KH wrote:
[...]
> But what are these binary files for?  I looked in the documentation and
> found this entry:
> 	/sys/devices/virtual/misc/tdx_guest/measurements/rtmr[0123]:sha384
> is that these binary files?
> 
All files (including rtmr[0123]:sha384) under 
/sys/devices/virtual/misc/tdx_guest/measurements/ are TDX measurement 
registers, one file (sysfs binary attribute) per each register.

> Why is sysfs being used to expose binary "registers" and not done
> through the ioctl api instead?
Sysfs is preferred over ioctl for exposing TD measurement registers for 
several reasons:

- Global Register Values: The register values are global and not tied to 
specific file descriptors of the tdx_guest device.
- Intuitive Operations: The operations supported by these registers can 
be intuitively mapped to file read/write operations.
- Ease of Access: Sysfs attributes allow easy enumeration and access 
from all programming languages, including shell commands and scripts. 
This ease of access is beneficial for application debugging, enabling, 
and platform diagnosis/maintenance, as these measurements are relevant 
to all SW running inside the same TD.

> That's an internal kernel-computed
> structure, not coming from the hardware, or am I mistaken?
> 
These are measurement registers of the current TD on Intel platforms. 
They are read together via the TDG.MR.REPORT TDCALL then broken down 
into individual register values. They are NOT computed by the kernel but 
come directly from the TDX ISA.


