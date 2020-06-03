Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9801ECDE4
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 12:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgFCK4j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 06:56:39 -0400
Received: from mail-eopbgr30074.outbound.protection.outlook.com ([40.107.3.74]:62534
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725828AbgFCK4j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 06:56:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iT4nj2xxpMp0RfWSS7Xumbi8mipJoyPuSKHY70TklzD69KIdZn9w1cDrLQGSLVumgSuH0d0g1jPBW6wKftp4imKS5DTGGems3nPzCmq4kPPSQOjsYEfBAZGtucIUFeYPI2Tn4xJOGtkJM6nBU8vpWg1YVe4rwlqnKK1cAibf/684qfuxjJN0ARCUP9VeLtF50INBjEeefR++2bPE90a9J6VM4eS4r5j4u+NNwMAs9BiZCQM5f2JnGIIPwubRA6V+BNUt9swhV871oTm7BCcKAohv50hiH3BZiHGP22LvC/BuLNEVVOiq/Bft06HN6Z1km+q4JVUJIcnL77sSyjn74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8J75WPC9kadoRTuFeOStWraYVTaz8c1K5vXkKZ3aFU=;
 b=oIgHGTdglfSUnaIkRC2PMhs9A9JUPFo/SmF8NJTXEUIfiBzFpxfWNbOeMCSVWy5xDPvzw4SXcFY9S1Szwlc/wY+lqOh5ZYPRqlJTOnhUwf/GJq2MHwwvViBVvnZJCazmbAv/SCrsliTLVFrknH5y5g9/VHoojZnhqbZp1NZkaSp9UnC6sg21hFxNmzT0nsPQ5vCGX+Jq9MHmp1xfDCZIkjHUvZdVJo+xKpnajoW/ao9qJOqAIzK2bbRL/9Badg8VNhIWhmAebg1IHz8gAWL0KYYZPOYQWExBojUU1ZGlujsgSG3n3EarcHnJrXay4qwwMiD9PUIo/3ufuzCEt3JvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8J75WPC9kadoRTuFeOStWraYVTaz8c1K5vXkKZ3aFU=;
 b=CA/DSsdlK3+2VuOSdha/+1scFPIwQmqpWEjb/mmE3e5A6trs6jG8m3ec7x8sQOa1AHV97xYg32jwq2zhw06OMsMTXsrMjx2xB2p8LZKTEawSskNpox8Nw+LbuJ7p3KvDyK4nAYDDKtVddVHBoygbnE40P2tTI8aJvIlgsg/iAZk=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=mellanox.com;
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com (2603:10a6:208:11f::18)
 by AM0PR05MB4977.eurprd05.prod.outlook.com (2603:10a6:208:d0::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 3 Jun
 2020 10:56:34 +0000
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::d05d:35af:3f2f:9110]) by AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::d05d:35af:3f2f:9110%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 10:56:34 +0000
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
To:     Jason Gunthorpe <jgg@mellanox.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
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
 <b3b08c2f-b22f-1e8a-ba0f-d50f2db1abd3@mellanox.com>
 <20200602233201.GE65026@mellanox.com>
From:   Max Gurtovoy <maxg@mellanox.com>
Message-ID: <7d5dd73d-02fe-680d-1b0e-69d0e8af5430@mellanox.com>
Date:   Wed, 3 Jun 2020 13:56:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200602233201.GE65026@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To AM0PR05MB5810.eurprd05.prod.outlook.com
 (2603:10a6:208:11f::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.0.3] (89.139.203.251) by FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 10:56:32 +0000
X-Originating-IP: [89.139.203.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90d10d97-49f7-467e-ee4c-08d807acc7ad
X-MS-TrafficTypeDiagnostic: AM0PR05MB4977:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR05MB4977ACDD341D3C41EB62A383B6880@AM0PR05MB4977.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVlBNG6biG9O+969WiKjqtD1SgD+2ekulhqteRdPTf/kDoHt7Mm+CJnTLFChBkatEcyDWuXlDfcHKLaB5XoTBEd4ReBlWsh/GM6FwQ2490/nidlWRaRZPFAneHitLDQmdyyU4nwsYtS7oXlffTYU1/KENmM2dhnEsFehI8j1Zx5L7xNR5K5IE2MVEH9xF2P0Zb0zJ2wVUtMwJ4eA8QePg9jVwubdkOjJk1d+nJwKSoYM0XTley6h7R5VqWFyu6Dy4AG06cbE5A8rEOY5KD7GqLCshtu2smvZI+BRIYgICO2p8XPMK5mIWwk8MsFWFWraA8wbUrsCOyT1BeKrbDY9NY56FzWXdnNylClfAfL16B9L5DWlSqokRA+1HKe9R0Hc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB5810.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(6486002)(478600001)(37006003)(54906003)(66946007)(86362001)(8676002)(5660300002)(16576012)(31696002)(8936002)(36756003)(6636002)(2616005)(956004)(6666004)(316002)(16526019)(2906002)(53546011)(6862004)(4326008)(66476007)(186003)(66556008)(31686004)(83380400001)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XqtmqDzQjdNMC6OKnSCLkUuRdH78ffmPdhaKU1BRJba8b/xHkORXplxHRU0SULYIsfNoVeicuggcqkqnxs/HWTwpcVpU+lwFynCLvrb4FrF3h/RkrBnq7K6sZfwO0Zxe3Vlswaw/HaXK0UZ2aF1DFl/l3/OhiP4ze2MRm+NX+wp9HZmdG4KvXair4o6+/emKM30seyIcHa+CZbjtk+ElEKm17nW32AL5B+Fd5Js8UjyRbSx+h6pqxAinTgI43G2gbZiR5Nj01Ul4mug1UWIuewKl4FHMCBIbrB2mZ14tTXRwIzCHejqZfsccJgazk3T2DT1dbLfTnGwtedEQc5qRogF+/fxQA8mwpniiKJZxGMbQNCgdnYQS6DRc8p/+hQ8q1IWXcKLsEuspbFutIY/qrNmPoVUucxAg4mAvQ3vGKUAAo5m7raHNXxcrywFIeQJ6dyuiMnKPCR2l0Ew+D3Y4DHnB2WkQ3btvywvWYrBV8caJ83ycSIh/k25ni13dw5ov
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d10d97-49f7-467e-ee4c-08d807acc7ad
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 10:56:34.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lq6/83P9uw2ylT1m/lVFosvO292JaxsOPRFiMepSdULemBc3yg39mQaO050N86NraiHSt3Tevuk6TXGm/mPr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4977
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 6/3/2020 2:32 AM, Jason Gunthorpe wrote:
> On Wed, Jun 03, 2020 at 01:40:51AM +0300, Max Gurtovoy wrote:
>> On 6/3/2020 12:37 AM, Jens Axboe wrote:
>>> On 6/2/20 1:09 PM, Jason Gunthorpe wrote:
>>>> On Tue, Jun 02, 2020 at 01:02:55PM -0600, Jens Axboe wrote:
>>>>> On 6/2/20 1:01 PM, Jason Gunthorpe wrote:
>>>>>> On Tue, Jun 02, 2020 at 11:37:26AM +0300, Max Gurtovoy wrote:
>>>>>>> On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
>>>>>>>> Hi all,
>>>>>>> Hi,
>>>>>>>
>>>>>>> This looks good to me.
>>>>>>>
>>>>>>> Can you share a pointer to the tree so we'll test it in our labs ?
>>>>>>>
>>>>>>> need to re-test:
>>>>>>>
>>>>>>> 1. srq per core
>>>>>>>
>>>>>>> 2. srq per core + T10-PI
>>>>>>>
>>>>>>> And both will run with shared CQ.
>>>>>> Max, this is too much conflict to send to Linus between your own
>>>>>> patches. I am going to drop the nvme part of this from RDMA.
>>>>>>
>>>>>> Normally I don't like applying partial series, but due to this tree
>>>>>> split, you can send the rebased nvme part through the nvme/block tree
>>>>>> at rc1 in two weeks..
>> Yes, I'll send it in 2 weeks.
>>
>> Actually I hoped the iSER patches for CQ pool will be sent in this series
>> but eventually they were not.
>>
>> This way we could have taken only the iser part and the new API.
>>
>> I saw the pulled version too late since I wasn't CCed to it and it was
>> already merged before I had a chance to warn you about possible conflict.
>>
>> I think in general we should try to add new RDMA APIs first with iSER/SRP
>> and avoid conflicting trees.
> If you are careful we can construct a shared branch and if Jens/etc is
> willing he can pull the RDMA base code after RDMA merges the branch
> and then apply the nvme parts. This is how things work with netdev
>
> It is tricky and you have to plan for it during your submission step,
> but we should be able to manage in most cases if this comes up more
> often.

I think we can construct a branch like this for dedicated series and 
delete it after the acceptance.

In case of new APIs for RDMA that involve touching NVMe stuff - we'll 
create this branch and ask Jens to pull it as you suggested.

And as a general note,  I suggest we won't merge NVMe/RDMA stuff to 
rdma-next without cooperation with Jens.

-Max.

>
> Jason
