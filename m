Return-Path: <linux-next+bounces-8848-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D6C369B7
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 17:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91BF21A24117
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 16:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4758F316183;
	Wed,  5 Nov 2025 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J+BFj3oe"
X-Original-To: linux-next@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50C320A24;
	Wed,  5 Nov 2025 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358629; cv=fail; b=DUNBc+wb45/3DPyjVHYfc1UabhYuu6LNODiIAvU/fk/pE6TGuvM0oletDcn7LnBwU3u/JzrvHmVOQXGVB9n0/fIhqzlj0A1858RtQ2okJTVvRAgt0LTmFQns7elt14jeVx67RqSzhV3FFHxhpqC33Jzm+LTSIvYV4b0swejqKUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358629; c=relaxed/simple;
	bh=KEG8lKvJNeFGLPgXcUH901vjRas6yyypmtiHdCiF/Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a49Yiols/ZhS5Nn+NYqYMI+M9K+EoVxdh0fFJ4iUC/NhMFxPi7yzNPn6kQNveZf7o22jyyHeyu0CnFAQXJmcMK/4DOSqZbnuxHg3H2PDjgMw/z1VZe+C/Elv/s38mJWZ+joLfaCa+Yy15cc6vgqM5ra/iDC0KghnccWx0JGCdZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J+BFj3oe; arc=fail smtp.client-ip=52.101.61.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWwMuPv0gXeMOUAzC5rptSUgRCqXvUrtic2ZysjEpNkwEiaAK9+EPCuulqNXoOGogrLxYeguLNP1IBdOXO7A2ozoJUafvoGon6FDnFx/YZUkYTcx6wuP5oB6WLJvQKs/jXESFtTBqLBjqGNnJG91Z0GFgHQn5ma9JNTjgqxg4mmVFQTiYB4yGti2K9fKScxhZRtEt5k41gVEmkhZc9MbYDMOj2voFtttuHmJjI4o+br644yWUCYfAb5KpGejbVSZ96THRQgtylNSm0mYDWPq6sQfkIq82R3RE8d40GT1S0faBIxQ+7CuNDGuTeRZ/MerACDFbWDVHCI0l6jiTy6tXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng5iO11TiGAMiiNx5zhIzusDErtpnUMROjBb1/lL9Mg=;
 b=h04kFMvlAA18KbYNRiX5uliW4z38/JHBRA5msWNiATPF+fQc0JhB5bzub1HCzJJAh0cYFXNdICbpxJftNGcVDYhnaip3FFs463O1f+TD05SviErWVSXU+kZh43IzNdJlLBTMxu9RHyn8/HfQL/Y/3Y/7NmDip5WhV1a/kgzi6IXgxy2TsPWOKqWSFcZfS/LonRH1gsbFCL8EtiJ3mcFyvSKyhk+3rInZc46GoEODhzw+3tZwfgNCv4IiGCgRV5c8jkY4ZQftZ36vk274vrci6843FHFK+cRvWriH+EgcNHXRTPmKAadg5kESQuAFFJA7rsmroaBlKsJwXIJPy4ElZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng5iO11TiGAMiiNx5zhIzusDErtpnUMROjBb1/lL9Mg=;
 b=J+BFj3oevkegltCmvqBfCJiDAoVJJ5nemOJoRLkgjJj6Lc9gUmXD9QN2bbypIqdPseH+z8uqk/idFOhef8JEkhsn5cGrxgrDBDgHiF8d4SS1bu5PmhNDu0DkwVSvaJSjDuFs+bWp+aPSYsUse1t6Y7czfbxhrlKDaqiW9hMsxxxAmCKrk4sbZvR0wi97gInrXo+f/yXTJjTMRhSXjkSvipTtJyM72p+0pkJYtItLx3na3TVH/JGb5JJ9a8Jw0o+tCkh8nzZNqHvr/F4M+PY/cLo1BrgWtMlvpl/dRbQTYyYV0lz2rU7UaU8WbTdGD2bTxiFSWrt7o6AHvqi+bJjfKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB8558.namprd12.prod.outlook.com (2603:10b6:8:187::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Wed, 5 Nov 2025 16:03:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 16:03:44 +0000
From: Zi Yan <ziy@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the mm-unstable tree
Date: Wed, 05 Nov 2025 11:03:41 -0500
X-Mailer: MailMate (2.0r6283)
Message-ID: <35929A3D-D89D-4907-B03C-BDB1E110B7B9@nvidia.com>
In-Reply-To: <20251105162314.004e2764@canb.auug.org.au>
References: <20251105162314.004e2764@canb.auug.org.au>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR20CA0040.namprd20.prod.outlook.com
 (2603:10b6:208:235::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: b0244b3f-8507-4c41-9a76-08de1c84e560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SFb8qowwWnmACpWSV2swWf1vt7xkyyRJwcEah/JZT6vhlrMxn3DHXVf7IUT7?=
 =?us-ascii?Q?fO/wxxl42UsEaohU/Afs1rdoedcTQy6xzTiENz9QIPjmBHg5nTKc609vo4j/?=
 =?us-ascii?Q?MwRHh8AKrKxLfZEUrwJ087XsBi59wND/A02qRW8cK1MsK7u/0vx9A8e2wbNY?=
 =?us-ascii?Q?l9DvkL8as0Iy/S5V7uhWIYoDWrersPUzFXIEB560+4P/n2Gx3G/dJY6Llw/M?=
 =?us-ascii?Q?6rUue0qi6cmpf1WhRzyohbluOW3Ls8OPQOyIVOonch1IQ8PYX/Bhqf1+xRkZ?=
 =?us-ascii?Q?fxYdsO+uXfxxcbAtouW6/JmZsr0GWUQZqFZIvXX2aAj3GPyGzB77SCUvkXxm?=
 =?us-ascii?Q?BNn4R8ZK6KoppmU88uy3t8OCo/iWfvUkSs47I8NhgDlJItMPudqVUeD8i378?=
 =?us-ascii?Q?EjImYZ8xvvIe1+uw4qoR6dmtjxOTjL1GGM9tdptuGNG4XUKD6amUjaEn941g?=
 =?us-ascii?Q?Afa4UwXazQPgTHbfXU7q9eMESQvPP0VScKUpn2fOaIM3mlXHNLDb1npY1sA/?=
 =?us-ascii?Q?SGGl6cOSKg644muSQGXx9gv5Qg6WuA9+ajZkps91Vp0UJ3eKX2Kn2m2i0LG/?=
 =?us-ascii?Q?rgrk/n9wMCafkrXjk5ysBcNHEQPQuhCBWDFysGmGWhpb/12XsfTBYXIdb2m+?=
 =?us-ascii?Q?1QzOTkrFio2BOUVb8ohjAra1+gBh3u8SKsip7DG+2rEB4PRik1+w90Ku1/Fm?=
 =?us-ascii?Q?3xD3vs27ET+yC4kixEy6gc47Ni9Vpg90sMA6wbWLff4UXPfv8aVhPtfyRLu1?=
 =?us-ascii?Q?MsIvmTrHMcwHDkfXWHFtSADgWjZI8mm/kGPD0XjIwI1g2uwRs6SJ20VBgKPn?=
 =?us-ascii?Q?Wk1m4gBl/DEImRRN4ow/0EQYGw72ZHoJfZRYTlyNUdsYrjeRTV38C2As7JrJ?=
 =?us-ascii?Q?htRB1C1vLXyokTZ84hTDPGPtDEH1ZjEAWdJ3hb9h4UvnoWtH84CRC9f7q9SE?=
 =?us-ascii?Q?63iC+ZuqRbGqMy1ackJgJTDZcqWs5DcyO7A4C0Yzct5z2rZb5yVkCeCcNkEy?=
 =?us-ascii?Q?OoISqUyxGXOewupTFzPEPSWdzPW23/ihz0c15CKqM8eS3UG7AeAis0qIt5U8?=
 =?us-ascii?Q?UjMlVw4V/GdwaEa83yZSpecz1/R8VgvPmPNlMwvzOUXaqbrHalDWrkqgc9rR?=
 =?us-ascii?Q?pN13+WoQ0aidNUfQt1za0Yq4GJlCrDqtuUw4C98esLAJxofZ2dnnvATkv/Zq?=
 =?us-ascii?Q?cKJsISQnrDlj3ZbvusZ4cbVmwqZKb5RvNtQvjs99o86xUOJdFuHBrmlKvuUE?=
 =?us-ascii?Q?3oHtQakS8VnZrA3uufkX/y90aOFoTckJcMF11NlCsVfabi2g1XGtnF0ZZ5Y3?=
 =?us-ascii?Q?ECRG3ZXdTvlXGh9+/Sr72SLj2HCu5f5UDoSH5u7kc78LuILt5kbEt6EXIGvS?=
 =?us-ascii?Q?lm7c/SFvvMc7Z1ecF5gChaqDzJ7zNXLH2Nfv8su95NaFiOytPXMCDHgCRt1y?=
 =?us-ascii?Q?c+R6OMycZAYQ99rZzohvoxe8uwz3vuBa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ach/GrZO0xHZW+aBtmDWrqm/vUhbL4awAFP6iYQxwpus0vUkFmwHP9MczXCw?=
 =?us-ascii?Q?O6dhbSsk7p6erVdB3nsMp4PLPYgo6UmBNPZnG9hqGFfsLNtkN8oNTnVBQNHv?=
 =?us-ascii?Q?/AKxcoOrvaCwbC/cTgxAaFH7HkPvC7cf3+sWg9nyiS731fmjgsXqIITiRi67?=
 =?us-ascii?Q?VhoF9bJ+DlmizdkvkAnH4iOAUxcEt2jg3uA/6U3Us/rhqQGjke048DnD+vRO?=
 =?us-ascii?Q?HjBj0mFbzaJmmq+Dh02AmCs7e7CfBnwfMr6BntAenM6/JLP5qd1pjNFuhB8h?=
 =?us-ascii?Q?SA+BU2FUBUvTVbpphI6XvVB57YHVo+98CJZ7lo3W3xqs8GmuSd6bEs9WJlO1?=
 =?us-ascii?Q?tlyhfHYIAUj34bRDC30HcFHwCP1uomEDScazkvNKXJFQEJiEMoNlJnS2P1c7?=
 =?us-ascii?Q?pGl7vqjKPipZY5B23mjTH9z8wnhWtHYWhqrem+e6mdH1lKl3Pqpw2Fu3vA9T?=
 =?us-ascii?Q?sdCJ82FNGT3WQ59bKKqYsFuy509hfvTDW+2h+0ym+I1brP1fCvtBL9aSVzlY?=
 =?us-ascii?Q?VeTUg016vFFYToLQ+iDwJXsATyntnNp1e4kKiP9YzpHnf59W/vW7ULdwP+uN?=
 =?us-ascii?Q?euWyD/HpBdEe/wcfWxbmKtXFuCENE7c6jsq45bFUNdso3ReLmNIrn8Eh6/iD?=
 =?us-ascii?Q?O1f/wH5G3UmKdoWdYDcht6+Qi2V7vxLgDfM+q4VMk9GXZhmVVQSA6E2IK9xZ?=
 =?us-ascii?Q?9h+5CrwCsGGLRk7pQvIRq8U/VGU9yPOKt00Jevtbf4jSPfblzB7JvCfrh9rM?=
 =?us-ascii?Q?llUTz3DMOzwNT/iu3RvLXPfmp/OByR+iu9FxFHDlBn8LX7sFSgApMSc56n8f?=
 =?us-ascii?Q?4FBH3rStGYNmv67fFER7x7u6h3q0EobejI8y6OhHqe+fbxL1CYScFIPkftW5?=
 =?us-ascii?Q?SCGZ+YhTQMhvETxi1ISKtBKzZY51ZoU4MwB0VtTNJj+WcczdpmD3GX6GCGss?=
 =?us-ascii?Q?0nl1dpvOurgF6AKgDTbhu6kzT18UxyTSze2NjRZzNPH7OePkyOnq4wI5Pq/b?=
 =?us-ascii?Q?/EuZWJT+yn8AQHdOMAS6F4L2K5PctJpu3utiUXAnWJb3N0KXuO9b9UBf5u6V?=
 =?us-ascii?Q?dkuFCR2PiR5WrSwgxDCpPR1HwWYVFP9JviBafK29zJABdwfSGJD4f98eQU6Y?=
 =?us-ascii?Q?0CHSC6u5XG5TiSdIgoCLZ2zIJY6SLFAmXQlHhlEqNgFo6tFXysC69/YDs1zn?=
 =?us-ascii?Q?vkqGWQWYFubWU0utCvxDqlAncldoQmIRcjCCTZCeged8g7lO+5wv98BCTMC3?=
 =?us-ascii?Q?OEUJkClWQIqfJkoN9pHXQ9DbfBMQYuQN8V6OkksyDpQ8xuSOCvcpeXEuySpE?=
 =?us-ascii?Q?8cB/AFrOoCvWuRx1wFS8rIsIIIcE01VsIEHtwrFtfL0fUKquw+O9KnnyX9wE?=
 =?us-ascii?Q?DMux4jSaPOoFL04TQSNAc9wLj/37fqANT/lQY1MYMzpvpTQiYcjo8Jxp9Li+?=
 =?us-ascii?Q?RoTt4oJAt98vp5CwQMXfVA70sVmxlCP/x/fIMvqcQOsRBzyOf9iNSINiZA6y?=
 =?us-ascii?Q?CkoNi24Zc+s/W3LnP89MQwUviIbjAnH1HRYHlPnLjVOshuAm8Q793Z1dFO5J?=
 =?us-ascii?Q?u148rtXfz96zjsXUiauy9jyxzSTXrwWsuVc6svFZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0244b3f-8507-4c41-9a76-08de1c84e560
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:03:44.4090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdmD7FANI/bpa6tTTwcwwc3eFWk2snyL70YS/GoP69VG5KQgJZqfgYhlyXF/NZXc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8558

On 5 Nov 2025, at 0:23, Stephen Rothwell wrote:

> Hi all,
>
> After merging the mm-unstable tree, today's linux-next build (htmldocs)=

> produced these warnings:
>
> Documentation/core-api/mm-api:134: mm/huge_memory.c:3593: ERROR: Unexpe=
cted indentation. [docutils]
> Documentation/core-api/mm-api:134: mm/huge_memory.c:3595: WARNING: Bloc=
k quote ends without a blank line; unexpected unindent. [docutils]
>
> Introduced by commit
>
>   95164597715a ("mm/huge_memory: fix kernel-doc comments for folio_spli=
t() and related")

The following patch fixed the error and warning:

=46rom c49e940cc23e051e3f4faf0bca002a05bb6b0dc1 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Wed, 5 Nov 2025 11:01:09 -0500
Subject: [PATCH] mm/huge_memory: fix an error and a warning from docutils=


Add a newline to fix the following error and warning:

Documentation/core-api/mm-api:134: mm/huge_memory.c:3593: ERROR: Unexpect=
ed indentation. [docutils]
Documentation/core-api/mm-api:134: mm/huge_memory.c:3595: WARNING: Block =
quote ends without a blank line; unexpected unindent. [docutils]

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/huge_memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a30fee2001b5..36fc4ff002c9 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3590,6 +3590,7 @@ static void __split_folio_to_order(struct folio *fo=
lio, int old_order,
  *    uniform_split is false.
  *
  * The high level flow for these two methods are:
+ *
  * 1. uniform split: @xas is split with no expectation of failure and a =
single
  *    __split_folio_to_order() is called to split the @folio into @new_o=
rder
  *    along with stats update.
-- =

2.51.0




Best Regards,
Yan, Zi

