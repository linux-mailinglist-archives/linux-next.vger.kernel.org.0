Return-Path: <linux-next+bounces-3026-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DBD932073
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 08:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FA2D281D6F
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 06:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D2F182DB;
	Tue, 16 Jul 2024 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s/bDd/XR"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48701E552;
	Tue, 16 Jul 2024 06:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721111645; cv=fail; b=NaQm8DJFQFY/o0FCBaKZD4uNToUfq9FUZ8A8iSeB/3JRVwj4IDMQUHJ95ZRewDBtJTyWcyQ9gEHu9g49D24rKPEWPeApde1BYDDLWXvw5+dJ+uoyzXqLRrpKeMper5q8o2Nht4KQRc7zAhs6xMYam3UQc4aImX3TTSsDmTc2480=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721111645; c=relaxed/simple;
	bh=5sMfmA56lZ8jaeaaS+2FgraM3OehAgl9N+JrJxX2YDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AttLdKRzk1JCgg1sYlPCa2GO/H6+bjFUUOClJkwxGoUoYs3eZxDuiJNPtkN/mSWoFT82fBCnFScL3lbduYFYsnlYWZ/y+X9No0U0McnYUuwxUP9utLaPsA9s73cZ9ioHtN6RdtfyxdH5FV2D4N2+8gdB1sD8H9ZFWVCDb2dwZK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s/bDd/XR; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/DmcbXjzIsny6jjP6L77nzmI1NyS+5D2sxYYoQaEVRWmavVqHLGPynZPqfBQPThzjyi7o7BdLD+Zqnv6yzqCNAZhLFL9VsGqWuq8zd/RGh11iC0NlB3AFe7F70N9TSvYISt5Wv0AC3UElptCtztoEpvT7EAcc2EcFULI8nSN2GlA/uNEel4cEiPMUfEVDX8zq5qeL3XSJnqyf/0EJgs1Xad+JdWGEaHhoaGlSpnQwbLmaZQIHc2kUo0uy42hCpH0PqH7Fsg+eGpQQ4/nbmGOCeDN0HvbPfeoR5I5Q/6tH+cbnU4Da4krEM00mMFZ7/fujBrr7dflhatpvrs4B7GXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7ayvUvOcy2L/7ItQ3gu48ayFkIu7zu2WyXIpUvwTAk=;
 b=Jh+jFNe4hBaaOW1bJJQhN7s38JrgdayRldXnumjcgrI5PxotsTjSpq3bG2OgOxmqgEgbxxhH4d390YkvjCcegYyI+odTc+Iq3427DqsfLdGZ3MEhvjJbGZrG2IoRXVYFc27RKpjkcbZcSo0BNTVWH1x2ho1k18rLVLnw1hNNaZv7WxyTRWPbdgby5+Ga8Rk7QbNyCFfCAi9Iil6HfWgGVMsKiNLuwyrOKK/svjUBUQ48MwSwNS+Gb90VGXc/jvVbOmxoa1RNNNKdGVflOCnnuFRRDKyoqpWehg+znyegAoMi+gGfdeZvfx4lJniyIbj3z74vmVNJLoaeFjYXu3DeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7ayvUvOcy2L/7ItQ3gu48ayFkIu7zu2WyXIpUvwTAk=;
 b=s/bDd/XR5IqYHMfZDquu0tRiILKiDlxk+UgAzZdCebcxrW8YGtgS89L7rgqgh7/SEbU1wc8YGyHpk1A8DJkVDPN6qm0d3Ptt3I7loB8ciFQ54vKb8IiUZf5xbN2otu9qXiTEblYfqF3kL9WMv+f2kWOzlv7tivK636aLf+U/DPKmgBStW5JEanB1ZbNYTYAeYlA5Ns015zzS60A+KXWnfP6uuETJM7UJ60hO8NoYB04EZjSlhGSJsrIDtYyPW4qY4UCukn2/NRwGapXnjL+kJOujjPbSMPAX+pKr5dcFFeggrEfATwALIoe3IQMzGH8BNC/wqMTDXdYFOtQD5GxhCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 06:34:00 +0000
Received: from PH7PR12MB8827.namprd12.prod.outlook.com
 ([fe80::8984:89a7:5fa4:5272]) by PH7PR12MB8827.namprd12.prod.outlook.com
 ([fe80::8984:89a7:5fa4:5272%6]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 06:34:00 +0000
Date: Tue, 16 Jul 2024 08:33:41 +0200
From: Jiri Pirko <jiri@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Pirko <jiri@resnulli.us>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vhost tree
Message-ID: <ZpYURX4IrW05U_O5@nanopsycho.orion>
References: <20240715171041.5d0ec5a1@canb.auug.org.au>
 <ZpTXa-E1SpFJfVBw@nanopsycho.orion>
 <20240715045026-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715045026-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: VI1PR04CA0067.eurprd04.prod.outlook.com
 (2603:10a6:802:2::38) To DS0PR12MB8815.namprd12.prod.outlook.com
 (2603:10b6:8:14f::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8827:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 644ed38a-29e5-4026-763a-08dca5614023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sU3Ms+S4JfH696I18po8wEkhRKKga0boPMeL0KARep8swJHwQ2q50+CfnUdy?=
 =?us-ascii?Q?XOfKF4PRyfZFdaYdnrf6SVtegld6PFdYD1RrffjMiK/CgGru79lPSEBMU03l?=
 =?us-ascii?Q?mGxMUkTf0MBIgZeKA7f3CHDPSG5N7QrYaCSvivkZYRlgFo0jw1NJySKdcVmN?=
 =?us-ascii?Q?VLOLPFVfjaIBrIvy0StFUWo9BQ+I9/CJxSPb5ZZi+5SuYkBalBAtiOpWs2hU?=
 =?us-ascii?Q?KZir2DsM0Wkd/gvRE3WWfLM5/rlcZX3/fQScP1pNFoFsbdYXw35ndH4H5U/u?=
 =?us-ascii?Q?lr8EAcgR2ZkkoQCkuDI53NFRtBXXQbuv833CP4BAApuKd744UGQInLYdjE3H?=
 =?us-ascii?Q?rOdKVQPeYvi46O8XOhTkvbox8l6QKzBFzV+MP5NT5+R3IjpR8F8pgbRxpVld?=
 =?us-ascii?Q?REDQ2+yRF/mreKgnA2BFnA4+L0QXbUQxRNyFwC/oTyCDEnxVnazrlwhJjdiB?=
 =?us-ascii?Q?ypaFmGR8/Js0q1oczoaqcjHOc5BCqYtOFhUGYEGYAxYwfIh5AeESPaWZexUC?=
 =?us-ascii?Q?H6gSH+Pf4Tj5/UHcfWRQk2gH7UsFr7qgEa1zYgUtd+VNFIFKIupa6dMhPAFn?=
 =?us-ascii?Q?Ivt8v4ID4T+tXtiMdcUUoZponR/1DBiHBISco8ZL9ljCvArVb+ueXC1u8Qxv?=
 =?us-ascii?Q?N2kmuzwoDklo372x43b5igf4v3WbrgepNr+a1+cKKrKrK9TTC+7rvwPhVuIo?=
 =?us-ascii?Q?dLxhGwQxcIObKP2KxLKmjekuW+yysvFlG2xD8xEdCOv4IPUSZAU7/1r1qZRm?=
 =?us-ascii?Q?g9nf3S8q3PNsAZhdwkpWkoVHkb1AU+nYZsrOrm65UEAfSIX+b282Gd9AtVIN?=
 =?us-ascii?Q?0YCwbqgmGCoIVDI3ziEX5kjTy22Et8zqu+OOQeJ7RzJzrPlGGjsMdnSADcz9?=
 =?us-ascii?Q?ACnQZPoHl8resg4VEb4mAZn7x9bQy2mkRsUSnWtBVwMehbXvtKYhZwAQm+2U?=
 =?us-ascii?Q?HZmGDgblaT/7uRpEZLPe0iltrLqAfR+zrvrYu4sIANItGQHR85pZHMw591TI?=
 =?us-ascii?Q?pgRXmLfznUMHZMGC8nSU7L8aCRGna2205QZgGD4zG1L57fZPeF2HheRDTTsJ?=
 =?us-ascii?Q?xrOJWsjhR/rPXilM8WTLRmTcJBUuXCrbZYZvCoMIvdPcKWzoSyeFgypK3bQn?=
 =?us-ascii?Q?9AFEYoEkwNOFOoY1LjZVOjRl+lHJromhpCm1oaweOXh6pNhdAlJNl/fNkv0+?=
 =?us-ascii?Q?/c5wP/Ed9Y1W6Un5beBIhq9RCddwgkdhd3uLY6qRyeZGqgfLl9Uswz6rzn+5?=
 =?us-ascii?Q?mggc/DGh/YQPnE1oSWj+fCxd40zNpZJup3avReR1fwESCALzSmhgkgpznw5k?=
 =?us-ascii?Q?WvuyLc80jadQNmzAQyTh3lV9VdCY4MXmIMNgvT1BlPedug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kNu1gf1ybcif0FWGC0XWwYqG9jpSTGv+twkihJWJiALQtU8gsonHIkF/WGWW?=
 =?us-ascii?Q?v4mAoyzfKbg05TnP2r41hRI8a2p+49awEvT22uFlJ2sk0oQzNJS6ob9Omp+V?=
 =?us-ascii?Q?OU10fYoKv9+X7+lK4vZIR4Zi7gfmg+mHXLDy2Cq57hZS4dgtB4H975lAUiC9?=
 =?us-ascii?Q?hJVzHWwGKjdWTooqYt57n+HgnskVTMs57aQm98+KWdwXmodUlI7lnOqne7h6?=
 =?us-ascii?Q?ewZ29/FglFZuWsrwaEMn7aIUV/e4vz/CfLas/YOn71AKoQM5Rbsx1JO3sSfH?=
 =?us-ascii?Q?+t0DDTGdRe+dqdvogZKlBuZ6K2i9xCaQ4uUlAZwsaLsuoyoNxBg/AUX9iWee?=
 =?us-ascii?Q?DRU+i5eQC+r5Mh/0OSrkrz/bGOdO92XHzAFciYwH9RQagiBzo2hzmSf4yk9P?=
 =?us-ascii?Q?SXZHyz+YRHtvVEzpBapNtWf0u2ijCU61eDDmoXRGby3aeLE/SxgELnAwEfwI?=
 =?us-ascii?Q?aKU8arK/lNha87zFy/+AFUxyd8XYIi7gAVoNG2LrjJ1YeTrOF/riaRCu0/Ve?=
 =?us-ascii?Q?eWXyZfOLEeMWvzqljrbpdBxQSFxERNx7pxwnWKyt7Vy5vTSD9N1svNSIHInR?=
 =?us-ascii?Q?TejyrV1uU2cde7slQwnGdwOrVrn9GZa+iSbAtCDlCjYR1nGUfpmcD06M+p1j?=
 =?us-ascii?Q?G+/Xdsewu1eDGwTIC2xQqHPzU+QII2sz5VKX0rjt2LNvQ+AU3ZvT70Yl2Hln?=
 =?us-ascii?Q?lHfGKNjEu2EY1TNBhOz5XofucCtXMXTAoaE/Bocg/TrpuX1GN8M4d19l0E4r?=
 =?us-ascii?Q?aVUPkGUMVU2Htf9NXPAMxsc5QFSLkU+6JLwIAecpgyr03JdVndFqJy3V+0yO?=
 =?us-ascii?Q?554w4y6FAnFQ8XmzV8YytNQC8qbRZsKSL+TISS1R3QXQro+wfBnL9PlplKhs?=
 =?us-ascii?Q?GLiJqcWT3kwfOfWOaYjMfKc/8CN2Cpz3kD3ycdQupfV/uEDh3JQOcAhy73fN?=
 =?us-ascii?Q?EajThMd3raLhowA9SOewbKf1OulIqjpYfkbG0qz+cuddTGQ7QdCiWiim3Zip?=
 =?us-ascii?Q?ENBMBW/ND7w6EOeBNxDMhSO5j34Bsg3J7epYo7gG/u+u2i8zI27tUWOFyk2E?=
 =?us-ascii?Q?8T+TMldI0PhyhNC7zlDC66/B+NTLL4ms53aQi+g/iLwMo5Rncur2Z9CNEq+m?=
 =?us-ascii?Q?xhXq8EfD0smfrPN4Vv03BXy9Dj+so8xoSSzU8la6dvoyiNPyoRZZ343yFKLO?=
 =?us-ascii?Q?EsRuJBu1TOTvRD2r1E0TWCnsmLweReIsybuOUqujAe4M65OI7KDk5Vt5rPDY?=
 =?us-ascii?Q?Y1uTagQF8Ss/p6qCvHnQvry0D2LGaGp+EdMyRdlQyO1+Z2HbBvpF7pY3g6JS?=
 =?us-ascii?Q?p8XobXnP3STw/bitROUseDevSLfbCJenPFLXlLWh6W7PBkmPR4bG00Bpp6o3?=
 =?us-ascii?Q?BLM2JZiP3uNUiE+fQyy5meN05l0NWDMyR1f75cSwSF7+wIwWlcRpm+tVgUBV?=
 =?us-ascii?Q?a/B08XwtEz8Sp6cKrD9bnwlQmwe9tcmKvUT946kIo7kFZS4SiPjlKs1HfGf7?=
 =?us-ascii?Q?06OXOxutudKl4E9jZbDjOfQ7w/bNIJ5Co8Mw5xekS5JTN1jXM3mx/yfWiMZM?=
 =?us-ascii?Q?luOsKWSqvYHtnEHntlQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644ed38a-29e5-4026-763a-08dca5614023
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 06:34:00.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaSnUv6NUtwQrvJzMFsX0xhmV3qAXv8h/MJ7RJwmg5vRtUW/NG2JwHVIkX329dVo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670

Mon, Jul 15, 2024 at 10:50:43AM CEST, mst@redhat.com wrote:
>On Mon, Jul 15, 2024 at 10:01:47AM +0200, Jiri Pirko wrote:
>> Mon, Jul 15, 2024 at 09:10:41AM CEST, sfr@canb.auug.org.au wrote:
>> >Hi all,
>> >
>> >After merging the vhost tree, today's linux-next build (htmldocs)
>> >produced this warning:
>> >
>> >include/linux/virtio_config.h:136: warning: Excess struct member 'create_avq' description in 'virtio_config_ops'
>> >include/linux/virtio_config.h:136: warning: Excess struct member 'destroy_avq' description in 'virtio_config_ops'
>> >
>> >Introduced by commit
>> >
>> >  e6bb1118f6da ("virtio: create admin queues alongside other virtqueues")
>> 
>> Ah, leftover, will send fix. Thx!
>
>Better squash it.

Does it mean you take care of that in your tree?

>
>> >
>> >-- 
>> >Cheers,
>> >Stephen Rothwell
>> 
>

