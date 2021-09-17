Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836CF40F3FC
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 10:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbhIQIW4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Sep 2021 04:22:56 -0400
Received: from mail-eopbgr80058.outbound.protection.outlook.com ([40.107.8.58]:24718
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237932AbhIQIW4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Sep 2021 04:22:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itEC8fpQDVtxwbeQSwKeBSAMTXQnsPEpYJ6eTQ6rS+QbONgpcrOP+SpL9acg46yAUkjKnoZ4TeFqgb/JFigVXSBGALjbmo/wkOnN3/ydWDRv5bQHCJeqAy51FLIph3efUxBEwLnCKhJ52Eog1AY9OlmQ2GBl2THT4iCQFLoo1p9/BwTRpjL8FE7R7q1XXFby165LbhTw4yvjgrRz/ozBLuwtP64O/AhJACw+75v14DpikAkOu0qcYG+bBXS7JFhHKbdN8E2r8Q0WoafeZQ7KiEOG1/t6sruR39rRd6jlTQlYlNkAXWeeCVUeZ/b8BAqtzZV3qpz2f5zcNKSif3bjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KjhC4QC7a4y5V6fRLY4E5KmIZXS1txfxo11ugriaIF4=;
 b=nd7Ub27EDNM/lyoM6DeX3gaXNK5yTfqLIZrK2ZT+xu68GLqmSOLyHG+x73kp8EfFVtC+E5dTFMN1giO2JPx4wVVUWPZEDQ7e7WTNEY6knbAObBhZkiy7s3Ip6p40IIeJ3UQztxC4FhU9cMIHG7XVDz80DCU/fTIh0mcRVIHR5evF3yqevDmIkbJ+N95PDzGVpx4clXZvUQ6tidwSeNhDyOwiPL/vmSPMVB/O1D6ZKLZoSYfLvoxfK15/J/bwkrEwttgxQyTpbMaflP50cw8kFn49NMpzGxvF8068Hh0bUXgBlbgVQKN8eWUIqVZcmBechvylMVwNuGotwgDOHPxJ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjhC4QC7a4y5V6fRLY4E5KmIZXS1txfxo11ugriaIF4=;
 b=OqC45mgbQ4MfSAvcraOaM/o8ZO8jSUoJKwTG1Upm19b2IkRFxTgOgykp4yC3+/7nFIIgEZhK1w/YKrc92TVU1330vS+YgHMwaqYOTJ9Qj1PL/x9WmPwZmpgasAM+0BzuWc3/0mSOBI30c1D0os/yEkhlYQ/Ewm9t4PJj1PvZxC0=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB3021.eurprd04.prod.outlook.com (2603:10a6:802:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 08:21:32 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4523.017; Fri, 17 Sep
 2021 08:21:32 +0000
Date:   Fri, 17 Sep 2021 11:21:30 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the clk-imx tree
Message-ID: <YURQClgzmxw5Dn+u@ryzen>
References: <20210917090618.3a7ac4be@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917090618.3a7ac4be@canb.auug.org.au>
X-ClientProxiedBy: VI1PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:802:2::19) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.25.164.198) by VI1PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:802:2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 08:21:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e43181c-822c-4385-cbb7-08d979b427e9
X-MS-TrafficTypeDiagnostic: VI1PR04MB3021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3021F76FC4E3497745E6DBC9F6DD9@VI1PR04MB3021.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cTuTCtJFEDjoW2gPmWCqDqnNJVq3Pa8Lfm/S96LNyXD1/lrJWE5oILqIu+NmMeBZh4FeVGMo0UE57RacsUaD3ohPC7D0NMKUgMSuxKtFSpg9GOLRdACGlxAyByZA+GBUb9lGvUwZbMSGZaDJhcl0GHaTrmQ8ahHDwQNhxzMIXVR61T6ACUZCBox9dmhYkZ2UrTMyvgViMe2pZ3CgmnEehmn37H/jl7DJ4LnlZXRdcssCq11yIxaiGFEvQe5zgLCjwXqN4NdUPARXPEDskFxWMUNmsERsr28joy2qJSak6ALEWrXIUYekRjg9zUcqkNC+4uvBqwNnodNkd6x2EqQG+dprWevrOgzlPWaER0YWkH0keysGikkFPoV7CjgGiuHM3lDIyIBfqWqRGrOz16PSxmMBMyywzv7VxghrPRNTMKWIL6F9todB+XF2Fu7MYcDJ+L15YOvKaP2YniWUQbiu2TondpZk0Pkz8XsWlu9M/1Pk8h9Itf9aPSp2qF9nvl0OwmrCYHX7M1oxo5045axfrBxQSXOfx2/hhlo+bcqyOVtQo+61XKgrdHNQRJEkfn0GROUrvkPRwMa+3xz+dP4owJZCbxiE+jv1cqxXmly93VYT9AEpOAYd0jBi0M30sc4lLXlAOWCO1qDARn75NieZWAOaspIBYEesJeSR9uwNqJvIXV24WYS5TCvPIyJDnPfyu/Yn3P331cPqa7THw7xRbNNKVnWroyz4rmK+T7klbc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(956004)(4326008)(8936002)(66556008)(66476007)(508600001)(26005)(4744005)(2906002)(33716001)(53546011)(5660300002)(8676002)(86362001)(186003)(52116002)(9686003)(9576002)(83380400001)(54906003)(55016002)(316002)(6496006)(38350700002)(44832011)(38100700002)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ul8hXou25Q5zsVqXRWEG3L8+KJIjmz/CDi0ro/85uoewiv4w+a8smbOYWc4a?=
 =?us-ascii?Q?BV8pAPdR264P6YJ1/25vDEaeiwsDK84Gev/W/YMY0FCQLPZEl1dIOM4YkJsv?=
 =?us-ascii?Q?gWN5M1aO2y66j2PltXPywRHEmkXMB8JlTzYi+9fu3JoQC6sUJmAvo26sZccb?=
 =?us-ascii?Q?suNzG2/Aqv6dxmN529mb3kKZTMKiz3HCJU0bu9e3R6Uxe44Ig77gj16gjZad?=
 =?us-ascii?Q?qZLQnJfAOfHzeLUtq6yfC78LvETC3FGO2XwfaM7vyrmN4+rXpqqKh0yh3AX5?=
 =?us-ascii?Q?Y1vv5VCUmRxFyNpE37sslHRta7/mDK3+O87X7AonOgcHf7MWEiq/DWUeaNxB?=
 =?us-ascii?Q?MjQx/dtljYfcUhQZ5TZ9pOf7tC9sUhPAZyp9/jMCAIMLHNGzUO1MMaIXLNUU?=
 =?us-ascii?Q?Zq/3DEJfGudOjCRO48a5nt5ggGvwNGsE1cIb00A/Rei3KUWM6pzFmvamE2qH?=
 =?us-ascii?Q?6HvtCI/bLfNEa5q+NgdvN4f/gAcHiV17eDGFjDhyoLa3BHQW+uqmUQqFJqtK?=
 =?us-ascii?Q?dCpz778USd8y9TIfIYcCnEf3BAEDz37efFFGNn+iFMGsMBKg1aTt/EJQI88L?=
 =?us-ascii?Q?Je3h2czp0UcXsRAuO5rYN300QbOcb0a/vuzD4r0k4A+ghS8pP1KBhlJ32nTB?=
 =?us-ascii?Q?CMWDkp2nTU4W0/YxJ7EbIDe5bcWuJlhh2OsHOyKNyU/wTxM/P/3gLEMInl8m?=
 =?us-ascii?Q?NVNt39Vua7DLxr6haSyv5K4jm2v1f/399I3IZPREklp5c1cnCxkQktYecvwR?=
 =?us-ascii?Q?s6il44jGUJoNc90fzFzVxtCxx3TUMvc3YI0fg04ROezYbJ6Pc7P+JKkYvNmV?=
 =?us-ascii?Q?8BGx8UhLUwlfagTUWQncJsrtvBgUSR5kkKISAhlXm4gBbqgL9wnJhcszgSmJ?=
 =?us-ascii?Q?P79Kvrp0J2woPR9DNx7Tv/sj7l9kKJOOWNWDj/XX6gnTb1d62m5d4RhadU7D?=
 =?us-ascii?Q?FokUT8yJvVlKw048xyf5zIC3u0P7caGte2l7PoxzhmCBx1+EJqXbwQb4F0M5?=
 =?us-ascii?Q?XjAc7gQD3DWdWJlUov9FQsh/4RQyRSYEnHB91vFApLzOOni4unROs9uRM01n?=
 =?us-ascii?Q?EpNhzgkqS/O3Nnd3VdDvD1k40S0bbfKdTAlWb7ZLBetAdOHhzqBNU4M8w/BA?=
 =?us-ascii?Q?ebPS/ZM7RN3lyX3M316C8gwdpx1zlcVxTsrKmakhUAhpsp++eRN8ALna0Rql?=
 =?us-ascii?Q?/j01QUrVu0V+4hqWYoeXn55Aqd/wf6UMiUeB9/vFXOnezOHbuKIqdWvRoIQN?=
 =?us-ascii?Q?kkKvE/Vm3miOdoPr9XvjkhMGd03dSeflL5EKaJsGVIwnLr8aV2ieMbIr0FLL?=
 =?us-ascii?Q?LWCC3RZKyeHe/d1KAxWVtCTb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e43181c-822c-4385-cbb7-08d979b427e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 08:21:32.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0oJwClYEHi27oStyKUL0RffBK2KyqRy7zCW3IcIHbYIjtIYLcv1YUJXcw5CDhM/Brkv2akw6XgtfLbI6XeaFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3021
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 21-09-17 09:06:18, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the clk-imx tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: "imx_clk_hw_pfdv2" [drivers/clk/imx/clk-imx8ulp.ko] undefined!
> ERROR: modpost: "imx_clk_hw_pllv4" [drivers/clk/imx/clk-imx8ulp.ko] undefined!
> ERROR: modpost: "imx8ulp_clk_hw_composite" [drivers/clk/imx/clk-imx8ulp.ko] undefined!
> 
> Caused by commit
> 
>   86ce2d393ff7 ("clk: imx: Add clock driver for imx8ulp")
> 
> I have used the clk-imx tree from next-20210916 fot today.
> 

Sorry about that. It has been fixed now.

> -- 
> Cheers,
> Stephen Rothwell


