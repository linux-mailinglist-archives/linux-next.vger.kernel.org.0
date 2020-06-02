Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404D21EC533
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 00:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgFBWlC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 18:41:02 -0400
Received: from mail-eopbgr20077.outbound.protection.outlook.com ([40.107.2.77]:19717
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbgFBWlB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 18:41:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWQNdk5iB9YOO41IgwuxIPMWAnywsjjtb4Y5pYn9U5tnxddqhg1PB4NuotVwyk2TtXKdJ2c/FquKb3xDL76yrKU6e2Hd1M8/j6MoCN0bKL69Xjqpe3UXOXB+rdLawBoc+0CdnbBpPhMwRzMCL5fNlGOWFCUWYh17tiW0++i+eOeNI5905bEeZgXiITWeLJbb0dOAtJHUE4sHIYZFnkSL/JJvjvvwtDSk6FJG/iQXVd2At/DC3PQKVm4LX8X2C3i+YhiUUw0MxqrwcCe+W562Am8rjvKx/Y+2Hy4nfI4uDt/HXpEu2CHAOCHA0TEKCHNQcmLaRSBmzM6+yg6YUXY/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUFVBO7nqsMgunRKzk6/mfGwIO3IR9cLkKdNTaf4wb8=;
 b=O9ljr+j1CQyG0m+Qo8+cKZuYAFoDkM3GXoNBK06WZ64SglicAl4Fmy6Ne7AH2oo79CWVuXcNyvy3IkRgJq39/7r70vFkBFKwORZyPxAjIKXyIda+seFnNx0jmmfSRm53u4z2OvZN22h932BpBGHcRUctpTFVAWGqhde3yg9oHFmljGa9hzxgM83I3K985GGOt4pZllEmSEV6Zy9D7oc5oRFgZAdWoPD2Z5sEXgQSzJbToi+6u7btvRRYmIsNCaawjE37hTKQYhlmvY0WF0ml434gmkXQ0kAWKHMQ/uDnUZBIy+U1LyEldLEayHObsY/hLBCyl5oK9sTPDWfhXZlwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUFVBO7nqsMgunRKzk6/mfGwIO3IR9cLkKdNTaf4wb8=;
 b=H9nd09rnSBzamZdxcO1Iugq0G6Vj4l/Ir2fraBAk2Uthb8QHnW7q8FpVcMZle1Rxf+yFiKErJ06/iL9OLGaJx9frMCqUkTtghY7xbKVDynFE1Q6Aim8tei9wN27mfp3CQil4UFcMGEFmiW3vJSWOe7/3fyScKR5iDNgmQYfMDP0=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=mellanox.com;
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com (2603:10a6:208:11f::18)
 by AM0PR05MB5892.eurprd05.prod.outlook.com (2603:10a6:208:12e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 22:40:56 +0000
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::d05d:35af:3f2f:9110]) by AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::d05d:35af:3f2f:9110%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 22:40:56 +0000
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
To:     Jens Axboe <axboe@kernel.dk>, Jason Gunthorpe <jgg@mellanox.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
References: <20200602125647.5f5ed151@canb.auug.org.au>
 <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
 <20200602190153.GA65026@mellanox.com>
 <8be03d71-9c72-bf88-7fd7-76ec7700474a@kernel.dk>
 <20200602190945.GC65026@mellanox.com>
 <b8ad79a0-57cc-e823-6b99-47d59ce5dc7d@kernel.dk>
From:   Max Gurtovoy <maxg@mellanox.com>
Message-ID: <b3b08c2f-b22f-1e8a-ba0f-d50f2db1abd3@mellanox.com>
Date:   Wed, 3 Jun 2020 01:40:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <b8ad79a0-57cc-e823-6b99-47d59ce5dc7d@kernel.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR03CA0062.eurprd03.prod.outlook.com
 (2603:10a6:207:5::20) To AM0PR05MB5810.eurprd05.prod.outlook.com
 (2603:10a6:208:11f::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.0.3] (89.139.203.251) by AM3PR03CA0062.eurprd03.prod.outlook.com (2603:10a6:207:5::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 22:40:55 +0000
X-Originating-IP: [89.139.203.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3725edac-69aa-4ade-281a-08d8074603b5
X-MS-TrafficTypeDiagnostic: AM0PR05MB5892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR05MB589278E4D40265CFEB172D58B68B0@AM0PR05MB5892.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QDzEeSHZyNpPGEvRy6Ewjd0xuqdbp49jI2OSTohVIwbPeeIO9WfTlZxAJBxSnBGEWLDNUw38dsWJc2v6TTN70oY1iiqqYQV0VuQ3kqbno326QLUSOJn0wqkDV7l/jrxQGqVnNiuI9I++5M+HuIZBcz0SUECeNTHNWvjw63S1a4XbrwQ9eLWjeSlKWpzO1JyZNtCRrfhm4A9PyvQ7vsPwDxyd0Ly1cOxSoY9M5Keutbfym2tIfwNYUBgEySaSvZ66YMJgeq4ZIsgZUrVfCsUqfz18joCO8y9s5aNmv8W8bZ+JW61FrOBe+N6iWCUkhVtO1bO1QKKuTzTUU4vS5vyJA3fE+udw+8YzBgIhSnvhj2NSr8VGAK8Mir2+RQeOmY3C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB5810.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(83380400001)(2906002)(316002)(4326008)(6636002)(110136005)(16576012)(2616005)(6486002)(956004)(54906003)(8936002)(66476007)(52116002)(8676002)(66946007)(66556008)(6666004)(53546011)(26005)(5660300002)(36756003)(31696002)(86362001)(31686004)(16526019)(478600001)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8Mn4l1WI1tNgMtNP+ooKqECKkzN9Sp71rlPZthz868Q0D+wux1mcUIDESEpbK8OBgZlMCbMHGNkafTWCjdaDBtUlhyMUYfpkcM1K9Qs1gr6Drv/7McklxRBkLfJF9UGnLyy9DU1OZGOewrGePYD3dGBS8c9rxUN4mujjsW1HXVKRXng8nHrF6/ev+oSCwWry/FqGNXTmAqWgkL9UVJAWWs1oH+qZl2aIjpO3EJj/DcaSxtV3kS3b7+wHgGtwzJzowEqRE18/dtFdLrx/GxkaydSiLVL3h59TMmrRdAJoltjlg39cGrwAi96bDzZDklHx5C9aYxY2rar4Y6V47zmeJgiyKfAenvIDQVODTRmYu/8j9wE//3Paw2at5ANt3bn8yIXPfn9ZYhdijhoC69zgX+MFn6xcMWI+++o9SciSpjJBHIrcLeiDd/Qch9HLJcHw7uufko0CD5wCx4g8Jz6JZv6i3bQOCUSIAEtA4FYGy3uMXj8BJx/lZROUfP8f22ca
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3725edac-69aa-4ade-281a-08d8074603b5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 22:40:56.6333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfA+uIkdddPNgm4IbPW30ZpZacHmSeGWId+BHkwYsiqvl6CB6+QqONROi2awoCx0ib2LEhN12uufFSAp1sT3Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB5892
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 6/3/2020 12:37 AM, Jens Axboe wrote:
> On 6/2/20 1:09 PM, Jason Gunthorpe wrote:
>> On Tue, Jun 02, 2020 at 01:02:55PM -0600, Jens Axboe wrote:
>>> On 6/2/20 1:01 PM, Jason Gunthorpe wrote:
>>>> On Tue, Jun 02, 2020 at 11:37:26AM +0300, Max Gurtovoy wrote:
>>>>> On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
>>>>>> Hi all,
>>>>> Hi,
>>>>>
>>>>> This looks good to me.
>>>>>
>>>>> Can you share a pointer to the tree so we'll test it in our labs ?
>>>>>
>>>>> need to re-test:
>>>>>
>>>>> 1. srq per core
>>>>>
>>>>> 2. srq per core + T10-PI
>>>>>
>>>>> And both will run with shared CQ.
>>>> Max, this is too much conflict to send to Linus between your own
>>>> patches. I am going to drop the nvme part of this from RDMA.
>>>>
>>>> Normally I don't like applying partial series, but due to this tree
>>>> split, you can send the rebased nvme part through the nvme/block tree
>>>> at rc1 in two weeks..

Yes, I'll send it in 2 weeks.

Actually I hoped the iSER patches for CQ pool will be sent in this 
series but eventually they were not.

This way we could have taken only the iser part and the new API.

I saw the pulled version too late since I wasn't CCed to it and it was 
already merged before I had a chance to warn you about possible conflict.

I think in general we should try to add new RDMA APIs first with 
iSER/SRP and avoid conflicting trees.


>>> Was going to comment that this is probably how it should have been
>>> done to begin with. If we have multiple conflicts like that between
>>> two trees, someone is doing something wrong...
>> Well, on the other hand having people add APIs in one tree and then
>> (promised) consumers in another tree later on has proven problematic
>> in the past. It is best to try to avoid that, but in this case I don't
>> think Max will have any delay to get the API consumer into nvme in two
>> weeks.
> Having conflicting trees is a problem. If there's a dependency for
> two trees for some new work, then just have a separate branch that's
> built on those two. For NVMe core work, then it should include the
> pending NVMe changes.

I guess it's hard to do so during merge window since the block and rdma 
trees are not in sync.

I think it would have been a good idea to add Jens to CC and mention 
that we're posting code that is maintained by 2 different trees in the 
cover latter.


