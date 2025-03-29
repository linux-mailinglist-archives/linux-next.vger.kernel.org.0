Return-Path: <linux-next+bounces-6081-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9965A753AE
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 01:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6C2170A84
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 00:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45C3C148;
	Sat, 29 Mar 2025 00:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBNYnG16"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA62A923;
	Sat, 29 Mar 2025 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743207840; cv=fail; b=HW+5KjXAxkrKVFoS7dvOv1FaTcbsSWFFoC2lmyZ9N7tbMvCBvSMAuD7E/CotJWXkXNArBd5RKjac+NjsOvpg0C1dN9pXhMGxsaJRXfUgHgH9d3B+nQu95MtYoDmgWzYC23SP9tuSzWkerM6Iyp0fhDrkh+uPkzcisyhhSeGH/ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743207840; c=relaxed/simple;
	bh=jmnbp9LwgbiURQig50RbA1lAcBthmJ1zuVU8e9252hE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ll7t4f8oJkc/iRtS9XvzOBNzFR1buC1Glrosv8QihcY1v4b6OPICs4YU2L1mDfI285+nAeSLIuMZ1iSWHMcjCm+elqsf/+xOxK/OJeX39eMS88q8wChrDrH6Z9MJIcOkBNmfAK7atZhpW3iqcWsqZgqfuELxEfTq8A3WHH3NhYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBNYnG16; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743207839; x=1774743839;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jmnbp9LwgbiURQig50RbA1lAcBthmJ1zuVU8e9252hE=;
  b=SBNYnG166s/J3fBQBtlrTLMqR11kkocYotCXIDax75/6dS6Q6YaZD3i8
   vr3Ug/BBshwHoXObHPj/7FW2khuu0p6a/C1la4tbpI0czUWfXnStjA0ZT
   8hvBxONFuzWvYu4wkxOFJaACfNZXlnLQPW+1qukIEp6hUJJXJCdOL2fob
   oxh+2k9O/xqExYJAF2HH4JhEU3GLmNVV2Q7tFzDUpvuxvzb5EfY/9Zxsk
   AQXBJ/fn4gRl09Ok7ilHeZjSvkdTMyLkjk9A6ggrSNkLT2b9zBZ20iqa9
   iPLjsefkIYguYbNBJUU9+nXSgbBrTH8hLhA0ODyVN6sqP76wU18i6MtO+
   g==;
X-CSE-ConnectionGUID: c7WsUIXhQcCwu3WP1Dp72g==
X-CSE-MsgGUID: WOXGMMRiT+OE/ox+HxFHDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44739142"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="44739142"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:23:59 -0700
X-CSE-ConnectionGUID: P+FS+8HfRYmsI8TDXC3RtA==
X-CSE-MsgGUID: GjSQXLUXQoyFeNm/trns7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="148762754"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:23:58 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Mar 2025 17:23:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 17:23:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 17:23:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBQYist+B9RDeaS5SzcPdz4A3wsnfQWRT2eLmgU9oEzAf1/txsrUtWn/fGM6QiR8MGK7/8A/tfz9IMreTS/sy9pke6eUZmRI+ct8UgXap6hpnyGB6hdPDHm9OYph5ErH4ufaD24BdSUxuLK/zwBvKFSuPynJFibzWwc5qX3CORvMXdLUvVppzhOrrMFVn99TSrLfA28JgWPjssoaHljc0KI5gwDGEErxpEJUpuISSY4+wQ8n5/slC63ts9WaF66Jrd5qfo/wrl/ulxHx4PUB2Ml1VVG+hFxZRklyr+HP/88ndJxweYZpyLYW5r1eI1dr9jz7K4cvQ3A13mnbnfwd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3u/cG1KLiBfpD1HA9c9SOOvSuyEadFls2vBne43XPvw=;
 b=y5HbyBvENI45BlmzIGO7QBdOpHuHSMaVj+sfQiQhKtY2yOOnpDOdKs1IC8f1s5oWkLWAmpYkakf4powQzh6tF4TA7k6Szcuzmw3dUsmHYfSncbOedjMxQQgxyKEwlGcEd7YU2IdcTdjszKvlH8P6EnlpCTiSt6zO4zksXR+7/HqzYztUt4RVI8HDZCYEvEwwdpuMmdvOjbk0GTbdiclt25Q94NhMzfsM4qcMbBXWU6ngQEV4Gl47ACd0MH6UzE8Zcfmti02/CbE+M4STHppKeMSALQ8BKN+woBQMxCt/43nzq3fdXmtS9iigki4rcR4EUQyOV6hjNZaYh86uxBmR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sat, 29 Mar
 2025 00:23:41 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8534.043; Sat, 29 Mar 2025
 00:23:40 +0000
Date: Fri, 28 Mar 2025 17:23:37 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>
CC: Dave Jiang <dave.jiang@intel.com>, <linux-cxl@vger.kernel.org>,
	<dave@stgolabs.net>, <jonathan.cameron@huawei.com>,
	<alison.schofield@intel.com>, <vishal.l.verma@intel.com>,
	<ira.weiny@intel.com>, <gourry@gourry.net>, <linux-kernel@vger.kernel.org>,
	<linux-next@vger.kernel.org>, <sfr@canb.auug.org.au>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <67e73d89dc6c4_201f029467@dwillia2-xfh.jf.intel.com.notmuch>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <fa4ee4e3-40f7-4e11-be14-7cd0b223def4@paulmck-laptop>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa4ee4e3-40f7-4e11-be14-7cd0b223def4@paulmck-laptop>
X-ClientProxiedBy: MW2PR16CA0030.namprd16.prod.outlook.com (2603:10b6:907::43)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: c10c656d-6fd7-4cd3-bb3d-08dd6e57f4b1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|423244004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1VtRTIvRjJJamY4U01OOFNzT0ZlNjQzc3F0bndISXgwZSthbE1QS0kwV3hy?=
 =?utf-8?B?Rnl5RzJ5VG5RVjRMa2JDcTc4Sld0SVA4UWJsMFNSdWVCV2xsN3FxbnNFd3lJ?=
 =?utf-8?B?S01lQ096M01CSkREUm55eUpxRlBoWkpFSlpMb2xMYmloR0VWOUNHRU9ZWUF5?=
 =?utf-8?B?S0Z6TnU4amU0REs5MTEzNzNjM2RmbEdxbi9FejF1N0c4SDhRMTNZcG1PUGRa?=
 =?utf-8?B?T0ErWHo3NnNWdWh5dXZFL3NWTzJnS2VIQ0RtWWhGME51K1JEOGs3MWtYVHRw?=
 =?utf-8?B?eEZpOFRQUm5RMkhjYUw1NjFxdDYwbkZaSkU5WjdJQiszeitYY0pHY2tOeTEy?=
 =?utf-8?B?RklxeUE5ZWxTNml2K0VaWFhDTDJIWFE3aWZGeDlTU3pYMEE4WnVHbnorZEw3?=
 =?utf-8?B?U1FRdkljQ3I1bHNRbWpBODBDNmxmeVNjdFdTeHRMbjhRWUlPb0RXcmxGdmlE?=
 =?utf-8?B?Sm1TeS8yV05PLzhJc1IxNzVQT2pzUzc4WTVuais5a3lsSW9MaTJrTkNHSmww?=
 =?utf-8?B?U3B4eTdVUXprNThSNzJIOTBpRlZzU2NWMGN3YkVyVDlCTTBIWXRkVHBiK2Vi?=
 =?utf-8?B?cDNONElUSVB1TjFoaHJuZVVHYWNJM2Vib0hmd05wRHp3R2o0ZDB3UjVFRkRx?=
 =?utf-8?B?MUxzamY3TXAxS2UzTjNubUo1Q1FuL2REQTUwdEVhZ3o0SUVISnlUMktSY2lM?=
 =?utf-8?B?YzFZVUNidVJpTm1qN0FEd1lmMWF2VlIvYkl2WlhQa1dnb1pidjJaTDJHOS9m?=
 =?utf-8?B?VGhrS2kydVk4bktyRDJnbXVwWTVxbUhMWG56RWluUEdNaDFmYkkzZzZ2U0Fz?=
 =?utf-8?B?cXg0YXl1cW5YSEdLWmk1Nk5MUlhUaW5QK2hpMEExS2VWRzI1MVRYK2lyOEh0?=
 =?utf-8?B?NHBzQmZLNmx0WStvNUFhU3AyOEZzVURNdmZ3YVVnNmNMV3B2N2w3WXVjNDdu?=
 =?utf-8?B?elhnckd5Z1c1L0J5UFRBWG8wbEJPeDk3YnRFWW9JVkd5d1hzbi9uV3lxak0r?=
 =?utf-8?B?am52K1h3cS9ROFcxbUp3T0FNT04zQzJMR0xaUllyVXBGK0FaaWQ0aTZCaTRk?=
 =?utf-8?B?d0g4WGsrU2gvL1BJaDFkZ29WRDI2ZllnUGM1dnlBWW9obm93Sm9DUk9QeURk?=
 =?utf-8?B?T0pyaVNSM1RVLzZGaEdsTUppUCtoa0JYZHJuMTNtZWkxRG1WMkhpVS9rSDdx?=
 =?utf-8?B?Yks2RGYxbHRoVVUyZWpIcmU0Mlh3Q3BPQ1IxZTkzK1UvYzZhUHpXam0vVUF1?=
 =?utf-8?B?aExTeDJ4WWkvektId2k2QVVuM0RTcWQwenUxeWVrbmRYTm5rNnROS3VGV0hC?=
 =?utf-8?B?dlNxNVd0elZ5TThvYk1GVnR0dTdKUjc4VGJ1dVF4YW5SRHdRZVpESVRaUTFI?=
 =?utf-8?B?V0Y3QUs3VEswa0hrTWVCU3JKUWs0L1RGclNIUzFBRDc4NTQ2M2NEdHhHaU13?=
 =?utf-8?B?dThXdEZleHQremdpQm5lT0xaSnRDSTVaeHkxTjVEVUFER0pPa0FIaE5zNXpu?=
 =?utf-8?B?MUtyRy8vU3lXUzJRTG9LV1RjaVNuZ3VRaEU1OU9WV2VVTUQvWEY0UGFHVWFk?=
 =?utf-8?B?VVh0SlRuUWxsL2hRL2FGYy9iMm5qazB6Z3JTbHFabnl2d0lvTjJwQU1Fcjcr?=
 =?utf-8?B?bC84TEJWaXhiZjRZOGE1TkJvQ1M3ZmtTSGxuYzdTa1RsdFNmbnQ5N09NRkRN?=
 =?utf-8?B?TWFENVdkb1JmejZhSnNJakQyRGlnRWVDK2lTbGF4WjhrR1cxdFgrVkVGckxp?=
 =?utf-8?B?WnZQeFBnR0NlcERiTThVb0hjYi9HUHdMQWxHai9pVGdEVGM4NjdMRVNPbGpQ?=
 =?utf-8?B?T2FYdkFkaVBqcnFKa0owemlrSHYzUjBzNkpMNXVwK3RaK1dPK3JTS0ZtRGJ0?=
 =?utf-8?B?V3NTRnlhc1lQYW9YVFFKWUhVV3A3d1hlVTlGK3dLOFdFM0s2dzRWZDAzTnhH?=
 =?utf-8?Q?DtMxvEXUwD8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(423244004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFB2S1I5TzRSL2tHeWE0c0ZUMWhRRHB6WGtWbFFWWWtqdFlWZE5lZUlJMWhV?=
 =?utf-8?B?N1gzOFFOUmJSdno3eTdJbDZtSFpDQ1ViUEI3RkJqNUt5NUVUdTF2OGhWSm9V?=
 =?utf-8?B?UU42T25KVTc5SGhVdWFPRmd4RmdHakpZWitmUzUzQzZ0ZFBxM1RkdEhWNnlF?=
 =?utf-8?B?ZEhQdWtHemxoZUx4TDZDNDAzM1pidUtLUHpiN1RGbTFMRXhmcGxHRnJCNGRZ?=
 =?utf-8?B?VEh1ZkhNYjE1VHdua3lidEJQRDZDcWsxNldCL1BNbTl1TWN4MGpFL1E1alNu?=
 =?utf-8?B?U05xRnlzU1lsdWp5elVFT095KzFUdFdvMmh1eU5yTHBvbmg0OVpkUzA2bndy?=
 =?utf-8?B?TWJ6Ny9Dblo0KzFZekdVbFdxM1FlK3NhSWgxK25NbDluSlNUcnAwNTZVN0VO?=
 =?utf-8?B?bDExSWZPZmoxdDE3THBqZ1lHNjd0YTVJUktTb2czQktwU2ZBcExyK1BueUhV?=
 =?utf-8?B?OThFbGE2a0lySEFhSmFyajhKRDl1cFlGaitiWmRxNUNaamtNWkZyNG9QSlNz?=
 =?utf-8?B?Q3hNT2tzNkdjRmdiTm1NYkR2ZHczWlFLV0tDVlV6MDlUVUI4QjR6UFFCVnRy?=
 =?utf-8?B?Y2lOOG8raVFNcVJnNTlMUDNaN2xibmhZSnJXVFgrT1NRc2ZVeFBtSDRndjJZ?=
 =?utf-8?B?S1ZhWEpLcjVsQzNBK0dFdjFGZGYrUHFQbXhxb3hkS1pNNEx5ODNHclJnRENt?=
 =?utf-8?B?Rm50c3hlaWs1RmFSTjJIdkhPY3FneFpaVVRqVGMxQitMSm5NekhhZ3RwQVBy?=
 =?utf-8?B?WXNUMWhnNzBmSjBhNURWZlFXN2VzUmlvRGxVTmhjVWFuakx4SWdKOG02WWdL?=
 =?utf-8?B?YVhzYTVtSVhremUvMTAvYkR6cDVuNGI4eTF2cWhEWEZoUWVvVTNBWkw5S0U5?=
 =?utf-8?B?SmV5UFhiQlc3ZmlwVTRlWkF3YzVEK1d6WXNJS3M5eDBKbEVWdWplUEw4WHYx?=
 =?utf-8?B?Z3hnVDNYdWJ3WmJIbUNUN1lrTGNiYmRNVzNkOUJwMDY3RktFUHhEeEtvTTBw?=
 =?utf-8?B?NXZrREdIQ1ZqWm5BbDFrQWpYV0EvUyswNTZYbXk1Sk5rR2thS2pEbzYxR2lt?=
 =?utf-8?B?L3JPdjdSeUpWN2ozSm1CVURPM0hURXJyR202V3ExY1JIdzhVWkMzTE1kd2lQ?=
 =?utf-8?B?ZFlCd0sxNFF1V2FENThqemZJYUw0SERlYWthU2VzWGJlc1FWTFBYVW03Z1hy?=
 =?utf-8?B?aFhQdmNmazBFN0xFRk0xSUJxMzRMcUpZY1NSQUlCSi9DNkZtL2puVDBkSUJy?=
 =?utf-8?B?cERpKzNiaWcrWFR2ejlhekkxdXN3bmtzb05jR1FFVFQ4cHRWTlViN1ZNcUh0?=
 =?utf-8?B?OTA1NUI2aVU3MlUzOFRKUU5UKzUrRzVDQ29Ca3VjRUNsMHptNENFRHc1aVBE?=
 =?utf-8?B?MXE0Yk9SM2MyVTByN2lxSk9zSnJLbjNyemRtTWpja3g1T1Y0OE1SWXc0Qmla?=
 =?utf-8?B?bWgvVzNRbnFLcEJJUXRLTE45TllNUVFhODhxRlQveTdxa0Ywb2o2RGJqM2JP?=
 =?utf-8?B?UmRZL050NFVocmhuVUhyQ0U5V29PbVRacGRKOEtHOUorVDZpbTJHSjBBdURj?=
 =?utf-8?B?VnZDS3dVM0FJTk83VDZQOXJNTEM3NFRseW1pdjdid1NKS3ZTc0UvaUtnOVJp?=
 =?utf-8?B?RDh6ZXRnMkQvV1lMUFZ5QUx3QlhPTC9GYXVBeTdaWWtXYk5JdWdoQnVWcysv?=
 =?utf-8?B?SWpGQUpGakxhU1NpajhFaWNsZWpMY1BLbG1XaVhTTlhLVXJ6VFpManNaa1Rh?=
 =?utf-8?B?SEwwWXV4dXB6YjhkaENDMUVFeldHNXJjNi9JLzN4K29BWkZnZmtQeXhiMnBr?=
 =?utf-8?B?bTIwdlhqdlVkZk8vZDlxRS9kdEJBTmlFaHF6SERpRW5FNjg5MjJrUmVwK1V2?=
 =?utf-8?B?T09MSXFaTElCUzkxS0tzbTFwYUFZR2dDQ1ljaTZqTDBYenpMcGxvdTR0TkRx?=
 =?utf-8?B?Qkw4R3B0RUl1d0gxUmhYZFRmQUtCL3dtTXU5MGVoaXdFWmV1c1hGY0dQMmlG?=
 =?utf-8?B?VWk4OHNjSGd3eHBvK2FKK2xBUUJ2SHptVHgzdGNqOG9DaUFqTDFoUG5iblpG?=
 =?utf-8?B?VHBjaVlmdHM0d1dzR095VU9haU9iQkpnQ3N1bTV0UnB3ckxRbFNic2REQWxG?=
 =?utf-8?B?YlEzTk9XV2x5SDVzMmZxaDE3ZnhaVy90RjAzMWhXR3kwRG9KVEhaRW0xSS9O?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c10c656d-6fd7-4cd3-bb3d-08dd6e57f4b1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 00:23:40.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qix/VQK8ZUXhO8UL1KdbF+d5q74eGNmfnNyfIjkY1z8fLED0mzVUR/psEcnIaSQqqz+BKwkApxeIga2J2dtw+k4OkD/UnWGG4Gphl4pFF8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
X-OriginatorOrg: intel.com

Paul E. McKenney wrote:
> On Fri, Mar 28, 2025 at 04:26:21PM -0700, Dan Williams wrote:
> > Paul E. McKenney wrote:
> > [..]
> > > > > Making the above change got me this:
> > > > > 
> > > > > usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’
> > > > I wasn't able to hit that with allmodconfig on x86 with a Fedora 41 build setup. What is the specific command lines you are using?
> > > 
> > > make clean
> > > make allmodconfig
> > > make -j$N
> > > 
> > > Though encapsulated as follows:
> > > 
> > > tools/testing/selftests/rcutorture/bin/torture.sh --do-none --do-allmodconfig
> > 
> > The problem is that uuid_t is not defined for uapi headers to reuse.
> > Perhaps checkpatch should be checking for uuid_t in uapi headers going
> > forward.
> 
> And for whatever it is worth, "git bisect" converged here:
> 
> 9b8e73cdb141 cxl: Move cxl feature command structs to user header

That makes sense because that was the point at which the usage of uuid_t
in those data structures became invalid.

I am going to have a firm talking to whomever added their Reviewed-by to
that... cue Michael Jackson's "I'm looking at the man in the mirror".

> > For now the following builds for me, but it is a quite a mess to undo
> > the assumption that that the hardware object definitions can not use
> > uuid_t:
> 
> Even better, this builds fine for me:
> 
> Tested-by: Paul E. McKenney <paulmck@kernel.org>
> 
> Thank you both!

Thanks for the bisect Paul!

