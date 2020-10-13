Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5779728D196
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 17:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731310AbgJMP4X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 11:56:23 -0400
Received: from mail-eopbgr130050.outbound.protection.outlook.com ([40.107.13.50]:19248
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727016AbgJMP4W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 11:56:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMrHd0Gr34QJH0M5QLyE8xvbscGYQWkTEDpZBsT1VfyLMEeLSxh/a7Caa0RSqQnvAEdM1GBjCf6vJA5cMNJfKd2xqUv0SopQgEPnKl4ruKP+l5XAVhmoGzoy5ekLZexGgGVCxgP6tAIOcBlR6HEfWexkoQg/ZdgbKI/iZ0paeuLB8I76xjy4aOI72Z3xcnKQtq5DkRhq6yVNyEUuhEKG5v1z2Z1YDiIBR4LJGNF2KZs4LpoEowtvoVf353bunyScJ5amKCpoBdYZPizzkD1X29+RwAmvf6mhFLxj69x1ymJvnSkMUWbsw24i7UOzQ6zn3iFoE/xoxt0pgAIMT8KqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrE53u6LpMMyjtiYtqNOol9BslBPF2lNIqPqSxOlnS0=;
 b=gFLAUPlUEAqGFcWskLMa6dwKsUPb5/OgSxXCgAeG3OwuY9U9JTBZFRluysHA3dKy1nde3ceRuc2CDjv1tIml3sYPo5ko1MqL1l6byUmSOgnFKugFARZFtYbOFNinXWDx3FxEukkYFHbg/RrbH4CWr6m3veeAlAkm8UbBf6b57OcplDPiLnsvQdORybMMJCQY8Dp6nC7qMV5lmud6mT0vrq0tL5ap0cRN0kplTwocd7DX0YfsjI6Sp5ar+U7eA2tVgdyxStio/kVKULKUqqj3tT70o32vC8+MXR3mMnmlclJRHAyaoXhwybbNLN3s2pKc+poRuUXQ53zNGERJOhPa+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrE53u6LpMMyjtiYtqNOol9BslBPF2lNIqPqSxOlnS0=;
 b=B3JvVOMpXazuZDLEST4PP/sP6hucpdR46RhaatuCCSauPLLNdW0T+XykBwWYC0YVSeUCvm4zF8VCMqbLmXGI8kJ4Jw1HcW5XSiWeNh6xl4J7R7xvd3pCF9nj9ATO4R8xetmlYgb5tufcR/SUdbv7blkvQCNf9vPIWe1SmixjaOA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB2815.eurprd04.prod.outlook.com
 (2603:10a6:800:ae::16) by VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 13 Oct
 2020 15:56:18 +0000
Received: from VI1PR0402MB2815.eurprd04.prod.outlook.com
 ([fe80::6cf3:a10a:8242:602f]) by VI1PR0402MB2815.eurprd04.prod.outlook.com
 ([fe80::6cf3:a10a:8242:602f%11]) with mapi id 15.20.3455.030; Tue, 13 Oct
 2020 15:56:18 +0000
Subject: Re: linux-next: build failure after merge of the vfio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Williamson <alex.williamson@redhat.com>
Cc:     Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201013140744.64937ecd@canb.auug.org.au>
From:   Diana Craciun OSS <diana.craciun@oss.nxp.com>
Message-ID: <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
Date:   Tue, 13 Oct 2020 18:56:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20201013140744.64937ecd@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [188.27.189.94]
X-ClientProxiedBy: AM3PR05CA0132.eurprd05.prod.outlook.com
 (2603:10a6:207:2::34) To VI1PR0402MB2815.eurprd04.prod.outlook.com
 (2603:10a6:800:ae::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.122] (188.27.189.94) by AM3PR05CA0132.eurprd05.prod.outlook.com (2603:10a6:207:2::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Tue, 13 Oct 2020 15:56:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21545257-bbbe-4688-3eb7-08d86f908574
X-MS-TrafficTypeDiagnostic: VI1PR04MB4719:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB471908CFDFC5FA56EFA4E3DABE040@VI1PR04MB4719.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:343;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQQVIVS3fXQL+ZbEvhdaTTgHjimpLt+6bJbZ4sk/nmRftKgISnnvuyr9fZxlIUmOqVwJWdgMfC/MEh5XF5D5m7m6j136u1NnVkgy9GoABhDjAdxYOGgPmHrKkQ/+7rSNX0JpcsqzLkpmF8AVijvU3q2wTdDHq7BVFUqRGkMdAS1hx9xncy8Z/okDJZO+6QF3cTAWSKSnvtPg9awdvIjok/ezzjwLJnxYLH70V8FgBSLulBqgdm5212dY70/h/6Uqib6p0DOUQep7wOMZ2wUO/lfeE9dVSvLYtz01vVrBhYN1tKfS604GYeZVXCxh7lk4SfsyRDP0PON1dEtLpDaV9PIMpIIG3RanMfsbNJZBvFpCys+0eqWu71rCOoDhCYyS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB2815.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(316002)(52116002)(2906002)(31686004)(53546011)(31696002)(26005)(66556008)(54906003)(110136005)(66476007)(16526019)(6666004)(186003)(16576012)(86362001)(5660300002)(2616005)(4744005)(956004)(6486002)(4326008)(66946007)(8676002)(478600001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mxoMxV7WYwE8oNGPdi4lP+GIIz9GILyFk/N9CCKYQO9NtEb5HNG/VKgIu2VshAuC7Hkr2l5ztHl7BlWZOwPqI+qsU3DvctwFIVn6PLCStN0U0Bh8t7dKwI6CF1Tu9rqq0McjRy+8lB/rDbdB16llTbJCQ6ATlPTv4rENhDyBsuMWG5+Ytl3XEt9yJNMJEWFR0nq8OerHMZBU3BCJtG5dSJQzWtnakIPZ5ltf76f7WW9o+bPPJ1icZXAi3JnzNHam4S+7gIvWwJkZh/hqePE0aRmfwqp/4TB/TmWXdcM+vAYX1kbAD+fnmYRXxKRyq9qh0GObN7RZZaDTdpr6YruHal5ifZYL0YzRywcigPnMAJgklOaCQFrNUSEUIDPIGhogEUoi6chvDsCtSZMGE06/pSr4MU6sT0La7V953+42jXxQCPhO1xw1vZAwlXr/VjdYibWy198ZEdyk+f+Q72cQaZcJSI3ezCHeVMNg92i9XxHB/A5hGU6zbuK7eIYl9yPbPNnIJ5C5AfGhQqEW9XRtV8qb0FGwNEE7nRVdr06UmD1FZA1Lce3HuJcooxaWe3YebjUXIG8tOOM8sVml/H63k5UXvG/Ev3PE7eYMWq7niVwDrhB6FKmuDXJmSQ5uzrD8txqw2LPPTDRNn96ijgnH7w==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21545257-bbbe-4688-3eb7-08d86f908574
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB2815.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 15:56:18.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5YQEs3//al07KgNuNWN5+LZkNELYm78lVGmLOYxnb0V/cgPXkw6WNtoYvUHXSiQ0CS/i8UJiqGxgTYboevWHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4719
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

How does it fail? What's the error?

Thanks,
Diana


On 10/13/2020 6:07 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> 
> Caused by commit
> 
>    cc0ee20bd969 ("vfio/fsl-mc: trigger an interrupt via eventfd")
>    ac93ab2bf69a ("vfio/fsl-mc: Add support for device reset")
> 
> I have used the vfio tree from next-20201012 for today.
> 

