Return-Path: <linux-next+bounces-6079-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43608A75346
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 00:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFFBD3ADD65
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 23:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665F61F130F;
	Fri, 28 Mar 2025 23:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BewvnLTq"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541251F098C;
	Fri, 28 Mar 2025 23:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743204404; cv=fail; b=nhcD37iKkc1M4K5IJR18zkpGFYZZXChY4FbUmff4gHDaYRIB0nbmVIc8v1IUFHXTF4X7RKKdLY1auIVZOaHB2qLEKEmQ2En5SZVorVkE6L6X2t1NiCNJ8/FoAnk9Rd9pCHumeDP8aFmok4uFPJVbLF86UxBVO2qyzKH+3JJhKKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743204404; c=relaxed/simple;
	bh=tET8QikcmHsmoq0kf8E1+0um0HFFD9bq8R0apxwYgGw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DbxB2GK47Bq4rFWC32PXJvzfP3dZp9gnws/+SC2ib7V12Nn02r2w7VcCI5Q0R1L1BnQlbJ2VRqwnUbwNIAwXj99gobH9/zfVvVETg/OE3mOC/apoN6CmYPE7tz4ehNl6gHyYCpT0dSwbhWnEOEACxrzUqNHe5G/lBAFsbfz11xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BewvnLTq; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743204403; x=1774740403;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tET8QikcmHsmoq0kf8E1+0um0HFFD9bq8R0apxwYgGw=;
  b=BewvnLTqvjAWf+QAgIvTiAzda81ycTvx25rFHUW1uxdZjdHPsl0gYHgr
   Kk5jFJdhBFW+s6Db6ZZezV3wFu+/zcN6iWsoNJr5IYu71jt0Xcy8avS+3
   hwhzJCcTSRH7pI+98ylvT9s/vrDsca9n8vxCaZSSg29qnd/9uJAsYomul
   cJ1iqALO0zcP2f+RJf6FOGYFAgVla+2sWyuDhcI3CWb30h3FMiNjp43c/
   E/2oXyiWrLUXRaUvhMFjPQ3oRoT/t0vAN3eZqNmDpXr7yRhZuC7MX/Kzq
   b/t4BXxuoSiV+uh8ldty8a6/0PXE4/dyQKmq1bNTYmn0kAFjGQbUaAx3O
   w==;
X-CSE-ConnectionGUID: VBFreQIeTQyKiUGY80Lppw==
X-CSE-MsgGUID: xeESzvrLT1GPvCKHv9eT1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44489949"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="44489949"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 16:26:42 -0700
X-CSE-ConnectionGUID: w1bW9qsfSyWqGz2z0gValQ==
X-CSE-MsgGUID: fzRsloItR7SA/qHGrpPxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125572998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Mar 2025 16:26:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 16:26:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 16:26:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 16:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxQRA3I5TfTZU8JAiLE3TPPdSk5gUtyjkSq0PkEc0kJPqkC/Amm6gda8bSXNKOHR2m0mZEwt4PA7KSuUcQR19j6AJ/WCLIWwTCDc+SeMbim0Wi9kFXhWw+FV0q017mEU8iAOCx/sQgA+6aCCxa+qz0aYtYQ1VxQAG/pWsMp1Tfe6+FJhjOuOYkWmAbYLaEiaLFMqHzVwhLLsuOmyTldScQlSPgFRw7KvuGH8nv7A+Pu4eLxHzeix2LcFDWj1880kbqFSq6ssSxjHbO+fdRhAODx/WTRd0qzeNtJ0fmUHylB52u4JZq/zgl11GDPcUJLzCwTokHDGpUMJr/fHDPxplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmRDgsjsRQxMyieh+vYhh50F5J9OarVKcXLlxJsLj+M=;
 b=Lt98wDebAAasad8JrsWroh0koDrkTDyNL3AFADtm/h+VZkSbg+JPTKB3z94Eus1kwIg+TOdaHjZd7R5Kw/WlfvAi8m//ZQDsu1eIijeeLbiBxz5JzL3jWJ03GqzzNKFtjfQtOZQHiSZCyeVaszP5BpcGfvXR7THbsi9eLeEcHiy2FbwT7NEAbsPiw8cQwpMqBbm7kdb9/ZyUBymamYqgcnNgTVcx1mP6nBBUMOhD3L4IMMsD/H6g1sbgYGjssxCf4opVTzjzFHVUyO1GAEcuwQuXqUw92hj1bjlqM0u0EfDCPtfalp83s5olLozpGq4b9ElDUFx9TKhE/UV3aoS7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 23:26:24 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 23:26:24 +0000
Date: Fri, 28 Mar 2025 16:26:21 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, Dave Jiang <dave.jiang@intel.com>
CC: <linux-cxl@vger.kernel.org>, <dave@stgolabs.net>,
	<jonathan.cameron@huawei.com>, <alison.schofield@intel.com>,
	<vishal.l.verma@intel.com>, <ira.weiny@intel.com>,
	<dan.j.williams@intel.com>, <gourry@gourry.net>,
	<linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
	<sfr@canb.auug.org.au>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
X-ClientProxiedBy: MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e53bed2-c9bb-4831-dce2-08dd6e4ff4b3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFhNZThLd2w4eGlFOG1FMjJvNXBZQUI5R0o1RGNEOTJnampnOEYyV21PWVJk?=
 =?utf-8?B?OUpwTmlkbCtDQTg5UmQzZ3Zra3lhWGNCekhBSE5jSXV5bHRpZW1ESTdCQTBp?=
 =?utf-8?B?ckRGSnZEL1VKTG1pcklEUWYyVThKcTVYalJ0Q0t1SzVBMll4Z3RDSnM1RzRE?=
 =?utf-8?B?aElQTEVaQmlSYkUza2JyaG93dWhEMkI4V1o0WkF5RFVhalMvTU4yVXFkdFFk?=
 =?utf-8?B?R25WMHZPTzJLeTdHRXBaekZPNE1Nc3dYY3o5TXk2UUNYSEhXdXhMeGcvMUIy?=
 =?utf-8?B?dnhxN29RbXZEZ1RPaG5uNHp3bzJWRlFOK0hlVEwwZ2ZITkllMExSNUd4WDZj?=
 =?utf-8?B?Ukk0M3JpYy96QWp5UEJCcHRhZm5Wb3N6VS96NlBCZS9VN204eGdBK281NTBr?=
 =?utf-8?B?eS8vR0lITzhBQjJkQWkrNTRsREcxVWIxeXErY05sYnZPekROVDhrbkszdytU?=
 =?utf-8?B?V3h2MmRwdW5PTFkwOWdndHdQTWIvMEJHYVVzQkVFaEdVdFhOM3pKOVROeG1U?=
 =?utf-8?B?V0tOQ3RsbjFDWUJwbHJZUVBTRHJjMEE1amNWMTF1dlRLWEkxcXFqcnovVmJ4?=
 =?utf-8?B?enBiTnp4TEkyb1hMLzBic2ppMzhhZGJGOEtLU2ZGV0ZQYno5enEzR0J3c2cv?=
 =?utf-8?B?VWJ5MTBlUDV1RFRnWFJydzR3cVNMZjVDdVlCNnpRYXhQRjlrb3BKVW5JQSty?=
 =?utf-8?B?QTFHc3M2Z3dUUW90S05lOWxmVDEvU29EYUZ1clF3YUQrenI2MHcybi9yL0xz?=
 =?utf-8?B?eGFYb0dkQXk2cnQzWGVQNGV2VUlNTXhHNGpGQXBueWpROWhvZmxSZUhjVjRZ?=
 =?utf-8?B?ZFl3VlFDS1VyOTRheGJGaGxIYkNKbWVEbEZGRGtpa0krWUM1STEwcXJDM0FI?=
 =?utf-8?B?d2psaDN5N3JkUDVrZENDa3dVaVRMeVFqdUVwKzVHOTdLeDBDOCt3SEh6QVNm?=
 =?utf-8?B?T2ZycEt4VHNpdTFnUk5mSnFjdjZYTjZoZ0FHbTNJKzF4b09TRXU4d1hnK2Qw?=
 =?utf-8?B?K2Q2a2VXbFg2QWRabnNOOWsrcmNXQ25UQkFiTTBGZnFmeEFTd3dtNWRsM29P?=
 =?utf-8?B?NVVXcUtsN2ZBdFFoYUFZbXJNYWhMdWV6MXhZMVNTZnhOb1R4NHlNbkkyaDUx?=
 =?utf-8?B?S1I2d3o0eFcxN3k0S2xVcmk3M0g0T3RhL205RnRTZUJ4bWhhbzgxZzBuOGQ3?=
 =?utf-8?B?cGJocGxLaTNYWnVuaFdkTUxvZjZCL1RJYUpFQnc2L3dVVW9ZM2FBM25xblNi?=
 =?utf-8?B?VlNySHJXZDNqTk1KRlY4aWJkUmpzWWNiS2p0TGJYMWpoMnhUQ2xpVGU0VHZt?=
 =?utf-8?B?bk1XSkpDVERNR04wQndOY2JKd2JCaFF4cmVrQlEzSFczeVdxWFk1VVlmSG1T?=
 =?utf-8?B?R0FKYktZNGg1MUJjWFYvZXdhSHg0c0E4QmdSemRhRmZzcmJWVGtiMEhsSFZI?=
 =?utf-8?B?RnVwOTVuM3IyU2hpTCtnTGFBVTNlSGVxZDRoR3A5K1FBcEYycjFyTTlmTDIr?=
 =?utf-8?B?YTlqMCtvYjJla0liV0czTEgxUUp5TFczVlUvNE1PNWZnTHhUNTJpS29QWC9q?=
 =?utf-8?B?MndEZDQ2WlVDYnRPUk4wWkhwYmszaUpOdy9MQzk1OWVZamh2Y2ZyTjk0UFdU?=
 =?utf-8?B?cldDcW9QcktUcmRBUWNMT3F0S2tYV2JNVE83dVpsQlpSWUxUSnpXbHFGa1g2?=
 =?utf-8?B?ZTh3NXJOTzFIalVkTWJvVEJCNk0rbVlHV04yNWFENUhJQmR4cTZiY24rZmJ3?=
 =?utf-8?B?WTU1TS9KdFZmSG5jcUp6N05EekN0aUhJNG9CNnlOWVdFUUhST29mVUZqdHFV?=
 =?utf-8?B?VG9aMVc5cmQ4TWRacS8reHpKOUpwNFNxRjg5cnAvZ0VLOEU2K05xalJzd1p0?=
 =?utf-8?Q?iV6e5Q0FTK/vi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUVVQ1ZTMlVFd0hTUGxFVWZZbjF1NW9OYlNnbWlhT2M5cTZnTjFpbXdiY3RQ?=
 =?utf-8?B?aXR2dXNmbU1ya2cwd1VnUFJZcWVkcGZ0S2J0UjJPblN1ZC9JMzdCK2pWWS9V?=
 =?utf-8?B?VWsrSEsvZThPNzd1WGhJb0p2REEyd2FCWld5UWx6eU94ZTZUSEtxQmJ6OHI1?=
 =?utf-8?B?c2ZCZmxZdzRmd2gxUWkxY2hFTGxWNW5WOENKNzhDbGlIRW1aWGVYSUtqV29z?=
 =?utf-8?B?djYxSEd1WjVyYzRwN1Z1dDUrWUF1ZEtoV05vcXF4UGZZVnN6Z1U2bEcwaEFq?=
 =?utf-8?B?L3ZzSnBPVXJieWQ5UElaN0JCVmh0Z3pSQXg5NVZsVEVvMVAwR0pmUXBVamNC?=
 =?utf-8?B?cnQ5Tm9YbitUbm1TV2UyOEJLcWxZTitDR0xhVXBCN1JvUUtJdXhSWkJiN3hH?=
 =?utf-8?B?S0l5MmhaMzRzeVM5NUFxQi9HcXduTTRabVVsZXRoekNEcG9zOTNmYStoZ0Vq?=
 =?utf-8?B?dFltU0xEN3V6R0xuSDFYZnVkbFBUYjVWUkNGdmJaZVUzemJQVjgvSW9lQW1r?=
 =?utf-8?B?QU1DV1lOZndRTklocmUwOXlqT1p5QXFDMUdQM3ZzN3diT25HNiszVXplY09Y?=
 =?utf-8?B?bzFHVDZ4bnVoQWxrRWFVNFpzczdrUUw3WDlmNzNuNjVBcjUrNkN6eERSRGoy?=
 =?utf-8?B?RWpidXl0OUtsTTBGOTBmblhodzZqOWRENm1aRTJGZTQyTytRL2syZ29iNTFh?=
 =?utf-8?B?QWZQM3oweGdZRXo0eE1xcDYzenhjRDg2ZHpqMUUvdlJ6V2FpRSs1bFkxM0p2?=
 =?utf-8?B?T2Y5YkR6TC9yWHlCZ2o4MWw0TTQwNi9Oc2dCZ3phcXJWV2l5dmJkaFc5cGpO?=
 =?utf-8?B?dXlld2Z4L2kxaXBva3Z1Nk5nbTlPYVFvRDZPY3VPeE5wY3h4MDdyV09uMFVm?=
 =?utf-8?B?Q3M0S1FWRmxxOVZmOWdabGJ2a3I4TldoWXRaYlIzK2d1RVhPWUJkYTdSdVlu?=
 =?utf-8?B?WkgreTVMMGMyTmJoTFgwUnpsaG4vYTU4eUlJMzZ5MWxWajViV2d1NHU4bkJt?=
 =?utf-8?B?WFpPYWhCZUJhRXhOY3NxdHhXNnNIUjcrdjFVd25DWExmcXpOd21VS2ttQTht?=
 =?utf-8?B?RWttNkJCRmV3ZDBiTGdVSjE0YTdXMTNPNTlDRVlCdTZkeFU2enpjYkRTa2VX?=
 =?utf-8?B?blFYeXhlem9XNjducUc0MEg4VFFwWnIrZlNMOVpWdHQwZjdPS29odHZhUzE4?=
 =?utf-8?B?NGYvbDhrUExZblhHcUs0Rmo1YXVxYWtZVUhJUlQ1TVl6Sk1nRnBqK3Zqbm5u?=
 =?utf-8?B?cHpTYkxWVmNoTHF5eHcrWktZb3dBWDg3eTkvWm9PMjhwUEJKM3FEZUNZb3g2?=
 =?utf-8?B?N3BZSW9pYTJ6cHJLUzlBZlJjUWcxSk5pT3A1d3dlY2ZuS3YydW1QQUVoOHR1?=
 =?utf-8?B?ZzR4Nlg2bzBaeDF0TlFLWlpUaEVVVU1UQlJWdVRpRUMwSm5aVy9yVUpZaWFu?=
 =?utf-8?B?U0dBWEE4VEVrU001SzhLYkk4QmxTcWVFQjFCRUFoeXBDVHVPSzhReERIWGxL?=
 =?utf-8?B?eW9WWCtGTGlXWjNKbkFHUXVKZDdCRjZQQTcvL0FRbUxFQjlSTEtGYzJVTHZ1?=
 =?utf-8?B?OWt3SkxtTnUvVk4xVmRUNUwzbERibmJ2Qmk2dis1ajk3YUdMdnNKaXBrbkxB?=
 =?utf-8?B?ejNQT0RqREVDNzhpSUhoT2pWWnpJZVZRazZ4QTM3TkJVa0ZOL3BnQzBhcG9v?=
 =?utf-8?B?emk2TjZRdUdCSG1MVUN6aHh3NzhLS2ZrTUJWNmhIT1FDTy85emZhd3AvZDlt?=
 =?utf-8?B?L0VteWt5bUpCZ0d4RWtwWStrMlpwaUg3V0FWRXoxUWEvZi9lbkZMRXlmdGFD?=
 =?utf-8?B?MjEzdFJjVHMrZ0ZGaytnYTdkbGQyb3lZNldNcWtjNlJ0MHhxWDgxRW9Tb2RD?=
 =?utf-8?B?OUg4M3BxZXE0MjZTdmhlYThxTlAveG9CaE92TUd1a01NanBoQWZwMHQxZVJo?=
 =?utf-8?B?WllIRDFVaU9XYkxHbUNvUTVFRTA3WXJ1K3lKekE1R0g3ZjdXU0NSbEZRK2hi?=
 =?utf-8?B?bFViMVdzZmpWSWdRdHMyR1Q3R0tXWHF3SnF4c2JIQnIrWEZDQTZmL3hjRDdz?=
 =?utf-8?B?Q2VURmxLNzhUMUVXbEU0THdPQkdFcnp6U1M0bVcwV285YnJLRWFOcHZZU1Zz?=
 =?utf-8?B?Yys0TEw4clFaaWIxUEdsdWJiUk56L0FmTEpyZCtKaG43SHlVa28zdUcraXgz?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e53bed2-c9bb-4831-dce2-08dd6e4ff4b3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 23:26:24.4812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zanTg5yYMTLfQkzG09Eex5bqd5TgT0+VkZdbbSOOVQu7xN7D/Pi3v6GFQaIPydEz7nTj0pv7P3ckrbiCwk3UMxpH//vhd7IXq1BTG5citf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
X-OriginatorOrg: intel.com

Paul E. McKenney wrote:
[..]
> > > Making the above change got me this:
> > > 
> > > usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’
> > I wasn't able to hit that with allmodconfig on x86 with a Fedora 41 build setup. What is the specific command lines you are using?
> 
> make clean
> make allmodconfig
> make -j$N
> 
> Though encapsulated as follows:
> 
> tools/testing/selftests/rcutorture/bin/torture.sh --do-none --do-allmodconfig

The problem is that uuid_t is not defined for uapi headers to reuse.
Perhaps checkpatch should be checking for uuid_t in uapi headers going
forward.

For now the following builds for me, but it is a quite a mess to undo
the assumption that that the hardware object definitions can not use
uuid_t:

-- 8< --
diff --git a/drivers/cxl/core/features.c b/drivers/cxl/core/features.c
index f4daefe3180e..d626dd7c5fbf 100644
--- a/drivers/cxl/core/features.c
+++ b/drivers/cxl/core/features.c
@@ -33,7 +33,11 @@ static bool is_cxl_feature_exclusive_by_uuid(const uuid_t *uuid)
 
 static bool is_cxl_feature_exclusive(struct cxl_feat_entry *entry)
 {
-	return is_cxl_feature_exclusive_by_uuid(&entry->uuid);
+	uuid_t uuid;
+
+	import_uuid(&uuid, entry->uuid);
+
+	return is_cxl_feature_exclusive_by_uuid(&uuid);
 }
 
 inline struct cxl_features_state *to_cxlfs(struct cxl_dev_state *cxlds)
@@ -228,7 +232,7 @@ size_t cxl_get_feature(struct cxl_mailbox *cxl_mbox, const uuid_t *feat_uuid,
 		return 0;
 
 	size_out = min(feat_out_size, cxl_mbox->payload_size);
-	uuid_copy(&pi.uuid, feat_uuid);
+	export_uuid(pi.uuid, feat_uuid);
 	pi.selection = selection;
 	do {
 		data_to_rd_size = min(feat_out_size - data_rcvd_size,
@@ -282,7 +286,7 @@ int cxl_set_feature(struct cxl_mailbox *cxl_mbox,
 	if (!pi)
 		return -ENOMEM;
 
-	uuid_copy(&pi->uuid, feat_uuid);
+	export_uuid(pi->uuid, feat_uuid);
 	pi->version = feat_version;
 	feat_flag &= ~CXL_SET_FEAT_FLAG_DATA_TRANSFER_MASK;
 	feat_flag |= CXL_SET_FEAT_FLAG_DATA_SAVED_ACROSS_RESET;
@@ -360,16 +364,19 @@ get_support_feature_info(struct cxl_features_state *cxlfs,
 			 const struct fwctl_rpc_cxl *rpc_in)
 {
 	struct cxl_feat_entry *feat;
-	const uuid_t *uuid;
+	uuid_t in_uuid;
 
-	if (rpc_in->op_size < sizeof(uuid))
+	if (rpc_in->op_size < sizeof(in_uuid))
 		return ERR_PTR(-EINVAL);
 
-	uuid = &rpc_in->set_feat_in.uuid;
+	import_uuid(&in_uuid, rpc_in->set_feat_in.uuid);
 
 	for (int i = 0; i < cxlfs->entries->num_features; i++) {
+		uuid_t feat_uuid;
+
 		feat = &cxlfs->entries->ent[i];
-		if (uuid_equal(uuid, &feat->uuid))
+		import_uuid(&feat_uuid, feat->uuid);
+		if (uuid_equal(&in_uuid, &feat_uuid))
 			return feat;
 	}
 
@@ -461,6 +468,7 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
 	const struct cxl_mbox_get_feat_in *feat_in;
 	u16 offset, count, return_code;
 	size_t out_size = *out_len;
+	uuid_t uuid;
 
 	if (rpc_in->op_size != sizeof(*feat_in))
 		return ERR_PTR(-EINVAL);
@@ -477,9 +485,10 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
 	if (!rpc_out)
 		return ERR_PTR(-ENOMEM);
 
-	out_size = cxl_get_feature(cxl_mbox, &feat_in->uuid,
-				   feat_in->selection, rpc_out->payload,
-				   count, offset, &return_code);
+	import_uuid(&uuid, feat_in->uuid);
+	out_size = cxl_get_feature(cxl_mbox, &uuid, feat_in->selection,
+				   rpc_out->payload, count, offset,
+				   &return_code);
 	*out_len = sizeof(struct fwctl_rpc_cxl_out);
 	if (!out_size) {
 		rpc_out->size = 0;
@@ -502,6 +511,7 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
 	const struct cxl_mbox_set_feat_in *feat_in;
 	size_t out_size, data_size;
 	u16 offset, return_code;
+	uuid_t uuid;
 	u32 flags;
 	int rc;
 
@@ -510,7 +520,8 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
 
 	feat_in = &rpc_in->set_feat_in;
 
-	if (is_cxl_feature_exclusive_by_uuid(&feat_in->uuid))
+	import_uuid(&uuid, feat_in->uuid);
+	if (is_cxl_feature_exclusive_by_uuid(&uuid))
 		return ERR_PTR(-EPERM);
 
 	offset = le16_to_cpu(feat_in->offset);
@@ -525,9 +536,9 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
 	rpc_out->size = 0;
 
 	data_size = rpc_in->op_size - sizeof(feat_in->hdr);
-	rc = cxl_set_feature(cxl_mbox, &feat_in->uuid,
-			     feat_in->version, feat_in->feat_data,
-			     data_size, flags, offset, &return_code);
+	rc = cxl_set_feature(cxl_mbox, &uuid, feat_in->version,
+			     feat_in->feat_data, data_size, flags, offset,
+			     &return_code);
 	if (rc) {
 		rpc_out->retval = return_code;
 		return no_free_ptr(rpc_out);
diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
index d6db8984889f..1e3323854994 100644
--- a/include/uapi/cxl/features.h
+++ b/include/uapi/cxl/features.h
@@ -8,11 +8,6 @@
 #define _UAPI_CXL_FEATURES_H_
 
 #include <linux/types.h>
-#ifndef __KERNEL__
-#include <uuid/uuid.h>
-#else
-#include <linux/uuid.h>
-#endif
 
 /*
  * struct cxl_mbox_get_sup_feats_in - Get Supported Features input
@@ -60,7 +55,7 @@ struct cxl_mbox_get_sup_feats_in {
  * Get Supported Features Supported Feature Entry
  */
 struct cxl_feat_entry {
-	uuid_t uuid;
+	__u8 uuid[16];
 	__le16 id;
 	__le16 get_feat_size;
 	__le16 set_feat_size;
@@ -110,7 +105,7 @@ struct cxl_mbox_get_sup_feats_out {
  * CXL spec r3.2 section 8.2.9.6.2 Table 8-99
  */
 struct cxl_mbox_get_feat_in {
-	uuid_t uuid;
+	__u8 uuid[16];
 	__le16 offset;
 	__le16 count;
 	__u8 selection;
@@ -143,7 +138,7 @@ enum cxl_get_feat_selection {
  */
 struct cxl_mbox_set_feat_in {
 	__struct_group(cxl_mbox_set_feat_hdr, hdr, /* no attrs */,
-		uuid_t uuid;
+		__u8 uuid[16];
 		__le32 flags;
 		__le16 offset;
 		__u8 version;
diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index f2957a3e36fe..d0276ab3a92f 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -1397,7 +1397,7 @@ static int mock_activate_fw(struct cxl_mockmem_data *mdata,
 
 static void fill_feature_vendor_test(struct cxl_feat_entry *feat)
 {
-	feat->uuid = CXL_VENDOR_FEATURE_TEST;
+	export_uuid(feat->uuid, &CXL_VENDOR_FEATURE_TEST);
 	feat->id = 0;
 	feat->get_feat_size = cpu_to_le16(0x4);
 	feat->set_feat_size = cpu_to_le16(0x4);
@@ -1441,8 +1441,10 @@ static int mock_get_feature(struct cxl_mockmem_data *mdata,
 			    struct cxl_mbox_cmd *cmd)
 {
 	struct cxl_mbox_get_feat_in *input = cmd->payload_in;
+	uuid_t in_uuid;
 
-	if (uuid_equal(&input->uuid, &CXL_VENDOR_FEATURE_TEST))
+	import_uuid(&in_uuid, input->uuid);
+	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
 		return mock_get_test_feature(mdata, cmd);
 
 	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;
@@ -1485,8 +1487,10 @@ static int mock_set_feature(struct cxl_mockmem_data *mdata,
 			    struct cxl_mbox_cmd *cmd)
 {
 	struct cxl_mbox_set_feat_in *input = cmd->payload_in;
+	uuid_t in_uuid;
 
-	if (uuid_equal(&input->hdr.uuid, &CXL_VENDOR_FEATURE_TEST))
+	import_uuid(&in_uuid, input->hdr.uuid);
+	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
 		return mock_set_test_feature(mdata, cmd);
 
 	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;

