Return-Path: <linux-next+bounces-2282-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1C88C4A28
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0291C210DC
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 23:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557B685922;
	Mon, 13 May 2024 23:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSXXdCAi"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621D1D559;
	Mon, 13 May 2024 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715643793; cv=fail; b=a92A9aUMJOuRRmnRFKVi6nZ4nQ9vRqgXddyO/kGvCxX5hQaDgwq3nJOVfP8k4l7YlCCJfzJl2prrYJJnrJbbh/IbPBJx7WL+5opLSIATKNb+e8KM+xa23jed8RKy7GCI/WG3/jVAG4osxj498A83XmwlUQiTXsbg5FEoU14nu5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715643793; c=relaxed/simple;
	bh=Y5lNkWu08HZTfZGK20E8Sx/+Eke/4/MpzT2yGwQEcsc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lp6WcGiyQVo3olUshfrjQntI4gA7g0B9UEtnkTjznIV6YwEs7OIFdSljrDQ8GQ5z+kfphMPgR4H5YTRikxJa4lo4OCPti/+e9AOpOl8+frlnWpIrIoRxc9sqyDsZ0aWnNcvQ3GfNYlXm0dTugEVFu5kOtXrtlKgFfo9zh8/7/W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSXXdCAi; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715643791; x=1747179791;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y5lNkWu08HZTfZGK20E8Sx/+Eke/4/MpzT2yGwQEcsc=;
  b=lSXXdCAikAvIgY+qKjdUwxiTTOXMXZCGZ1YCBWl8v1dHAhZ35PiGyv+D
   wrp3X0HmIjCDS62QxbECrijkySTEVHC/zd/Wi8AshJ/orsblN8y4HFyYd
   md+Co6f8ZVwaQBinCv7tzZowb9qa+s3wLHHlt4eOG/25ftk3SXp5PUDyb
   SvUFHlNG95SQ5zlUbioQg5gb78EwicT678MyIbGlSaMUOAfN4at1pfF4G
   kDMkcKUKLjM+ODr78/6lbdPiinPcbiPrfi8N8LclIG25nDNAQhaCNzhKX
   CSNYv1wvJVGtSIDbPYFDYlGVFT2+e+9KTowbID5Z5SDKziDNnsA9YZEU+
   w==;
X-CSE-ConnectionGUID: vkOplWkjTS+d2yPMTYPVuQ==
X-CSE-MsgGUID: 5y3Ed5oaTsOH5mf96CCBbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22181690"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="22181690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 16:43:11 -0700
X-CSE-ConnectionGUID: H2aqL/9eRy+72Sy084VIWw==
X-CSE-MsgGUID: YkSTg9ZaTCuzNAPyPhmCsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30559414"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 May 2024 16:43:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 16:43:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 16:43:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 16:43:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 16:43:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTPY9pcTUCfIQi6LcHTtafEowFVn8UIonsx9qmbHojuwIFjoW+LB/76gTWQ52tMooLr35piLzmNv7OYhqECCFqCKeKyR7T4UlrTORi78vZpN8ut2Bd/h55SRcyfRMinDZBwFspXpk7LWTKDfzq7oj5Zq/xOq9iRTZTQt6AamKa1NXoIAUAtLou0BIRk3CPc1ns58ScO58hHUKIQJdjaVUshel/7UKo4X17SYytJ6nRDyWeXe1u36G800JM0fSOvebhfsUKgC4d7srNdfaAmAtUdlvTUKZMJpw0rXlIVLoUlF5wbVG5rbzwlcR1izN2PQsZ5OMQN3V4J+6BLcSwxAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5lNkWu08HZTfZGK20E8Sx/+Eke/4/MpzT2yGwQEcsc=;
 b=oTIzm3WTrTlTHokBSWs4DQz0xpGUnKoLRDG8Hu/E8huvTFV6pMstAut1FqaB+OXH8JtVd1Sdsue5Zwge132bEPqIaiP9TDOg8BvVfSYj9ixOtU9RwdrCbGdgrmIuZgDHJHjkQzpXYrc8fiQr2v5c7Popc87Na6m+c9QuceEcI7ZbnLYnlrzK0gyNxHvGvMG3XGlTrQaq5yMJs5HbVHh1ygTbkwOk+dD/23/KKng21RuS5PkOAXPQl2OQ1sed6Jm8+aUYmvnec1WH8elTGQJxHgCb8yER4NDPhCKg4p/ZTXmIJ0KfLdD7Hr9iO7RQNCGw6zMvfkNXUwtwJP6o+d0GnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 23:43:08 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%3]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 23:43:08 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the mm tree
Thread-Topic: linux-next: manual merge of the block tree with the mm tree
Thread-Index: AQHahJSf2FruIywPz0GjFzXI2Ycc/LGWFPMAgAAAf4A=
Date: Mon, 13 May 2024 23:43:08 +0000
Message-ID: <ea742b61053b3343485efa7e362839de6d677707.camel@intel.com>
References: <20240402112746.3864d8a6@canb.auug.org.au>
	 <20240514094120.0ae75f3a@canb.auug.org.au>
In-Reply-To: <20240514094120.0ae75f3a@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH0PR11MB4823:EE_
x-ms-office365-filtering-correlation-id: 732792b8-bf18-4e44-e994-08dc73a67191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?aU5sNWl3Wm1kQjFxMDhiNWQ2Zlc4L25YUXJ3SmJCaXBFNTJiRXpWNUF5NGVH?=
 =?utf-8?B?VEFHRFRQa0ZEVW93dGRLVGkxVFc4ZW9OQzBSWUJjRmNITUs1cUVCNXpVTGM3?=
 =?utf-8?B?R0NsRjN3aVNKL2hPMUVLcVhZZDNnSEVjaHJQMC9hQ3BKakU5ZmRYYldxWHdD?=
 =?utf-8?B?c0N4MEpTWUIyRUVHUGk0Z05EQkkySUkwVnJvWXRjNE9vc3hvYndoSTMvV2NY?=
 =?utf-8?B?Yk9HdE1JNnNnbDYyOGJEWkV0ZVVKUmVVZG1NMm1CM1hEZ2E2WXpHdHorUHpX?=
 =?utf-8?B?ZWFtckFXTitXYytZZ1EwNndtZVFjdTRkSEVaY3Fxa2R4c0pNMzg4M0labFpO?=
 =?utf-8?B?aUIrVkUvWVNWTXVMS1Jpa1JETkovamdicERpa0R0dUFFcm80cUlQb3F1Yy8x?=
 =?utf-8?B?NW4vNVQrSEFDUDIveGx1angwRzdrMUc2SjhVaDl0S1Q1aU5xeUlEVzdUdFVZ?=
 =?utf-8?B?ak5FbmpWam1wMEVtNzFPaDY3V2NrWTc3Q0kvbTBMVE9LYXBGWm00a3F3blR4?=
 =?utf-8?B?QVIzUXl3dGxKbktCQnZ0dDV5SXI0ZVRpWVJ0OWYzNDQxRmI0VDhxQ2NiYzFm?=
 =?utf-8?B?YUJqd29Qc1pEcGtCeXVvbmQvbmE2cy9MYW5UZW5lc3VEUlNnQTI3Rnp5Vk1I?=
 =?utf-8?B?cXFEcEdXZjJ1cnoybnZyWmpjYkJVYVVHdjRDRGVxQmRWQWcvOVhoL05OY3Ji?=
 =?utf-8?B?SGdWNUMyZSsyUzlTWFNJdGtUS2NuYUdDaSswcXBOaHgzSFVCV20rdGpaaXlt?=
 =?utf-8?B?L0lBWTh2Qlh0cjJmclVOZGFhTlRTaVZxSGp2OVNja0J6WmpreTI3TVp2Qm9k?=
 =?utf-8?B?cGZlWmc0Q0cyQXVJL3cxeDFRWjhuSnc0ZlNkZWR5OHlzc3JoblV4NnNEYmVz?=
 =?utf-8?B?eUt6ZVBwK3I0WXR5eFpNaXdxYTRUd0xGbldPcDRDNWZkOGtuaFZmNEdJRFRw?=
 =?utf-8?B?aS94YnBOdDlCNnlCQ25lc2dVSDZWQzlNTzBQQzlFVU1Jc1oyVVpLWWFSVVBu?=
 =?utf-8?B?M2FUSUczLzZ2QllQcGlFNmZTYXpXY2N5ZUd5R3p1Wmw1UEpicVFDSmxCK2U2?=
 =?utf-8?B?Mko1VDFZTGlVVHhuSGIwbjI4RUs1aG5nK1d5VThwLytXYVZoSjJLV0Npb3J2?=
 =?utf-8?B?YVlpbU5HN2tjOTkvL3E4SExIRDhXd2Vxc2JtOXVnY3RlSDJDMUpUanhoSi9m?=
 =?utf-8?B?cVpUVCtqL0U4M2R4cVFvTnNIZk9sYlNNQURZbXd6Z0FWKy9wVkhrMDd5SFQ1?=
 =?utf-8?B?Q1RzNEw3ZGlpN2ZlcnhaSUNPeE5xRlplSDREY3RieXRyVmU2TlZneHYvaTJi?=
 =?utf-8?B?Zmt2Y2JET2UyRG5Gcm1qT2hyUWdvZDVtQ1hnTld1N1RFUmZKdUgvYzEyWDQv?=
 =?utf-8?B?bndNTHBJaFRMckhJbmlsMEo3VmRVVExSSXhocEtzV0VkOGpPKzQxUTJ0L3VL?=
 =?utf-8?B?TG5Kcy8zdnpyTXhSTmxQa3FCZHRiTFd3SGxIZXY4MUdZOER2S1NFTUlxekxR?=
 =?utf-8?B?RSs0T3MrbEpMb05nTFZUSXczQnd0WnFaZnZwYm0zMlV1WVZ6djltd2lNek1Y?=
 =?utf-8?B?QlZBTEFocWplRGdUNktOSTN1ajFxVkt4MkFXSllEK0hOMVpCM2dydkk4Ym8v?=
 =?utf-8?B?dUNFejF4L3ZFSG5EK2FUSlhXbFRLcGZ3ZnB1cWJqNWdacXdtaGxnOEVESjFU?=
 =?utf-8?B?MUZtNUFHRjg1SXg5em5GOUx4V2UwWWg2eDRaRzNJbEhXcTBjYmhzbGEyMSth?=
 =?utf-8?B?Y0o1MGZ1NERldmpOUFVIQWFXRHlENU04UVpsWjZWWEE2dFFvbHFKc0ZZQlJs?=
 =?utf-8?B?SjRsTUxqM0NrTTlDbkMvZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXlyc2p0aktQRDhOSHRVM3orM1VLeFNzNlFsTTRENDBuQnUxWUR0bjJXaXBq?=
 =?utf-8?B?UEZLVzN3cGtOWXB5amZ6YUZaY2NPQ1Bld3hjYW5aU2FLODdVTTBSS3BpYTNY?=
 =?utf-8?B?SWFhS1grNHRLR0FVRDJyam5hT3NZMVJqcUdnNUMvbG9VWnpEZ3pXYVRQWnpL?=
 =?utf-8?B?TWdBbTZrWk85TGkycWF1Tm5oOXJJQ0VteVRCTURzUE9mcGc1bmpzN1o4bzdD?=
 =?utf-8?B?b3BUMEppdmdDcm1VV2pvZ0pJWXBaUGxWSWp1Y1V3bktvNEFQcFgxUWlOZTV3?=
 =?utf-8?B?VFF0K2tnUEl2bjVhcHhHQTJ5T0lRTWJpU0NXM1U2UnJHelNydlRTQmwzR2hE?=
 =?utf-8?B?U2ZBbmFBSnl0V21kM3dSMTkybDRtaTJYUDloMnVWTUhGc1Nud2dtWEFzbnBo?=
 =?utf-8?B?dkpDeFN0L1dSdEFqNlpFY3BxNjlwNGdCUjJpQjdNM0o0VW1ubzg2dWJZWVRO?=
 =?utf-8?B?dmZEQzg1VUtpaVFDRFYxWStsM1FnMjJvTVBVbFpFa2FYZUFDdzJWRFJPb25C?=
 =?utf-8?B?bkVtZHJWYkVySDk3YUZ0aDVtdFNYTXJma1RYRTQzMWlFakhSaXBnVUxtcVlU?=
 =?utf-8?B?TjVleWVZQlErdVg2TitQdXhBeTE2TmNlNDVmbGtWMk52VlU1TzlqVUU2MmtC?=
 =?utf-8?B?TnVPbktTbnhXbGVDNHErWTRtY1crbVF5QjF2d1lFbXlXRzM2ZzlNdlVnRGp3?=
 =?utf-8?B?bENPOWdvY3hlUnl4b0NDQTdWd3k5WVcwWHhpeTd6bzBlZGxJR081WlZnSGhy?=
 =?utf-8?B?L3dpMy9JSnhDUHBpNGxPQStGL0RjZUNuazB5M3QyMndJc1ZPd05hV3JhNldU?=
 =?utf-8?B?d1NONzZaVTdxNEtEaUkwczJ2U3VodlAwNk12Mmd0Y2RWU21ZenEwVlBpWWJn?=
 =?utf-8?B?V3Z1ODdaL1hPWFI4SHlYbjJNRFdVanJveVNCa1FETktqMGNrdXplN1AzSjNV?=
 =?utf-8?B?eFdsMHFoSlNvR1BaZTl6ZVV6M0RVcnhZMHcrSmdxN2xLYXRGUjlNZm1iZ0ND?=
 =?utf-8?B?djlNRzEzcDJBVUZka1RldTVCaDMzNFpRbUlOVmtNMFRTVG1GajExdTBtWkZS?=
 =?utf-8?B?KzJZK3B2WFJOaUUwUzFkYW0reUhaS2x5c0Z0RHRsYmNlVGNVNWhLdVBOdlJr?=
 =?utf-8?B?bkhjSjVyNDR6TTUzZml2RUgrcGxlakc2dzhqc3l0cENHd1RMcGRybXlrNkhN?=
 =?utf-8?B?b3hjNHJYRjQrTzBzUk5NdG5ocGNDeDQ1VnJPNTV1bFArNkNhaE91SjZLSk1I?=
 =?utf-8?B?RXBFUWZ4WW1HQ1d0L1BZSnA3V1ErV3dCY08wMzdLanpUei9Vb0drTlFKZ3cv?=
 =?utf-8?B?d3dxQ1p2bzR5ZUxXMWp0K1RiTnA2aXJLZThveVVweGFwR0R4WFZuZGw2bzJh?=
 =?utf-8?B?cFo0VGtBc3dCbHc1Y29PWDkyRTZzWnpCL0ZWU0ljTVRlenBpSm5kQkpqQzM5?=
 =?utf-8?B?bEoyNUxoZWRYQjZ0TU1BRzhvTTc3YmFDNkl0aDZnZ3g1Z0VTY3ZIcER5S0J3?=
 =?utf-8?B?R0F2a1hOSXR3NENabUdYU1o2RVNlSDh1eWxiaG9jQ0ZycWFqOWVaOVhEMDk5?=
 =?utf-8?B?WUhGb2Z1LzlVSTF0K3JYL1lxN2ZTdkhOenhEcUJ3VjZ3VGZZNGhWZUlHblZN?=
 =?utf-8?B?T0pJK2xFdndhc2laM1lub3dUdlQxVWdBQlh5cko1dDNvbi9lL3ozcDc3US8v?=
 =?utf-8?B?TVNpMUJtTjlEcmo3Q0NCWEVwdjhzZDhWUEgwYTA3bWpmYWFETnFYaTBob3A1?=
 =?utf-8?B?M0s2WHE2VVNYWG9jQ1BVdStpUDNjVmc2WUNHM3AzbnYxRVJpb1VKUlY4UGJu?=
 =?utf-8?B?TmV5RkpLUTZpK2VKNlBKRnAvY05MTGRsU0VYWTBIT0NLbHZoOFNSN0d1M3pR?=
 =?utf-8?B?MzRUL1h4UDhBUFo5d2RjSTJvMkRQU1lqRE5Cbmp1TEgvTlQ4dEc3QVZ4Zjlu?=
 =?utf-8?B?My9NMlZtU2pwd3UwbUY5QlZsZ1dFRzFaM0RqVEdReHNXVGJBRjU2Uktkbjd6?=
 =?utf-8?B?MjVMWXNwa3FpL2xrdGtMc1R6K1NPK3dRNFgrWVlnTmlkUStxQStOaCtsWDFD?=
 =?utf-8?B?VHVRRFVZK2IvK2E3Mkd3QjNYRFIycjhkbS9oNnZDOFk3cm9ReXVma0RacHps?=
 =?utf-8?B?Nlg1OERJMWlHZDlVZ3IySUprUzc4Wnc4d2NvREd6dFp4SElaWERSWk9Lazds?=
 =?utf-8?Q?BSyhJkNcvl+6Dfap98cRuG4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA84806468E1FB498A449D457CF64B95@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732792b8-bf18-4e44-e994-08dc73a67191
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 23:43:08.6872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYIQrdl2cPrN76zDcuJ8KKiIyla+f+EO0bF4b6hkrsZIaYTuDF0/cWbpiRkmoFsxVzygfueQ++YbF0yLP6kYDv0rP2EKjregTQwrDxzN3TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI0LTA1LTE0IGF0IDA5OjQxICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiA+IGRpZmYgLS1naXQgYS9pb191cmluZy9tZW1tYXAuYyBiL2lvX3VyaW5nL21lbW1hcC5j
DQo+ID4gaW5kZXggYWNmNWU4Y2E2YjI4Li41YzllNzAxMzJjZDEgMTAwNjQ0DQo+ID4gLS0tIGEv
aW9fdXJpbmcvbWVtbWFwLmMNCj4gPiArKysgYi9pb191cmluZy9tZW1tYXAuYw0KPiA+IEBAIC0z
MDIsNyArMzAyLDcgQEAgdW5zaWduZWQgbG9uZyBpb191cmluZ19nZXRfdW5tYXBwZWRfYXJlYShz
dHJ1Y3QgZmlsZQ0KPiA+ICpmaWxwLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ID4gwqAgI2Vsc2UN
Cj4gPiDCoMKgCWFkZHIgPSAwVUw7DQo+ID4gwqAgI2VuZGlmDQo+ID4gLQlyZXR1cm4gY3VycmVu
dC0+bW0tPmdldF91bm1hcHBlZF9hcmVhKGZpbHAsIGFkZHIsIGxlbiwgcGdvZmYsDQo+ID4gZmxh
Z3MpOw0KPiA+ICsJcmV0dXJuIG1tX2dldF91bm1hcHBlZF9hcmVhKGN1cnJlbnQtPm1tLCBmaWxw
LCBhZGRyLCBsZW4sIHBnb2ZmLA0KPiA+IGZsYWdzKTsNCj4gPiDCoCB9DQo+ID4gwqAgDQo+ID4g
wqAgI2Vsc2UgLyogIUNPTkZJR19NTVUgKi8NCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gDQo+IFRo
aXMgaXMgbm93IGEgY29uZmxpY3QgYmV0d2VlbiB0aGUgbW0tc3RhYmxlIHRyZWUgYW5kIExpbnVz
JyB0cmVlLg0KDQpSZXNvbHV0aW9uIGxvb2tzIGdvb2QgdG8gbWUuIEFuZHJldywgZG8geW91IHdh
bnQgbWUgdG8gZG8gYW55dGhpbmcgaGVyZT8NCg==

