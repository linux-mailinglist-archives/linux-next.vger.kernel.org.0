Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC754390A7
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 09:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhJYIA0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 04:00:26 -0400
Received: from mail-dm6nam10on2042.outbound.protection.outlook.com ([40.107.93.42]:6635
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229498AbhJYIA0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 04:00:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN8GWtl4zHopEPfCTSbLrtgj3p3n/98W3/yncVoDgtVu/qTEMHTmkX9jpCQFS3TLhjqEumjavuRtViYklKGTN79eKVOHxK41iS4Evrx+AgVCAZ9jS9r9kLCSLoiEe59yrTsYjHwpd5zQo43rBVW4HZpNVPZub6rWwg66cJek3j7lIM4sQhepHclkqyFDUDXYtPjL5VPBojLbONTjh1WfpsPTAbO7bv3M3gRETVW+Y3cGzWRD6yvYTFwKk1I679BQASDmae/fBVvI9dtK5rZAZq/MntMR5aGvfRsX9/Y1xJJmovjBE8tnYczpKrfhrMQ9EwZ4wLAN0D4WE9K7sYuSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moCF78UXa6hg04/lVy73abzTvCYi7vVeWKIm+FEN1vI=;
 b=YI4UHh+I0GfRJTyNLev494t9HADQDJuyZyUAAp3ynB6+jeTPeMYp3QG5k36i5cKu2g+iXjON0I+2h5OpayhopMb/IVMZx5RspipdPTKWCFz/0OD3S4AQDMYLS9llc6GnRGpo5e/FnX9DRXngTD5t7vkWZB51Ktw2ZtMYecISZyii22ljGLnvX5avt1V855tsFhVvCoaeSxik2sH5g6iPS7t9sKLViM/HQs+EcspALvamdLhtF8CjrRu1YHAPrOvTOUTuo+KIjmb1ebqz2KiuM5XjuvvwmBPJz5jbOMPjIkbnt3sQb40BqYiUnEl0ayUgHkEMc6+baOhf2olCPVOZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moCF78UXa6hg04/lVy73abzTvCYi7vVeWKIm+FEN1vI=;
 b=cQPDkOrozJtkehsfNiD9Lustgl/tPK0RHGLUSRsWk6HV9mwUqOMDMyMY90enQa4rrUycZcCs8943il27SzL/39nyoOpi/sTFe0H6A6GgPZayyJUvCquolpjPmNidCx8NuFJxuF05iTgDG4xzRjy+rV4m8+SedMwD58/aEY79jac=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 DM6PR12MB4894.namprd12.prod.outlook.com (2603:10b6:5:209::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Mon, 25 Oct 2021 07:58:03 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2%4]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 07:58:03 +0000
Message-ID: <9085bf61-9b97-75a1-60c6-6818b28dee48@amd.com>
Date:   Mon, 25 Oct 2021 13:27:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211025131302.5c5757fb@canb.auug.org.au>
From:   Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <20211025131302.5c5757fb@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::30) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
Received: from [10.252.92.171] (165.204.159.242) by PN1PR01CA0090.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 07:57:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4efc8ae-db75-4795-2292-08d9978d2b53
X-MS-TrafficTypeDiagnostic: DM6PR12MB4894:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4894BB852FBC6DD515CB4BA982839@DM6PR12MB4894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoWZNExfpyW3nv5uU1DEu+4lPR/Ol5ZByQT7njJfKzrSQ5ZJN/TzJtNBtoO+4A3a6WEsZDHLJKuSwuGkjJrrK5e6GGuspMS+66JswUfVRY/Uqqv2yI8vEyv2+cBN8w98bJHFaq2yNgEg0sLe6DGUk0BtwK2N5MLcsgd+RfZFMLciJRdj2MdvNaYtLJNIEGQkkLCVl8/2StmdEvZXU8U1jzoP6F12R7m2LArERJYuDomXwGQGBJt9Uo2Q5DaDvOEjlh+7VmpQPDsOkFmTjQKC1/kaXq/2Bgerol983p2RXA2WwkdXuR2U1XbyV/E2qUY1mfeypqrwmMl7R0i8mjuF1Rj2+7HyxNEpbSXiheypSRZSyCyAmV3ij85YZxezztDIkMq5JVuIjyNI5sIdiW25d34ZD05XES85Mztk7KkdJhdcAhw+OzQCdcCsjuG7fIt7RWZqIrz4GCLTgBny01vEz2cAof5M+DkXSmbJqqX3uuCzdjbJKAzqNabfHUfSqSWFFJa8BUZq6tKdqd44ZqDKdcEFaz7/a5/ESPKajQhsjk3DsnfBbax76M8QpZf/fvWq5bSzslUJLpghlOLocOZA8cYC3Lfsn8CZJ5v8mTdv65ev7xLi76CaX/Jo4fQ7fIg9NV1+7DChqOxwChS0Dd+4NPc41vBxEEI9NdrLzk9ajg20MVNFcQ3l76cIPF8u05xvf94GDvV6Iq7reZVZD02IplnpM2a4xsaoIHE+nlaMFGCj5xqzpWit/dDNyLOjA6Ken7NlMGnamEOeofs2bk8Q3F3zMBScn/9vOwx/smPUqIhme5YbuckhFyZy5IEqHubF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3627.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(186003)(53546011)(6486002)(26005)(5660300002)(4744005)(8676002)(966005)(8936002)(66946007)(66476007)(66556008)(2616005)(956004)(38100700002)(36756003)(86362001)(31696002)(110136005)(4326008)(31686004)(316002)(16576012)(54906003)(6666004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3dmNW5WSjNQS1pMSXQ2bmN3OGRuWG83VWViZVptcXMwMzQzc3JXQ2F5NVEv?=
 =?utf-8?B?dElZOGZPNUo5bG1DNHUxMEJuQkNNSEtIak5ZYjNDMkdiK2xQcXRjYkdRWnQ4?=
 =?utf-8?B?cW5odUZxV29kcHVsK3grVXlRNmc2THRRdkRFK0FNMm4yek9ZcVRCaDV5U3g2?=
 =?utf-8?B?SlphOExneWxOUGVzMmJ1akNXcmN0QzVZbmJWTjlxT3R6bVNNTkczeXdzOXhr?=
 =?utf-8?B?RGJxWlpNSEFKWUd4SUUxYisvQklQVnk1akR0YWVDR3RPd25jay9uMmhsdDky?=
 =?utf-8?B?T2VvVk5manNHWXkwUG8rQmI0OHpLYzMweFJYYVFWR2FWc3FnTUl0bERoNm9Q?=
 =?utf-8?B?V3R1dThqZSt3K0dTUlN5anhKb01CdmRaaVUvd3lJbmwrYjBPMGtpUTdFR1lu?=
 =?utf-8?B?Y09MQ1lWeUZ6QWhDdGk1VTdjUGdXTVQxb3daWlZ5YTd2Ry9yVWdCOGZzSDkr?=
 =?utf-8?B?Qm53Yy9JVEJ5M1RWakc4NW4rSDIvNU1UVytFWXpHVi9PblpqWlI4L1QyOXZM?=
 =?utf-8?B?Q3J4YTBNNzVMc2cyWnNiQVJsMk5ocWRxbDJuSUt1SVlmV0lwUmM3ekM5T2xn?=
 =?utf-8?B?eUlxRjBLeVg3TDJvZzZpQWlMWHN5eURwS2liSUtXb1F0aXJXM1lDNlRWaXZq?=
 =?utf-8?B?MHdiWU5lSGJqWS92OVI0bWFSODZLZHFxSnM0MSs1QnAzZmdDaXFsU1F4cjg4?=
 =?utf-8?B?R3VqMWdxYlh4UEFiZlV2SjFJdzRrcXFHaXRxRzRsb1F0bFdZYTVzeUZnazRU?=
 =?utf-8?B?NFRpTjVRS1YraDMvYUM1SS9pZFFXNUVrOWk3TUVYTWpRVm5WNEFqWGhCN2o4?=
 =?utf-8?B?RFhsMVdzbWdxeFp1Z3J4U3hwL2cvUWNMZXA0Lzg5SjgwV1Q4Y3FDZ3AwSUdG?=
 =?utf-8?B?NGdrcTZjM3hCN0FZYlJyT2JieS93ZEFROHJhSnFIVXk5MHlaZUhDbS9qbUlw?=
 =?utf-8?B?Ujc4c0tINXUybHN1Qkh0Vk45a3h0cVMzZks5UUZSR1Y4b212Q29ZdWUzU3I3?=
 =?utf-8?B?azZ1MzAyMm54b3dqVkRHeDl3QXdxdnYyVm4relg2V0ptdmlXei9kald5aEJJ?=
 =?utf-8?B?WVZUUkp5YVZrT2xGSGJDN3lTYzYvY3VaVVRRQS9FcUNJd3JXTWJVaEx5YzFv?=
 =?utf-8?B?V2JOa0daV0IzWTNUZktFMXdwR2Fzd3dXZktzcjh4N1JEdXZzNVQ2YmNvOUR4?=
 =?utf-8?B?emEvY2o5N2k0RlRQampidkYrRVBIS2pBZmMxUXVKOGVQSnBxSExSclE1cDNw?=
 =?utf-8?B?a20vWU5LcHZ6S3FzbHNhVXdGb3R4M3FPRHFuNEtERWtiM1dvY2dtOGRUd0Mw?=
 =?utf-8?B?SFJpcWk3WVk4U3RJSVJlQnIyWE9iMlBYOVNNRi9yUGZrZU85QmsrbFkvbDVX?=
 =?utf-8?B?cTI0cGVqSkR5YVFFcnBJWUdYVGZjQWZRelFqaGRpbURPYjRHY0UvZXNUS0xm?=
 =?utf-8?B?eFZyYUI3TFdKQ1RsVHlWQzArc1E4L21Dclp1dUdwVm50YWdUc1EzN2g1SlFs?=
 =?utf-8?B?V3c2djZkeTVQL2xBSXkxY2srcGtnRXpBNlRORFhGRzBqakE1VnhMcW0yNW9l?=
 =?utf-8?B?b1QzazE4R2gvVFJDQmM4cGVwVjlFT0p5U1dSYzcyaW0rOWxlZVdibnBPMDhW?=
 =?utf-8?B?QmxEN1gvS1UrSkdhYm5SOHRCT013TlJkYkp6SFQ0aGdFRis1cUVFTWRqbUVO?=
 =?utf-8?B?N3k2L29Ha2hFczE2dVZGaEpqdDdkVXp4cHpxQk8yZytvZ0sxVE9rRHZ2YW5T?=
 =?utf-8?B?aHZ1YmdCVGxNbE1nNnNwSldYdGNLdU1DZy9TU0tGYXV0YjFRcTNVQWFzUkVo?=
 =?utf-8?B?bC9MNVczbDhkbUJlMzVwZlJrdW9kb0wwMHpMYXRNWkhxRXpUZmVoQmtkZzhp?=
 =?utf-8?B?N2lpZTA3ckNQQ2xrR3F2UFhlc0ltSWlLSmtIYkVUM1V0MUtDTERFVk1GdVlz?=
 =?utf-8?B?ZjFUcTY3ZjNtdXpYWWNqdVQ1VUdmL0VhYjdqb2pZcVNIWHRUZDVvNXhQLzBx?=
 =?utf-8?B?Z3RZSk1yOGJFV0JSbW96UElRL2Qwdk43NVRpa0JZRlcrTDZwc01scFVYVkRJ?=
 =?utf-8?B?c2hVNC9PckVSWGhYRnFlWWlHa1hnM0dYOFlCRDAyWkxqQU83RzhsOGtyNWVY?=
 =?utf-8?B?RVExamo3Z1FVbGJ2Uml2T0ZVcTM0RkFEWEZuTDZ6N2RoMDN4WkhNa1R0WWYz?=
 =?utf-8?Q?y6XvdPNk5iOq/lBS9sItqAI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4efc8ae-db75-4795-2292-08d9978d2b53
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 07:58:02.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WGVAE0Uh2Nz5cegsnvNhn+b6EI1KrCboiT/VzAvPX4zKCWNxFho/Yn2gjK0ln7HegjM6XXbdCQ2ZDqNlF6DWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4894
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Apologies this seems to be missed, i've pushed a quick fix at

https://patchwork.kernel.org/project/alsa-devel/patch/20211025074808.471333-1-AjitKumar.Pandey@amd.com/

@Mark , please pick this one into asoc tree to fix build issue. 
Apologies for inconvenience

Thanks & Regards
Ajit

On 10/25/2021 7:43 AM, Stephen Rothwell wrote:
> [CAUTION: External Email]
> 
