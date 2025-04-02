Return-Path: <linux-next+bounces-6143-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B58A78D62
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 13:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 037D97A2176
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 11:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2049820E00A;
	Wed,  2 Apr 2025 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o+I1hrsh"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E4235C04;
	Wed,  2 Apr 2025 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594258; cv=fail; b=rI/lg0liklS3av+b67LKa5I8+lq/dfal7KTir3HzkAEs6pNeLwmiqZXLkOEcHFD++X07NzVZRDKJaZ4i+5NEw53L+ValIT/vEaBhbcX+ZHXu7isDu3ihqngTxrwWY+Wocl1dywATraN0VHlRzxtsETAAmnbRENjL7xid25AkTXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594258; c=relaxed/simple;
	bh=3jprTyDAOdpi59rOnBYTmYNfg23kPdmx0OE516J2Si8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PW+w1CAr9bMm4tM2bYEYyNzz+8Jl8LsvB/Eh2+caT19VSRFPGV4fBAUoytQwD4CpdmF6q0HT8Mqrl0UCGeWHD4BVht0A137qaPrv7KA3N5QYWTSiKVn9tdw2d3u45DsLvmlI9Y9LmFi4+XRWr4Qh4al1L7jhRnlfnCxysojdo44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o+I1hrsh; arc=fail smtp.client-ip=40.107.100.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN7MIuFWDjUkIGnGluehy6mRJmGUvogoWzT9mEGKOLG03JkzC8KeQPrYY10vcqWfpZJx6CR2jZlJqONAwmw+FuZ4WEIeU1L/NTh1uaCQOQsaYKaHe1Sh5twqTMF7GP4NFgdTgHn4k+nS9ufDI/4yKFPeAkev9Ei1C/744RC4VzG4S6D3GsGxt0NE8qQin2f72TNjcwJPUmTlOA20iDMS0PCyD9GW3Dq7UrsBWVL6m7GJeBrWhNKrsN1g4yfKaCG4dd5USicBt56Dy14yGzyP+Tvbidybw8ujJ4RnOFPWwEaDSRO82ZusTLC6jS/TrXx7DylUZScKsAMbgHlhTbfcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjB4ZCgxQp3j1g+rBH81LvXrHGzbRTxZ/LCTuQc4lTE=;
 b=xYCbj7k+5llWSrHoAmRjMLd+UH3Vkzxc4Rm88lQvkJdTitpqrjRL0HbNmytzs30g4pbmCcmNGLxu7BFzMbqMZRjYmygcnQkAlpQvjP870jrx+DuXUVh4wsAPphiTgMbfCZvvPsERBeHqMDGn3G/F6OvPnl5e8WgVt3Q4dns/PHoVRf2LPdKWukkSZ/2Oi/w4Ff0uaPChVaCywHIwyGjNz6LMZhbpGj79x9P/67WXTQ1BPzhLnZcYNVVlef6C/rXsgp7g6ieXUSx7BLCvR7UaoZ0I/6dnxlraiDpBnoQsAwUkiAtMt1o1USF2mR2Qjp9M29gbaC1FFVgEeh+HsjAHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjB4ZCgxQp3j1g+rBH81LvXrHGzbRTxZ/LCTuQc4lTE=;
 b=o+I1hrsht8O4tP1CUzOh9IMEmP+08W/IcREWBUZWS+ibKq5UArtTU+LxruolTfKA5fov6eI5UkrgK5n7XX3Vl50jVwACCt7TBSd6WfuPYKe2nHcMA1F1Z74m9qTILCAf9kVbbEL9QxACw8avjDjInND99SZ492T7WDNMvpEipZzIh4iAeN0TKeKxwJPaxi08Qz80xa5cmWEPAP/oxZXFLnIEH2l22okncXcmElNYqfky1dvxNLhZ5ajEzpW6CToEFJK//zdFmkGE+wNnjGFX81AJboDab8My/c+PjxNp92bYE4c+1yKpurDk16tRhEXm5cF69QHOD3tSoYdnmDGNxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS4PR12MB9562.namprd12.prod.outlook.com (2603:10b6:8:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 11:44:13 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 11:44:13 +0000
Date: Wed, 2 Apr 2025 08:44:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: paulmck@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Dave Jiang <dave.jiang@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <20250402114412.GA342109@nvidia.com>
References: <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250331171755.GC289482@nvidia.com>
 <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
 <4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
 <79a032b5-b13d-43fd-b56e-01098122e104@intel.com>
 <66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
 <e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
 <20250402114722.35cbd9d5@canb.auug.org.au>
 <478264e8-af94-462b-929f-f7afdf8466bd@paulmck-laptop>
 <ce38cbe3-429d-466b-bc8c-7dbb7c596ab9@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce38cbe3-429d-466b-bc8c-7dbb7c596ab9@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::10) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS4PR12MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: da385dbd-0dc9-4faf-ce93-08dd71dbb0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IAxm/tp6MFHCHKsmCuyZXzEqEGww/E/hIXU7TQwuXi+JNPLdUAYIhomT+dbO?=
 =?us-ascii?Q?s3W/hThqY7QoYFw02qPes+ZWaaXdiLTyNR8Y3QS4EayjbVN9q/hu3qFm9G0J?=
 =?us-ascii?Q?dzLnk3yKXmWEIpuLlTW2yYPA0q1mwHgiaSdSwHWwAGHTdwxylnJNJKDiBAU+?=
 =?us-ascii?Q?ZH+vTFyjNDqEmoiOuwG8DziLPCFjyeenfb773SoyprMrKe0zkiLLlLxOAXCk?=
 =?us-ascii?Q?lYx3L5vzc50S7889jj0FdlbDJ6vOA2j2HJLtArAVCmTyTpf+giIyC4JxgtYW?=
 =?us-ascii?Q?iveTEu5S0keTUekq5iR3rY9hXiTrtdQQUGpGHIoi5a51yAl33xQjQoMVjGko?=
 =?us-ascii?Q?MzfKiGhC5nryebxPeL/cjFJQUcOm9cHPT+W8bp/njuEh6jdEIiIS1poaiyGU?=
 =?us-ascii?Q?YaWjmoCtmYyKlPi9lParpUDfhxBAcHiUKN/c2o4gJhic2KOa/pl5imkeoJc8?=
 =?us-ascii?Q?vTmKoRGD0pO3PNrOkSTiBZj2Bit2TVOB+YI/6CsJysKl5rjLpzhAzC8VByR5?=
 =?us-ascii?Q?+R+YRHWItsmMd4RQj7PTZXs+3kwFEo5T6T8XK8eWlfUfeEEjmGI7kxcNNaRG?=
 =?us-ascii?Q?dIqFbue48qigLb9GHPOTXPriLkotz92VLjNxq0TgSsjExr+ST25ZJKr8E9Gy?=
 =?us-ascii?Q?xB7I18sF6frFlPRcFH4IPtcD0PmZjIn2ImxII8qjZE+OqSYskwvRHXviiYVT?=
 =?us-ascii?Q?SkauOL0Tasb1i1Eeh9RPVieD5dnTfvl7+pn9ZzoffGblVPrusrmPVFLL6BUZ?=
 =?us-ascii?Q?c5z6+Y4x3CmYjt4vA0Tuq4QoJCiP/4HWW6x8E5WnUjUGyAfJALGAr7xyiIyX?=
 =?us-ascii?Q?X4OsvixsLCEglEJWiaOb38Gm3voSM+pcfLJJeWT01kRxtLsORukQG6H1cs0o?=
 =?us-ascii?Q?mNF6GtlhsZLpNhIRCsBzpi+G9zjmTPkgaXsTlxDe0+H2BsW2ekzq++pHJgef?=
 =?us-ascii?Q?dd4Rmg3ZjDT4uDERG20v74+h79jZdSjHxmch4tgEcL5QW3Q5NLDrQfn7y0f7?=
 =?us-ascii?Q?hDV5r/qG7s1trGxtc1E6Do4IsGatER6iOlvA1/veK2ZbTQXsbq6PRoImwSjY?=
 =?us-ascii?Q?bEFuBdhI1Cc5eo1RcxJqcSsgFPLMYcnzRLG5Z9DXvro3rccVvcRj0l7m+DX2?=
 =?us-ascii?Q?9Dy6d/4l/Ypfq3tyPiPW3taTRPyFxxTeJPERVBt8H/oids/Cgt1BISPmGtgW?=
 =?us-ascii?Q?gQ6Xw0SjIfhwGEGtJQGtHeLEcgpk3iZXvjt+HWhwzohdHzXuokT21AExg+0i?=
 =?us-ascii?Q?OezL10pYRZ8UlmABATgIGfiJnAw1W7MGZbMWXfCxNiUgXcPSVzhusqlVc/a4?=
 =?us-ascii?Q?kT74b4B/15F4w4pwpemk42mD10P9XVrPYbERNGtL2vhs+MSKJZ6ymisPv+MW?=
 =?us-ascii?Q?2v2LiTskLAer9wyrJ1j6MfJjNLXI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fJbuIRaG2uSTmil2RjPdTQ97WNEPpaO7FbPinVHnDDNLl76l6/uX4XeqQJqj?=
 =?us-ascii?Q?5BYNuwRRKHfar6cnic/zS7X7CUSD6nqU69A/iJZkEbgaWGbzXXsCvvSKJFg1?=
 =?us-ascii?Q?HQLE/FlayVyqsUJoxWRROHHWzWarUyGqtkzcMDxqG5iAGDoLvVFy3DevjvM+?=
 =?us-ascii?Q?sqKKjU59QK6aSypj6+jZYKt9VEK4IIOwISsgGeheRWZsbg7XXkegXNN7XHEZ?=
 =?us-ascii?Q?yHafKnfy9eySzzK1Fc3QFBAbOdBMoBVSdMfwVunu4w8Y81Sa4IdqZKIjhqcd?=
 =?us-ascii?Q?M7xURXJ4ubWjz1dGEDgzOAgGN8MVwPFUuPkYUhhli4hPN9Ogdi0PMVimiIRh?=
 =?us-ascii?Q?t6FUkj6d5GyE+dLSpNvAbPfRHCiZOg72sIC4hEi240x32D0RPxnyBWjCRUJ1?=
 =?us-ascii?Q?VagZQ/5IA6S26lCBYkmIudsPiWxi9RXNc0rYch70rK8Y9GTwxNAn2jZuK8sN?=
 =?us-ascii?Q?91MRWX7EUd9tJqBMDEHYcWVm3s7r/JKAhtMumA4cRF74JCv4Ofcp94/G0vOk?=
 =?us-ascii?Q?S0A8yLNsZHUW5tURHZamI05zolpda9bYwOp5SUPSIk++RUB2ouiu5GB1KMdO?=
 =?us-ascii?Q?9klaSMtzztysQ1bDrYLrz27r9Rw2a39me1bk3GeX5h1KCZmFRKw7BruG6gkI?=
 =?us-ascii?Q?tKBW23ZPFOXwZAQMCoMf+3pk0rpYVcVZc4WknZCZgEKtWWRXHPvWKgGCVuTd?=
 =?us-ascii?Q?o37wBAWTTU9AXTwUqkMc7yJgbsqTeKTEaqqpl86aDISkkIi+hFYMpYknkkGU?=
 =?us-ascii?Q?UMSsuGO4RA6UgJgwem13Pn01Ribke8DcG58cMBKVrA20tGU8mcOVe/LNst9H?=
 =?us-ascii?Q?7azkcvcNd9pPNV1+WiIJk+n+rZxXHSvkKK+YblA0/I5znxna9E0VKe/cwtgv?=
 =?us-ascii?Q?Fg/t3IYy101Oim27m2AQ2RTIX0AlKvI1o/T29/kU6LDvwyebTJUY2rF9Rn7T?=
 =?us-ascii?Q?7eWnBiNRnuy9XiqHm4H5PxnL9r65MAFfT8OSmpy0YrCJAeDezt45qttsGFzz?=
 =?us-ascii?Q?FAuv8BxA7n1X3+H4G9XCBx7qzLLutF+itXMWO/JUPY+CYACDocsL+CGvpovD?=
 =?us-ascii?Q?8XjfsXySI/e9JLgMMjTf/v/kQuHwdPKjcbKXA7M7wpksOFuVCWy3GSLKPFMw?=
 =?us-ascii?Q?QNKRAERCblRSYZhrNcoKfA/7Gt1f3Jikr/sUXZdFYTmQnPf1E58kHYHqv4ev?=
 =?us-ascii?Q?cUqpp8Hs9huvBxQHU2omZB9Ze62krj4D9Pfx4095tW7VPIVZNysPsCoEnOJ1?=
 =?us-ascii?Q?z4cGGBcXzzaDE6KrbX7DzL9/tzi+MQH13ToZ7Y/3Vb3TR/3zoFySBH0tnDzY?=
 =?us-ascii?Q?Lg7IOnzxwVYa6J+RSb2CFJOYXZwv/Wfnz8i3ai5WJCk4reCG9sg1nYWlFPAv?=
 =?us-ascii?Q?HaGheUKezKJEG/JmpXnsIIpQR8gsykDRhVPeFcPr36GjeVImYwwjCJdNmF8L?=
 =?us-ascii?Q?V+WqqYZwmM+k74Z8B2Bx4xlAEcBnkSDeaAUuuxIpPD1syyUqzkioWi8UXU8t?=
 =?us-ascii?Q?vq1dqCzGvt/3Mlu19+6Nu6O8a8Y35jd4BH2szPUY0fUk1IwFO0hI8EazINXA?=
 =?us-ascii?Q?lRXJPJNMlQj5jKRey7BpyesANtQO8pQ6ZRzSZTzt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da385dbd-0dc9-4faf-ce93-08dd71dbb0e8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:44:13.7883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27xRb9nUwdYDlLhBGilHANSX6dt8hfa1GgpVrbyIH6+Rzr5rzg1/OqX/LI6bMIwX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9562

On Wed, Apr 02, 2025 at 11:57:04AM +0530, Venkat Rao Bagalkote wrote:
> > So the various kernel-build howtos will be updated?  Or is a patch
> > forthcoming?

I was going to pick up Dan's patch after the merge window closes

> FYI, now the issue is on the main line kernel also.

I thought the header test stuff was disabled now?? How are people
hitting this?

Jason

