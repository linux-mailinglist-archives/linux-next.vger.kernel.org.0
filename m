Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5441EB782
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 10:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgFBIhf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 04:37:35 -0400
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:6144
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbgFBIhe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 04:37:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NB/OVF0LnMbXu02UqCaBiCP6yrLevavUG7tYpiu5C44+ct2rZJwYEy8Q6RSHK79Sd8Lx6yfItwmoJ2GAnxzluZesLFppKDm3gi1JCIynlVSC3wFaRqflXOHLZUw+r2VRjpn2h5N9eC+9ViXg3ofhfPOE5WDHiA0AfseqjXDjCzYC5BxY+s9ziCg1LLqaz3cPuy84TIJeKwXouLGiTisxpMipURbG51GvvdAMgDVoxieAsN0gCLWLf8mKyjCvyRTsZrUHGHNpzl3LdqUOpo85plm1egdMKUE60tEQNTgnd3PttEs5MfExFY3iEXUU92m1/aiP8V+d4QpAhh1CCsUm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aUo7NUI5jfaMlCBAWMMS01DSg77z765ARsVkZNAoZg=;
 b=j50ItN5Uu5umFcwc66ltSzERWj0x0msWbTiKSJ4sV6t1ADBPiqfRWMxG/RrLh8EWPSRahstTEvdWkeGqVAThGXZoYfDo7TN8GeKnhALXsnKsq4+L26nxvpBnuK4xB4TXOKzH7VPRIRFAbdVi7+knBIVsUH2OHdRsBEjru3xgO7Ui5izfHmaWNvZGvY2lsHha/2WWA8GlzWhxiQph5o1G2b3M/fyrRqNJtB6JxfUV76eoDkoiST1M7+8Oaz3utzZMT/ZecIESuhUSFb4XFczNUhRehh1xIF+3C+wsjfldVP49ozsqgXs5ajVmivoMbQ9HNIEdU2QvBxQhGzjl142E4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aUo7NUI5jfaMlCBAWMMS01DSg77z765ARsVkZNAoZg=;
 b=C8CI0uWpGvpx1bG6RziywRI40zaY9aWF1sbcQ91yc5ulo6qxoS2dUNwlYELehtZUb0SSBpBMkVOyYyAhRIpXWTmkVqIhBYzMeCyrrEo7sYEP53TBhYfS007RMEyE4POgRtbZEdvU/V+JWWbG23GMiQBzUWYwWSTkpfOgZ0qiB30=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=mellanox.com;
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com (2603:10a6:208:11f::18)
 by AM0PR05MB4403.eurprd05.prod.outlook.com (2603:10a6:208:65::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 08:37:30 +0000
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::d05d:35af:3f2f:9110]) by AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::d05d:35af:3f2f:9110%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 08:37:30 +0000
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
References: <20200602125647.5f5ed151@canb.auug.org.au>
From:   Max Gurtovoy <maxg@mellanox.com>
Message-ID: <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
Date:   Tue, 2 Jun 2020 11:37:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200602125647.5f5ed151@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To AM0PR05MB5810.eurprd05.prod.outlook.com
 (2603:10a6:208:11f::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.0.3] (89.139.203.251) by AM0P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 08:37:29 +0000
X-Originating-IP: [89.139.203.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72862497-1213-4f21-bb76-08d806d0301c
X-MS-TrafficTypeDiagnostic: AM0PR05MB4403:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR05MB44038F45D78C9571AA6CD72CB68B0@AM0PR05MB4403.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQn1oAjdmMeUuFD7/o0YyL+hto4IYZfkdNqNQis7inedwra3WiKz4fbO8k/XKbwe1/NgvIlp7Djn164k+Myn7OTpn4b8P5/rmeo732F2LjY/sE13oBFwMEk7KAzQ9dVzwuuFbX2dsEZ46dGo3gXhilCgPWvgVgsZ+ddPnKzqcySdxMDLW8DnsenB1tA8lI06UFjSnNDQA9OhWDVet3hUAz8JE1HpPU8PECcRaduQHn5iTHr6InlaIXKgyfrqA1kQ5qKTmhC0qrVVFShsv+yRvCfDgc4lXEWWdX2O0kvTzS1oKEDLxczrj0Y0pdzfj5AHGht9zMTpZvJGe/XfDyIkVfXoi3FzwS2z77j4w5Ulh11Lb4TApjutwq7ZsZ01+IE0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB5810.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(66946007)(53546011)(4744005)(6666004)(52116002)(478600001)(186003)(16526019)(2616005)(8936002)(8676002)(36756003)(83380400001)(86362001)(2906002)(16576012)(316002)(6636002)(31696002)(956004)(66476007)(54906003)(26005)(110136005)(31686004)(66556008)(4326008)(6486002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: VPe0lkV4PUaLd+qpaQTZ+QWG6aJzJ6GLX3p15TF4VvAO3hZNWRLs9mzIlHrWzeAB4igBmpavuaIy9Zn3d74LKfcJUs6y1M5KksIlsnq+9GhauMlIahkY7/VraxpOkdK2PyCFgAu9Qkmo0bYqZwlzQN9rJZ+6jqcLBIzoiXw9FtHjJ6TN2dM3q3QFR2C7eembgWOtw9u8wrvfq2IEF8GftcG/C3gWsAR1cGge7PMDVoOv2im3O2RtKuxeVwRdwwXgyxpeB6Q+NaETwZE/QHTmS5J9JWkcxZNgrEaU5ELBDlCdXpEm1g0KMt0tUDL+NKzEM2IxmLs2z07uYdW3OhVPdFzIoGTVPW1HrtpXstYhOuaZdZRbY2+dLEDOeG99Vcb7o5oXdxne7kABqsn1msjL/EcU1CAiA69fu0CrWjgzOu8ZpQLGScAkpZTZtZhK682OhUYrP5onRyKdjXb0U/qTZQ5HJs0Fp28ubYYjDiAwY1vyRS0Jp9WLvGcrDA9JRSUy
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72862497-1213-4f21-bb76-08d806d0301c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 08:37:30.4897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNyJGlMfOaW4PpT0oPpYZFG0PptmBmqgfgr5i2JFAQvnyNCb4VoHVQLZzfxj8t9ZvG/DIJgMB0QZDYKTAk0vTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4403
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
> Hi all,

Hi,

This looks good to me.

Can you share a pointer to the tree so we'll test it in our labs ?

need to re-test:

1. srq per core

2. srq per core + T10-PI

And both will run with shared CQ.


>
> Today's linux-next merge of the block tree got a conflict in:
>
>    drivers/nvme/target/rdma.c
>
> between commit:
>
>    5733111dcd97 ("nvmet-rdma: use new shared CQ mechanism")
>
> from the rdma tree and commits:
>
>    b0012dd39715 ("nvmet-rdma: use SRQ per completion vector")
>    b09160c3996c ("nvmet-rdma: add metadata/T10-PI support")
>
> from the block tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
