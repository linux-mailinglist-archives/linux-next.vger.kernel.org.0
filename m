Return-Path: <linux-next+bounces-2226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 807048BF90B
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 10:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9BA2B226DF
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 08:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451B953800;
	Wed,  8 May 2024 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m967mPfM"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC01757D;
	Wed,  8 May 2024 08:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715158322; cv=fail; b=YZXj56CRM1k+BzP5gqzf3KtNxgNMxF/HBOWBWo4KscDeLX3e37F68RACJlPpdzt2Io85TK70DQA4TA6BPgXVKy6KHCO3FxBgg4YJFyXoCSbhBfll0wL0MLs26Omx/b8CCWWOtj7TTJFbPNt7MOTp76qG8WJbyidMd1pOO8V82A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715158322; c=relaxed/simple;
	bh=zDCxzzwhxvqj2R0664qOIVaN2j3Ao1paxs47pBIFxo4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P//5HQGgIsuCzNzGxye7ud3GntcDNcDXaIL5DlBCtFsiifERWPRTsi0/+vWXd+g9CBNElxnieKOY3xS2BLF7k4LrAdreZvR6sZa4LHCp7hJdr2AhjzQSZ9M9jO+hYAMRXYUYNAbzBdrrNn1mZWW4wJmSlJiLu9BJXAIGDAU+wkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m967mPfM; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715158321; x=1746694321;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zDCxzzwhxvqj2R0664qOIVaN2j3Ao1paxs47pBIFxo4=;
  b=m967mPfMkK1mWaC9lTMuOBD8KrTdH9S0VHos/+i3L9Aso2/L46f+JVyG
   RhqjrUDqkgHLCPS6xaJvm+DM5unMJF32HgzEuGq5Omvj6ASaUFf/Oxk6i
   6aHnd4jOGHs1+nIDeo4VDb/BrNwoptosEsfT8LmP0jykO5pv2xTfCBGqY
   26G5RxA4acJ28TYMsCxf3KdIKVULnASNK0gn63PMexj9Ed7s0h98sZXBh
   2GgfALYFzUgIcYMTu9qyB29IqN9/Bw+xxjShikkU5cpfHFF54hBW84Gg2
   ETxp5GeX90tVLN1MVk4O8pcB/+Y601lLH5rYAA2n8+EiK+TEXntOZtf3t
   g==;
X-CSE-ConnectionGUID: TqFheeksSni015NxE9LgmA==
X-CSE-MsgGUID: 0Zusl/J1QU6K5XfRKR5c4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14798182"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="14798182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:52:00 -0700
X-CSE-ConnectionGUID: gQZYj7YZTPicwI5XM1afNQ==
X-CSE-MsgGUID: vJ2iuseBSLKcEUj3Xw/Mvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28908528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 May 2024 01:52:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 01:51:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 01:51:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 01:51:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVtFlL8tRlaUMl4jNekKR3ip/Fk+kmy7NBjQVXt/pe8yXvqnqDf2qZqKETupLVKF7mDg8aRoYOwxpK/XHh+fOiwgtoX3eYNvXSio64xmhFlxjkNJLb6qRsy8CnZbJiXDzGx+VfMnhLX3yEuZHHK6P+kUhm2pEqjnnC5j+5BeaItO0wmuv16cueKvtF9DIv87LhSnwXZnhoULXPx9xO6a6cXAEaywYcbUYiVSWMx1qikM5CgAnBm5g41TLKuj+4GSfHZ9cO66VbhvkPbPWdNsgxITiDitJMAsHYit+jqoEvd/Zmt6sKD0FwRRo3tWjTTdicdciOryeCmqkB8jGsXsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCYn7V8c2cWrhNBXasO2LcU9vc28bIZ3hlvF1QBn6eY=;
 b=SMSRtpd5xfECXencBzYqGAMe17JhhQ6bUhSNA/aiCUuTfmxskU8P2Moz3eZGXXqEQEM7L7uFpY3N4nrATS1wIcnAs7MeLdqQh7TQK2z22bgzHq1tnLv0SPkfKU2DdEFcNvP6cfZleKRoxu+zvWkNl8n+myYBt3Md9LC5PmZEunUnRyidKsfqXjRRh4skCLmOhFFZZrr/SncCATDz39Jw/nUlkk+7IX6tLq0kB0YWW5sV5jAersS+LcbHckomXBcaagFGtrosqLkWR9JPmqp1mg1aHqgd49oI3aOewBwKRly6CRS0u8jhMipdd1upmludupknGsoMjSh3toMYuj/Nbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 08:51:56 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 08:51:56 +0000
Message-ID: <cdc6c9e4-d604-4ae5-a56b-d8e9264ce5aa@intel.com>
Date: Wed, 8 May 2024 10:51:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
References: <20240508091631.1ec34a25@canb.auug.org.au>
 <20240508065102.GC10736@lst.de>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <20240508065102.GC10736@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::14) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 6abd8d34-2032-436a-ef76-08dc6f3c1d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzdFUGl6cHFJU3dWMnFrOGtLRE9QWllGZGZUK3A5NXJZUjBnb1pCRTJOQy9O?=
 =?utf-8?B?Z0RJeUxLN250NHF4eW5tY0d4Ny9WUXV4bkM0ek56NjFrTFoyZHFaTUNjWUI0?=
 =?utf-8?B?WldpcHljVDA5ei9nRUl4czZxR0Eva0JQb05FVXlUQTExTG5peDF2MWROOURN?=
 =?utf-8?B?MEhMN3NIVTlKWHQ2cVVtbkgvN0RSR3lQaGdpZ0VGaWhLcUlxbkNsRlM0dlpS?=
 =?utf-8?B?NGlwOHlzT0FWTVpkbmhEcDRTN1ByYVVEZUs5MWZyOFhWZUMrdzJDMWIzQi9C?=
 =?utf-8?B?SXZJZjNudWp2OUsxbHllVFl6Ri90T1J6OHoyNTZIZGFJVTN1NnNCWHFDRnRW?=
 =?utf-8?B?TlhOS1NlVHBvMHpQZ0FNcmErYWVSM1BDRXhpbTdRN1p0b2pBb3VJU1FBaGFZ?=
 =?utf-8?B?NHp1YlhzQzJ2V3I5S09LaWpVSVRtcU5yTVhyMnlUREJ2SFd1eWJQWGRwYmNv?=
 =?utf-8?B?MFkvcVUyMUtJVHpLT1M2cExreC94ZGlENzdGaVBNTUVocWR3U0tTREd6RFhG?=
 =?utf-8?B?czREMXd5R291aitnM3g4eUlUc25aaW9Kbm9DWVFYTmx5YkdLYmMrR3E1a0dZ?=
 =?utf-8?B?cFloODY0a1ZzWUM2UTZPWlZubURvN2dPV3VTcmh0QldsUCtNWHdONEZCZnpN?=
 =?utf-8?B?Z20wNndKekFjK1VSWi9WNXFyLzhITk9Manh1Q3g5WC90THBYeUNGbkFHeWp0?=
 =?utf-8?B?WGlnVkFZNE5kNnlqZ2c3TXpoNkxHVDVRRnB1WUU4R0NlMVlrWEo0NEZLbUZI?=
 =?utf-8?B?WkRwelBYTFI0YVJkbHVxR1JSczlKbmc1OHFGTXNVTzhJVGhCMmJzY0RhSHVC?=
 =?utf-8?B?enFpUVN2cW82Nlc0SFRXQzV3TDBKWnNVY0hQTERRYTl0TmxGYnBsUnQ3V00y?=
 =?utf-8?B?THhJdmI0QmEwM1hzU3MwZk8yUUZ0aXJCTFQ5VUtzNERyR0lsRkVVcmE4THcw?=
 =?utf-8?B?NWxjZDlaRzRKRUVKZFJiSnJMUTVzTnRiNmFjb09zbEVsTVVQRDNOTmJycFRQ?=
 =?utf-8?B?NHBIY1ZMdSttckI0R2prbmU1a2lTMmVBUTN6Q3hYNlJMUlZveWVFbGdWOUZz?=
 =?utf-8?B?R3dlVFM4YWVWQXBUM3VEOGtrT1dVS0pBL2R4Ri9QZG5ocVlwRkdSeXJ3Nmxm?=
 =?utf-8?B?Rzg4OUFncjdJWk1kblMzYjRjdUJ2TEF2SHFKbGQ3YVpLcUZqaGZVeUZtOEt5?=
 =?utf-8?B?cnNFc1dWTStBcEFSLzh0OXY0UitsSGdwU2JiOWhwR1RGSDF6NmNEQnJoK09R?=
 =?utf-8?B?TFFTUHBSQ1I2L0hoN0RRc2N4NFRCSGZKaW90VWRjbzVITS82ZWpuQTBWRG5Q?=
 =?utf-8?B?emNJbE0rb25tK2s1dzRRaWZBQTF3V1BEdWMrQXpNR2MzUjJFYXJsZGpLSkVD?=
 =?utf-8?B?eUpiWEIyd2hUZVEvZjZMUHVmYVZKMVM3S2puWXBXS2NkUDNmd1pOYzRIN1hQ?=
 =?utf-8?B?eFc4OGJqbS9vNnJUZDlmQ2JGcWhVZVlkenRJNk1NdkxNTVQwMjVOTHQ3YXVu?=
 =?utf-8?B?UWpDSkl1dGZCZnlZditVU2VGbllyMnZHOW8yNGVjYWNwVWsxOHh0Z2Y2ZEM1?=
 =?utf-8?B?OVBJVzhtOVFrZ3B2dno3WkJybmpkVnJibkNsWWlSaVcrRDdJbmhiWkkyN05i?=
 =?utf-8?B?aDVEdkZvSElyUmpQTXV0Wi9Ec3E2Tlh0SzcxTDV0aWwvUnNyS2daeHpFSEUv?=
 =?utf-8?B?QldpNUFkT3hLZCtLTWtydVJBMXo2MWRkZXEzUjNtT2VHZDM4MmNDRlJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVMwaXc1TnRORVdNOFc3WG0rcEVzaXpMSVV4UWVNRzhWR2Y3SkRzOEc2YTla?=
 =?utf-8?B?cmFhak1Jd2VZeXFTcUtnYk5jTGJvUURUZGkwNlo4YnpFNGFTbUFYTGQ4ZVh5?=
 =?utf-8?B?eW11c0M5aXNtendhb2IvaTU4b3V0eWc3V2VLU1MwWnZtcFhscFhyUkMzT1R1?=
 =?utf-8?B?bTREUXNPODQvaDRMZVNQc2o5OFdiN0VJM1VWRHpXbGdwZlJ3KytncmUvSjFo?=
 =?utf-8?B?dmFCS2FoUmljNjh1cVZUeVpJRTFXSmI4dmFSQ1BDbWRWdHRMeWttZnRtdis0?=
 =?utf-8?B?TzREYldzQSs0QmQvSnp3clhOaVpqWXpVRmUxeGJhUjgxK0pBZ3V6YXorQkVa?=
 =?utf-8?B?NzNKcUZTWnJQM005SEhSWiszeVUwWVhuYU43bVY4V3J1T0RjQkJkRkFVL3Jq?=
 =?utf-8?B?Snc4eTZaT1dsdllhSHRRekwzVHFTV09rTllPUnY3NFN4QkNuS0Q0b3k0NGcw?=
 =?utf-8?B?bllBd0dMekNZcUJnNVhBMk1uM0Q3UXlnUU5QcnFzOWpaMXZLNkpkMUdwdStu?=
 =?utf-8?B?ajRxU2VsTTlZL2UwQkMxblZNU0oybERTMi8xVWF4TjducTlSZ0ZGd0VjcXJC?=
 =?utf-8?B?WnpaOXluQjkvU2N6bHFhZ0s4enFPTlB0aUNsRXBHSEtoYTZncStCNzJ1RFB1?=
 =?utf-8?B?Ukw3bExVZUsxSk9KdlE4RmtLL2JOd2ZLcTBXU0hRQ28vZlZJanF4TXRuUVQy?=
 =?utf-8?B?bGJOSmFHQ3h0Sk9hbzZ4ZnFjMDJmcGk3ZlRna1FrVVNyZnB3bkRNbExKcnNv?=
 =?utf-8?B?dFRxNkcyeCs2RGtHaVJYWFdJanQvcUJNeUZJOWV1V0s3eFNXYkZNaEZSelBl?=
 =?utf-8?B?aytqRUJvcTJZVWhuaGtCMGRrMkhDaXBHamNST0R0VU9aYnZqNGtta3h3aWpl?=
 =?utf-8?B?TXZvN0pVeWczZ0hvb2cvTmVFbXZ1WkQvNzBtNzlUQUFoUVVTbFpZcWlaTVd6?=
 =?utf-8?B?WmlZa0Q2OS9YczFxa1JOaXQzTTA3eWZYbnJKT1dXaXNCZ3FLWjNEZDg3Qkkx?=
 =?utf-8?B?cGdnU1QzSkwxaGxJQWRrWTRxTHB0cERvT3hLeEtlYmVCanhFZm03dU5GanN1?=
 =?utf-8?B?VU1wbXdqK0F1YXVqSm5SR01BWUV2Ky9RdE9jZEJ5aGN6aFRZald2MmpNTDVR?=
 =?utf-8?B?bVU2bUJpQ2xZT3B0UkcrdU8xVTRzL2VZM3hNaFFqaWlZNXAyZ1VlNUs1OEZs?=
 =?utf-8?B?eGpIc0xWdWk2eFRESEJ0Y2VHamhXMHJDY3BQUS9qUlRZYm5UalZtL1lvdy9B?=
 =?utf-8?B?Uk1rYTJaSUdzYjc2TUhDSmRLWkczNVdjTFR2YXA4ZlE2MUsxTFZsRm1hcDRU?=
 =?utf-8?B?ZlFTQTZiZm5Mbmh3Qncva0pXMnFsM2xvYjlPY0UyTFpvNndqZ0ljNmlNZDVN?=
 =?utf-8?B?M3cyWlZoWUR1bUdSaTNwT0dscFlqOXptV1B1OWxPT1NXN0RiT2ZDdks5S2Rq?=
 =?utf-8?B?Y0tIYXpxdk9OQUdjZVFzdTNBSHdvQUlZNHBWMVVHc0ZHSk9aRnFFMUNGaHRE?=
 =?utf-8?B?TXV3VTNHRnB3YityTUxOeDdUMWl3TEk3VnY5OWlkWkk0OFBjWHFOaE43YklB?=
 =?utf-8?B?bUNGZEF4K2JsTFZGeGFXTkxQN2VHNE83SDFCZlZ3ZmZiNnBURE5PRnpZMDVh?=
 =?utf-8?B?TVlEejQyR01idHY0MVNVYm1SQmc1OGJWSEErTnRrODFlWUlFTmJmOUtmSytw?=
 =?utf-8?B?NmhjaUllL3p3WDRNcmVSa0h6RXYyTitqWVBJdVlFN3N3bEEzWUNNNE11Y2hV?=
 =?utf-8?B?YXlUaHRvMzUxMDV3Vm94Y1E5Z2hSMjVNdVdEVXZiQm5wZzJqRzB4RC93WkM1?=
 =?utf-8?B?dXgrS3Qwc25Vc01jSEZ2OVpuLzZCaW9tR1JUeUhMb0RIZVMrb05nTmduUkcr?=
 =?utf-8?B?NGFVbEJ6WkdlbmdJcFo4V0R2Y3h1bWJTRlNaRVhibzZ4a09pUlNVakpxUmV6?=
 =?utf-8?B?L0pJYWFxUjhaYlBMQ2FIWDkwTHlXbDhDbmtMd2NCU3piaWUrS0RFZnNTSG9m?=
 =?utf-8?B?YWlqREVxemoyWFpQK0dKNUlWRFVRcXRFL0tXOFpEblEvdWlUeko3eHVDdFVI?=
 =?utf-8?B?VEwycUZBcW5sZEgveGxGdUNuakc0SUZWdHBUbG1LK3lpK0Z3Q3dnamJNYXBr?=
 =?utf-8?B?Y0FvSU44b1NQa1JQVDRjQWlyQ0FvMUN0YmVUY0hDTTlrVDIwdnZqNVQ4dFJz?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abd8d34-2032-436a-ef76-08dc6f3c1d33
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 08:51:56.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g1TsKmS/O5kNpF+Vt9t7uR/o/rbQxUevxLM4auMTRNh7/IN68kwG8mc5tFFKBAuvZtu7SOfwNJOLxDLq5c9bigESK+53NTF5QFen3TLh1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
X-OriginatorOrg: intel.com

From: Christoph Hellwig <hch@lst.de>
Date: Wed, 8 May 2024 08:51:02 +0200

> On Wed, May 08, 2024 at 09:16:31AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the dma-mapping tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
> 
> Thanks.  I'll fold in the patch below to drop two consts for now.
> Alexander, if you want to pass the consts through we'll also need to
> modify page_pool_get_dma_addr, which looks doable.  If you want that,
> please send an incremental patch.

I'm verry sorry for that. I had 2 trees, one with const get_dma_addr()
and dma-for-next without const, and didn't check it compiles after
rebasing >_<

net-next already has this const. We could leave it as in your attached
patch, but then there'll be a trivial conflict when merging with
net-next. Or I can send an incremental quick fix for dma-for-next, but
then 2 commits (one in your tree and one in net-next) will have these
changes duplicated.
What do you think?

> 
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 8836aaaf23855f..4f9d1bd7f4d187 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -399,7 +399,7 @@ static struct page *__page_pool_get_cached(struct page_pool *pool)
>  }
>  
>  static void __page_pool_dma_sync_for_device(const struct page_pool *pool,
> -					    const struct page *page,
> +					    struct page *page,
>  					    u32 dma_sync_size)
>  {
>  #if defined(CONFIG_HAS_DMA) && defined(CONFIG_DMA_NEED_SYNC)
> @@ -413,7 +413,7 @@ static void __page_pool_dma_sync_for_device(const struct page_pool *pool,
>  
>  static __always_inline void
>  page_pool_dma_sync_for_device(const struct page_pool *pool,
> -			      const struct page *page,
> +			      struct page *page,
>  			      u32 dma_sync_size)
>  {
>  	if (pool->dma_sync && dma_dev_need_sync(pool->p.dev))

Thanks,
Olek

