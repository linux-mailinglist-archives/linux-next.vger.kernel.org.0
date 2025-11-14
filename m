Return-Path: <linux-next+bounces-8992-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75015C5D998
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 15:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 303BB4EF674
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB584322DCB;
	Fri, 14 Nov 2025 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMH/NRiG"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A8322C9A;
	Fri, 14 Nov 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130255; cv=fail; b=J2RA79mE9IopCx4xsUHusFiXhlRfzk+TbRyD4mYIAin8OqKv+/9/SolMvJL7bX/1v+yLAGWEwnp5vDzS4OQaauWcaygvAmYvk9x4g3esWV016l/75+q2tlL+8IDD/E5LbWqi2c4e3fEDOy3biO0nIylS5O4MTRcAP8R1Sj93+mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130255; c=relaxed/simple;
	bh=yUNuDtPMMVdiAcQWhK6Q6qUzWmK0+SdV+X0Rfq6TdGo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Co3GDr9PYJtFN7WBorVicu1R6Y9hBpdRdmQaByMY/TaxI9qh03yDMtNHZDXcZHo6jiF+AVtzyBXXbnjHgJsHDjNm0C8k7ZdOPz3L7q/GNQFOJyIp78jdhErUU7amsmM2tmLVlTPxiic9vRUauGOe9Et+8cr7GoLno33DVICdmuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMH/NRiG; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763130254; x=1794666254;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yUNuDtPMMVdiAcQWhK6Q6qUzWmK0+SdV+X0Rfq6TdGo=;
  b=PMH/NRiGmy1G10X3VfKqmDIABpMlBR4nu5kj3qxb4Whz+SIwcdy7Tp8B
   WmdxqiwkmP78jcubMecUbbDHuKnmzi/o1zmcoWF8bhBi177fW1XGy7Ujx
   EJVmugp8blIRZ7conl0nRP2rNLNDJztNdv+b5/7xZWo7J7c2tIkPkA0Z3
   ZGRahr0TQ++FdgMb+lkmwINlSSa53aN8dXRoZnbozZrwN9LqylgBMrFvX
   tAnUPoUkEerNV7v6/cRewWwC4a6pkR2jEEhI3StJNHOeM7u6enVR8MxuE
   rXL0JSiHKu2YSB9v5xRpfM5PEBKrO2SUnU3J/HtpwpIuavCaTivFe2neX
   A==;
X-CSE-ConnectionGUID: XzceEqS7T2uxMYc363w7mw==
X-CSE-MsgGUID: vVl+Pt2KROu24yazssnu5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82617817"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="82617817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:24:13 -0800
X-CSE-ConnectionGUID: gcEXRiXWSMKf0qbJ406oHw==
X-CSE-MsgGUID: BTcWD7BrTZiyjlBTdwciIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189082574"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:24:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:24:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 06:24:12 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ii6E4hodw7i/SCA/0ycs22scFQLsxkgYsZZmvEpHrcos5PVl1DdelVbK8Xh5e3JzFRcNMdvYdESgUMAncn58EQRuuY2VZcWpdesnwrTd1+dsf6lfEYq7qZOzrHoAm9ocNkmtN8QZ9SLUVo+VYdFX4xf5o9od1leC0Hub8l43Z6eHsWUgv5umscF2w5Om/cJtr4o08v12WOXeWuM3+X0zNRvQpFfBbNX6GQUgu+UUvT83Zo8CYqMjIZv8quKjmgvSafj+wuMhAGU7QzinHH5GTxwS6SLMRNcoskz+CWkB7vwOB84ddQG71tM8vTixd2pFOPiD2kq5n1UZhAOatb2Tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhZqL4QcOYaaN3SbISriSsH9NoEJmvhm+rOB7ai4TLU=;
 b=F4LTmxuiYKJFp8s9UYRyu24lhfmywVOLIs3t+9ijfvOR7/ILwD0/YKMxzpCsnP/ws0YSoZm/L/P2zLW/VdTZQv4yy+3W94lM7EsRrPqgCvtvGV9yPoFbBmSzTr0trlOqTaG+/VlzKEqhPbgKDqRMdFeTnyO21X771u0djEy86k2EZZGZA8AO7DS50p4T/U58t0zK3CQIrAEY1VI4eKJIHTfXjjoBgZA1Xzb7ey4dj4VcGMNllq9V+5cZ9ONiZFX5subrD56l8aoCxpS5TaxKjiLwMM2MqqGaTBiLVojynTCZB6xo1FHeofQmHy6zfJOLPqvGIZrqkpmod0iwG522NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5898.namprd11.prod.outlook.com (2603:10b6:806:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 14:24:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:24:10 +0000
Date: Fri, 14 Nov 2025 08:24:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
	<ilpo.jarvinen@linux.intel.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <ijbweytd5eadwi6misldllxfagav5sfggfu3qylehjbhv7npbs@brqvjtzzo52j>
References: <20251114131300.21a5c6da@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251114131300.21a5c6da@canb.auug.org.au>
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e2e3d1-cd49-412e-16f2-08de23897a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NsvEuzERXtVmRt6mjNX/VsS2UtmTin63qFllMzqdu8+i2+/Zz4QeFZZoyuhc?=
 =?us-ascii?Q?8zTc10wFVrftA/3WxkGhNFMMVcp2Ayal0T+DLEwkbXfY44SrVWUohHcdgBR1?=
 =?us-ascii?Q?YaACRaP0PNr0G7IAaL0jo3nepXjuc1Xb4ps4JjD7XwiCybWp+4MjdUCeDR2z?=
 =?us-ascii?Q?UQJ4c1bIiSLaV1po3EsTjFRfM5PuBOnOav3J22mmZqq4OT5PC5XuK75wfm6X?=
 =?us-ascii?Q?1eFtj4QwEBWCaAbP1Tv566vJMYJi/39CxSpPgdB2qkj4NwEdXGMN93INZKs8?=
 =?us-ascii?Q?6ARLYVJlEHxlhjc31+nBXUADx+UIBSbTsDVrfRJddf7XG25XnLb9xPW0gCf1?=
 =?us-ascii?Q?u8bX7VtKUy4vK89YGpB3frEXq0IXViYZTmjQY4o+b/aNbbh0kQw3zDuPIdGW?=
 =?us-ascii?Q?k8mePjxGEsyaSD3Tn572jwKRxuFGer85V6fPo37vslVfOZEpomF9SJYTeAfB?=
 =?us-ascii?Q?R4OoBHb2u78OtQb1RqzzMK4JCS5AV0FCXBKKB9gihghI5Hsuh+KcTtrAZzgP?=
 =?us-ascii?Q?6Pgg3uo0U+nW2tmabkPgwlwPEKEx6+hJL3R5rZwK9UJIckbi99F6M+D+Yky+?=
 =?us-ascii?Q?CZAOTW3q04mlmCgHwNwwcDlQ4oROtpvU1M0Tu/DQcr0g8KzGjyEouGKKJrf1?=
 =?us-ascii?Q?6qrUq+mqS3nU1ya3kyUjgt7FC1QaKdfPOQQRKrQ4cECn7gg48rBydgb5k0r1?=
 =?us-ascii?Q?fjRpwPkRKyGBlbNoyu+et56kr2EcnND03av3OBwk3EZLhN8D+AU2D8oQEsVp?=
 =?us-ascii?Q?wkkWB3inZXKlXdYvCJ76voZQJAHpimVTk5h7w9QnOImLmvDML4meUACS3glf?=
 =?us-ascii?Q?rXPq6qXmg0u5G/0kfydWenyllwkixMdzsRTsn7KxfhGUL0IBn5lWZtA5tcwQ?=
 =?us-ascii?Q?4jj87AglmqxWbPcSEHzZMNtLCVhxQPKt3ES5Hcj2ne88rKj2FWomfOff2Se5?=
 =?us-ascii?Q?dmmuXjTQ9/7HUs+lo5Y7PY9y2X28SREiMW8oDkiiD+YKMpwkue0mrv/JLsXN?=
 =?us-ascii?Q?ldAc6sImYORQ5hsrEJ3Vhe+HFTrs3hETBzdDOpacH6OMe4rpT7bSh27twXVH?=
 =?us-ascii?Q?HqK6tX2xaEqUxKGgk7NpaQnf4PWEY/G5H+2cvxq+VcFvrhO8nBfLAMdbPMg6?=
 =?us-ascii?Q?wdjVFjwKBU67gbkMi/Bjms40+6jp35luaTwNSfHx+UG3XGOjBQ8LFXXV67sr?=
 =?us-ascii?Q?zAE2qoIQf8Uwmxd4upPIwcupz2igFnHY9Su1rFrQKLEo3I0pAC8oLjBbJaEl?=
 =?us-ascii?Q?1s7aoFaq9GSRiefSeRxmYoBomKStE56yamAGqdUAZh4e9dLoG/9t+d2apc0h?=
 =?us-ascii?Q?F/IOLvC7V91niR89ue2TIEH38yFNOCayaxTtaNN7tUhcMImFL8d2ex7vcMhy?=
 =?us-ascii?Q?lGRbYUsm9fSRjb0MAv4PfSI2K3OUQsyVADIU9y+AuPCGVAz7ifXVLcE236hE?=
 =?us-ascii?Q?kutP14sRRC73sd7s+jX/kUbRKTC9cd4P55OIHzZOF3fXa+g84K4Gbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/OEGDpY642V72Ggl6TRBggxtxvQLTlYoIZyfxF+9HeOhQhn4w0N/lNlupsXR?=
 =?us-ascii?Q?immwp9S4OPlamqxmk9+xkKtpii0k+7pc2wr2A7twwgsCfCOTaAXlXrLLU2wt?=
 =?us-ascii?Q?Q3YjbscVXZ0H0vk/TEXNO5V8++bghG4Cm7zhFPj1kUx8JBs9vsSgS3eztbVp?=
 =?us-ascii?Q?ggc6naN+w+g6ezg/0zh2Avu1EO1MIdaaGGr+bO4drKjcUZAiPsVAAFLmieek?=
 =?us-ascii?Q?xW0s90G1jhcSWOkHaI2XSq0EWIz67A4jcYBxoo+/wpfXBGPdFKMjJ8ALUBLk?=
 =?us-ascii?Q?/Dn7qnCnRwaCJSsmtnKx5dRfGarP4moxaj/Sr9HPxwEhIKzjaAiHImisqRSi?=
 =?us-ascii?Q?LKWkCALGcGD/WjOYhez14l70nuX5LoW/70ELdkeIDkXV+lIEso1ZOJPWTBss?=
 =?us-ascii?Q?DbBcAXuaszvL0D6267Z2yWtaTjIMC+Z+NCjsgLZNtKJBtipXIYN8xLjd11SR?=
 =?us-ascii?Q?AFxkMPz4b9Q4zilU61Ne4bxiVUEWGWtETI8bXHXKv26JOSyWebnB22oQpAFI?=
 =?us-ascii?Q?Wbc+w+IYIRYlliB3otgVtq6htqh/DFEo3jKTTUF8u6uw45C3fZA2sWjyhloX?=
 =?us-ascii?Q?7/RzKMZuC2so7avFv+k+j+4welOJfg9AaP4oC8qicbFfheSCbhoHUKhw6m3R?=
 =?us-ascii?Q?HnrgqBS1vlPg8Nu1PYj9nXA74U/z3Nqlsg7Kw2eGIMV116cQj3z+X2ZttKd7?=
 =?us-ascii?Q?PxpxLFCl/MG4vAlur+Z2FlcQ3ZP1b0QLnM+idHCrQv551siqxaD6wGi2OP/M?=
 =?us-ascii?Q?2PURzYXL4/0/zM0ilSt1XShTwU3euIoYY7zIoPTLGjtLkKlgSuZQvSRC+29s?=
 =?us-ascii?Q?Jch09skZ/neJ+aDSuDgyOuLOen1BTHyIXTLzpCk5MvcpNC+uo2EKi1JB5Ltn?=
 =?us-ascii?Q?Fg6FkKK/ID+pSEznekkrwP2x+M96Vea8ICNtgTPLzpqi/L5rLADvCwg3HCG3?=
 =?us-ascii?Q?wtVlQCIKCMNA/NK1gQ/MFgBG9vpTzEzql/lBJt++L/JU4CZPj9n63fHxaONp?=
 =?us-ascii?Q?5303dnEE60s0XJcosUf8iSjb0yReBkPfB/Q/givCRdBLhOT+AfUU/8ptwRGv?=
 =?us-ascii?Q?BERS/iGz2W4PUdU0qX5Czo3VKlojcUxGDj+Wb7otNSD/f4tPWl+HVoYZv4iR?=
 =?us-ascii?Q?4DeYmFOdQ5A1ujMWPg0qGiXeXtqJQfZRKFFZAkuX8TP/Ck3u4td26kndUUUW?=
 =?us-ascii?Q?TKnL0CiRQ7KI7eg8sYkDbZGDSLA9EO7TkcGzho3QZOd6XzLQaoZOdeHJeQtJ?=
 =?us-ascii?Q?vgR4++heqfFBNZ2crj39lxzpx/O/+RF+Rjjq8MqCJzfNcoFoCFD2ON916bBs?=
 =?us-ascii?Q?vUyxJZMupvSCX1FHwdfOpiuZ0IO12q75/XlgatOAsMOqdzEBTSmo21U3kyw2?=
 =?us-ascii?Q?F/kCSXUnm8pPucR7Wa5lYdLszOlzS5eBsSG6tQDPbRw11LhiziHFhHcf5N0o?=
 =?us-ascii?Q?VmduaqyIH+1NJKhDNUl6Ib4PxFNLSljpplZRLcawjdALBd8KthHyaXTZZj7t?=
 =?us-ascii?Q?VPtsk6PGcpOrQCbTjE9OaK2OSF0yhV0O43qpb/JaAapVJDBtPvkNts0f+B/z?=
 =?us-ascii?Q?A+G/i7JOSP+djQKBhskpuElqUVfRGM/h/3TZXUGsVvvmmx+bliCFhQk9UjRy?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e2e3d1-cd49-412e-16f2-08de23897a5a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:24:10.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3d5yqbZ7NCvyKsFcGDF120+coU3A0H2cncdVS7VFons3ROHuVWaGevHaEk/E8wA6l/EJYqqcQi2yjexvMKMzqd2rRyGaotyl0yPMZOTEReQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
X-OriginatorOrg: intel.com

On Fri, Nov 14, 2025 at 01:13:00PM +1100, Stephen Rothwell wrote:
>Hi all,
>
>Today's linux-next merge of the pci tree got a conflict in:
>
>  drivers/gpu/drm/xe/xe_vram.c
>
>between commit:
>
>  d30203739be7 ("drm/xe: Move rebar to be done earlier")
>
>from Linus' tree and commits:
>
>  73cd7ee85e78 ("PCI: Fix restoring BARs on BAR resize rollback path")
>  348df5b30822 ("drm/xe: Remove driver side BAR release before resize")
>  af63e94f01d7 ("drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()")
>
>from the pci tree.
>
>I fixed it up (but I am not happy with the result - see below) and can
>carry the fix as necessary. This is now fixed as far as linux-next is
>concerned, but any non trivial conflicts should be mentioned to your
>upstream maintainer when your tree is submitted for merging.  You may
>also want to consider cooperating with the maintainer of the conflicting
>tree to minimise any particularly complex conflicts.
>
>-- 
>Cheers,
>Stephen Rothwell
>
>diff --cc drivers/gpu/drm/xe/xe_vram.c
>index 652df7a5f4f6,10f8a73e190b..000000000000
>--- a/drivers/gpu/drm/xe/xe_vram.c
>+++ b/drivers/gpu/drm/xe/xe_vram.c
>@@@ -24,39 -24,14 +24,37 @@@
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
>
>- #define BAR_SIZE_SHIFT 20
>-
> -static void
> -_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> +/*
> + * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
> + * assigned IORESOURCE_MEM_64 BARs
> + */
> +static void release_bars(struct pci_dev *pdev)
> +{
> +	struct resource *res;
> +	int i;
> +
> +	pci_dev_for_each_resource(pdev, res, i) {
> +		/* Resource already un-assigned, do not reset it */
> +		if (!res->parent)
> +			continue;
> +
> +		/* No need to release unrelated BARs */
> +		if (!(res->flags & IORESOURCE_MEM_64))
> +			continue;
> +
> +		pci_release_resource(pdev, i);
> +	}
> +}
> +
> +static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int bar_size = pci_rebar_bytes_to_size(size);
>  	int ret;
>
> +	release_bars(pdev);
> +

https://lore.kernel.org/all/3ts3e2fwom7inbu2kzrvljo5mm7wz5ruaf6daib6cf5tk3v4al@njzufk22tcsy

the more correct fix here would be to drop the call and the entire
function since the functionality inside pci made this redundant.

thanks
Lucas De Marchi

>- 	ret = pci_resize_resource(pdev, resno, bar_size);
>+ 	ret = pci_resize_resource(pdev, resno, bar_size, 0);
>  	if (ret) {
>  		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
>  			 resno, 1 << bar_size, ERR_PTR(ret));



