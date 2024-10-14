Return-Path: <linux-next+bounces-4253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E699BF30
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 06:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AB50B21567
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 04:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388E94503C;
	Mon, 14 Oct 2024 04:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/jjr2RH"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A5231CB1
	for <linux-next@vger.kernel.org>; Mon, 14 Oct 2024 04:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728880735; cv=fail; b=m56Eck6RsE0npN4/KFmPA0AgY6dgRalC7gO0cBVZ6Xr1dxDnEj/WxRJVDDTVRO3y5go6JK379dRK17eWEgEqsX0m2nKnLkvAyz168a2mA+OhrDllwscAdCgiDmRDDFOqvlvr9ZLfc3MMQ0z7v5bDrG8j1JwZ0i+MxwrnBUim82A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728880735; c=relaxed/simple;
	bh=q0uerqbMFYmIHLHCl5wMKmMisI8rbrUY51ZZ2bXSuxs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LgYGd57Xws0Ejh/8ZA3JbfnO8pT+XOocS2dfqq97kT0mddm2Y7fICtgH5V2moDCLXILGucFDLgIX8f8glSZZYYPt6vxHYRRxq3TpMFwoGQDVeDtUYgTRPh4PlAQnodN9C8SXkWHcIVtHcSqeqUd5f0UAJooDbIIFyzyDdiUWcw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/jjr2RH; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728880733; x=1760416733;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=q0uerqbMFYmIHLHCl5wMKmMisI8rbrUY51ZZ2bXSuxs=;
  b=f/jjr2RH/NZudhA8RkPeVL8c+YSTuxMb4TXVbVgeh9Nw92VAUF0PiRLe
   6wpZsY27yGABiDH0NB819nCZGsFSdXGM2SDC3NIcDTZXaefGA6ULt81bS
   1QQx9BfrI6IZx+ot5yl1UkjsSLWRm2QUnXNzgD8LjMh79oza7G6H+jJBz
   KtRXpcjdqTDuc5MStUjQ5c/H0tLnc0g+4EysBxJ35rSeM1tVVG+nKaRDA
   wboP8FonizserB/vW+ZhzT4h9qgYIhIWv045GYpV/eWfgG/3cacZRv9zd
   vPNhREJ9rIz9/lKlqqs9waoxqW3yFwf7UGm8pu19zTOt6rP1CuKvzVMU1
   A==;
X-CSE-ConnectionGUID: 0kY/jSguTkmZticjiIuKug==
X-CSE-MsgGUID: SICqvyNCQvy9V2mu+pV/xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28308644"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28308644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 21:38:52 -0700
X-CSE-ConnectionGUID: r966mTXHQ9SFoeoHFVdgOA==
X-CSE-MsgGUID: smgz25TWSMuok2uU6NmWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="114916151"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Oct 2024 21:38:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 13 Oct 2024 21:38:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 13 Oct 2024 21:38:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 13 Oct 2024 21:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCvyryEcxMOrNN51LYlHfp47e7/RdMrfgLEfdaQwgpTISLCQgi8BXFJ30pWOaLHoCc+J/O3azdYECrq+2uxHxhRALOGAwGnaV6aKV3DhTA4alqjMwQUI1/l/VUKzd7dKPlDPGb9fnISh0uGoGpZzKd6JBeFuieZdwm1S8j9RvlKxfmipqSze+vPdsmWRTBCFXiiLFWuL8JbKoJKQCP3TKiS7m5rIKTptjjy6NNsxQxlIkiqvY27BtXc53TouBoRhkXCpzZL2DzwnM0LGJiq0E+LaEtjcz5MKtyNMOJ0hjAbd5uljkLfaDPKzxofA7fiHJrWLYQawVbIpeON1oS3uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HeZIjQXOTARL26Zwg1tyCsd/HJmHdvlZmq2ZvPnTHg=;
 b=vVfe1VUnOG1jDRNYmVJYaPDfJPdHwxdQPIQPPuU+ONj+8/pvT8cCQpVaAHXQAEo9RHM63G51Rc8WQ58noIe+lW7jv/nwTAZzX9603C4NEPjNi1eBnZhctLJ0AnQpSVLbjow1OdvXDq0GUn8jhQDnoQERZJUk3gDnt13lAABnFKyR7gkP+aEDb8ujr2Gc+lCJfZ2vwUfKLtPO1J4X2jhSgu7pp8Bln2uHRu6J5mQdbNI/jyjGuADta/e7eOfr316aOHLxoA/kYfFd10l4E6folnruOlqDnCSEAtUcFSi1PnI0s3gZ13zK/U+FB7Q2L1XQFfuxLpMbPK/NoRJj97zJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 14 Oct
 2024 04:38:49 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 04:38:49 +0000
Date: Mon, 14 Oct 2024 12:38:39 +0800
From: Feng Tang <feng.tang@intel.com>
To: "V, Narasimhan" <Narasimhan.V@amd.com>, Vlastimil Babka <vbabka@suse.cz>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, Borislav Petkov <bp@alien8.de>
Subject: Re: WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655
 krealloc_noprof+0x2c7/0x300 with next-20241003
Message-ID: <ZwygTwPVaKs5qzGN@feng-clx.sh.intel.com>
References: <DM4PR12MB50866964E5363920F072737589722@DM4PR12MB5086.namprd12.prod.outlook.com>
 <Zv/An5StQOBS7Ais@feng-clx.sh.intel.com>
 <DM4PR12MB50868A0BEFA31FCFB1FA440C897D2@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR12MB50868A0BEFA31FCFB1FA440C897D2@DM4PR12MB5086.namprd12.prod.outlook.com>
X-ClientProxiedBy: KL1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:820:c::20) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fdcb67-8f9f-40e2-3e99-08dcec0a1919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rpJlLkZ7otMKNUGP3hE/cnYF2xH+EhDLECheeA9yig2bf+VFPpWv6T+08kaD?=
 =?us-ascii?Q?c7GnquHus9iIztBBVOAcfz9FIjWpl+eqX6G9f4qbdB/yskPTGt5vML7LmkTr?=
 =?us-ascii?Q?kqRsUfgca04WKCHRQGGuBiZZyA+V2ENC1aT7+RG4oxUkfDqEf+xBJXyukNZG?=
 =?us-ascii?Q?L7ARxMW+4P8iiPXrYu9O2d9fe8P4a884mJAVjAP3sU9V2CGu6q3DZbMG1UmR?=
 =?us-ascii?Q?8ONvi6JclqH39s9dIrU4+q3NL3LXwttwlN9+se696Xl13qIw43bOA3Lk+VfC?=
 =?us-ascii?Q?Fk9l+2hquVzt41xccp1rauQqe0+If7MpVUTUQ3Fw18NGnC0eil2i8R6Bsdne?=
 =?us-ascii?Q?N/QvjM6Yo8BGFsdfWpic6ObrLwzycVW1bEeeNVbEF/HXjMVDh4hFhb81ypb+?=
 =?us-ascii?Q?jLlry48LYBTi7I3UL6VjvK57T9Qpnz/WtSiHDLWOXoR6BBtelChQ5zhUIlGc?=
 =?us-ascii?Q?QDPPoL3HKhJ7NUQrEzG561kJsaI34/50iwsAK4AB/ve69WSgOcpKbP1kHWQN?=
 =?us-ascii?Q?gy7AN0CsrCQB06taNxP5j31tJs/G8LMWcSe/kfTxYDbGCh0KguG4OUfLkpQi?=
 =?us-ascii?Q?o6dhwasPgSdvA1Yz/ajxLbf1oSG70QA0u7JlZmZWpw/RebYnKjDEl6Kf/PCq?=
 =?us-ascii?Q?FHb9fFND6XZ/H2lwMWAUfnPFvsnElg9X5OtXM6Ltgh6ZVe+rqScaytN5XJAl?=
 =?us-ascii?Q?zVNUeuyRARI97628gCdFjwUEoUq8uqpiWv0TdiBQWNnEBgMZQc5MIivGL45Q?=
 =?us-ascii?Q?xBdD8KQO7i8ntgiaeEzVrOY7dZtJfPIzN+REPIkE0g02IQ0tsRFUrtQEKHaa?=
 =?us-ascii?Q?iyIf038G1KZA1l+B/0YLwPREqk+/dYH5UDuwubngcy73WC288OWMYMHsTbku?=
 =?us-ascii?Q?PnQ2gx1XSwvTEB9o+jZL+ouyi84yFvGMIKD0PGTqNB63IfzELYwFzkXbHygN?=
 =?us-ascii?Q?UyQpKYNoGBHLO4kNzpopmcLdDb1oru8AOmq0BbfdQJqQOY4lgOhybYNFciMX?=
 =?us-ascii?Q?U0AZUTQhIH3IG0i/fHZetW0IEWlCqrXUUT+2nWSMsAv2aaw8/oYjrR5oHhjF?=
 =?us-ascii?Q?TWUP7sVbtH0sqjSsNy754mk8ePkegACdbwzkv2HQz7oDHob2ad1YJifPK4wB?=
 =?us-ascii?Q?4DUC6QhMBp7/3FKaQHRYFnkMBFjOGTlpAVo17133tE26z73X8ctg27u5roy5?=
 =?us-ascii?Q?+aRy/2zPoWK+PW26UvLhWLU0fd8hNTeRP7nY0Nc3BT2g2HskgQcFAxp++2Oi?=
 =?us-ascii?Q?beCEUROIEBkSAfYO6rgHM3L+COh70WWFgPiwYaCK+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOHJOn+U+Y+tKfKas0uYRt29m2Z4u0u3px70BdY0boDokN4DRIABIu+j8BiX?=
 =?us-ascii?Q?Rr7OGJi+bmzfId2tjLXrYJt6NlbTT5Dd+RPeef15Q5goOermga9b2gYGfBEW?=
 =?us-ascii?Q?bWIjX0le6lU5GUtmQIXAFzhGNpdTOagh7C7ZMSTehw9lrGjdCECVzCt94E4x?=
 =?us-ascii?Q?J7sFk6/udiQX4AkdZV3+LvySrCcT7ZMA7ATIORwXZkqzI2quO7G1iztEnysg?=
 =?us-ascii?Q?3UGmK1Hmp4nijTRBJ4cldYYEseppT58a1Ou/+j/Meun4tfrpbhA0tp9Zpzdr?=
 =?us-ascii?Q?sq2cyBPNH+2KB8P3yfdXrnxV/8VhO6NivT4OYxflkRsoUa3s5XiKgDhZUbxE?=
 =?us-ascii?Q?sE7HiJCmHND19TfI5rEeURUJUMKXgaOv/U3Cmv6JsBG2MdafRX3fi/GKKyJc?=
 =?us-ascii?Q?RwnTNC/JRhNacHgAe2vu3v1IsjztjcJXyK2gaJdEPBsxD9gCTGSDijkjInyF?=
 =?us-ascii?Q?UknQMSeDGRbq9T/nJTJ0cx9T3SEg64CdmbukNagRhOAgQ1ERmnfrofdxst9z?=
 =?us-ascii?Q?cQeGESUzcnXBfp146+dM1JnqWpxgU3IgHSYh+E7/bHC57hqR2zY5pTzN0b+6?=
 =?us-ascii?Q?lJqtqvcewjlqN4fq1Nq49iootRau/9aVlPB4O6OWir7Y8yY+dvrH1d3HN4zr?=
 =?us-ascii?Q?VnUvla7v2Td6R+mbvJGRKaPehGQnvY9/ezQk1XzkIaru8GSV7pe+ls3HakhL?=
 =?us-ascii?Q?PC32+71gZqrrolXRe5fjAAbPlygUMEK2KF3DGtlR95iuMi/W8ny3flb6KMo5?=
 =?us-ascii?Q?YHmqNtWTOsegy3Y2nOg+59laSeRDFRnApE56M1e0zac8k8ZlRyT2jFcCRQtV?=
 =?us-ascii?Q?x2XXAy4dZ0EabL2UmGBtdTb4jbkQEB5O6f6OUEnoiI/AM27BSOIBK7wNrxFE?=
 =?us-ascii?Q?HSbZaItOKftOcajhjbu8faMseyXFol24rerX3ye3tAnChqfkDUFzIx4O0Y50?=
 =?us-ascii?Q?y09sFpUnFScd/cFsI5LpznphjHOkarvz7PsMqLCf5lcjcuAquzvJMfsqMLir?=
 =?us-ascii?Q?Bt1K+liIOl29b6DqPXsETFH0v6ni0EH8wLx+lvYwrDlL8FTEtP7ABy05NOGn?=
 =?us-ascii?Q?lueKo9hrDCl6AYdk5GshTjVbjLBur/oHJ7I+k6PwQknte9v27oHpfmXokltM?=
 =?us-ascii?Q?YEai6xycoomICT2xCVXZ4cCP1aDwsqp76ti04/qGwshn+Fef5tFlvz6pLwo5?=
 =?us-ascii?Q?PSLQIAkBzKNlTAGvBi17wSpDpct395MH5OCVaD+6HV8dxGJ+ZzS7BV3t6754?=
 =?us-ascii?Q?spzZ+9LQQ1+u3iF9ilhLGwW/I0qOn3ULhwG3pDE5B92qibMOu0HqttOlc7xJ?=
 =?us-ascii?Q?hXBox341MpTf1OnMp2bd4zHjrNPN0u/Q+Zc6jkCyk5uEWaLrKSWmE4Vhr+Pz?=
 =?us-ascii?Q?kV7qkikuWAX74xgwc8HIH3Bu+70vRwvjkGh6+i5bHUnW0kff+LBVMxpJN9co?=
 =?us-ascii?Q?wwDWgR3vGK7jhR+OW0h+0v1456DT9hYCpBz13oKOfJBXUuJaJschJiP7cso6?=
 =?us-ascii?Q?H+nppPH6i62wj/qTyTfWVqJucGRPSc558FiWOexWAajFHKKrXaTa97gxa0Ku?=
 =?us-ascii?Q?VzsjMRmxEJAIVInXSt/He7IzYsHzCVWJdSxB7mjR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fdcb67-8f9f-40e2-3e99-08dcec0a1919
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 04:38:49.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVKjEh+TkyOQ9LJiGhEFw5RDM0EBaj3BmzwnL+aXr8+Mu5l4kJhgdZ6WfbubvsPuqKBLX/7xQDCPJraIP48ABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com

Hi,

Thanks for sharing the config!

On Mon, Oct 07, 2024 at 06:35:42AM +0000, V, Narasimhan wrote:
> >> Hi,
> >>
> >> Seeing the following bug on boot with next-20241003
> 
> > I think it is caused by my commit d0a38fad51cc "mm/slub: Improve redzone check and zeroing for > krealloc()"
> > that the virt_to_cache() it calls returns NULL
> 
> > Could you share your kernel config? Is KFENCE enabled?
> 
> Yes, KFENCE is enabled.
> 
> Here is the kernel config used.

> CONFIG_HAVE_ARCH_KASAN=y
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
> CONFIG_CC_HAS_KASAN_GENERIC=y
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> # CONFIG_KASAN is not set
> CONFIG_HAVE_ARCH_KFENCE=y
> CONFIG_KFENCE=y


> CONFIG_KFENCE_SAMPLE_INTERVAL=0

I think this effectively disables the kfence, so it should
be the large kmalloc case, as Vlastimil said in the other
mail.

We will try to address it in v3 patches.

Thanks,
Feng

> CONFIG_KFENCE_NUM_OBJECTS=255
> # CONFIG_KFENCE_DEFERRABLE is not set
> # CONFIG_KFENCE_STATIC_KEYS is not set
> CONFIG_KFENCE_STRESS_TEST_FAULTS=0
> CONFIG_HAVE_ARCH_KMSAN=y
> # end of Memory Debugging
> 

