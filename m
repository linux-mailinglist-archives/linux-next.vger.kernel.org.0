Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0863D41E87A
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 09:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhJAHkw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 03:40:52 -0400
Received: from mail-eopbgr60088.outbound.protection.outlook.com ([40.107.6.88]:36067
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231226AbhJAHkw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 Oct 2021 03:40:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCARais8zlti88tUK+0f1nen21gnC8O6neSEG7r9yBgsd+hQIiTgp/EWHmJPyGGR7nuHOEDejAEPCLmQpP8zHMEI4jpwE+lEjzdDn6xdcl2aUxQMfnCvrSW8Z2m8FewHTjCkwbWmJA9hSAi2ngcIpRethNwK5q53yVU24yAGfGFhEhU7rvS4zFVClIol83B/4gH1w5BDPAWAZ66yCsdnuKmQQwN6uIiyvo3EqftPokDoZuoyf2aXxHZ1TV1y1EaokFJQwJU/KVnGg9CQz2Pq2mIZIWLhbYnIDBUMyGo3dUlU1QKQB0dXJRvGa1j1kiuTLsdT7A+162EzMuu5cM5mLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/fRCjXIxl8+uQsawQRoBKTj7PY1gZwapXhQ21Emf+k=;
 b=JnHoYPomNRNBLhQmvbxUyt7UfX2avf9yb8880GMS+1UpYOdmIkVhx7hyqBXWiidQnoW4N385iasFmFvsX+oe3E2lWY4eTkV07Cs0xziy3lrmnKPDaZB1pABb14djA/vFLqVD86vcAalKtQ4GFKzC8AWxjon11kqYHdUzgxndWSIaWF9shLqp7DnFhWz0ToUW0AE/UIfyUVq0q0oGcPdPQpfbdWLciqbIDocx62MFW8xkkwMZ1nUvukbBbHYgnmTq7szFN4k/BocudpoZzB9uDCJeCaUNxB1Z5WX/vfAUcFOyRW21EY9bHzw0ssQXIpUcqMJwW/Mhzb5N+I6viXSq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/fRCjXIxl8+uQsawQRoBKTj7PY1gZwapXhQ21Emf+k=;
 b=B9s1LQ/EWXb9ulBptMs3+vVNsOAbkSKtnnSHEtlscKrBqHU0cdtl9iYR6wYfm5XGsR71XNs+FCQxFHgiTepOWbCEy6TroAIIuStkaIoS5h13u3E/+MkFCG7LuLIcBbdtm3Zvd4bxC8xT6PbbX+gZicgFhEZ7+sOqE+tPyoM7UuE=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB4783.eurprd04.prod.outlook.com (2603:10a6:803:5e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 07:39:06 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4544.022; Fri, 1 Oct 2021
 07:39:06 +0000
Date:   Fri, 1 Oct 2021 10:39:03 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jacky Bai <ping.bai@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the clk-imx tree
Message-ID: <YVa7F+Y6BGUS9vXN@ryzen>
References: <20211001083304.3cab4195@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001083304.3cab4195@canb.auug.org.au>
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
Received: from ryzen (86.121.85.242) by VI1PR08CA0245.eurprd08.prod.outlook.com (2603:10a6:803:dc::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend Transport; Fri, 1 Oct 2021 07:39:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4e63774-680d-424d-0277-08d984ae8c00
X-MS-TrafficTypeDiagnostic: VI1PR04MB4783:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB478328B3CD7035D2AC8A7C7BF6AB9@VI1PR04MB4783.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7g8wB9gSc92Qqo/X6WIAVDcxM1q83usaOPqDde0lpGILFnQk69QntnARb+yfEcjllBMOTbxwAKSSg31vTP7uM8KuEL4WCt05BD5ZcaFiuYrS9NZm3GZ1i5aldYCFGmvVv+n+wP9dTk+Ypt7ANcnblCQHcYZgmuDcWWc7r6tMw9iSPYs/PeH4T/2vXCueVRLcSFTP55DxxjOdy9enbvIWrFGnmbRJqkrUpzyhkr1/O6lSrDLC0RRbOlq66PfEDnaktSjGzcpwtBlNzfCtwJG6FrKw30EJhW9IQK9w11gNlhepYayG3o6ovWsdWez+SRSX4YH9IjIG+GpdXSmZkeL61DVwCuIBDTZd2xD8JAXUVAm//tJ5FWRgcMdU9zb6YCdj1gBaJ40PieXHBB/2LbBGcExDttkCoKAJthcQ3k6IP+C9JGcOk5Uk+3yM7JT1CMMnJsdzmzKFKeFPCN9Amo+KbcolnBNA5TkVKnP3bP28cV+x8Vg/zz/jL+4i3g9o2i5dvfGQ4zA0RLimvjCwAun/Fu3aPf4ljZpf+kwWyeJYf+0U262VuKW5226qUh7/vu7K2yNp3ip0dg9gzavyOxuls2oJHwZ+u8i4o6uKVQYvQBsKXma8gWRVgIkkLca/pors7MGiuGsFozJ653fv25/1i0T2sas5G3SaplB2qt00K0J+s/MzIlcA6UObx7KCA/8vpPPthIvtDGtpwxdzTGGXB9N4owakFx4KU9dLzHTv8Ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33716001)(2906002)(53546011)(44832011)(38100700002)(66556008)(66476007)(9576002)(83380400001)(508600001)(4744005)(8936002)(54906003)(316002)(6496006)(4326008)(86362001)(52116002)(66946007)(8676002)(5660300002)(55016002)(6916009)(956004)(9686003)(186003)(26005)(38350700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ooIkiZcnr9dorfBtjWv9Hob2TUu13MumU0uKdk1JKeXyXHqkqzuuXy/VIiFo?=
 =?us-ascii?Q?KEncy29GF4Sqt4vC11DjfLJaSHBE2HzuK7qMXfEvk4nsatL8zmXKI/NgsYwY?=
 =?us-ascii?Q?WmWt5r2UX2ObYbAExcO7wSRROP2bsCxJ4wyHPOc3BezXxLs5QYxQp+xA4PWX?=
 =?us-ascii?Q?XTaa+9CfMYDBzOy+FBrFjciaXtv1A3INxNLlVj0uGFAfo0QhCda6AUNRwRWI?=
 =?us-ascii?Q?81rI1k5a17qfNtWoN7P975Ntaw6r8VJW2y5d3BqnwUxF4AZzfdSLTczZ25pw?=
 =?us-ascii?Q?b01YkOPNIdnyZhxQwb/hKAhizZ/JDqvNONYgt81wlQ12uZxOvwTJQ6TqeQ5l?=
 =?us-ascii?Q?PKxtd2zk+d5UwHZqKfRmro/fB4kgTZjczjtGC12CzVq1TYmgCJKS7cc713i0?=
 =?us-ascii?Q?dsENNVPyj0ZEV0D++3kDVmFbEE6b/znk7IJewcknXvnpUw0PCiP3JQpQyqZa?=
 =?us-ascii?Q?3vZsjWO2kEQ9Wx7C9GfytPdR6VgvNIXgUtjihT7IVGBMLKDU+9CGaA7rh3FB?=
 =?us-ascii?Q?TgE8JOY8P6nqhSpTEmTAyKWCLJ4w1XAmgwFGCrA+6x1IlYQZl57Am17xGHCN?=
 =?us-ascii?Q?sRi3F1jCLR+L2LOc1GHF9La8c6vWMtOhGsOAjXZgs7TiNWER3xOvpyy/6kPg?=
 =?us-ascii?Q?8VjOS/nGLJh2eGq94oOOz/12czbKfyBA5I/wSZHr8U4Yd39Cs5jikmJ7VOis?=
 =?us-ascii?Q?ZW7sYb8CpBfL1fxXgiNvw4LbEaUmcyUeIWLDzJVe3qsDEcf+FAtfzrO3Z0AM?=
 =?us-ascii?Q?sNz7UYQyWbVna+mbBxikdRJQw9DSOj6tcXDKZ9vZa0g/+fod3sJFoV4wlbnt?=
 =?us-ascii?Q?ROG22xQpF0DkZVdRhRI+9mn/fnzGJv3/iiDmTTe7j9/mEODMC0xVLPHtKr5E?=
 =?us-ascii?Q?37WcRBgQAePVa/jqxXBYmSE0CtH6/QPRQ+JKDm6B14KYwX9wegdPkqscf2Ex?=
 =?us-ascii?Q?FMdWSMe+g+khmJDAHnjFZcLTWwh9P/mdle6BCGIo2sBxyH053paFpZn77bLe?=
 =?us-ascii?Q?1Z7UTmDq+aAJJw4685S2V61B4CPkVl+D1ONNW6uzykMkV3ZhIAyEozw1agKd?=
 =?us-ascii?Q?C49G7y61tepX5PVUCF5mKSo/qFbFyJJfnpaStq+0PfPK68pJ1UDNMqZpsZ44?=
 =?us-ascii?Q?w1DGaCsO15GNBcHFBFtSDjSallgG3BdzQ/NGR2XdD/6f2Ho2ELIrjnvUHg3w?=
 =?us-ascii?Q?tMuKfPi+Td/xXxDYaPldg2RzR3IcFie76jug1PDtqDuJ2odqDng8CX5qem/s?=
 =?us-ascii?Q?rbbde18Pimb8muNB+WsNF6I9PQ8ajbR7I3ATf8fNn3pDUljkh9MlGDDjW3/+?=
 =?us-ascii?Q?77j51o19Nnoi1SkHTXT3Oikd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e63774-680d-424d-0277-08d984ae8c00
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 07:39:05.9281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKr8pYLQE14XaOrmesSw7qP1rE69hztqa7Fvi7e2yjB6dLO0gPbWf3lHdn/m6ELNpxwK1/bfCEODJ6/i6ypjwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4783
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 21-10-01 08:33:04, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   b00bad50a24f ("clk: imx: Fix the build break when clk-imx8ulp build as module")
> 
> Fixes tag
> 
>   Fixes: 86ce2d393ff7 ("clk: imx: Add clock driver for imx8ulp")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: c43a801a5789 ("clk: imx: Add clock driver for imx8ulp")
> 

Sorry about that. Fixed now.

> -- 
> Cheers,
> Stephen Rothwell


