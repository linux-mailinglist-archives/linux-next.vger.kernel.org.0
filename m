Return-Path: <linux-next+bounces-6112-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4652A76C4A
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 18:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A50E16B38F
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 16:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13AF2147E0;
	Mon, 31 Mar 2025 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZ24fBou"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD7C155725;
	Mon, 31 Mar 2025 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440107; cv=fail; b=Xb2NUiCxrtst57gKfhPmMbghWyfIqpwUV6hxG3GMaNa6qcqdP+WU8tMdrbGW8OFC5XznsHNqGz4sVT7MRBKaAvSKNElobEmffBfpIkeBf9xhuyAJeFGjDG3pG4H8u0iMdhyWuRJtxhnCYSn/L+hKMA/XmkDWCApE1eINtdzrlEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440107; c=relaxed/simple;
	bh=IjQKRFRrqTLmkImgnBrW1WZ76XX/cXBqxY36Vu5B5EQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HScRexPdvw/LIpnP5FkKmxLLd4C4NcrGxANIXhS3eXaW1nJIaRx36q4xvBOCGMw5Go+uP1byxs+UYAmGI1N3bJ7QpqiRWicYN7mjot4Utiu6GczJDoTL1Bkd4r6CjBYWX/IYVRPm1VjiWMyTXK65w4qqurECgx6/h7UzRawe0jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZ24fBou; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743440106; x=1774976106;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IjQKRFRrqTLmkImgnBrW1WZ76XX/cXBqxY36Vu5B5EQ=;
  b=WZ24fBouITgakca9ujr8t6tBObb8nP1imdQ8svut9VGhnyupei3Kd3ot
   GAqLf1sEFMXFZblNqzxlOUcvfgLTU7OHg1toVF/7rWmJivv5OioNajORw
   4gs5Epb/6iQSErlJlKXtj3/128aJGG9+w7nMVUZjYwgq8Gju7enScr/kz
   dTKfMb57XO0c3CWNIdNcDgTiSsktt4PgR1agPjo5atJmc0PPBJSU/4ukP
   SD+Gb2mmu2BJnE1xZdAx6D38F74pIAiIXKNtSTJvF3Z8ScxutnnUF5/zX
   m242lTTMH5W+91G+Fbovd0LmZ0YiytlD4sTrZ7XA3+FO6QXCthujqFtN2
   g==;
X-CSE-ConnectionGUID: FIZvm+1qR5KSBYt/n7VgWw==
X-CSE-MsgGUID: gNReHTtjT8iaKYbIGAQfNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55394788"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55394788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:55:04 -0700
X-CSE-ConnectionGUID: v+YSU/ocSjecvi6JEgRFOQ==
X-CSE-MsgGUID: N3SG/9XuQd+/CcRzInu3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="125894346"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 09:55:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 09:55:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 09:55:03 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 09:55:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2HM+rJvvLvlHRtMN10og8tzsyfEhPOF3HoVHKlcIFQtiN0eCh4mfgWHoQ0eQsdj/W31S57ApNZ5vZqMfvalADS9Or5EYpWdK6RvUWAkENkvb+/UlQu8M/mDgPJuVuBp8D/8yB4NVVIsV5GRTL/t0LQjLwlael4SNoN1nzX72fuo2YAIs6GJTKwaRDd7k5wgwFRdQiJYflA7v9QZcC5HumgjVurQ74lcLHikRFPrWQX4Ftkbm+2srYBWORvzvLKLXhQpp65dzkyy8B02SanSrRewWWFV+KJWg8J5ahEMMtHhQYY0Cn0wfOOqCgsliIQ5jKX/JB9S0C3c34inuLyOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ41ZShVTqCA6BxS+ep8Q3NdpWz48u8I7QyRUxxvBfE=;
 b=qwc/esa9aOP+Erw59jwsSI5GSjdv9Uk7aKBuKoHsMYMF4VevF46zhjjOXz36yRKv3WRoruuQsNsCvg/VZYuXuI8p2guT912h69TW0ftH6T1dfl4ChDBFqRRLGEcqlEKoMBCApQEBXUOl9pnWH7RcipcVNma7USlBCDbxGAGmDzEbQW9vzHFPm8DE0HtlIjspo3800SrkfCzqM48qSY6pFc3PD7JvrNU9ths+5nignBODsSxPP3cBoChFUUh0hNSpfO9F+lRRTrkOOXla06GkukJB2tqww0uVpkq9oBwuYnsmstnXWiT26jmVRVuZg0nZDnTRELZ26QK7Ph0gyHLCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ2PR11MB7671.namprd11.prod.outlook.com (2603:10b6:a03:4c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 16:54:58 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:54:58 +0000
Date: Mon, 31 Mar 2025 09:54:55 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Dave Jiang <dave.jiang@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, <linux-cxl@vger.kernel.org>, <dave@stgolabs.net>,
	<jonathan.cameron@huawei.com>, <alison.schofield@intel.com>,
	<vishal.l.verma@intel.com>, <ira.weiny@intel.com>, <gourry@gourry.net>,
	<linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
	<sfr@canb.auug.org.au>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331132439.GD10839@nvidia.com>
X-ClientProxiedBy: MW2PR16CA0064.namprd16.prod.outlook.com
 (2603:10b6:907:1::41) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ2PR11MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9b0f57-093f-4d9d-68ee-08dd7074c4e9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVduR3ZMUnRxRUVrWTVvdHByNTNrRHZIamQzUE8vRXRYNDJ4N3VzZVFRbisy?=
 =?utf-8?B?UmMrWE1iMkpoUS90bk1GSnE5SENaclpSdkxLQUpZNDNaT3hRaFZFSW9kanM2?=
 =?utf-8?B?T2podFMwRTZxdjU1TC9ZZVJNR0poc2FJalJ5WWg2TWNDczltQTBXYU5GTGhi?=
 =?utf-8?B?dnV6eTQvUUtSak5EcXI5blRrcEdaVGdhTENzRE56cDc1dC8xeEFMTzZXZW5R?=
 =?utf-8?B?RHhFaWY3MFQ2ZzFjVGd0M29UelJZNm5scjI5SmlZdmJlNTVYUFlIYTZrcnJP?=
 =?utf-8?B?K3pWV3cyOHZmWE1kZzM5M2FvUmVxRUs3anVCQ3RuZGZ4Z285TGg4UHV1VlRH?=
 =?utf-8?B?NHc4N0pSRCtmb1RUWDc0THczeUVtVXBUYitvSlBnQUUrZzc3UXVzQkQ0bEJu?=
 =?utf-8?B?bkh1c003Q0ZHZnVsYU5QTzBhWm5FbVBqV00ycVB4bUliQUFzbHU5cENaRVpE?=
 =?utf-8?B?S2p4UlIyRDg3aVpDR1Rpa01iMlZLSjB1MDUwcWZPYzZraWRVZG8zUCt0WmIv?=
 =?utf-8?B?Y3JRL01JSzBXQ2tJMW5wRFYvU3FYSzR0SUhBN2dOSmxEbjI2dkJTWDRmUTY4?=
 =?utf-8?B?ZW1sK2JNL3A2bmYweUFWczVlTTREM2tLeUdpOHhsQWU0NXBWbllLWFJJeUxW?=
 =?utf-8?B?NXU3dytuZXc3M096L3I1RFJkTTlUT2drbTFqbUVlQk1xTjhwSlZoRDQvNElv?=
 =?utf-8?B?VENDZ3daZ09UOUZoaVZmQlAvLzNJQ04xcHVNb2N2WGlZOWlpU3lSaGJFbVJo?=
 =?utf-8?B?SGZYUHFzYXdsMU4yOEpHLy83QzFtM21RUlVka3dqWGxhRlFyL1dGaTArRTdC?=
 =?utf-8?B?a2lyV2lmazgzRkgyajQyTDNGTXJ4RlF0dThOeHVPTk5MQitvcHdBTjdNbHJ1?=
 =?utf-8?B?b3VZbVcyUkJ6NnpMVnNIY09TNGkvMXhiS0JyQVd0M2MzR2ZNVWlvRXkxaTV0?=
 =?utf-8?B?akI5WW52WU1DTlBudC9hSWpsUmQySFB1NnpvWHh2RkQrK2NFY0VJak1HOW5L?=
 =?utf-8?B?YmRkU3NYaHQ0cjVmRG5od0Y5Nyt3dHpTUzBHeDhvUDBncGxQTFRRQnBpQkxn?=
 =?utf-8?B?cEQrdWEvZ1FMblJJN2xBUFplUnBjcTVJUTFQRkU3YndROWNTLzdtbEFXdGlj?=
 =?utf-8?B?S1BwY2tWcSttWis5ZERiOUhuU01ERGhiWSt4YngxMTdJUWNVMGN0R3pDT25p?=
 =?utf-8?B?S04yZDRBYlFzUnpiakZuR1loS0JhN01TdVRqZUxZYmVWaWw3emNYU2JqZVdW?=
 =?utf-8?B?RFo1U0xHeUtEdjhsSktTSEdCamNwNW51NW1lTm9FUUxmc3g4WVVVTEhVUVV1?=
 =?utf-8?B?NWZWRXpBZG02L3hQcEc4UVd1Uk9MNVpxbkdzSXNMSGM5dGVGTTRhWlI0VEd3?=
 =?utf-8?B?Sk9XVDBCa2NFaXBwK2w0UjYzTSsvWXIyaSsxdXozNjhMUnBheXdtM3hDQ1dE?=
 =?utf-8?B?b1hoajdYQXdaN24zbVgwSzZVQTlGcXRMZGdpY1VtaTFXL2VKakRROVBTV2dO?=
 =?utf-8?B?WHZMZXVnSUYwUlF2ZERiWVAzVzRBczU5K1VwWTk2WG8vak1uZXcrS3Nxb0E5?=
 =?utf-8?B?WWVmWG44cHI0NmRXREsvWk5hbldWTmh4dkltUHF2VjV4a1RIRE9YZGVncVlG?=
 =?utf-8?B?cGJYbTlyeHRHNkp4eEU5SWhUeWdtU1dVOWJoSVNuWGQyV1VlelNyTm90aUJB?=
 =?utf-8?B?c051RWZ2MUg2Q3hnaEJhNFhCUGRMODVNU0pZRW00ZEd2T2VUVmEwaGh5dE9m?=
 =?utf-8?B?dFhlMUlJcHZhYlNOV01TNHBER3BLbWpHelRKN3p1bEcxSFNMVnhRWGJkWUFt?=
 =?utf-8?Q?ffmOzdzvvSFt6DeESakAiWR9dAuu4kYhIG9IQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEFRNjFiSGJScXVzdG5MajlxcTduamhqNHY2MC80THRrMnRidzY5am5BVzdN?=
 =?utf-8?B?Q0htcFJYTExwcC9qNmw4VmUvWHBRbEFEUGpjSmRCRGtpZmhIeUUwdFFVRHMr?=
 =?utf-8?B?S1cyMWxwdk5CMmZDOXdTamtuOGF4UDhWbHZldDZjNDVxUXBSN3gvdXpVTHVJ?=
 =?utf-8?B?eUpBa0NZajI2WDFaNFFya2V1eUkyVVA5Mk42K2lUVU05QVl2UVpTSWtYUitE?=
 =?utf-8?B?dTBXdld1dzhIRG1VR016bjFJTlhUUFIrU3AxdG9RenZTRXp3a3Z6RDRsTlF6?=
 =?utf-8?B?bGdaQjhobEFET0t5ZWg2TGxZNEhqcU51dGpPOVA2RmF4d0l6VlB1em1NYkxt?=
 =?utf-8?B?VUhSc1QxUjdpaUJuMkF4L0pJelg2MUljTkt5amlZM0FBdHQ2bk80Qm80UUsw?=
 =?utf-8?B?cjRHeXE2R2Jvd0ZRbHgwbFhFU0R1ZVlnbVNSdmtYRXBzRVNJSjZ4TFRFdlA5?=
 =?utf-8?B?TGFla2t2SG5RUzlJSDRQZlFxTk5pa2JkR1RQUFdtZmJ3SVhvK3lYRWtkZm5l?=
 =?utf-8?B?a2lMNmVjeUYxTFhtZURsWnBWSWIvNVFEVUVKdkRhWkEwK1hhQ2hlUVJaMzFq?=
 =?utf-8?B?aXhCK24yZG4vckJwN2NpQU9pN1JpM0I3M2xnaWJwN0h5QTR0U0F0MjRBdlpq?=
 =?utf-8?B?K3lkVXFTRWFudXg2bSsyZFJYRjlINHl1dmhmUXYrTmRxTkNQQ1pCRVk4UkRN?=
 =?utf-8?B?UEh0ZHRyMVYreTFTenpDTW1HZ29qWlNkMjAyZGd1aHAzQ0thK29hbXdlc2tB?=
 =?utf-8?B?Ym9lbTVuTUJKT1NhV2Y3S0dQVEY1WW8wY2gvNGtsQ0pRR0lWOVd3Z3NRRERC?=
 =?utf-8?B?bUpySnRWMkRRS0I2Q1BDWXRiaWtaZXAwczRTU2Q4T3dVdFpPRmJJTU1lS29p?=
 =?utf-8?B?czZDWDY2UzRENnVGWVpYRW9Gc1lIWUFqNTc3czArM3Rkcmd0VEthbk1mUi9Q?=
 =?utf-8?B?ZExDTXgrM0t1L3IwYmpCOEN3alJxc1FISUJOc3krVFRQaWhBV0hZay81MXB1?=
 =?utf-8?B?bEt3Y0ZmN00xanQ3NVFHczYxVDZialpGaWNwWnU2TDdPZUNQelpoVlAxSFVz?=
 =?utf-8?B?Y0x3YkV5U3pvY3ZIU0VXR3daakd1ZnB6NTNnQXpKVFE4K2Evb0U1R0JRRGw3?=
 =?utf-8?B?REJoZlI4R1F6UG10V0xRV1NieTZXY0llQ25EV2dqL1duYVc3OGhpWDVYT3Fl?=
 =?utf-8?B?YzZNeHZtdTNyN2hxbEhOaURqcVc4ejU0VFdPbWlqQ2Rac3RTRmF0SS91OXZu?=
 =?utf-8?B?QkhEOStUSEQwZjlLYlZmdzhBMEhSVVh1TWV2a0wrWko1RVllejlISEwzR3Vj?=
 =?utf-8?B?Y2ZVWDdhYVVyMUhmbExqMWtUSVdGSm1ITlo2Snd4NnFDSmIvNzkrMDQ2Qmhz?=
 =?utf-8?B?emZ6M1BtMk4rSFh4ZlZnSUVPSUtkdDJ5MGxaRmJYZXRUanVJMVJlaUxtc08r?=
 =?utf-8?B?M2gvOEVDdUU0Qms3WnpmYk41blBzWTU3TnUzaUpUY0oxa1U2eXR0RDcyeThr?=
 =?utf-8?B?dHZkbkpZQ1BRM1VGYURUeDhtbTRFaUQ2aElvTS80WVg1RlJmd2szSjRMeDZO?=
 =?utf-8?B?NTluTzdTUGxVVVFZeDBFYmQxY2Z6WjZGSWZtSjczZStSUi9lUFR4Z3JuWmJU?=
 =?utf-8?B?YkhCc0Fua3BheDRKY1RxVm9KN05xT2l5dE51czVrMzNOSW9wR3drV1UrajdX?=
 =?utf-8?B?R0tuZzNIYjB5eUZ5ck5Od2ZYdndBVSsrRit1MGw2Z3Vja3BSMFhkZ1hobVRj?=
 =?utf-8?B?YXdUdnhpMnFTMWptUzJIc2RXSXUxK3JaRjlPOFF4M1lJUVVFcE5La0VDb09U?=
 =?utf-8?B?OGxRRkZSaVk2OHJWWTRVQUNCUWFjOTJoYkNoemZjN3RhT2dIL1NOdXdLMzNx?=
 =?utf-8?B?OTlnRUNCUFBXbnhycis0c2pHeE1oR0tWUE52aGE5OGpwMjVuMk4xVHZMK2Zz?=
 =?utf-8?B?dk5BMFh4VC9FUGpCeFZkaUZraG9GYzY4dUovSHZhdFFlV0ZkZDJtbmxheDFB?=
 =?utf-8?B?RGt4M3hYcVJmNkJEM3hLQmZjeEdhNUs5L0hrS0grbFF3WmNNZkxPN3pUM09P?=
 =?utf-8?B?THZDYnZmUmlyclZmK1JHbXRhay9WRkVkbWM5QlpTQy9VSnJsaU9HMEVmTmt3?=
 =?utf-8?B?eThDVnk1TEdXSmpBaWF1bVBCQ3VlZjlxR3BvYkxZYnFkdytoRWl5YXRYSUpU?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9b0f57-093f-4d9d-68ee-08dd7074c4e9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:54:58.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsgFcvG8kjHgPsAdz+FQafA8+8JSPawOuL6r+PKsCxTuT1MU2sd62VKYmUqHmQbMR2XjCu7Bh0Xaurgk2wYEnuLykoDIkfqin/8/4/h5fyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7671
X-OriginatorOrg: intel.com

Jason Gunthorpe wrote:
> On Fri, Mar 28, 2025 at 05:26:42PM -0700, Dave Jiang wrote:
> > > For now the following builds for me, but it is a quite a mess to undo
> > > the assumption that that the hardware object definitions can not use
> > > uuid_t:
> > 
> > +Jason.
> 
> Seems invasive?

Yeah, it left a bad taste for me as well.

> Maybe just like below?

I like that this avoids converting to the kernel's uuid API, however,
not quite happy that it forces userspace to contend with the
type-conflict with uuid/uuid.h.

So how about one more riff on your idea?

-- 8< --
From 6fbca9bb3e29f3a205861b9489a8fba46506e107 Mon Sep 17 00:00:00 2001
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 31 Mar 2025 09:43:48 -0700
Subject: [PATCH] fwctl/cxl: Fix uuid_t usage in uapi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The uuid_t type is kernel internal, and Paul reports the following build
error when it is used in a uapi header:

    usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’

Create a uuid type (__uapi_uuid_t) compatible with the longstanding
definition uuid/uuid.h for userspace builds, and use uuid_t directly for
kernel builds.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
Closes: http://lore.kernel.org/f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop
Fixes: 9b8e73cdb141 ("cxl: Move cxl feature command structs to user header")
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/uapi/cxl/features.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
index d6db8984889f..dd8874860cec 100644
--- a/include/uapi/cxl/features.h
+++ b/include/uapi/cxl/features.h
@@ -8,10 +8,14 @@
 #define _UAPI_CXL_FEATURES_H_
 
 #include <linux/types.h>
-#ifndef __KERNEL__
-#include <uuid/uuid.h>
-#else
+
+typedef unsigned char __uapi_uuid_t[16];
+
+#ifdef __KERNEL__
 #include <linux/uuid.h>
+static_assert(sizeof(__uapi_uuid_t) == sizeof(uuid_t) &&
+	      __alignof__(__uapi_uuid_t) == __alignof__(uuid_t));
+#define __uapi_uuid_t uuid_t
 #endif
 
 /*
@@ -60,7 +64,7 @@ struct cxl_mbox_get_sup_feats_in {
  * Get Supported Features Supported Feature Entry
  */
 struct cxl_feat_entry {
-	uuid_t uuid;
+	__uapi_uuid_t uuid;
 	__le16 id;
 	__le16 get_feat_size;
 	__le16 set_feat_size;
@@ -110,7 +114,7 @@ struct cxl_mbox_get_sup_feats_out {
  * CXL spec r3.2 section 8.2.9.6.2 Table 8-99
  */
 struct cxl_mbox_get_feat_in {
-	uuid_t uuid;
+	__uapi_uuid_t uuid;
 	__le16 offset;
 	__le16 count;
 	__u8 selection;
@@ -143,7 +147,7 @@ enum cxl_get_feat_selection {
  */
 struct cxl_mbox_set_feat_in {
 	__struct_group(cxl_mbox_set_feat_hdr, hdr, /* no attrs */,
-		uuid_t uuid;
+		__uapi_uuid_t uuid;
 		__le32 flags;
 		__le16 offset;
 		__u8 version;
-- 
2.48.1

