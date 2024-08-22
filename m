Return-Path: <linux-next+bounces-3392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73D95ABD5
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 05:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA0E282F81
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 03:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534991804F;
	Thu, 22 Aug 2024 03:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lK1GqxYa"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4B3DDBB;
	Thu, 22 Aug 2024 03:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724297114; cv=fail; b=fhN98ETnPdiiuu2+/4n7CRWKMXKPvhI6p8hj4RgJJuT12Pxd2uAeRgGqdWQEckY0uRPRUQmMai2bTbTfA0mXh0eOG9yNqo6CZFt8KIBEc4G+0WcbK5F7P9S0G55MpfXjfKBRvYo0KaCmZc4zRIGKfzZk4EVLfMmuZ/h9kDgksWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724297114; c=relaxed/simple;
	bh=QiNqJjuWZNg7jOaAiSLpuWy+QgdnnAG6g0e3KuBAJvs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=igOx7XSgTmHiFSCV/tAdcGOO8chARlsc1faQPWOfuAfmhO9LinMcFKdXsvPl0s1Qx+yFtmUsh3VyEKs9FZZQQ/2N7B4R6hqfHGS02vgYt4zFzJHxHHcYPN66Hy7fZDvEBfV2tSidbjzyNsu9FyCmr1q5c8MkNwKPs6mmgeQNJyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lK1GqxYa; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724297113; x=1755833113;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QiNqJjuWZNg7jOaAiSLpuWy+QgdnnAG6g0e3KuBAJvs=;
  b=lK1GqxYa0KqLs9eZUXBcjGqPMWSMfewoln2pyMnWFiXEcfqNRL7xZb+e
   D9YOsKNvnA4eJCU/CoU6rY5+G/a7I4vE450LQbhOqbiBbabRRckeRi88A
   INVvCn0PRR5mTAEF6Lv4mXSXy0PX2w+iA3az1Gmx3mGjGVX8sD/r2TSgM
   M09VGHahRrBpOwC11ZzbRx2504D/6piGDlTb65ScgNQrDLDti4mf0w3Pm
   jP1NiIAv7nZkLSLVRiUPqAZB60GddvpmmY6ZyMK5xM+BG7X3Xk6+iFgRs
   xH8QTBTzy8eH1gob8f9edLDdcOinpXoTXX+XMKdPgyWeJh6dbhvAhpDdv
   g==;
X-CSE-ConnectionGUID: uCN4efGaTmKJFtRQICvYXg==
X-CSE-MsgGUID: iejW1es2S/+PY8uhqptjIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33258081"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="33258081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 20:25:12 -0700
X-CSE-ConnectionGUID: Q8uA4JCuRNaB3nz6WU5DtQ==
X-CSE-MsgGUID: Ig79+EgwS9ihrF8ZXkojUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66243290"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Aug 2024 20:25:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 20:25:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 20:25:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 20:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIcOr6ltwnBm+mz84Hh7csWg/rS6/vtqHtqBZNGydItsvEpd5TTMixn2X5NYRPfNknxOpFvBbMZYWQdBZhSA9BAmJgt6B8sPh9V6FsAEk0der8VB/ywXBFzCFp8mKrnv04UEa1wbhDIl2u10JJiIFafOselOrmedAeXOVHm2fTMiBEv780uelU7hzL7a6Omg+OaJBPMf/mtooDRn1K+1e5aUIJ7lELrwoJKzm+lE+RNl9o0lwDnqti5JBDGkI+xiTyaCV2oe9mBm8Sydr6kFoxQi1JZbjMfEDGw4TnF4P0IYhWSE4zsGfg6o/a7kPiMYTo6IMKkKXeQUarqzBWGbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqHu3VmF1TBkEMYPOROzCQd0fa9sBNTilWfmJrwqpJg=;
 b=nN9VBFgY8lzgDEqfQ6UkMmbehj6W2Pu700gw4jRVhMFOZLSOtcwQ4N4im04EW6VSQvP4ouSYtF01joKI84k35J9tFXRzY1bE8uRzEJKbzRa+wE8d7jZgcetDqyi59jUyk0zNtCf6jAvpmRpq7xzVYuHU9q50vdcGbQfIW+MZPuM+/1yTQ0aLgeE4Qc0c6GB/hTQpEnlyUJm+KxZNic9LTbm8+s7tNR4/4B+/sfrHuZqCsC2Au1TDEs//UFf2eriKTv0ac86f1zsT83TS/O4blHnoKTudBP1zkQJ8XIcIhY8ve3ilv5lYei9QfiJtMTCXnFmhMMt61PF662HO3efynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 03:25:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 22 Aug 2024
 03:25:08 +0000
Date: Thu, 22 Aug 2024 03:24:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: [PATCH wq/for-6.12] workqueue: Fix another htmldocs build warning
Message-ID: <ZsavUSYTeIMx+NIw@DUT025-TGLU.fm.intel.com>
References: <20240821134531.1da04ae7@canb.auug.org.au>
 <ZsYYRtpi3l50_Jzy@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZsYYRtpi3l50_Jzy@slm.duckdns.org>
X-ClientProxiedBy: SJ0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4982ae72-b26c-49c3-5fdf-08dcc25a063a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7g7uN5GfEtQam8lJTlmhFkAYUSZH93oQS1LdrbKRdvPeXYSfSxW5lwiJRetI?=
 =?us-ascii?Q?dPwI72kyT/ZLb0IJVZCQvzba2pMlSbTVOcJzmpi+BW71gETwdvaGhk30Kwci?=
 =?us-ascii?Q?AoyfSpbixXmxhiOaUILEZtDv8n7l6HnqOgvxbDII8CDIVqNu3v/cKTlp0EaG?=
 =?us-ascii?Q?2Keu+AVnw4/3x+ZwY3ra3BaLH+zlmtQ2ElHKRnN5rJJpfKNt4yhYOxooHjEc?=
 =?us-ascii?Q?Y6d0YYYeA9++ccSYRUa9bddxvLMa6mjfO1+SLhxxu+NkVQ8t8cLFNdws3x/h?=
 =?us-ascii?Q?+krXnx465vbYl/W+eroDHVkFEQBFAKAm4MRJwprqgpmulTrD0tNRw+AzfF+L?=
 =?us-ascii?Q?V0RQzPXQzMyVkHCerLUWJswJR0YkCB92vSYxdKRzc9cW510IALXp44YM4ERt?=
 =?us-ascii?Q?qo5kOwXKt7vOCfPLse0lcyq5Vu/LY+selrftJAG9hU6UuZ+orLIvuK/anr/n?=
 =?us-ascii?Q?tempz4IzV94n76aGzQrVwCWxx8FnyMsTziPyZav6RW3O3PSwihB4gYoWdlXw?=
 =?us-ascii?Q?d8DxrGqcN9A9KH2P0VP6jBuiAt1a2VHR1RTKuO34i6mmyiGcTty3wo3ADuCf?=
 =?us-ascii?Q?sp6cPAWIjIOV3r7uW4jFyftMDfXftXEr7/jUF8ceN39RM7tqnLGpu4cDanJ1?=
 =?us-ascii?Q?BaV/TKgbMoWXzOdITl4GvoBbAT3uIpFRmd4KfhsvlJiewtF+FWA2+oTSvm+B?=
 =?us-ascii?Q?xxOS6GLJjVgvBiNHO4a3GXBrtbMIaNYAzfgdEP71UI9inf+V3eWtoPbCggvu?=
 =?us-ascii?Q?nIPeEGa3Je7L5XYV9G7FT4iC2Tma3XxcH0NbGO9SsHrcoMcuXl2ih8BXWyyS?=
 =?us-ascii?Q?yA4xgYrBHZ7W5DM3KM/gBSy872fALFccjFvTU9XXmLUy2G0F4w07/RITKwSe?=
 =?us-ascii?Q?LINpJCsaSkTVL3Rc2yNa8To2fnP/6V/xck5fKw9d8izyPSzTSXSV4Huk7Xfo?=
 =?us-ascii?Q?oq4WBwbyAh0+2U4EMwRYIxAfCCwGjO9E8qSJx7RY+/nMq9LqmlLb8KY5mOKi?=
 =?us-ascii?Q?ySJ+WejgEIRQwYtck6zIjozuP/1n3oqMTCS7Lgo1VoN2AyBKEUJkfgYyNKLM?=
 =?us-ascii?Q?juOGw9H8ZP+4XvDgQkqaVHdewA5HoMcJcvQfWTcSBle2I4sdw4+PqzOgpR9t?=
 =?us-ascii?Q?dJLZDvqSrU1mRTpxQ5WVmC9uOlUUj37up0uozozBop674XL6kwl4HTsiAyG+?=
 =?us-ascii?Q?AMvG7xRJy/BH9VZz3Xmt6whPwBnNg/qrRfsndyMjbfQX5dr+7Fm1aja2bTFE?=
 =?us-ascii?Q?yQrJ0xTIPPY7dMDcXCIVt6X8mzZt1BpUUJO+rBVrtJTOAuz7HKEhtLTlPyTJ?=
 =?us-ascii?Q?O6hmyihuhcbRuL6Q+Xi4YspB2UZLPeVjXw2p6N8inFmqDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X2ib0bmKzpM3MWufpXlmcGeW1f6OnI4yqAsHTiBLxg/t32gqWihefHY6WFvr?=
 =?us-ascii?Q?v8sZ2SNbh9k9sIYxzrnjzurtarQYBvBB4Ah702F+e1z3OnpYhcwYJlWD77h0?=
 =?us-ascii?Q?MYESV9PM1zTu0/U8Wge6l8QTRThIQLSZKeZ1lMV/51dHt4HFeUnO3EqJWq0H?=
 =?us-ascii?Q?oOrYO3bFa7c3XqX8TVkpQChurWedqUGGLIzMA2tgj2PzlAv39RVuYqLx9dXv?=
 =?us-ascii?Q?pEiBI2BU2alnZGQPbEFz3GO+/OG2ZlHDera68e5hE08TXe2JG3NfIdUXk1sa?=
 =?us-ascii?Q?Yj67zflTn+fb5y+C1o72Od3QlObBG2u6wVs4Gt/ZCz2FbGmdZZRqS4FT5biM?=
 =?us-ascii?Q?VLozufRfsmhoZJmqSnlVIgqmuswKiew0gbWvg1662lFvd0jcyz/ejO/4TPzJ?=
 =?us-ascii?Q?RJcPFSf240r6AdSOl6VXedx8wfZuGSjj/vpE0Ezcy+015lMsY7GejTS831Fv?=
 =?us-ascii?Q?yJowgVXYnLjpWBnFe8nIK07qSMw0BWqaXTnJj5cQg7H+l2g5/oVO8RNs8m0W?=
 =?us-ascii?Q?GvIiWR2bnTCcxwYYg2pCXnHjcxh8+zfLANHymBCFd2LOjmO42NsMza9wywIM?=
 =?us-ascii?Q?W7kocCzLJA9upMMLWXv76vO3LqVR+Db6RBXpDblFkkkBjlg2AP9qFdgLd8x2?=
 =?us-ascii?Q?yq2JX9yK3lgm8ENbYw8IMeeSBDM0VTVy+onNR3Dq9ZVtiKwsUayJ3bp/yz21?=
 =?us-ascii?Q?e1zrz6bknmfgB2/zbL/vcqJB7rK7t03/CVYsIlKMJc4V+scOP4CUK4wqSleF?=
 =?us-ascii?Q?UU4h3reuMCNEseWukizY68Bi4H1c5tYSWdtglMiA1t7otiJmhlpGcvZv9JZ3?=
 =?us-ascii?Q?fK2aDTF8zs91kbbWh6ePK8yBp5QSwNzqpPn9JZ3WwAcNmLRpIe9Uxbuj4qn8?=
 =?us-ascii?Q?+bGtlBfdXmuYXOiE5fwWI9br4Hu3vwSaI0T+rpQpqGwqsQpFwVyMDy37UdW2?=
 =?us-ascii?Q?Q/EGRoyd3svnkhh33aM1eX0+jOFGOefzoXqGyxYxH8cug2EtaQnRSyLpxKVO?=
 =?us-ascii?Q?jXjsnAHjgCvD+XKPnvWdT4gmrOFh4SculG9aRain9F82VL2pj/g4i0OR+y5s?=
 =?us-ascii?Q?eNwpYk6pfQT8OYmsU1jMWrdy1gSL/O9fq9nl/J7ezpM/3j26J3RF4Hxv467e?=
 =?us-ascii?Q?6O8hLg/+5ePpWooigyhWsnFbuTD/8cRFZADJqzIfZ2Eua3mFXUo0jQ/7XK2z?=
 =?us-ascii?Q?vB2VzZ+IvUFK7K2e3gccONUnAHO2Ih6pBmiS+/HT5cr+fmiKx3IEzh0/z+HG?=
 =?us-ascii?Q?L3+dFXjE4U3n/c4SMR511RUBw4z6l9Ut3dt5USG/wGJBf4kPnfQHQN+qp6EM?=
 =?us-ascii?Q?2Kd0lx6j/YdknEuFmxnST3j4sjtrQM7Uj2H/aRAw4OJIEjzDiPTf7/uu3ee1?=
 =?us-ascii?Q?aCWVm5uXyXyPKXQNxxow1BysNZHeW8KLH5M0c2pOEuBvG9ZLuNklOOJLVoN1?=
 =?us-ascii?Q?qQuWADtnGynIloQDAjSc0Swujvfr/NRvXqnBPF3ZvkuAxdY2G+c5IQBmk2xr?=
 =?us-ascii?Q?EeZW5lOL8uAYCEYoUzhjH7yWBH9TinUjcgZiHf1rW+hnpWV3ZDYCBoAzTgH8?=
 =?us-ascii?Q?w1SejGGmAv7dmcbZHI6DtEvhcz3YEJpYFcbF9sEZ3Gtp7qYWAM6ue2lrUfmc?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4982ae72-b26c-49c3-5fdf-08dcc25a063a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:25:08.9160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bahVDzvrM5XI6qD1M1wayC2L6e14eSKRb6TYno5GjjshSzIKLPSKLyUy1TQuYWdvUFOwZ0gjEUmMlhrvEZM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
X-OriginatorOrg: intel.com

On Wed, Aug 21, 2024 at 06:39:34AM -1000, Tejun Heo wrote:
> From d156263e247c334a8872578118e0709ed63c4806 Mon Sep 17 00:00:00 2001
> From: Tejun Heo <tj@kernel.org>
> Date: Wed, 21 Aug 2024 06:37:39 -1000
> 
> Fix htmldocs build warning introduced by 9b59a85a84dc ("workqueue: Don't
> call va_start / va_end twice").
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/linux/workqueue.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index f3cc15940b4d..59c2695e12e7 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -534,7 +534,7 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
>   * @fmt: printf format for the name of the workqueue
>   * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
>   * @lockdep_map: user-defined lockdep_map
> - * @...: args for @fmt
> + * @args: args for @fmt
>   *
>   * Same as alloc_ordered_workqueue but with the a user-define lockdep_map.
>   * Useful for workqueues created with the same purpose and to avoid leaking a
> @@ -544,7 +544,8 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
>   * Pointer to the allocated workqueue on success, %NULL on failure.
>   */
>  #define alloc_ordered_workqueue_lockdep_map(fmt, flags, lockdep_map, args...)	\
> -	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, lockdep_map, ##args)
> +	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags),	\
> +				    1, lockdep_map, ##args)
>  #endif
>  
>  /**
> -- 
> 2.46.0
> 

