Return-Path: <linux-next+bounces-6721-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7BAB4AAA
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 06:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF1C11B40002
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 04:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41BD1E0083;
	Tue, 13 May 2025 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CY+4Y6ew"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D3E545;
	Tue, 13 May 2025 04:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747112183; cv=fail; b=F4rpPYEIAoy8MFYjnU5UvezgxuzhdBimcHOPoP6NiRQJCPg2OpLPdQd89hFzg+CiNCr/19Lw3VsiL8y/9FNPOHL9P5OYxh1qOragSDa4eyCOjVawZqgvFD/v17nxl5WBcN/4mESRmtzpXqseRjIhTeqZKNYvf3X01CHdyUwdnv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747112183; c=relaxed/simple;
	bh=s2u1c4GpV1nnFN3hvvpeVIeFlTs5sjI36S+rPRIkDM8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tNAAo+DfSIMQfUtKgX20mQMEK6G9DjSOJTI9Z3bFg3G4UpjzFCQELRS5FYsSra90teCxhAfM+78LFdSltsK2Wj3FamDir/MBUZbQTCmy1Y4EfSjJJ0NhfxxcHjo10E3TBYFXQ1qaBWSgGqm4XRy62krAkfXMTv5OZB1WjNeZO+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CY+4Y6ew; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747112182; x=1778648182;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=s2u1c4GpV1nnFN3hvvpeVIeFlTs5sjI36S+rPRIkDM8=;
  b=CY+4Y6ewgackPCEX6ACH6ObXcuBnZGiclm0zS3e8rBKp7cKgAk1zoAT5
   UqVUg/QDAHxw12MNkILqXvEM6V5xi2D1cW6HiKJpR6010Yg4OKxV1yquP
   nDi9D9Mqc2MWB02wbQhgicO8OBynN2bSI5/2XbiUclob97nn3Fet+DTLO
   drRcUKUk3nPtc0HCokkEoBVbAv/OFBshYYfHku55SVevg6WjgrJ3gibWQ
   XiYyZ2Xw8qLVXV6rNOXau0cRlryXshuiTM0Vgaq/apS5VplOBHXmYurPF
   PTx+OX48INltV2fv1725Dezlkhibj7CYBt18EWO0AQtrEONfnIKT/6Eqg
   A==;
X-CSE-ConnectionGUID: mTUBDl3wRI+8BS1uP9VtMg==
X-CSE-MsgGUID: W3obUTsgT5Cs5N/npdaSUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74336975"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="74336975"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 21:56:20 -0700
X-CSE-ConnectionGUID: O6V4CB1xTgmZbcJMQADYvA==
X-CSE-MsgGUID: o30P6NYRRG+iLpuu2PN2RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137500641"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 21:56:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 21:56:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 21:56:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 21:56:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogaal5Bqd4Pvi7AffC5MW+LQX33KJSM19dlyU4MrYVSgSo6I4EFBzxOOtx2jxlSTjcD5OpD6aQy6MBx3UWGijrI9HTvVpmQY8tE3dFVYOGSxcK7DwTIeJ7bcc5P3gtr/LwkPcKjDW2ROhR+mnioo+37kF3j6JTiULYZ6BYFlG1mdlG+sKWhNgZGm1LNEYj2+5SIbPS0+D+WtYJMAagDBQcyMi1UDmm8PB3/x9dOFo/ybX8Ozl0U888ajeURGVOWcpbhoY4IiXoOvhElb2SyBTc/1uP0+FZbKAWCgGoR7+4NkmkVE0x6J9SPvlYonXXzYuZZPqJklQFMwDGOODQJPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IEzIQbZAGTJFUu58bzYvexLUGhYYp/eMDrs6ybaWcc=;
 b=vfco9EsZJZ3WazCZ7pdWU54EJZUzidtY4UEx4Pm14MbjYY8GLsjdfxyh0GjyFVx6U2lX9+KkUsh7MEIg7kVkqtt4jlKGzhs1PsimMB+Jk0qllfuEwvK2+Pns1j3n52X637fOIjQbjgrGI8VfPT+L78jMi6k0yc3Z28tjnsIu0YuUUHAzidIDQtOROH1ipli8ElW4X94TY1md5TPrJLosHQhsBg7/m8sQNc3VaG2o2/zOA8oTJYNmmEW8mEIwG5+HLqeyLcf7epNd+qa71fO7RHsSo0B+sNOGSymMB/0frkCqNUM90jK6mYB4aiwgSbTzJxFu+94o7O68IkFIBkxi0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 13 May
 2025 04:56:13 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 04:56:13 +0000
Date: Mon, 12 May 2025 21:56:10 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Dan Williams
	<dan.j.williams@intel.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
	<sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
	<steven.price@arm.com>, <lukas@wunner.de>, Greg KH <greg@kroah.com>, "Cedric
 Xing" <cedric.xing@intel.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devsec-tsm tree
Message-ID: <6822d0ea6db40_290329426@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250508181032.58fc7e5b@canb.auug.org.au>
 <681d4e5584d46_1229d6294d6@dwillia2-xfh.jf.intel.com.notmuch>
 <6e5559f3-29b3-45d0-b475-cc021b90b1c2@t-8ch.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e5559f3-29b3-45d0-b475-cc021b90b1c2@t-8ch.de>
X-ClientProxiedBy: BYAPR02CA0031.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::44) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f8e8fd-201a-4981-6317-08dd91da7c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?66JBvNaKZiyeFg0uLoFC+cA2ct084P4LJG0hjhUJNCX+qwmnJErg90F5J8?=
 =?iso-8859-1?Q?MCJN+3rcBY/GBEwBkdyU5s52zNIuygMXn/cUuRbMc7WteREX5xkgTIJte2?=
 =?iso-8859-1?Q?UWJn5hW0lHBe3Dh0YuBXFjtQbqmup+BluKG2wPmocRU4oVsEHjH8DvZFi1?=
 =?iso-8859-1?Q?WIpyCgQUtNBAEFVk23sJ120uAM3zBP0aTdwgKOjOSUtjv+WclGvJPl+epi?=
 =?iso-8859-1?Q?J1ZEBy9OK87vxz2BpGkPcEoGhW/BJKskZNI8dmXN9hxmhaHlobVM3A9iBI?=
 =?iso-8859-1?Q?y8MKQDcZ+x195U1bbVM9AAPsHMzalR37o+PcTgN35TzVWP5kD/aLrtV7Ut?=
 =?iso-8859-1?Q?zSQn4J/aAB167my2IOpYzh64v96EQdN0pQDMcrulyDIo5lRi77WFUtQA83?=
 =?iso-8859-1?Q?9O9Kglh+GdrSbzc/EboLRHkVYI9ogekPQuB+gos3HR1ICjG8UmmBfqgr5D?=
 =?iso-8859-1?Q?huRpQ1Uu/lHv++AwTO8QMZ2eWTv6lBr6l2erAsJMqd6yRTOYWd7vv22uZ3?=
 =?iso-8859-1?Q?miSkCzptIfggS9/TrtYYGfbQsTF/xJAwT1T60G40A1yt/KK0lDVzgvHaM4?=
 =?iso-8859-1?Q?99BS1cRU/3bJRyJUh1BG7XyM9RYRwgJ/vCStrT+z92mcaoGWtJGM0G5LK8?=
 =?iso-8859-1?Q?/mLC/OCmBH0D/zS/zw23jMkRZLMfaKEn6g/uLgLADD9y5EzyyBILyvlQ9C?=
 =?iso-8859-1?Q?lDRSLL+W8oisLy90r8oLOiP6vno71zRuRMoHcEUbrd1QmY3PAgB6FtxeJJ?=
 =?iso-8859-1?Q?HwBdn5C6Icm7c6wJ1UA+7lyvxvNST5DI97HyQLZsEcLvegq5qp40AFb0t7?=
 =?iso-8859-1?Q?4SCFpVM2Yn+6piewDlGYzln7a7Bl6TY2hNUOjLpKQI691deTQWu8ot6wlz?=
 =?iso-8859-1?Q?zWP8THrdTHb5IQ3F5QKLG2kYZHFVyuzM5AR+rCDtJ8CadMb0aTeTogkjO3?=
 =?iso-8859-1?Q?0zRup67+BJK3WnwcMkuijNQILTf5SkOsT9ZkXprQS5siqdIQbKJa+ywCfT?=
 =?iso-8859-1?Q?XEMCm27SzaeYwnh8Q88ONmmclhkeHflp2XCgEDXC55/iNYt8Tw6JCDsOBU?=
 =?iso-8859-1?Q?4/VocvwcCXrzOapl+Fln+FC6Reci9SjUp+3+DNyl++LorP2ZNJ+d0sWt4Y?=
 =?iso-8859-1?Q?H7L3uNQ5+ivqBGaNspp8ovK467FUTHdqkDQbDVcaOM498buqW39NBo4QFz?=
 =?iso-8859-1?Q?WnFNoYzNoM4LpLesYmUuKF8sYodwKszkkNctYdUyIwJM08y2s5MBSZ/f7J?=
 =?iso-8859-1?Q?nHsLV6YOW4jXkhhTvxi1KoROQJRs+2jU1y4yzTC0mKtC1KaztXV+/CDyHp?=
 =?iso-8859-1?Q?dVczSWbYEtooYnZkIUCNovpYIvgBjlVq+35lvXfDw/zK/7BVbYoIIQB5K5?=
 =?iso-8859-1?Q?xN/HeE6vOGJC3Xne51by2J0pgAZalG8trZWaXu+OESTtEHav55S1c+35ea?=
 =?iso-8859-1?Q?ZDt2ff1NdDwGfTNU3g+JsxJiKOdBDm5b7HWY9592dA1nl63ykkCm09HROW?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1vPqzjc3sDHKttX7ezg1ixKlAypbPDGywQ9T1MeVjLfjpioHIpRTB/5f3S?=
 =?iso-8859-1?Q?YniuEicut7rYXtQr+CpyY50QBhkgqCCb14PGZCrcOLskfibFogScg1JfjO?=
 =?iso-8859-1?Q?QWWA6tNXXGbkKy8VsWcKQ4D+HrilVWsG8Rr2LnbYfahxpQIHb6b/kyuaec?=
 =?iso-8859-1?Q?DxkJRxFeFfGCeDL0bcFVjUZ4PNcuifHIBj3BxPAYuM6jjhcIfhvjOzSoIb?=
 =?iso-8859-1?Q?RzU4t3Q+Mv3QiiGuA6C9QzxSU5LJSYPlve+j3XNc3SuBqVsbhCmX3D4vRp?=
 =?iso-8859-1?Q?L3HdhR/frEg6OavYP5s1/L4tmrZeavDwQb+dgnp++2kGvA/Asmtyxj6SIF?=
 =?iso-8859-1?Q?hbOI39tMzd08VBrCx8t3aX076aujNy0d449NzlFvlzYXdnu2rHBtg4AhF/?=
 =?iso-8859-1?Q?pihiKqQfxSWhtrwAniov01iViHeTB4htB55bhSOKwEApZvuPgSBvVb4KMi?=
 =?iso-8859-1?Q?P6aUevqFWJY4e8VUYdp1sdrBDNEgF1W8VnOuEK3OjArq1Y1Ws79yXC3NhG?=
 =?iso-8859-1?Q?T2CwCDgTU/oPtKWQkyusngGVgTcRARwjXuGChPkJ41BT6fRfc510AoaWX9?=
 =?iso-8859-1?Q?PyHfTyVFkeJB5TU9vypzNFaQqG8kyYqpAZ1rLelnc/Cu+T44lPA9YfRaqO?=
 =?iso-8859-1?Q?TcJ9ewqZp7V+NceUlZpCTbhhrjOZNZ1zkTFEr2sOFab4F0TPTYWuV6w4dz?=
 =?iso-8859-1?Q?UKDoB0Vg6bAEvidPLYKeecztBFico5qBXTIdYQUqrxk2Lo+eVhduwLtk1g?=
 =?iso-8859-1?Q?wVjJK5eeCoNkuMqOW4cMAY5yV6Yx/bvU7RaoHae7ULtsT13Fz73agIEXFf?=
 =?iso-8859-1?Q?4VftSyll9tJIkvO+cdkjloGB8naW3sWYn7/uBqq3L/0hewzD5R96XsQFGT?=
 =?iso-8859-1?Q?LKUtpwNv84GD8nSFK+U2QwwlV0uFrFf5TbouBFzON5IuxEMiRfwoI4D4JQ?=
 =?iso-8859-1?Q?crTpgK7yZYC3mQchqwUzocuKx95MY0SSkRyJvndlX6mn0KYo7tOEO6a3yV?=
 =?iso-8859-1?Q?ymR5YDMOit3iQJg1palOUjUFPm/Fqol5czmzcLXjcWhtp7EvkkZEnwsx9z?=
 =?iso-8859-1?Q?jB55CsybcCmCCOsgRrkQH4RPwdSGSZ83wBJOuRIVHzNoG/hcfs9yd6vwHe?=
 =?iso-8859-1?Q?BBlxYsThbGj3mygGXsZvU5AGzu4DOWokLyCGh/WOfFEi/AUq3dQHUq4HG0?=
 =?iso-8859-1?Q?UDvgyxLy+lCODf4lKMtHHFuwQI7XEOWKdza60RxbFsT8u8QTr9hnAibYRK?=
 =?iso-8859-1?Q?r9H70XZ/c2UBWfdUEZ6jz7d2NCM2VbkMSJYMaapjNvzwPLwcaqvnocqzfF?=
 =?iso-8859-1?Q?zY7J6amEBe7TdiltK8lOgPgiz5z6BXoKCnZr6G3CokfzzOZ7i39CuF+uE7?=
 =?iso-8859-1?Q?WIvfmQ/jsbMfKIAKXfzdUC6YoBgOeLfw1jvj6oXrW9NmNQyiQ3fnvIhX1L?=
 =?iso-8859-1?Q?L4K+qtfhJOFV8AMM8Tp7zxx0fvGiuyyoZLllEoJY+CELIrj6+5jYZwAlpT?=
 =?iso-8859-1?Q?XI19qlN5FEN2KQWu4iceaZ+oWV/wwK4Zb7ncG615ly5mZvmoQVDj0v9duU?=
 =?iso-8859-1?Q?IrqtAHTEnRK5B+R0ixHn3KGFEJAvvlvi/2u8eFav3pGI5b9Hef47PI5aGi?=
 =?iso-8859-1?Q?MM41zNQJ3+B/3SgV2S6ojP4ibCASsIxtLLAoMcK55fHy4QtmRvCQSStg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f8e8fd-201a-4981-6317-08dd91da7c5c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 04:56:13.3084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWhU04REWSRFqaAS6L+APq+b0Lf74kWAlrAoRMNUxLHzA2UALoS6GOfEP5qEGW3hRdNpoNK02ufojA+qFSy++8N4i/AUrnB5FS6+qTLPuV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5191
X-OriginatorOrg: intel.com

Thomas Weißschuh wrote:
> Hi Dan,
> 
> On 2025-05-08 17:37:41-0700, Dan Williams wrote:
> > Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the devsec-tsm tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/virt/coco/guest/tsm-mr.c: In function 'tsm_mr_create_attribute_group':
> > > drivers/virt/coco/guest/tsm-mr.c:228:29: error: assignment to 'const struct bin_attribute * const*' from incompatible pointer type 'struct bin_attribute **' [-Wincompatible-pointer-types]
> > >   228 |         ctx->agrp.bin_attrs = no_free_ptr(bas);
> > >       |                             ^
> > > 
> > > Caused by commit
> > > 
> > >   29b07a7b8f41 ("tsm-mr: Add TVM Measurement Register support")
> > > 
> > > interacting with commit
> > > 
> > >   9bec944506fa ("sysfs: constify attribute_group::bin_attrs")
> > > 
> > > from the driver-core tree.
> > > 
> > > I have applied the following merge resolution for today (there must be
> > > a better solution).
> > 
> > Indeed.
> > 
> > So it looks like while there are plenty of dynamic binary attribute
> > creation users (see sysfs_bin_attr_init() callers). There are zero that
> > attempt to assign dynamically allocated attributes to be registered by a
> > static @groups.
> >
> > The @groups publishing model is preferable because the lifetime rules
> > are all handled by the driver core at device add/del time.
> > 
> > So, while there is still casting involved, I think a better solution is
> > to make the allocation const and then cast for init ala incremental
> > patch below. Cedric, if this looks ok to you I'll send out another
> > partial-reroll to get this fixed up so the build breakage stays out of
> > bisection runs.
> 
> Take a look at nvmem_populate_sysfs_cells() in drivers/nvmem/core.c.
> It uses an intermediary non-const pointer for the initialization and
> works without any casts.
> 
> Could you then also use .bin_attrs_new?
> .read_new and .write_new are already used.

Looks good, @Cedric, can you send an incremental cleanup to remove the
casts on top of commit:

7c3f259dfe03 virt: tdx-guest: Transition to scoped_cond_guard for mutex operations

...from tsm.git#next?

