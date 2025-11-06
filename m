Return-Path: <linux-next+bounces-8889-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F51C3D52A
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 21:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19D613AB367
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 20:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7770932038D;
	Thu,  6 Nov 2025 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WFYhI8Pj"
X-Original-To: linux-next@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E288D36B;
	Thu,  6 Nov 2025 20:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762459550; cv=fail; b=Q9l/JiFmr9Z2aL7BLVX32XLDJNKRr5csoRWGiF/7nGdqtlrYKWSqEQAduELOKeVc6nvVb3TCbk+XpDYSChm/5sdKkGxjK/sRuRrDy0qWcnHf+2a5eqx1Bxaugm6QhRuRMxbZZanJ2UeYYVJq5Ea3sEHp/mHCRv5uo78l1NL409k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762459550; c=relaxed/simple;
	bh=KB48pC/6ekXaAVLQ2fCDrkq5302sHT3OaLYnO+IzB6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IKLZJCN2RrX006ev2ATef/iOOk9mKocd88Equ8VHw5B1hdx2F8G+yiznuSUJ4JIlFXoQ5y1ZCY4FRc+2E8ORQIL/1/qB2JXWzzeAiBHHX48ndXmkB++8DZS9Bja2/rV1tgt5RR2SLmKLILwwyglsmR4rahHDXKZNm002LCUtzyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WFYhI8Pj; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+Qi/c0tlG+JuV+x68LWOUAz+kI24MjhLbyz/9rXI1PT8ITIuLdxg0KIBkWrAqxXbPOy+DQX1vMiK2W+2OvGG0q8VfDEeTKEkTpiQXmaXJwN0uNfJ9wI2dsL93oDT/A+0J856GTejmqmtLPVbU1NnpWfmEtuHajiim/doecntNsfP+ONLSe8bSJ7xJAh/VDNa5KXiv/kp9ZCFyE5/SUbrbFEsFYnhlLUoYw4BeCGyalirsFpy8lONEYtOEeCMALOG6oJQqF91UbmfHhQFxy5jAkcin6x1Hc6Ixj03Xoi+ND2BeLV6KfceQt0K+2zOxX4+ZPp6XLgvfv5bw7dDztp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AcS+qS1Y9EAPly0mqQ+tHb1Iq7RJ1zlLki+vgWJr5g=;
 b=LBh0SmpWfZ/AzVugkuPFf4KxTSvxyfQL5sSceSEqrgxVqojgWnropCHA0FNquYaxnoQLcVOk0RtHzgDaSxADb2jFDVrjeB+Z9GBsQ77IUxSVr8QIhzocWAXfyUFyeGTHHG5fAO6S/Q5KUbbnuZBvpM+f0C2O/G1V9F6w/KTL7mARei71E61+2lGiV/CjQCAYDWvBOpriWdzzzoxJi3budHtGlN1Kkh1T8ZSpDOq5vpld2BFhw1IFuoR9amLi1mZaHN8p0hzVWfY6itMVS7t3R8IrxUyIUAyCY5m38C9x3UfHG7NOC2/2tWBB1lB0pss1mu4hsthMM61itIEc7L2SkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AcS+qS1Y9EAPly0mqQ+tHb1Iq7RJ1zlLki+vgWJr5g=;
 b=WFYhI8PjWhr65p4AiqC/j/fQgqv8gwct/ap+GVZJcQ/5US5B0QKs13WYf0G185M6lI8wl8uJYBb/BdrMHzaAP5FzFgGXPJwYiQNijI1utcV17lbOyMf90L2w25YSmF7NIngaFac2rv/aW6OzLsaK7jt7E0lyli09HzU1YnR1SjI112M4t3qE1hIr8/d006vRjmdp0S2zjm0vaD0J+fzBkE2eF04gXdyYVHZumX0waPLYGwXNGNaJI8GvBUf9kBoUO6wo/CVO2ZP6V7CHAeop0YMazJEkdbNIPFkbDBvVjOC5ba6C9f+naX9kV9vrQhj7EgSJPrtOdkmdTgw6ghejRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB6710.namprd12.prod.outlook.com (2603:10b6:a03:44c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 20:05:42 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 20:05:42 +0000
Date: Thu, 6 Nov 2025 16:05:41 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Longia, Amandeep Kaur" <amandeepkaur.longia@amd.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: linux-next: Tree for Nov 6
Message-ID: <20251106200541.GG1732817@nvidia.com>
References: <20251106153215.7fb21343@canb.auug.org.au>
 <e641c955-25ad-4eae-b3fe-4392966cf768@amd.com>
 <b47cc630-b27a-4d62-83c2-c81463b53bee@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b47cc630-b27a-4d62-83c2-c81463b53bee@infradead.org>
X-ClientProxiedBy: BL1PR13CA0280.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::15) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e53487-8951-40ec-9be4-08de1d6fdce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kp45c177RlSP/MdTN+wLT9N/EvgXKEorhICqywVbhIbXmZp3xNm/pS8V17SU?=
 =?us-ascii?Q?aLIZrSIRCD6JoXJV43fL3PfemfTHNMHg63A2dPlg32XNOy7uHhYOJM0bO0/Z?=
 =?us-ascii?Q?9YWy/gJzPBbnAKFWEt9j67KtV/Ub5nPDV00R4TtJfqtVzUBb47f8MJ2MRLxM?=
 =?us-ascii?Q?/V6n0INUwtCzUffGe6ZNfW8PwRYIDnsgYss9JfKxGNWTNsxIUEoquR6OvrZv?=
 =?us-ascii?Q?pyzIvGRaFXqY0MIxvuCw+4V9eVfx7f7UyCTJC186etlcbpmjRWmUz9I3940Z?=
 =?us-ascii?Q?3POqtvHx3RYblmpuodh+SBeA8mLpAFBwtYHXPCrin4ajjoCueNLkPWRBMTrA?=
 =?us-ascii?Q?49s0W+GyMCfvymIBCv4II17WAPcRsf2JpL7Bo8UNVr9lxZaE0z0D8vxxY8Ph?=
 =?us-ascii?Q?lDid5mpbMZIazLMjsthW0kzSXT3/izVh6HRvArvaEDRau9EkhOomnXhP/WmX?=
 =?us-ascii?Q?VRgy0bMwG43NHjaYW/Z8xcz2vLtTyL4cFRrHYn1zJjETQ28lma6mAB0ck2be?=
 =?us-ascii?Q?mnZVc2H2GPKgBEqHBy7FJLcccCW2uO/4GCM+nXH1B9KkUl8/U2K2M9CuQsig?=
 =?us-ascii?Q?iiLDAot93U6wvyf8cQDNdvKqfF+OrqKdxpUTpTr7bqBEf489WtOwslPQQ0CU?=
 =?us-ascii?Q?MmGYibTBSZ7i3U+3hdxatzmS1Cqh8kBGDuL4hB8MSBSpv3vk+CJQXETgKaLk?=
 =?us-ascii?Q?/xZm7GpuHviGwc9UGVIRRybJcXHi7rv+aVgNvq5butfA6HqeAAsCpyYtB0x7?=
 =?us-ascii?Q?HEAv85csNr44cCw2MLLgL665XVRXUBH+RyDYnGe0A/ZSLt6m1RsdtdWit3rC?=
 =?us-ascii?Q?0dxuQLt0Uxctu2LN7Ij7u+zHq67MivTESFoJCdeAijmn9597GEFZLCuix0Bf?=
 =?us-ascii?Q?6HPUEVKq14Ty4cz/cmkfS9KPNae5FaeWMbbPiAJ1juQ1atW9oS5Q14u5rcEx?=
 =?us-ascii?Q?lHw2019qTULwUy+ZbogKTqrTZ1QU6K8vNSe7Q5XyigaRU8vFg8+4ilCz8pFc?=
 =?us-ascii?Q?ibDjGW1xArBu+L21omGtS+IbKLncq9JdB/BXGGCkFOEBxmFhWgT2yjO2ySLW?=
 =?us-ascii?Q?T3L0HoyxwvBUjBEm4L6slv9aR4FCH39wML8iYEn8hAd6h7CcmblXY1vcLj/D?=
 =?us-ascii?Q?yheelbCG6rNCZYhwhs6KFwV+GNTvxORE1rGi3AJkb/+Kffs1erLzKG8c9Cej?=
 =?us-ascii?Q?TsjD/Fznsu1OJOpXHMdj99LmkfmGCNqY4gR+CIDd/mfvH0Jq7aM74xiV6jPN?=
 =?us-ascii?Q?jY9im25/3qVTLZ1BAjcSN5fRlgznmeIDc+v8Pj0hUtGgi2IfjAAbLmZJvuYj?=
 =?us-ascii?Q?lus9vRER6scLJd8o+B7moc9/Gp7g0A/REyCSfno8Skv7yQdvpxOkHzz/UQzb?=
 =?us-ascii?Q?zqtQ3rUYaSzOlHHjUsItERuqD1ZZY0diUAD/ipJVLqw4WBZmyOPf0tMIVtS9?=
 =?us-ascii?Q?ckfzdgQLUugZojflbBnrxpVV1iUNPUpOsGS4hY0hl1jxDiLkfI2AyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g+hFJ9GwXxCviKVbylt5uCIqQDaz1MRiGl8+Zo9GuMDHGxaxXcQQE1v8HtWX?=
 =?us-ascii?Q?yDW1pPxUV0X0vx0MYMKgR/3jd/ik/wtaNYjW6es+5tJgWSQ3Dmk8EihtkoXh?=
 =?us-ascii?Q?hOKgqFvxN754hSGiLs5SDawo/b5gMzBiV/JEQSjUCT7aU90eF/+el9/bmzrd?=
 =?us-ascii?Q?P6b7ztLeVuqS1HMmYAdxVKzDVmdQdHy0BjyVBMKcfkpwJxfvzpc4y1+w53VR?=
 =?us-ascii?Q?PGBWmCvmi78dlV0HqFRIbvSYSdkzNbbjPuyr5zbf0p1P3oC0+nmSQUng/NtD?=
 =?us-ascii?Q?+YspJbrgORwnynxSZFIC2KdYMrPaJ13u+mkQwK157PsJK5F5d+kcV/SJ+3R6?=
 =?us-ascii?Q?OL3vE5cfpNSwh9YwfWx+T1z4Q3PLaWV6SaPIkO4a+4EZWVGkqMrgyDycQplv?=
 =?us-ascii?Q?WxsIfQ4C/2HOEu3Q/G26uiKq9il7FzukJX2OBqGz+P2IzvM0s0fcgsm3kijt?=
 =?us-ascii?Q?lwuovaB1JwsHePv7QGornVK3vJUrKu7FwkLyNJw4n+uZOK1aA3AwVEECFqTc?=
 =?us-ascii?Q?3GaLSICd9KiODUTBOWm7mWdjDg1KR7kPEfL9+TinHNN1N1O5oJKd6/IM5BKC?=
 =?us-ascii?Q?gUG5wEITeFPRMCPJ8sRwbOB30CAlwMG+MX0B3OpQd3yqiFlXwwUCd0diHUks?=
 =?us-ascii?Q?xoCOaAiLRforiZ/df7xebm77oMgIlaxkHko1w8jHbCVIfzztNIACqjmmUZcZ?=
 =?us-ascii?Q?qsNzA3mky0SEfaoLiQexazxvHcT252/ptyQ/1subU3YLkNJ38yp195HhWyMn?=
 =?us-ascii?Q?3vaqrJeJBtCEcwXHVQV649DVruS2WcBTxVlIx9+TWSxyaitNQJYlkZfREK/9?=
 =?us-ascii?Q?vayNYOeyY+ffBvr83SxbCSYv5EmsZgFY62014j9FkB6+pcTUHg6y02TQ5Ffx?=
 =?us-ascii?Q?B/Cfcbt55tSauYcnvC3xQRh6C3Ane/foOzZcaEjrfzvOnyEckg4EhZBMU1QI?=
 =?us-ascii?Q?BpUKP5vhSS56Fk+OYx9NF4SArxi4pteLUP+y/Sszoftia9+wcD6xbuG/v7pl?=
 =?us-ascii?Q?7ficFNbygrhwEJPhKCvv8tZJX9Paj/mhjTzRsMxrdnnvQxc9zDzLfKOzG+xo?=
 =?us-ascii?Q?Yry6APPIe3F+qPotuC5EYi6V/t92zpfbO5MPVtsUD3TlKAqbb1iy6cqE4wcR?=
 =?us-ascii?Q?Cn4HcLI0ZWckVXpB9xSPN4DR9YmuRhhQIREVVBPBI4fTLc7OAuZKahusKASm?=
 =?us-ascii?Q?YBK2KO7fOP9c4KiKTXuCU0IaGSD1UZhxWMZGGXxszhXethAYnsos4Rn8NruP?=
 =?us-ascii?Q?asn0Qg0v7AYVlnZsewINurVULSYpZxqwYPg5U4BApGOSza/sVWutUhg91AvX?=
 =?us-ascii?Q?xIUn6nyTfV80YA4J39YnbLvozt13lwY1HB/bdHg5aBvYVognSMj5z7pgNPVe?=
 =?us-ascii?Q?ROvo5LXKEw+gOLvZPu7HLk+x2/6vLx67yLMCDx9Ct+aO9v8lpIE9I9w0bafc?=
 =?us-ascii?Q?CKLAmh0g386cU6/2myJGufzVGLEYlBoj1f0WVQq5ahgAX7/LMU42tuoY4VEJ?=
 =?us-ascii?Q?D/yfcZcsdvxXSTqwgtWCwsEJ7BfDhLt/7BUl2taJ1JIuVR58ObeYiQKXbvU8?=
 =?us-ascii?Q?VGB2t2emyESzZz0oMnI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e53487-8951-40ec-9be4-08de1d6fdce6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 20:05:41.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPLs5HPEW0SQFSHgLfPxdsM4LqddD89FiL1zvh8vGtmFDG6XtjxyOgmRnwZPOvGc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6710

On Thu, Nov 06, 2025 at 11:42:36AM -0800, Randy Dunlap wrote:
> > Currently, I am bisecting between kernel tags 'next-20251106' and 'next-20251105' to identify the culprit commit causing this issue.
> 
> Pretty sure that your beginning "good" should be Linux v6.18-rc4 and
> not linux-next. "bad" should be next-20251106.

Thorsten pointed this out in the morning:

https://lore.kernel.org/r/20251106185814.GA1708009@nvidia.com

Alot of bots and people have used this series before it was merged so
I'm not sure what the special condition is to trigger this.. Does the
above fix it?

Jason

