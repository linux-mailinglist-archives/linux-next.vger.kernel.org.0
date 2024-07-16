Return-Path: <linux-next+bounces-3036-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB49325A0
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 13:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9B028380E
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 11:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E652D1990CE;
	Tue, 16 Jul 2024 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lsyOQVbw"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2041B7CF16;
	Tue, 16 Jul 2024 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721129363; cv=fail; b=FKdovK6yFQFMBsCq4yN26/UBZr1urTSC2kNVLfrV8u8rsZ6n/XogRSReU02MvoZVe1qN3vjLWVzUhI0fUZKs6xSRoyyPgm2+r1lawNWTD1FYBIs0n/r1rCmk2hxvvldYIik/3NgHZP7COHr3370C76KtovnZaEEBo5sKXFquwnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721129363; c=relaxed/simple;
	bh=UtUYEoLVL8ycEqzZTVJ0P8O/OVFFkaTN0eokfaC/mpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qLfLduZzy5OSflfwzPo4pTTXdvBSM1Kcosp/hA2hs5AK16x02uBJRZJd2Stdc/iTqQEpOZatUaKvtOnozD9bZOseUxtSuFKWxEVwBUPM/wDcElh+hR6W601DLkKBjBuYKtFVhctMb5d3F8jm5jPTYTpIj+vv6IUR+hC5Xn2kgeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lsyOQVbw; arc=fail smtp.client-ip=40.107.92.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYmaI4spjF1fyA8arQyWT+AuThT9+EDkH93rtp47v+wljEHzp8gifmNeFfWRZIyDaS+ditZaeOZGzjVdwpiU9+fFJ1EhpzRBymtHCsKedwwsuGsDfL8wdEh0rNcyKP8yUENW4Rq3HJcF9MYcOEkibShnAHr3ilCMaFRQflCmbFLsAqhNE+wpY3vh2TLi535A4IAtMlcL9GIYz6EODBb1654hViVCALbc+pOKVlZkTCtQwInNBf6dBO/JJFpXFqf/NF3GlEeSqso1t9EqdSgYm7BwoLhVa32Ogj3v3ZbchPpQXRCIFDgz9JWEmkFcC811mKEi8+UJ7Wwt4bRpa4elEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T08aEhSqSNVjiLF0nOwmAKzDormkZIOye4+fk3AHeac=;
 b=r4bgsnzb6SpN9Xwc1qwGjI5eka+bAT96zNobqdYsTEtqsHVcg88ovORnsxvoqIqCeZAL9gtyG4ohoCsettwfHczAIzQA82GieL15N32dqQXxTbklMNJg/dvzTCpJonhbyjZuoh6K49Mrnc12NgFU+G4z7Tm6qdF/XN7S2nRugFVLJuHgIvhmPxH97T+GUQPZKm6acPo0WuomHoUZ2w2cHBIFlVIrKzSyEW7u/zNhXv6mcJd/ZZsRL8j8Ictcf9iQLmi6t92r2s4MmOYo52yNxT2vGE9bM9kePX71JoZU2jvPMnT6FcCsHazZ0uFK1WpzlT6Wc0yrynPdAv6kNdYgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T08aEhSqSNVjiLF0nOwmAKzDormkZIOye4+fk3AHeac=;
 b=lsyOQVbw97sozYMLtYpd2RLZroL0IjLOSyWX9WioI54RzxbPEuZq642hJ1O9NM4c9QWqI+UlyHz4YWDfFwDtbouV4khqfPrszGWNIMau29rBfWPr/1W9H0C/M90WfZaZBlyNLkY/8CepVUcLQVqkDTlVU+EqL3YNpcC3jx1pQaAOcUHsIZSt8rtc8BYy5xDP73y9Xn3lCWcxyrQiq0H+s4uUCiCcm27kdphv/EeAxEN0pL2r2OpWP84cP6NqbZ/JqKRI7WKCnH2RANCE6iw8sVii6G0pk8suKvve5nzNGOrb+Rh5U9BTznHo/vcX14gNSrQ3rnRsHtS2vtUriza/nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 11:29:18 +0000
Received: from DS0PR12MB8815.namprd12.prod.outlook.com
 ([fe80::f6e3:bf2b:a789:50d4]) by DS0PR12MB8815.namprd12.prod.outlook.com
 ([fe80::f6e3:bf2b:a789:50d4%4]) with mapi id 15.20.7784.013; Tue, 16 Jul 2024
 11:29:18 +0000
Date: Tue, 16 Jul 2024 13:29:13 +0200
From: Jiri Pirko <jiri@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Pirko <jiri@resnulli.us>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vhost tree
Message-ID: <ZpZZiTkPChWVJ_O2@nanopsycho.orion>
References: <20240715171041.5d0ec5a1@canb.auug.org.au>
 <ZpTXa-E1SpFJfVBw@nanopsycho.orion>
 <20240715045026-mutt-send-email-mst@kernel.org>
 <ZpYURX4IrW05U_O5@nanopsycho.orion>
 <20240716070452-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716070452-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: LO4P123CA0616.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::16) To DS0PR12MB8815.namprd12.prod.outlook.com
 (2603:10b6:8:14f::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8815:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac54971-7551-4cf3-7ef2-08dca58a87c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/VTOS0dXpyM09cqlMTbBT0hsr0GpQhKfqAsh6/+mYuooCgA+Yz1byljyBx2r?=
 =?us-ascii?Q?Bq/V1F4O/NFA8q3K98LxnnAms1UvEbpunOC+Pm7iiOjddR0CQm6PW5O1oHuD?=
 =?us-ascii?Q?hqYPQeKluDT6U+oVP98SJmv3JeSS+amK+0UKt5gRIirAOutn9YPv3NB5AKla?=
 =?us-ascii?Q?jIREcPjLxiHP4XRuNCqSobxUQ7yI4I/J60JKa/Pa8hBGrtWAr6scS4wFMPVt?=
 =?us-ascii?Q?VBkBm7WEK6o2THXeM7cuDb9n0viG8NA12ssjN9S2HuqmK4q6dO3NgPrCSWwu?=
 =?us-ascii?Q?XuIUelqMyJK7U96Va8Xkyw5h8NbUKL+EHa2NaAfn5wYZ5OSa5qdkLlXlicBe?=
 =?us-ascii?Q?eyFwxPhzzg7jzDRxaMsdKSyPZJZ0e0Nc25w4Su1mxY0azPtPgP3aHde03sYc?=
 =?us-ascii?Q?LDzmbnwPLmn2utbigjLkubl21V2HqbRrUdMmasKJmdqC2HplrTn+i48u6R0K?=
 =?us-ascii?Q?/ghwfCwMG2RDK8aus/o31ZJU/lBb8LsZIOHoIEGmZ4YbLidDKYgJPgjHdAdd?=
 =?us-ascii?Q?riJmao4j5JwRFgKvZjbE7RI3m/oKkBoIUZTlRUxDNbmMTqbnWxH8pdSafRAm?=
 =?us-ascii?Q?H1AnnwMtSdpHMwvzOxKkBxwNBdXcW2RLrOh4WXtL9ldndhuU3ssGMUxC+gd2?=
 =?us-ascii?Q?Y67KN7YK1A0cMNgSoAXuOXiQ0A97Q7Fr3zhk88AHw6DvuTfW77MVrflH/Lzk?=
 =?us-ascii?Q?B+izug642ldOJliMkDQqj321P6CDFENO/qc+Kthl4wU8zcWtiPES4zV+TJwL?=
 =?us-ascii?Q?XACfwfdp67JsZ0fTTwgYwBE243dPx6XVMIrGpxoF2HTJ/4RkfBaoF6L9hdmx?=
 =?us-ascii?Q?LV8P6j8BmJkGq0SJUyt0RedAdB9G4t8ghDUMgrZKU7nqg1tJOTz4riy7agui?=
 =?us-ascii?Q?BeHwQ09pgVY6TrGBpJbaM9Q4EI5BXoOlPNnkb4TFBcSwMABb9zyeS1BN26uj?=
 =?us-ascii?Q?pq7MKsHExhVOPuaqu7nOqb1WejVIoUMTdU6qBzAc7HxpsFFYvlRG14i6vMmN?=
 =?us-ascii?Q?j5WNg/hl7888pQfnkxRxyS1bUiBH3p92B29cpjeYkWtskMvk6Dwwddxf2LSy?=
 =?us-ascii?Q?UGlxjDRsfHsd1X9rVR6jvAsY+qLk+/QGGo7IDPvwIyN/H0cdKEB3oOV4Jq7t?=
 =?us-ascii?Q?OHM7pmMoNMzZCt8hU9lbfsVqEzjG+Tk03MQs8evsgSXEPBN5mueeZ7ClSq8Y?=
 =?us-ascii?Q?Dc3fAXS0a2jKp6gGM0Oe2kXqlIX8MeOpi1zxIbusMIPPd1XYYxjLP1HboM9F?=
 =?us-ascii?Q?9bcNvE609d8pn5+Cq4T/NKuuaCOPUpCNxIuWCNw9iRHtAL4HFu6I4lf0nWSr?=
 =?us-ascii?Q?vVRhV6gIHOT0LvQh4QteIrwsgeeuYpQ7LeeeSKvNWx95yw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?efwVfHMQ4pm/Aqwx828z2sXxHQpJShOtxNdLu/plbb4LE1hwGQElYurFTPw+?=
 =?us-ascii?Q?4VMezncRAu9Iw3YcS9ZFZiQzQ7+g1gTPYKu0QbCL/5wRwSgxUEgjcHa+m+gw?=
 =?us-ascii?Q?frZpCJdexlScwIb6A30Z7LMgk8/PPBqxGQvspoEKCdihDoeEGMP+mf6itNhU?=
 =?us-ascii?Q?4sATf0bTOdAQjF+oMsq8WzAyDL6xemBjc8+aaUoq0QhFnr49zoURQxq9JPUf?=
 =?us-ascii?Q?r1hMUpcibgc6PHvbpuHLvw98VBysICWYDV97ujBIGdw2oC/qd8J1++c8EZLN?=
 =?us-ascii?Q?Bsp9+FVSJe3iHbjw/Yslyurjjf2JcJj1UaPesNc46hy2l/SJ1FOvyVzbvuNP?=
 =?us-ascii?Q?6NAonLRxJRdEmo81zPX2eDNAahI19+eqvVkOHIiXtHGor9SNBTPedooby+QF?=
 =?us-ascii?Q?UUxynmW2XttUy+weieH9yIIWay3saaHXg8dKJ1oBV3jQCgKMzruNWcNUO9eV?=
 =?us-ascii?Q?cQ03TVibqX4ignxXmZjLRPfMtjnxV0r20MKiOrTGaa0/jHXflPEVVeRkn3ai?=
 =?us-ascii?Q?7sUnX9wc9t+ZqU3XWDFc5JBoygCncNIqEIga8qQuUI43ZqXwCZv99GGAQyqF?=
 =?us-ascii?Q?iU0yqsTzJg9deqBLZ+B988yOYh1ToNriG3xc7CkR+undud5y4k3INGVw77X2?=
 =?us-ascii?Q?FbXxmIyaUCsupTtynmYfzkGauHERtke9l5KX4q9b0+MEkb/OWTxEWKPdEriA?=
 =?us-ascii?Q?HLzwbrtJrTWUHMqwkRBBuedK3enfndrxZDuX2vMttL7HmlF1eDhI3hhc0spu?=
 =?us-ascii?Q?iRB1ccMn8Nyn1as2Z0Gr3w22J1QATfMZWlTh7jzyAApr2rHqQjTv4JENBYs+?=
 =?us-ascii?Q?h2wFvc/HZ+RCof5ajN3EGXrMsD4iww/zg58b6xUC5oTuEB48XPq364AercFE?=
 =?us-ascii?Q?IlBF8kJ0xj/hwkSol0Y4EEmA6mUYCpDMGYDuMctNvLRLGGuvsKh8M1WbThVl?=
 =?us-ascii?Q?NClxvslRr1Ea/XM92kjnknoPIRWhZ+0lH3XrZyQAvGA9B8JOTZuBQGP/KW0/?=
 =?us-ascii?Q?Dblk0cflN+5x2vj6zkOQCcEEyGMlorKiyefEzqd2ABABubj1l9AHSBDKpFF2?=
 =?us-ascii?Q?Swu/ZhtqvRn5H3jrBMXo5emccXcRAQPy3cvkwwPWOckwqpf2zX5fXdwRZLjr?=
 =?us-ascii?Q?kfrF62cj9DBSNWSZmyYNEL97MzPDAyWA5ubnbYbsbiSBVCQljmv20YK1Ygw7?=
 =?us-ascii?Q?GOzvqx/aw5bnT/3Kv0MCk/QKR+sqPIHkHrh2krAeYt45qBWqNI8FClUuYWyd?=
 =?us-ascii?Q?Meonw0Dkv6x+x5DegI7xPqJIkv/IJD40xyMXGiSd8QGoaHwnCF1+39tOujT/?=
 =?us-ascii?Q?BUWXlM4zM0tKt1T4WkDx6DQ3I2SNnhR7QKwVzjoLRGQLK4Hg9c5kXlrgK1Kv?=
 =?us-ascii?Q?sES/nq+uS2YmG3MpEyxJDsZj0vAuIf39AkSk2Nwy6T/Fz8Tedr5RAECDXpcl?=
 =?us-ascii?Q?PkIfEMd9dgQsBY3SL2Wv2+CFzViO4chuLYdYeJpiqRzPC9A3ncRrO/tMTtuy?=
 =?us-ascii?Q?X181e7RyyRjSGuwf+8W6lzXlkPvDInDdfUNP+V14g5S1+VJaTP+wNXyH2EMZ?=
 =?us-ascii?Q?90RtkjheZvwmNt/r9PsSAIXhzpJoAa0rv58Q2dU8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac54971-7551-4cf3-7ef2-08dca58a87c2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 11:29:18.3011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUOD3lxaEPVS+LgwiEDvTvi5tCZNuRm5W6r1IKa10rnuClzkscVjVGRVUfPCJKMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240

Tue, Jul 16, 2024 at 01:05:12PM CEST, mst@redhat.com wrote:
>On Tue, Jul 16, 2024 at 08:33:41AM +0200, Jiri Pirko wrote:
>> Mon, Jul 15, 2024 at 10:50:43AM CEST, mst@redhat.com wrote:
>> >On Mon, Jul 15, 2024 at 10:01:47AM +0200, Jiri Pirko wrote:
>> >> Mon, Jul 15, 2024 at 09:10:41AM CEST, sfr@canb.auug.org.au wrote:
>> >> >Hi all,
>> >> >
>> >> >After merging the vhost tree, today's linux-next build (htmldocs)
>> >> >produced this warning:
>> >> >
>> >> >include/linux/virtio_config.h:136: warning: Excess struct member 'create_avq' description in 'virtio_config_ops'
>> >> >include/linux/virtio_config.h:136: warning: Excess struct member 'destroy_avq' description in 'virtio_config_ops'
>> >> >
>> >> >Introduced by commit
>> >> >
>> >> >  e6bb1118f6da ("virtio: create admin queues alongside other virtqueues")
>> >> 
>> >> Ah, leftover, will send fix. Thx!
>> >
>> >Better squash it.
>> 
>> Does it mean you take care of that in your tree?
>> 
>> >
>> >> >
>> >> >-- 
>> >> >Cheers,
>> >> >Stephen Rothwell
>> >> 
>> >
>
>It's easier for me if you just post a new version of the patchset.

Ok.

>
>-- 
>MST
>

