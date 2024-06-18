Return-Path: <linux-next+bounces-2588-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8790D97F
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 18:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC13B1F23712
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 16:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD2C502BE;
	Tue, 18 Jun 2024 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGhSVsjU"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B39A80624;
	Tue, 18 Jun 2024 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728886; cv=fail; b=o366/pwn80u5hiWy8BUJwqhfS4QIxqbBbCOKnnqHxpp/Fa4VUfX/y16i5PeHhxQ0rDEC7LrXnxxEbl4e2Qe9kUmR3VXDNGdk9MvPFXVZzwhlHV/5SFLtCDYFqNX5B158tQW1BXFfd4gayDUw7VhnEc3ANxla6mkDtxQwxE1zr8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728886; c=relaxed/simple;
	bh=es6hFOpD81qKDVOpgWXkj82n5vm1/VmDn+4E/fvmE44=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mqb6gEJid5yOSQdWUJSwXXSFS4/TehFUpCV9mt9X0gCUsjp0xFOtnYLQ8CZa9g2LdAPoRcXGsgAcBUkSdv5OcGQXb/A0ttr0OUnW/KN7aqwuoybV9rDxsD5fXEYO5vT3gdiUOPTBBVmKqF9twRLW3ZvEesEWwIfNpwPA9RBRt9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGhSVsjU; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718728885; x=1750264885;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=es6hFOpD81qKDVOpgWXkj82n5vm1/VmDn+4E/fvmE44=;
  b=kGhSVsjUiYuoZ5tI6kBSorgWAeNNwO2IWbdf+pHmyohLAJonBbUg8lT2
   B1dLNUOQyYS+eyDnZ9zt9UYed+HwCp7nEVDCwL3oFRrJuG3Ybr3fO3Edj
   uyQ6qxowO1zChTLtwKjdak5n1G/Ord/rTQuRpMDuETx4dcR6Fl7KzVL7Q
   7CHjKvt5xlbXsb+8z/cY75Bp94HgOVyhtxkMM8lEHPu0gFvIjw+BfoqxE
   I+Ev0GWtO9TnNUJPegBBWWM2RGVGWFbHf8VkGzixmlvt/Ulmq1IANlJFU
   qrrjCUVQsmpZLZJlv7vIhMxV0cm7lSf8tPh59rDih6W2TDHnC7x8OFF0N
   g==;
X-CSE-ConnectionGUID: 56OpHn3/TA6obWZn/oREvA==
X-CSE-MsgGUID: mbESa5+5QwuSE0/0dHAdSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15499806"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15499806"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 09:41:24 -0700
X-CSE-ConnectionGUID: dWm45wZdRz6jhKegoAGjSg==
X-CSE-MsgGUID: ZfQwkytBTrOHBD+cb+G21g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41745181"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Jun 2024 09:41:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:41:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:41:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 09:41:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 09:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAV311QHsxAd0+65o9p7dxC+ptqVylC90FdRrcAscYBMRwps0qXZlltYzS+4JqL3WDl9EsIsw4trlj8FtjbSOSLOPiLK74lvDyjrJRlrLcz0h6lWpGbDSsiyrrS7vygD6EW2lwnzieiVs2+HJeGekMrWq7OkKx7BN2tNzZZ0gXJfVw5qq/ihp0iKvk1zLDqPtLE7s6JjlJpupk2xgi9hCVeIIyURbG2rt+ZsoFZOGqVXkqkzgZo1HYep9PqfeTi/u+aq0XlCRFy8F+67Ssmn/rhTfyHxSTQvCmjJSUCvpecUxxgDEBrdu2Xbrd9/fIPN/9T5V4RNMDTHmNjpHfnkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1w+nb0uNLKibq4Or11FViLXA9oJLXEaxm7p1TgSuB0=;
 b=dEAre5QeVuLaKJV1Ys9KXhk0MnVdG8r4bRaDsYLr4QluMSI31ZAGtneFLc6eNPplI1BJwDBkRb3PE/QDEanqt3jMkxo8hQ5DuWUfoBEam+D/QyWVtql4wqgsRmjJU60K2RouDXU1p25DYePDxFwv9JkTbguTj5/+kdljOMycr3OinRM87/XzPa0I+ANyXbgknrICDOgDDM+wfgd2NFJl07Wxy2hmRSmtfMBBJMWPM92sc7AtjHlzISqqttWMWDAeUSJq357NbHsBjzaR/I1tQ3VDSUSBbl2WtKUY8gls4qchjUdhVfd8j31xUIRzxo9xMDwvWR7XJmtzC1uQ4yDdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 18 Jun
 2024 16:41:20 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:41:20 +0000
Date: Tue, 18 Jun 2024 11:41:16 -0500
From: Ira Weiny <ira.weiny@intel.com>
To: Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next Mailing
 List" <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the pm tree
Message-ID: <6671b8ac393b0_298806294dd@iweiny-mobl.notmuch>
References: <ZnGWnzrnsyD1j6Nh@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnGWnzrnsyD1j6Nh@sirena.org.uk>
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd9e752-3389-40b0-2448-08dc8fb57b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EkkcV/ZkZWs1zMZzeINuUSuJAjfKCImZM1vupxil/QqLA4GZSfQcYqKSiWsv?=
 =?us-ascii?Q?dHg0ndbAHW3EbCaQG2uH8340mCmCG5Z8VIFj9a/90Ua+66MEbEtcoNMPagPY?=
 =?us-ascii?Q?Lu1XeiofZ0M3justmlgghNnu8wlED/F3NH5UAB5NPS8ERRlUxdd5DcCkKUDg?=
 =?us-ascii?Q?8d0stlQJMiQttAUMdSOnaKkhgEqucYshC912GMyT5+6gatuAuaBTP/8ZAK0z?=
 =?us-ascii?Q?vhxiuuUREqmi3tM5LnIcjxIo92BSVxkPhzY8X8SVwAjJXOEof1c+1Px/gcpt?=
 =?us-ascii?Q?xFds1YOpJ/aiP7/XajGb/GYpK3SUPCh3KKYk3Va/fZkN+QfIj+qB2xlHjIKy?=
 =?us-ascii?Q?7mX6pgGoLvBDoihxl58NDEeuh7XqB54HF3nBI92bmIpXEw6nipceutFcsQwt?=
 =?us-ascii?Q?DcU88iCoKrLTF7HmLZ3A0J1EP3mS7y8q1tNLmIrdMlPVUGQhba7kQeOXzHmp?=
 =?us-ascii?Q?e+buBg2YTZQ5rHwBeAWgDEkUvXOgwEx28Z82ypfAhwMXx3k5hhRAbt7CJKgm?=
 =?us-ascii?Q?MSNZOyJbgjNYq+gJGmbXa087aymo0Elb35PTdARqrW6U2IwB0o/bWIvyPB33?=
 =?us-ascii?Q?bM2gKtjLRIWSuom1NcCszBEPoSF22RYqcoopiP7QDXWQ0tBCtN3XF0s4wr2/?=
 =?us-ascii?Q?HG8HV1HDs+AypHqgmT3+TIx2KPl2ZPqbaHKNc0JslZQGwvuFnY66kgy40RIK?=
 =?us-ascii?Q?Q0xgNSju8ts52jjGYKzPwB43tdtg8YxMAS8Y9UL7ylGb2vbrIv0Utfpidk/d?=
 =?us-ascii?Q?HnK+bfc15v3rBTji2FO0pgoNPwRrR50era2IxBGFXlADl4xnaeZPKE3mVDWW?=
 =?us-ascii?Q?f1X9K0O6ii38xW5MGhaRMlq7TExu44R43mlmTe5D/jVSly4Sa112b7TWme0Q?=
 =?us-ascii?Q?uqVWax96uoTtPSSVFv/chtEvOi+StBuTwAfVwulpN6Wx4NhTqXnyqtr1j16l?=
 =?us-ascii?Q?G2ODiFC//BcB2SgEzxxUWf4qAKINTfX9LSyV6l12ROTskkZO7w0GzyHdh7Wx?=
 =?us-ascii?Q?U7TRqDTRlqBF0na256NCgm9BWCrPr6R5fHG/vVHrxwtEiPpzBqQQ5MaTRdj5?=
 =?us-ascii?Q?8AoAuPyy2BZ2HJ90/Wa6NBg5ytKxqpPjZUkhvsI0ST5cpLjDhrlRVsav+hQB?=
 =?us-ascii?Q?Vhnama50WXV4LnrcKXNJ5+9f7HG5FFBzmPaYqQqIRhxiDWtjiLIv2enldr9L?=
 =?us-ascii?Q?FWU3OnNxu5XLntApM684NG3q9bNVGKE1AQrksXLoWEIH0johE/FfEmunoYgA?=
 =?us-ascii?Q?3a2E3Asn6ySJVyQXnt816GpCmAjrGLP9FftOE4YejNNd6LBnYCBOgahoBMoB?=
 =?us-ascii?Q?ltyieLcspVgTrUZqURzYCsFp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O4qi+u+Olq6UgKo7rha3jBIpRjQ0vQu/ev48iapu0ZlqYqQMQnbB1zBgUyv4?=
 =?us-ascii?Q?W646sLi8OoFIav1dOUfrIwlWeX83DOuipv2LA9fZZOObME9bI6TDAoVZtSLm?=
 =?us-ascii?Q?Ffw6YgsPlNO+qheGuhOFEueCJPxt148PL8xuQVSfCzR/FNOcmYNVu2tcmYmI?=
 =?us-ascii?Q?yi4YE1bYRaDPf0tJrEMnrePS6lNMv0gEeM4vWsUzuPNX17sE3nzsGiIzMlE1?=
 =?us-ascii?Q?MB9Bw/JiGUQuKWY4ZVrJDWj4PappSMcSRXtCjkqFF9Xc0wi5t8mP88UqLjfB?=
 =?us-ascii?Q?Werm/C2MfkrrzG6iaSiHeetV+woC9nbJ1X4EIQd9G6NxL4BAHaK4Uenr+BSe?=
 =?us-ascii?Q?v62/U+w+GUOHM6qaA2slm7P+q7wyDai0auJuOS4QWKVWc1Zyr9rkl/lzBBX6?=
 =?us-ascii?Q?1DNeAUwGi6fsY59RucVwaW/oIMAyjQ3Co5PH5bhbC9XVc92TbYWRrRDq0stp?=
 =?us-ascii?Q?BAdW3N5p77DQmj6ab2MR3gSEURE5Rf0H+H10XR7rrFi27wyQtWnLlNlS4PFx?=
 =?us-ascii?Q?02TtdR99CFyjb4Yeuc02wHSUd/AxbaIEBcRa0gZazqW1/ygkpAneni2Tud0c?=
 =?us-ascii?Q?LnU9vVRhTB3BPMF62YEsHUKdmeeAJ91YQvMeLYrQhGK+4mgG25nWJWzgrUBZ?=
 =?us-ascii?Q?0zVkD06j3SdqrFV9WUp7ncYBQP2n/chChrp1+uVRniUk709EASBBC0o5T9cK?=
 =?us-ascii?Q?zcfG5HkypvZnIJPGuORruluKetlGp6c8iVn5IVYoB3lDc0A68jlEJ54wroIF?=
 =?us-ascii?Q?zZ2LdvUR5YlPMziU8FdJtjaXu7uarV6IpUN/DSq+mh3z0ZFMf9Ht6hclq9WT?=
 =?us-ascii?Q?cHlQWRihZXr3o9N0pYzBCkEXjXWdoKb5f16SdKPkgzY69ZMyxpAueGfV2BHH?=
 =?us-ascii?Q?ID3cT2nDRFM/Po4KTiJQDBoynb0WBA96QEteb9jkeeTvX8KBR4l4zJL3pHpB?=
 =?us-ascii?Q?IUiQBBjub9INCiP1K6lGrwtaFZOTLXI1eJ9EdxXpEFvWOTzmW/dzUNCpr97p?=
 =?us-ascii?Q?8VzGVCCH/hxzZmFAe0SamzqrE0JDsUxoxfw/wbuILx1sAD/3GIBQ/5Hgkcj9?=
 =?us-ascii?Q?zQj+oH8qPzvxIZZ8s0DgeSrvvgIUmOEnFAgwyonEEQ0PL6Kw+GqIbTiLjfn5?=
 =?us-ascii?Q?bJmzsaoWb83tzc4hwKjgQOF7YuLbhB38fHR2lOyLCGRECqw65+nF33vWXrfs?=
 =?us-ascii?Q?sUHAehrPdf4soV23gS86DIvUjcqwMu46tePZnscc0b5CvxB7jrEz059Q05Gm?=
 =?us-ascii?Q?EGKh53H84cbm4FKu6oNI04UsRPARfN60KxsrTkTZF/uxDwA0SkUjdizt2Pye?=
 =?us-ascii?Q?Fe4ysjeJftzlcPspy88pbenlhe3h2sC4O4NrxNi8OoHU57ouoN/xoyY3cWty?=
 =?us-ascii?Q?5QVvTb4N+nNrEeUsdjTDveFpu1ReKLgAA6IW2lkJzFpxptWvwqL9r8SAvXYE?=
 =?us-ascii?Q?dsIZv6H0kqD/ddsgSwOX4pa6lEPBXmsFOIR1KxQ7yCojpRwLLK6p3UWBxsKZ?=
 =?us-ascii?Q?1cPQW8grXh35TaXA/Rd+SJReJIFbXoSkL6GQp9gTkyMIOaNoqL6YMSknuxVj?=
 =?us-ascii?Q?BqU/VGiGPXszCmOZVAaruTrHt8FC103HsjqediRa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd9e752-3389-40b0-2448-08dc8fb57b3f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:41:20.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7Hw+2Fo8wgxGKpSl+GQol2D+npjC99MMyYc3E/1JCY3VQnUpQipgy8Vo9n6a/Uo6hf0qiGEBBlhlKVGf+k4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
X-OriginatorOrg: intel.com

Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the nvdimm tree got a conflict in:
> 
>   drivers/acpi/nfit/core.c
> 
> between commit:
> 
>   4317874eac96f ("ACPI: NFIT: add missing MODULE_DESCRIPTION() macro")
> 
> from the pm tree and commit:
> 
>   3101daba2b086 ("ACPI: NFIT: add missing MODULE_DESCRIPTION() macro")
> 
> from the nvdimm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thank you.

> This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I should have realized that something under acpi would potentially be
picked up from someone else I just did not think anyone would have for
done so for nfit.

Thanks for fixing this up,
Ira

> 
> diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
> index e8520fb8af4fb..5429ec9ef06f0 100644
> --- a/drivers/acpi/nfit/core.c
> +++ b/drivers/acpi/nfit/core.c
> @@ -3531,6 +3531,6 @@ static __exit void nfit_exit(void)
>  
>  module_init(nfit_init);
>  module_exit(nfit_exit);
> -MODULE_DESCRIPTION("ACPI NVDIMM Firmware Interface Table (NFIT) module");
> +MODULE_DESCRIPTION("ACPI NVDIMM Firmware Interface Table (NFIT) driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Intel Corporation");



