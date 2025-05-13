Return-Path: <linux-next+bounces-6749-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA74AB5B37
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 19:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E13551886C8D
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 17:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809A32AF10;
	Tue, 13 May 2025 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJWT+oMO"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD0645
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157307; cv=fail; b=JqMW4Fd84I5QOmkPBrxEbYNm5N1biKdUL53shlh6Qtkj5fw8xUlWZrOpGQ+51fhyB1p9Dsw7C7RrL5ejUj1dQ03X6zLXDc6NHEKfJYWm1C4ftt8nlynoqoIVvvMv4KV0p04uH3jLAUY426AVQLPZerLF3r3tjO/cBdbLJoQWZPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157307; c=relaxed/simple;
	bh=ugcg8dHGCljcimnoENGVWHTEnSSb13p3fgxRqW7LG64=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=OXXRmfQJ/42Uls8cubHGvPPZQwG9q1iJE5F503yOlixqrtwf94Hql982GodnwJBiwnc29snKt9gien11w2N5EIkzTEdhZ0k/8LJrmVRM6iTKHbCPuKkZC4VGV7MSD9n3gaqGgD3TZymvHikJ556gmePs/awc4nXWIKVka+rRepI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJWT+oMO; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747157306; x=1778693306;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=ugcg8dHGCljcimnoENGVWHTEnSSb13p3fgxRqW7LG64=;
  b=mJWT+oMOevcQjAqWkY4HtU9yEjxRQSspmZbD2ulQ02PDi/fXpmrT9bnL
   EqeGWRUw6ye1IJZOHYnGTCK86jXuCfmOFI7wcTNLyOyjHIhs9KTKbm/s9
   ShaL0FsMiQpEQbcIWXLOZYeuIII7tE/Jwxdswd3kI4HRiGkOANooNrofn
   Rj8vQMkolIgiZST6kW2QIsZ70hXU8i876wgzQ0FxFsTzV0TZ5QUhUDtyF
   dyeA/Hecn6NZrMP9r5x5kKfrNSa+2JNyy3+dLujuy3a6IAuPh9zmshWSf
   iS6wjGsV15+6FNtvJBlCbMkZCRs9I0EYOy5nStjSQYogkpefSfT0qQXCZ
   A==;
X-CSE-ConnectionGUID: IWGjvRtFQOu/2MaaRt/T+A==
X-CSE-MsgGUID: yh1Zt4kUQ2W0m29aYBRsvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66430417"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="66430417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 10:28:25 -0700
X-CSE-ConnectionGUID: CfHn7VD8Tui5l9wrekV1Pw==
X-CSE-MsgGUID: YkbRLoIBSIayKZf7MilnKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137644277"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 10:28:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 10:28:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 10:28:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 10:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWOkQ65lfL+2nExYxNt33netykCau5T/MFPT+F4XNkGf0GyuZsMxy1EyYDcc2CfX1xQqT281VbI5lhuJTgpQS8XFxNVTFcB2wliUtWEOUc3tMFrn3F/aUA1lhIgIQt4aM64LAER7sepWxJVhRj0mXyU27qeHw0/95FjCTMxtUe+g469Hce1oUfRdDNNveNLjnEAn8LdbYRZVg9eNsDuLJ45A3F3XBPbR4SaDfQ20AcFX3rgceCScgbgFdIzAaHYmVhATXV7BOSVsj6eXUMAJ9DbKAXdBrOOVA5QDdTF1m1zfVNpfwaDTiz5Ak6RS/psAfnKjg++4WXivb2t+aj/H5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELzdLALhPgEoVX0fwJG1Z6altfgsdcySjnxBKinwMXY=;
 b=jkjR2KARY/iEU6nmQtknh8+/otFwn+9sIocKdheVu7hmDu3vSWLyC0xepUfGDfusahWEmqidPET//abcUPsI85Rs8Li+6tycxgcBswbNqwu+iqhLWBw6JtZqIeFUxngTA1Gzz2KaX5vhfPYuyoIjNMQfkA+x2A3GXU9tQS30YvlDlGweZTTIRFoMIPQBnSFWsR4lZ8B+QkncOTLO6V0DZXEJT8os6ofJF5SiWwnFnG/dA9u8EMreXmZQ5NgQzAolMa4ATus+Vayojm1kEdLlDajtTNFgzZpwM2GjVISU3AvbPDqCvDTCsv7vpoAfzUCFTF6hkl9X6laPnXhYkEpl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 17:27:55 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:27:55 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 13 May 2025 10:27:53 -0700
To: =?UTF-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>, Cedric Xing
	<cedric.xing@intel.com>
CC: <dan.j.williams@intel.com>, <sfr@canb.auug.org.au>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
	<sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
	<steven.price@arm.com>, <lukas@wunner.de>, <greg@kroah.com>,
	<linux-next@vger.kernel.org>
Message-ID: <682381198ad46_49706100fe@dwillia2-mobl4.notmuch>
In-Reply-To: <ee550446-ef6f-4fd1-bffd-cc09f82bd883@t-8ch.de>
References: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
 <20250513164154.10109-1-cedric.xing@intel.com>
 <ee550446-ef6f-4fd1-bffd-cc09f82bd883@t-8ch.de>
Subject: Re: [PATCH v2] tsm-mr: Fix init breakage after bin_attrs
 constification by scoping non-const pointers to init phase
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: ae99cef7-047e-48e0-4172-08dd92437f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnhBU0N6UGVlak5GcG96S2VFMXV1MWF3enBCM0NVb1RyNTR3azRwYVdNdTVN?=
 =?utf-8?B?UjdNMkFoTEZWcktqdVVFczFPNjZWYm1OSk15Q1orUy84M1JqUU5aVHZxc0t6?=
 =?utf-8?B?SkZtWU1teXlOSmNQU3dKUXNjMGl1Z2VFT3JlYVkzbTFmNlc5VDFQZGNOQXhs?=
 =?utf-8?B?aDdmTzdkUHRlVWcxNnExWmVRM0pYMFYvM2lHS2pSdTFIcVB3YU95b0NxaFoy?=
 =?utf-8?B?VThHWjgwWGFFNXlhMVhxa2R4dlc4WUVHbTNiaTdkYzJXREdBNXN2T2pST2RU?=
 =?utf-8?B?Nmtob0NOc1I0aW1sZEl6N1BUQ1FIT1ZWRXJMZ003U0tIRzBNV01USWJRbk8z?=
 =?utf-8?B?M1h5T0gvQ2RGMHBPYlR2M3paeEdPWndaeFkyU0lSdFE2QzZhUW9kT0pKSUdm?=
 =?utf-8?B?WjNnam0yZG96NHJVQS95UXhnSGgvV3FkUTBmdG4rSmFGRHFlT0tkRUljdmp5?=
 =?utf-8?B?U1BHS3NsaEV4OU03eUF5Y2RRUWdrcjY2KzB0WU8yb3ZqZHloOFNNTFFBcEc1?=
 =?utf-8?B?azhRUUZGMFZ5S2s1WTM0MGlEalgwdlpLMVZnMW9tYjcybnFnWWVWVHFsYVdD?=
 =?utf-8?B?azY3amVNdFVOSDArbjQ5U05nRWRCdmRiUEQyQmJlcU1lSHVOMkIzZG55NURD?=
 =?utf-8?B?Smw3WFZHMlRRQmhYOXB1czN6VXNhS0hocUhKeHI0cEVuMnBLQUZMRHZCWEM1?=
 =?utf-8?B?U2dPS3pKL0NCUUVhQ3pCRXhsdEFPZEVYb0hiVFFvRUQvN2lENXUyUlhLSkNh?=
 =?utf-8?B?VVdMYlU1ZXpzYk9TWkNLN0JBcHVFeU1BRnlTR3RVQVNCRjROdU43clVROTlS?=
 =?utf-8?B?bjJLL2tXZTVPZXN2dHlOT1ZzOWF0M2VncUpMNlBGMExkRkNOdTV0VXBvT2d5?=
 =?utf-8?B?YmhPYnJ1N3cvMmJDemlOMVgxaDNKL2dweFllWk9Fekc1dnJ6QWg5Wk85ZDh0?=
 =?utf-8?B?emhDTVExeTJia3RaZzZ5VFhEQVlsK3B2MWovQVB4ckF6akE2S3JSMUlnc21L?=
 =?utf-8?B?RVNFSFJqWGtqeWxHanhIQVgxTkIvQWxBelU5M0VOakRHakFjNVRUVFdNSk1Q?=
 =?utf-8?B?NzdDMXd4YXdiZ3NBVlFjdjRUem1saGNXY2FzeFYwZkVpaGk5MGFwODYxQUNq?=
 =?utf-8?B?YzlZYlVlOUs4ODdqZGJWNHdGZDVXcDA2dE5FOEJDWTNRNkNNbXdYbEMrMG5G?=
 =?utf-8?B?N3hhVEFHREo1UXBIT1hNQnlGR25JZmV6dExzaXllWU5qZHpFVmVXalVjTmtD?=
 =?utf-8?B?V00wZXZyOXR0cEZpS2dVM2s0Z2Jacm9EQkVjcHgxc0ZCNW0yd09sRkg0WGhT?=
 =?utf-8?B?V1pqRmJzQXlTdEt6b0VzMng5U0EvK2U2WjNXVGdHemRMbWY2dEJYUXhJMlVo?=
 =?utf-8?B?d2pTcnJhREROT1cwS1RjQUFoUzB4dVpXU2E0aHBMa1FXelFEdjJxY0ZxUTQw?=
 =?utf-8?B?V2IyWWxray9LWFdmQzNtMm9ZTjlKQ3hjUVJhSTlJRlFrdllkK3RMVHZ2UERv?=
 =?utf-8?B?QjRuNjFDeVJKTXVRbmVKelpaSjU3VjI2MDhFQ2g5a1ZZZXp6SDZWbG9IQlBT?=
 =?utf-8?B?WXZLNmprMldiY2tpdTR2dmdNcFh1YmV1aFdpYWN4LzVwenpRY0hsVis3QSs0?=
 =?utf-8?B?RDJ3bkREa3Btc0tldXZUSGZsUCt2WHdoRHlmN2RRS2VIRFowOXE3aFBhVjh6?=
 =?utf-8?B?ZldFN3RyZlNEVU1aaFZYU25VV0pOTlNaT2NhSGFvNlNYaXhMNWQxaWNUNDUy?=
 =?utf-8?B?RzI1bzczOGJlbGM3NDhxemhuTlBvMis0Uk5DUUFDNkdnZXI1OXE1VWV3VGVG?=
 =?utf-8?B?Yy85V2luZEIxc3UvVEY5TWVYOGJiU3didlV6cFpRZ0xEbnVhdThiUHpBN1Nl?=
 =?utf-8?B?aFBFdnJTMFZ5NVBEMDU1OW9KMS9lVWZacVpxV0pWTExQSmh4NEhrLzlFaWI3?=
 =?utf-8?Q?wHrMeqNtUhE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azJiZHhPalYrd3JGS0hQRXdKTklIWEUwSjZIejNhWlNMcUcwWTdMMEJOSWpN?=
 =?utf-8?B?QnoxbjRjajVUK1I1WEhTUmZmRGo3eXM5bHNtRUdiNDE0aFV5dmU2TUlGQW4x?=
 =?utf-8?B?TG4zU1FXaFRRcHJucnBlR2ltUE13REIvYzNQQVFsSFFtRjdhVnh4QUE1RmxB?=
 =?utf-8?B?UVVER2FhSTlkeFFKTE8wenZyVUNKSlE1MEdxUWw5Ly95TXVPT2RKOHppT0lL?=
 =?utf-8?B?YmUwM0lHUVZMalkyS2YrSEtYbGErU3pRN0NmZUVBZm1iWGFBaUhBaXJDbWRF?=
 =?utf-8?B?WW9TM0hncXYyeFVWbVVRVTRrSzhSV2dJdEI0dlFsSHZXNEZGVXhDRGNYYVh2?=
 =?utf-8?B?Yll1a3NjMlI2UUJhUE16SVpEYUlPVzJaQ1JKS3ZDMmVYNml3WmtqTERYK2w1?=
 =?utf-8?B?Nm9yY3ZmRjFhZE40TlpzaXJraEV0Qks1QXA4Y2hmSGlBZ2J4RGVUTzFPdjVS?=
 =?utf-8?B?SWVkdXVDS1JJNWo1WERSZjQxcklmNVduVkhWcWRIa2ZqcGtXSjJHRFVnSXh0?=
 =?utf-8?B?WTZXc2lYcmdETlZhaG5qUC9TRkRHNkpZd0NjNjdoeGMrenlmK1J6NHhKSXp0?=
 =?utf-8?B?RDMyY2Ztb24xU3pRNEMwUzN2UEE5S2xROGRPa2FENWE1YnZDV0UrVlFjN2NY?=
 =?utf-8?B?R2I5SStrVHJnSXJSUFM0M1BhY0J3M2NQQ0dhQW05SHkxWVZmT0tKcHBTcTdY?=
 =?utf-8?B?NXFUOVUzNnZRVHZQVENSS0g3bXlMcmVVYVhuVlFIdXc2ekJ6Z2xHOEczT3pX?=
 =?utf-8?B?UnZnT3QyVkphOFVxNG5hUlJOaW5FKzAzaFc0YlpsSnhId2tkSWNiMFRTVjhF?=
 =?utf-8?B?d1NORzFLYWZ2cjZTS1dCOEp0cFo3WE9yRVl3R3FpYVVXTGJwazJ2dHFFZ085?=
 =?utf-8?B?SUs2RTN6WlhhVTQwSjdCdmpRMldSTDR6ZHR0bzdHMHlqcHh1S1BkdHdmODVk?=
 =?utf-8?B?eEhWOHlYbWwrSTlmcjdZOUdIRVFkQ0QzbWNIQmpzZldRRGxEcWN1djdNdHpC?=
 =?utf-8?B?R0xQT080NVJ0a0UwcEY1WlFkTHgzNEF3T3hoZVdCbzh5NHV2cS9BZk5mZzV6?=
 =?utf-8?B?Wm8rMll2YTk1THI4S0hLbjFvM2ZOT0lvL0UvOUlpbGhTMUlwL0VUZmsvMEh2?=
 =?utf-8?B?YTFEWm5md09JUU5jbnpaTC91UkdWMnJJelZGZFFnbENmbGhKc1RSdjVtNHVQ?=
 =?utf-8?B?VFFoK3l0YkFtOFpnMGNmNWtUNjEwUHREOVF2bVV2cW9Va3g5RWt1cjgxdW9S?=
 =?utf-8?B?dkxZZUZvcWRjdHBlY0FZbVBtSkNFUlROTVoraWdlTUFFbUtzdERuRkVlK2F4?=
 =?utf-8?B?UmI2NE04eEpmY2FrQlczSFU1M3E2dGNFVHNJVGo1YytlcDdVbi9RenVBMjl5?=
 =?utf-8?B?M3R5ejk2OHlOa0J6T2ltMStiOTJ2d0RncWU2T01yWit3Sm1sUzhhekxtLzNG?=
 =?utf-8?B?TmVrV2VsNm5IeUdvSk5qczl2WE9sRmJVWXprWm9EVXplUno2UVdKZWtxZXlL?=
 =?utf-8?B?SURWQy80blR3UVhya1ZCdnl4cjVRM1J6bGt2aS9qbjJORGc2RE5aaXZyZFAr?=
 =?utf-8?B?NFFrQ3pFM0VJenF2MXZLb0RvZWRlUjhZem1nSlBOS0x6NDg0MTdhbkdYUFFp?=
 =?utf-8?B?Zk9yWWIweWJkWTFmcWVRUXZ6ZGszeDFtc1p2Qk9odmlvOHdZSlpubmliUUhI?=
 =?utf-8?B?c2p3b2lIcDZMUDV2WlJ2YUZONWhrSkNaUmR4NUVoK0RUdjhaNys5ZHpuQkhQ?=
 =?utf-8?B?bkZYb1orUFA0SG51WC9Wd0NBVFBxQU5aZmQwLzl6K3pUa3k2ZEtXckk1MUla?=
 =?utf-8?B?Q0RUaFZHSTc0b2x0VW9rYVNtRVhid0dsRSthM1BBMnViTHJFZHRubWt6K0FQ?=
 =?utf-8?B?RDRNV1pjRUxJeGkzT0RpdFI0ZXI3THhpemtLWnNONVlGUks4amhjVzllU2lR?=
 =?utf-8?B?MER4N0pWMUgzcEJjYnJ1ZmN4ajI1ZHFmVHc2UFd5Q09GLy9aSnorYjE5a2VN?=
 =?utf-8?B?TEcwRzl5Tkk3M1N0WDdlbGM5Wks1clVmK1hvckVMT3dZM2xGZGhrY2xsQStH?=
 =?utf-8?B?SmZpa3g0b3MrbENhQmIvOVNxTDh1c0oySmtGQVJCTGV2ckUrZW5ZTVR2aEZu?=
 =?utf-8?B?QmN2WGNucWRIVDVBbXNBakg1WXhPelR0SkJPaUpEN24vNnVjSURzMFF1U1JB?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae99cef7-047e-48e0-4172-08dd92437f24
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:27:55.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYTXGXjvcgA+aliZJ4+YUgUYasuLIUTJUIleKmv0BgK/+oTOJJV+KPIK2ce1+AY6yvm99eAG4xs9ZOa1nLcKzU6qLn6WJCogEmj6M2IXGec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
X-OriginatorOrg: intel.com

Thomas Wei=C3=9Fschuh wrote:
> On 2025-05-13 11:41:54-0500, Cedric Xing wrote:
> > Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") enfo=
rced
> > the ro-after-init principle by making elements of bin_attrs_new pointin=
g to
> > const.
> >=20
> > To align with this change, introduce a temporary variable `bap` within =
the
> > initialization loop. This improves code clarity by explicitly marking t=
he
> > initialization scope and eliminates the need for type casts when assign=
ing
> > to bin_attrs_new.
> >=20
> > Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> > ---
> >  drivers/virt/coco/tsm-mr.c | 30 +++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> <snip>
>=20
> > @@ -244,7 +244,7 @@ EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
> >  void tsm_mr_free_attribute_group(const struct attribute_group *attr_gr=
p)
> >  {
> >  	if (!IS_ERR_OR_NULL(attr_grp)) {
> > -		kfree(attr_grp->bin_attrs);
> > +		kfree(attr_grp->bin_attrs_new);
>=20
> This is good, but the assignment also needs to be done to .bin_attrs_new.
> That is the code I can find on LKML:
> https://lore.kernel.org/lkml/20250506-tdx-rtmr-v6-1-ac6ff5e9d58a@intel.co=
m/

Oh, the latest fixup that preceded this only went to linux-coco:

http://lore.kernel.org/20250509010104.669669-1-dan.j.williams@intel.com=

