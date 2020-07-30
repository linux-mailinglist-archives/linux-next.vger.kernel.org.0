Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B8D23318F
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 14:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgG3MDR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 08:03:17 -0400
Received: from mail-eopbgr70040.outbound.protection.outlook.com ([40.107.7.40]:58551
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726581AbgG3MDP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 08:03:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGQUu2ASPo/rhTYvnWjoI0FXWXs/CRmMlzN/T5M7N1L/Vcj8qd6y2pUq0/IHihugQt9H8CD6RP04B5OLinR/HoMaYyB0D1dOyC6hs4uJ5/JNxG4CjRV0h0Hvwwmck8B9KCrn7lFuZBfsqi2pLYPzu5W568uHft3pkQZ+SNx1mJcXobfSYG6jtgtKZYuptFgSpYoQcv2Vm/8gIc2NdLSgegb4tOfLbyipYapjaVFM0xBiZVkrsScszZIIFxaSbeY1q8Wu1zSRTKecUjYPbmH4vYH+780YJDehROw9NE898wAvW90rPGp73ivEMKUhPEvDwxD1u8i5owgfRlpU5RFP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN8eX597T2OaFClzdUsyPgbwZkf/drlB2RlXM3sX1SY=;
 b=gu6mBA/wB085y343loBmzUIv3DrZIuxr8SwxCjXxOIJf88asjOUJtvTdFLhR9mv4bOqBWcqnwZ/XPR0bfUAizx7NT17nmGqJXRMcpNUl1YzRrXANzwivTYVupOYNPfcGAEmrMeoxYtEXa0ZxHHm5OlBadtBfOmyrtyznamhwAAu/ldqs9x9WBQ7DWGId0lXAklWCAtD561MB+LNHP8VXnXQ/9xPOESDVyNcALfLq2j/aClFyKmN1qAvsgFFBmEZ0xE3v9juzwwd23GqqMkjHoL4G8H/j2ePa6TJJWS8a2nPJHhGzgbBmApamu7mS35Z7ejrYHAgcIn0B4G7T6sn26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN8eX597T2OaFClzdUsyPgbwZkf/drlB2RlXM3sX1SY=;
 b=HcfGkhzvBrfLApOZZYjfmcC0SZ/49xFfCv4MhL1RdmW9pfRgQo5lod4sMqf2Sg2fc2s4bCq4hbPl1oM1PEXCQBWi1D0xaMrf1cgCtYJKOF8FVwp25bzrlq+Tz47gpL9RDnjBEe7o6l1PCdu2FaK+JieyAkKmMENjIWJaxpNwACM=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB5583.eurprd05.prod.outlook.com (2603:10a6:803:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 12:03:11 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::10b0:e5f1:adab:799a]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::10b0:e5f1:adab:799a%4]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 12:03:11 +0000
Date:   Thu, 30 Jul 2020 09:03:03 -0300
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ben Skeggs <bskeggs@redhat.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20200730120303.GQ19097@mellanox.com>
References: <20200730192110.1466e63e@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730192110.1466e63e@canb.auug.org.au>
X-ClientProxiedBy: BL0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:208:2d::44) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by BL0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:208:2d::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 12:03:11 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@mellanox.com>)      id 1k17H5-001PZJ-JA; Thu, 30 Jul 2020 09:03:03 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cefdcd09-3ed9-483b-7297-08d8348087c5
X-MS-TrafficTypeDiagnostic: VI1PR05MB5583:
X-Microsoft-Antispam-PRVS: <VI1PR05MB55838C2B805AE91E71170085CF710@VI1PR05MB5583.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KOAewo6oGAbMffbVE3kpHscIZmlDE9Ul8qtmElj6kNQMoV6X9SJAmWl+WqZwRjdJfkaFn6kWPupbCB/XV9Vp9BBJDDGDoxYyyiO+BvPeD0wq8bzCtWEaCKuLVl8R9Vgc3ETPe/hSp7rs4GoaF2RAgbbEH96AWBWjX1j0i42bq+/HMhBW2uiCT7tELnqkbA5jTrfo7tkJPpblD38eswWY3JBsRyqm/uVnV8VArHOiNe6b/KnxQAJBMa686OuclyV1PFZY6CZQaxp/Y4LTBnv4z/hbZaAczyQA2HmfvJN4V61Z5vxWoGCZmqMZgkBYVvT+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4141.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(26005)(33656002)(316002)(8676002)(54906003)(66946007)(478600001)(110136005)(5660300002)(1076003)(2616005)(2906002)(66476007)(66556008)(426003)(4326008)(9786002)(9746002)(36756003)(8936002)(4744005)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: FcNZZ6T7j9n82oupaxaoHtwz3B4Ka/sPhTFMOvAdVrL0ZiR05Yoo6f9vG0mm8JFWefDFs88aGT9QjbGmnyD1+VosE36GCsoJVbfFtwlqNIY4OcjElzayWTJYPDr4+MGG8kzAw4yhfsFoPfIad+WXq6NF8aTjRqmartaM3qyvjNZJAvAQZe6+z5jScAD63kxNjweYRyWuaUbbnvucd3RVZGsPOyA5/x0xW91h4G1PY+jh6WfOvVwzdrTCYR8vNQx9QwK+R5n+0lfmP1zbdkOO6XYMsU0s9tzv2dJImAZTArWE0hb347kiy3KgQMtk7YVkBAvgfyzKJsKHfO0zQWcAORs9ca7blPMBTq8eUYch1DmioOqkLVvmdwVMfU06QaD+rzXo9dCRUygnBX57yk/oQg18xEICytVKLwAJtpk1/iai/AvKl54VUKmY/qZjYxczWid0sXQ5CequbE3TbSnPSV/VQ50fZholUlTvx8EdhBc=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefdcd09-3ed9-483b-7297-08d8348087c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4141.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 12:03:11.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+GVNafIGEf5+EcO72w9jyXNZ4yrDt2ECEUR9W0c56HFGo0gmWK3MrVCiEitjL0jZZVbAOekVvdeTqguKBj8Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5583
X-MS-Exchange-Transport-Forked: True
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 30, 2020 at 07:21:10PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the hmm tree got a conflict in:
> 
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> 
> between commit:
> 
>   7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")
> 
> from the drm tree and commits:
> 
>   4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
>   1a77decd0cae ("nouveau: fix storing invalid ptes")
> 
> from the hmm tree.
> 
> 7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.

Oh? Ralph? What happened here?

Ben can you drop 7763d24f3ba0 ?

Jason
