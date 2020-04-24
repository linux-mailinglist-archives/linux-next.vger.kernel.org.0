Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9A91B6D1B
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 07:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDXFSc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 24 Apr 2020 01:18:32 -0400
Received: from m9a0014g.houston.softwaregrp.com ([15.124.64.90]:42151 "EHLO
        m9a0014g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726010AbgDXFSc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 01:18:32 -0400
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY m9a0014g.houston.softwaregrp.com WITH ESMTP;
 Fri, 24 Apr 2020 05:17:37 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 24 Apr 2020 05:17:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 24 Apr 2020 05:17:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPHo68CGeMShyf6N1G4kqdOJ7pwQXoM5taZ4LbCBZy5TkTiJtuZPrG0c6dEzhXzcC/kZYhi6ac3VjzFy6sc3R0giEjl0nv5j8UAmNwH8Bepg8l2FajtnolH2OWO5fHbHQr/zbzDvUpcs5eSIR8hmxbGijZR7Ls4qua/Oqk3+/xN8IxnUXUlgYeQnSzy+aW5vqcuVzTdIhbwvBFs1gz+T4HKpWwVSIIgsaTVOwDqcUSOQ1eL04Uye6b9O7VzKehUAx//10WgjdBiFiv0sYbmEiVmoCfVVcsK9oMkYYWTGhlcE2B3TzWz/O1ob/5wYmxJbW4dEvCJ17ZrjRaPJTF0dAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYGxmqrz5w6yYuWJ/IR46xZFeAuzr25uh7N26uY8vVM=;
 b=LWR5YewHThz+99yPsHozBunmVfRcNEqEVTn9w7k/fS5iMTuqWxKMCMr4yYJkBTt/GloD1LAJz7IOKaco9yievvbPEbBde6djdo5kWYs9BAcZvqwmWknO6fHtdbmwgJZneQVF5V0elXSyxGJPimF1JLD8zLSznqvFNpY9WgDBMBCFDmN6v0EOTm+emmhzWVC6gzRA+wJv9tcpQTaMQfJ7JdPlljh1nyNHJR7p6W9AoJC5EL4xoSFhXB1RcmVguE13/T+uyl1HzlkEHUQPT6CDGCvhp8Xqs74iIHwzKGLt8FlKXdbm7UFz++u4UPFB3ks6dUbDjntcfLLt5szCK7Rr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=wqu@suse.com; 
Received: from MN2PR18MB2416.namprd18.prod.outlook.com (2603:10b6:208:a9::25)
 by MN2PR18MB3406.namprd18.prod.outlook.com (2603:10b6:208:161::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 05:17:17 +0000
Received: from MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6]) by MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6%4]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 05:17:17 +0000
Subject: Re: linux-next: build failure after merge of the btrfs tree
To:     <dsterba@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200421102520.53623f09@canb.auug.org.au>
 <20200422212933.GS18421@suse.cz>
From:   Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAG0GFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPokBTQQTAQgAOAIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJdnDWhAAoJEMI9kfOhJf6oZgoH
 90uqoGyUh5UWtiT9zjUcvlMTCpd/QSgwagDuY+tEdVPaKlcnTNAvZKWSit8VuocjrOFbTLwb
 vZ43n5f/l/1QtwMgQei/RMY2XhW+totimzlHVuxVaIDwkF+zc+pUI6lDPnULZHS3mWhbVr9N
 vZAAYVV7GesyyFpZiNm7GLvLmtEdYbc9OnIAOZb3eKfY3mWEs0eU0MxikcZSOYy3EWY3JES7
 J9pFgBrCn4hF83tPH2sphh1GUFii+AUGBMY/dC6VgMKbCugg+u/dTZEcBXxD17m+UcbucB/k
 F2oxqZBEQrb5SogdIq7Y9dZdlf1m3GRRJTX7eWefZw10HhFhs1mwx7kBDQRZ1YGvAQgAqlPr
 YeBLMv3PAZ75YhQIwH6c4SNcB++hQ9TCT5gIQNw51+SQzkXIGgmzxMIS49cZcE4KXk/kHw5h
 ieQeQZa60BWVRNXwoRI4ib8okgDuMkD5Kz1WEyO149+BZ7HD4/yK0VFJGuvDJR8T7RZwB69u
 VSLjkuNZZmCmDcDzS0c/SJOg5nkxt1iTtgUETb1wNKV6yR9XzRkrEW/qShChyrS9fNN8e9c0
 MQsC4fsyz9Ylx1TOY/IF/c6rqYoEEfwnpdlz0uOM1nA1vK+wdKtXluCa79MdfaeD/dt76Kp/
 o6CAKLLcjU1Iwnkq1HSrYfY3HZWpvV9g84gPwxwxX0uXquHxLwARAQABiQE8BBgBCAAmAhsM
 FiEELd9y5aWlW6idqkLhwj2R86El/qgFAl2cNa4FCQlqTn8ACgkQwj2R86El/qhXBAf/eXLP
 HDNTkHRPxoDnwhscIHJDHlsszke25AFltJQ1adoaYCbsQVv4Mn5rQZ1Gon54IMdxBN3r/B08
 rGVPatIfkycMCShr+rFHPKnExhQ7Wr555fq+sQ1GOwOhr1xLEqAhBMp28u9m8hnkqL36v+AF
 hjTwRtS+tRMZfoG6n72xAj984l56G9NPfs/SOKl6HR0mCDXwJGZAOdtyRmqddi53SXi5N4H1
 jWX1xFshp7nIkRm6hEpISEWr/KKLbAiKKbP0ql5tP5PinJeIBlDv4g/0+aGoGg4dELTnfEVk
 jMC8cJ/LiIaR/OEOF9S2nSeTQoBmusTz+aqkbogvvYGam6uDYw==
Message-ID: <9b0fe1ba-4db5-dfc9-3b7f-28e8b65430df@suse.com>
Date:   Fri, 24 Apr 2020 13:17:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200422212933.GS18421@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To MN2PR18MB2416.namprd18.prod.outlook.com
 (2603:10b6:208:a9::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (149.28.201.231) by BYAPR08CA0051.namprd08.prod.outlook.com (2603:10b6:a03:117::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 05:17:14 +0000
X-Originating-IP: [149.28.201.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b671590-7242-4853-daba-08d7e80ec170
X-MS-TrafficTypeDiagnostic: MN2PR18MB3406:
X-Microsoft-Antispam-PRVS: <MN2PR18MB3406ED83B095E32E426138DCD6D00@MN2PR18MB3406.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB2416.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(6666004)(31686004)(6486002)(2906002)(52116002)(316002)(16576012)(956004)(110136005)(2616005)(16526019)(6706004)(26005)(186003)(5660300002)(4744005)(86362001)(478600001)(81156014)(36756003)(8936002)(66476007)(8676002)(31696002)(66946007)(66556008)(78286006);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoqfAzU7xaYNAt4BsiHbyHjcO2VRv9XzMYt9Kw/8ButyAd2GolR6dQzc02+pMTdpU/sIDAkM/OdsQVnLLnC5+udRtSgE+fiLFWnTEpedHEsnHvYBK1gqcwKCILcgrbI5BF+wFJ07aAxgB+CyA+QC/dCFMOqbbXIOTRmHxtWN+qBwd+qTAs2veXZMmjw+kgTPrdVmnTqMjkJoH/+jN0LXURm03tQMDJO3OpboPxoVzboaX9bK2HHnpH1B3YUTQWGYLCLLjjNM1AvxWh6KV7jihveIJKnNaBK8a2CGFk0uiSQovo0SZU0qZsQPzVGPCjW5x6iNjuSUcZ55dGN45IP8rsTEjHOgCsjgKOIzNC4qucjGZfCwIK/PR3f0yjuaZELIMdnkuh5d7j0LfMaaELkZYtzFWL4hqh/8neKpttzIPSmg5704MrhJ/C65AAHLTufDnX8oBgetk7B3ylPUs4B2uB9bsykmM7WHS1PX40VAsgioEcQChxmMZcnB/FN035OL/UGcN+C8GUm7mcFhQ+3WHwfPYvthnWEw9v3npt4IB68=
X-MS-Exchange-AntiSpam-MessageData: VSfugazuTg0IbMQ8rZnlJVr1izXVXL6zxi+IWz6y0Fk5lmH4iEGCdz9OeNQYA0satBaZTjunVR2fzO1HkaRkwGyTy2BqZ2k8wCvlK7yfN9QcoiD/QqCY4nUUEXHIztR2k4vGFmeA/ywK+rc17itxnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b671590-7242-4853-daba-08d7e80ec170
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 05:17:17.2217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUsmhQq0C7Bc8H+LMoNpNYHCKiIE1AD3GFHPczUZa6GzJbhrvkfJDQTIr5A6zeF/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3406
X-OriginatorOrg: suse.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020/4/23 上午5:29, David Sterba wrote:
> On Tue, Apr 21, 2020 at 10:25:20AM +1000, Stephen Rothwell wrote:
>> After merging the btrfs tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
> 
>> Caused by commit
>>
>>   8d80a063d508 ("btrfs: move on-disk structure definitions to btrfs_tree.h")
>>
>> They should probably all be __u8 ...
>>
>> I have applied the following patch for today.
> 
> I've removed the patch from the for-next branch.
> 
BTW, do I need to update the patch, or just move btrfs_tree.h to fs/btrfs?

Thanks,
Qu
