Return-Path: <linux-next+bounces-8438-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A720EB92C4A
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 21:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5894E17FB63
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00D92E5B11;
	Mon, 22 Sep 2025 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU9oXzRe"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFAD31A556;
	Mon, 22 Sep 2025 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758569169; cv=fail; b=sDGBaJDKmn3ul1fGbWmBIAZ/5KmP6obs8rDR+lsxKfgV4xj1ly1xX2ZYOTy/SJePOCv/LpcxDIiDwBEPpzheOWA9QGbqgNrTLgGKOCzGaWS44IArJGRAP2ztdoDx330abMF6YL34tjvog1hyJLzX+rx9H5nqdKbK6ykrsw+EBhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758569169; c=relaxed/simple;
	bh=OhPMJgCIJMW35V+QY2cDRb3Y+h8j5Q+zvYjpe5OjAfo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S3qx6bYiRX2wUtBJs9yBKjpp3DhG2FWJyeQK+pGa4rB01UGCE/vhRbnY/taX8blL9Ncl9bmx5NZ7svRCkBH5KrzPb5DTRXLUyu5jU87K3+BaQ/lbIr0WRwu3ucvgvRVZnbZ+3n4BSwhJoBbqrMeITFexi6aMCethinPW03/Xhl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PU9oXzRe; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758569167; x=1790105167;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OhPMJgCIJMW35V+QY2cDRb3Y+h8j5Q+zvYjpe5OjAfo=;
  b=PU9oXzRetpWtH2/8cN5IvWWBFgF6TbAjricY5s1i6y+qqzUYDlqmK68c
   HxmVyQZgHbgUJTP/fyDFf6WWeL50omXghGtOa0f41TEqMezyc0egiAxJu
   CLsKeIVteBRyDLv/j8bZ/aMpZj/TJ1i4rI8f3yGMtuzHx92xWJEHKb1YC
   ryL8Dl6UesUSD/HhYdsaQ8eO6pwtua4a6V1qpHoE6LTQRt4d8v2Jbvnsy
   gVqvmUr0SmvwKqc3PXDTfmkxNek9aSu6QnfOHNpWuo4ZSF+swb9JFtIBO
   gDsJwwkMi0c4BOyk7EP6ZL6da1AHNLFtuwozvMWPuTqemzxUO5ovVrJlK
   Q==;
X-CSE-ConnectionGUID: AdltMuOhQn2ic2jwGI4lXg==
X-CSE-MsgGUID: bahxmdiNRBSPRyUWlVx8NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78282776"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="78282776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 12:26:07 -0700
X-CSE-ConnectionGUID: Q6Mi1EZ5Rz202Z8e4tweTg==
X-CSE-MsgGUID: tSv1XL5dTfSr+T7Vnj4E8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="181717137"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 12:26:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:26:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 12:26:06 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmOhKpcEpuDezjT2wkc2dKW3kXLjIqsRbNSobPfQHYAsE89Qj9GPIHMdBer7/IHir/x7SmTMczb1Y1vOxjgvxrufPkoXyRDsSeKKJRTmIbsPDOA6KR4Rq1IJBT75mDrKWNAE8NLN0+VxB3EpYRUvaBvsHQnpwJ6EZrBacfMeXRk5GBbgeJ1ZaDXmiFZ2my9JGEkjfb0h7cFTaH9+CshI1kOCdS4JlKCP0Zp/9Txh+MGKPJrqGdtfeflwKecUyjQ/iHXk4Bq7mKuwwt2V86itN+tgaO+F5c0OalU52jWVwZwcy+hMy58+FI6GsjuzBvgBN1vyAi6H6XXltlNEMp1kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCewtlwqTE3nfI4aMuVSk+6XtVKUSWenuC6YFOZWnvo=;
 b=tKgOd80koZJUoq5FA+e8p0eURRakyvwPAN2xzdNoAGyjmK7Y05AkY03n9ArHDKR5hgb5b2WMPD0JWpgCJhLR7ii4w/Z72vhR/rzWB/+S9pTSm1jNI0x8CnSO2wVqOiNmJTuCZXluKvkv9NMS1qGCjziBtxSwowboA3uGsrOZdkm/gOcqkOEeWw0fIYXa9BWzMlmXFHuAQgOxQW2jB6eT4Wwys/e8Eq0SqUoHi/f919Sa/8tuqVWI9XN6jurrOOwqEqkxY304k7SDa2j77LY8OPDUUrAWfav7vn5iTUz+SPo3+lnNMRl//DXhE12/PJzhe/N44m68SAILR0B6CcZ3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 19:25:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 19:25:58 +0000
Date: Mon, 22 Sep 2025 14:25:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
	<thomas.hellstrom@linux.intel.com>, DRM XE List
	<intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Zongyao Bai <zongyao.bai@intel.com>
Subject: Re: linux-next: manual merge of the drm-xe tree with the drm-fixes
 tree
Message-ID: <poz2mkphxsugh7blllzaz7x5bnrxfduz6mavyu3hou667jlzb5@wr65av6rcyoj>
References: <aM1QX4eEaSRQX6Dl@sirena.org.uk>
 <20250922182832.GA1542561@ax162>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250922182832.GA1542561@ax162>
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e77d6a7-2749-4258-dfb8-08ddfa0ddbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2SyNFXVacq/bYmUtH7E8vABIkzSrZajBoDqT8LbQ+Hft8AiCZcze4kQtgbaF?=
 =?us-ascii?Q?9pG4xxOTUmwKKvMZtRdClUz0IHORdauoh1S9hxfGPygzMSMIeF595HLBV74i?=
 =?us-ascii?Q?aD1KoOrnRCZffVsRQmSPv9TagUHVRpTJPN0ce09UFUtQArcmFj+O99mBiuw5?=
 =?us-ascii?Q?MWzx2JUTtGZtYvuuMqMTNuWJkDs2a+IuRVa1MatWB5Jkz2VBQ0mgPMB0Ij3Z?=
 =?us-ascii?Q?P6GOFDEN8EmOpqGqA9Ti8Zd6Zn8QNPBQvcrdmGjDHu5w2C7+9orfb+g+aLPL?=
 =?us-ascii?Q?Up1htCe+cnVnUY6ZcmrzbVCsUfMhiCdVpL2FGMZklbGxbGFGDnH+yvy88/Ow?=
 =?us-ascii?Q?Cf6b/tuDqvMOEgcDUF/Zy1OmRHrkJJxKZydN7PMlx0WIMoLKALnUDfM8txfM?=
 =?us-ascii?Q?73P2jzdETx4oz2fVDbvfyADQaUbeJYIxuYBfvU3RW13nJaR5QkLid9MawgBh?=
 =?us-ascii?Q?+syAYcHHnko3eM2z1ecss7fA+P4F6jJHQ7QgC98jOJtpV65oSaWU2/4JZQQk?=
 =?us-ascii?Q?xON77GPEB5BhxNJ14/6L8Wcj48l+Tfd1nT0R48nre0f4AYuV7ZYXhhfnGzR6?=
 =?us-ascii?Q?D0MuYTKnwyEEAQ1cAz39OtWNyYj02YHfq7ckkGEio0fmqyxScwUGzupgHmQ7?=
 =?us-ascii?Q?LmHlSfDBq2uE//vTTdYBv2ZcOcXNwLDigbtJZnYKVpZ13zs8HFqgV+6Sl6xg?=
 =?us-ascii?Q?sKewF5fU/fzjuaT7n6bV1qlMK/d6JS1Jy6gulpXG5/N0H8I/ae+5wHCWVZnE?=
 =?us-ascii?Q?c5zenot/EFurjsIIQSGJ6400JJzrEPH9iJv68WX73eQv41AJWahTeNC8ijmh?=
 =?us-ascii?Q?SdZcbLFB1vy/8K6j/P8ofEZQd8TDY3UmOtbd4robBA1lhVlQIjXqRCgYYxKl?=
 =?us-ascii?Q?3OGOlyTl12ZOvrpGqevVBdwVQWkeotad7gkGernfjjagR8uMQhh9/Dvyn4uS?=
 =?us-ascii?Q?jkbTbUb3NPKUmgSAuwM1EnjXCqBbqsME5LNb4titYAD90JeUS46/ZeBH+1at?=
 =?us-ascii?Q?Kiy+/N6D3XTVBf3Lqxl6DuEMeJqYuC2kNrOIhCGw3EfAriqpPOhqhc/gvX2f?=
 =?us-ascii?Q?C93jLnTdFAidrSR9waB8mgta9LGFaIblG+Dlj1XPc7203khhtVgmlbuDdgRb?=
 =?us-ascii?Q?+Dxs+dMRUL44XPPtp/SxDHbVXds9lxlvYmRx0OiualLPUuPQmP86w2tkPr8J?=
 =?us-ascii?Q?CoIXKqiJX3I82hsGK3614vvGjuVV7+2fcdfghkoypc+s/6VWn9we4WGuvSZk?=
 =?us-ascii?Q?Ef5e7WMfevAJM20urSiiSNcyn3d69pxSoKR8KWM7HHEifa7w0X3UNUiKRhm+?=
 =?us-ascii?Q?GfYhTo0QweDfSKIT1C4pXXI9EbStmJrc3hHuLs4TMgsqjKuIx0b9fM994pvL?=
 =?us-ascii?Q?qqLANn7n2f77K8vM31m8ju4r+P8cSFvr8wP96mPL+uLvzhj6gQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LfjvfPwPD/Dem2TcsCSx+NALeiZ3sf40YWLXyAQd6MoatVVFEzb9P+expQOe?=
 =?us-ascii?Q?dKrRrCdHEIRdcfnxYkwnzZm+GE9M1S3uLCh5AVBUOzyfuscZbraXyp2L9+Te?=
 =?us-ascii?Q?ZsBYsStp+TaHP2xORxk/Ra/J4MHoCH+j6Si/1/d/KUuSkgZTIoggeSgbmYVw?=
 =?us-ascii?Q?3ySth6kQ17nc2YiZ6LXptMSFcYH2JzaM+EkkHVtL6djoI7Iw6KI1+aOnPwAb?=
 =?us-ascii?Q?H6HU1pxTJL6JqnueT02sDIg2bzY/fgDxKQnpTl1I3s32u2PF2GRI3ZbRfNLP?=
 =?us-ascii?Q?Mro8c53lm3k3oUYUC5mCQvQT8xAasuOHP9DsmSf2tBwwLXAa/aod/x+4srn9?=
 =?us-ascii?Q?gVdxl4z4HowM85o642xhUiMAWWCTCtcsPZ4Hp22UsFh5oHeANVeDpQ6OwLur?=
 =?us-ascii?Q?L+7SxH0bzSoMpO6YHkdVDskyfAHxc2GVef/TWL7+0ziXneklYTeTtDprPYO4?=
 =?us-ascii?Q?a1BAiHzGinKQB71oRhyStt3kUKyQWgcl0Zz4a8/4AXh/68zi6Tudhqx/jN1+?=
 =?us-ascii?Q?wd+jWUKz543G6cTP5nvRYUPu/pgjKV9uvOpHwSoFpHakk1kvmpDmeRsH5eWc?=
 =?us-ascii?Q?/k1ENHcIBxMHh7BkKKaRnLdPsJF/U6ZZXP0OGI0wG7QKvLYVRUmShkDoh0nl?=
 =?us-ascii?Q?2hJHiM8GksP3F91WA8mJeKVjOBzORTh59WtWUSIrII0l6RNDl/ZHjAoPRjEv?=
 =?us-ascii?Q?9uiVL640dwb+eVMFh+bVLa7wfKtfS3MMKhZ32TuQzgc3W7+TYl97eboZzGlW?=
 =?us-ascii?Q?KF1V6dasUDtMrLNkYDgMhf7jA0EqUFt1k4pW2GV1iOVKmwwiiHK/aW1IGHqa?=
 =?us-ascii?Q?k8grlHOCtb9XE/kH6cDqsnDbNfCgtOxgWQAKtS14TWYVns6PmBo4V0nT1Sc4?=
 =?us-ascii?Q?g2uxFbpvKWjH/TIOZUGkPj/KdXY0gqkLHIbttZdAud5e8zUGGd+k2Ig2Uikc?=
 =?us-ascii?Q?e03HZKZDagyXVwy77JPBCFz7n1/fazE8E9UbDoijgsRYHRDKeHgrwnOX83n+?=
 =?us-ascii?Q?+btsXSdlf6GlGHHcAEW7UHDaXfLM018NdAqo6Pnuu5J/3oQTkDRukOiOggLX?=
 =?us-ascii?Q?e7InCuHm7Xh8jtcsuSs//JhznBjKz2J4z5vglWf7FlBejhYar6GLIKWkQkeP?=
 =?us-ascii?Q?SPLQpcu/vAgd+3zytdpPZxCGt06JVjsOd05QC9SWHCu1NUf4oKFdViYHdZeL?=
 =?us-ascii?Q?LC9Oh+F5AXzpmBdVH8WznPguXbJyMNOOOs32eA54CFlAiWKN9tDoIR6rUg5T?=
 =?us-ascii?Q?d/SG71KCHTGFRACMqLXITxrguC3US0nkQN2yt4xc9kRMQJuEWYZ3WXnaIZUx?=
 =?us-ascii?Q?mSreuZ6X5E5YP8sUNS57sImAftLVFJz+oOXNCCkAfdSIdd2thitDVJ3wqy/I?=
 =?us-ascii?Q?egNy2KP1sw7qYcvx7XOdKJ/590trlaHAw/RZxiIxGmY4RViabqm1WGQOx0+4?=
 =?us-ascii?Q?Ec81E3M6zyzcLicGXs8VFmezXkSTUwTd/WnGUwdSYH78SAgbR60+zFdlF9ax?=
 =?us-ascii?Q?xsdZkRh4UDaNbE46pBJnOO+K7nAN5BsEp7HS3YQ4VpM5Mt12LS5krxqvIDyj?=
 =?us-ascii?Q?5vScmRFdVypGAs3F6wcRcByVlSLzUWAhSLES1oP75Xf9vF27OOADZNJwxZpA?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e77d6a7-2749-4258-dfb8-08ddfa0ddbe3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 19:25:58.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyaT5KN2ulcEYIqFZaEeBCg9XY67G0xQdPK3jkz8Q5Y4vR8t2nUTrTeZ6XkEPwGkVX/oxZgEsI3kPJIJn/e8d8k3DWe0/jR9/4Tv0PD5u54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
X-OriginatorOrg: intel.com

On Mon, Sep 22, 2025 at 11:28:32AM -0700, Nathan Chancellor wrote:
>Hi Mark,
>
>On Fri, Sep 19, 2025 at 01:45:19PM +0100, Mark Brown wrote:
>> Hi all,
>>
>> Today's linux-next merge of the drm-xe tree got a conflict in:
>>
>>   drivers/gpu/drm/xe/xe_guc_submit.c
>>
>> between commit:
>>
>>   ff89a4d285c82 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")
>>
>> from the drm-fixes tree and commit:
>>
>>   fb3c27a69c473 ("drm/xe/sysfs: Simplify sysfs registration")
>>
>> from the drm-xe tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> diff --cc drivers/gpu/drm/xe/xe_device_sysfs.c
>> index b7f8fcfed8d86,c5151c86a98ae..0000000000000
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@@ -308,19 -290,15 +290,15 @@@ int xe_device_sysfs_init(struct xe_devi
>>   			return ret;
>>   	}
>>
>> - 	if (xe->info.platform == XE_BATTLEMAGE) {
>> - 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>> + 	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
>> + 		ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
>>   		if (ret)
>>  -			return ret;
>>  +			goto cleanup;
>>
>> - 		ret = late_bind_create_files(dev);
>> + 		ret = devm_device_add_group(dev, &late_bind_attr_group);
>>   		if (ret)
>>  -			return ret;
>>  +			goto cleanup;
>>   	}
>>
>> - 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>> -
>> - cleanup:
>> - 	xe_device_sysfs_fini(xe);
>> - 	return ret;
>> + 	return 0;
>>   }
>
>This resolution breaks the build.
>
>  drivers/gpu/drm/xe/xe_device_sysfs.c: In function 'xe_device_sysfs_init':
>  drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup' used but not defined
>    300 |                         goto cleanup;
>        |                         ^~~~
>
>I think those should just be 'return ret', as it appears that
>fb3c27a69c473 already includes ff89a4d285c82, so I think you can just
>take the right side of the conflict wholesale.

yes, taking the right side is the correct resolution.

thanks
Lucas De Marchi

>
>Cheers,
>Nathan

