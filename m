Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC4142645D
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 07:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhJHF6j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 01:58:39 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:58380 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229548AbhJHF6i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 01:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1633672602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O1psWbP00szwD7uxqx+7LtwHgxCLLXJaIkKgqmDE44A=;
        b=UXosj8XGUWcRQulrkhFFinsJAoSq/ywS4e/HPBsxSbK91TEdmE6iwWINJFzpk/F7n76Cbv
        SFwyNFpRDV0pXUHOl3b/sSZpaonZsYBNcrQnkVEF8eRuhFubnoW8suAcGPlA9zNj2I5LP9
        DQsGGVz7Ttevhh7gmZDloz857k5uD2M=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-xNV-E15CNtS6WwxHHvsJlg-1; Fri, 08 Oct 2021 07:56:41 +0200
X-MC-Unique: xNV-E15CNtS6WwxHHvsJlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5JRHDyZa+tcOsu5OcRTzYLFXwz10osk+QI41qsIHRBclM/WhZwksMLeTDEhFgCGmqxjVXNOGPB6uspvP0tie1GHbpsdRojdE7i5HgRhd6q63NitBMJkPOZaqqDYSJA8gSGo5bzFlrriNp01vS/5cueYCJHP39I8SrGI0qNhFjK4ViL6oNPHETWOqOUb1Shvgcg/5c1V2cJfWAn2Qf9QmCC3izU0Z/3pPPKCCp/xdcVGFQAjtOkkHnO2HdJUzWPHWS3PerU2lIXBdrJk59aWIHEik1O/tQ+ejS8B05rhoMSUzINFYHmzyTHiifZ+jWp2tdWiaWjdoOqST0zbIGdTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1psWbP00szwD7uxqx+7LtwHgxCLLXJaIkKgqmDE44A=;
 b=TQvH9HVcW2Z36WzxaDHGE30p8gMaCahdoz5gyY/ISCKpK4drU8pnONWPmvHn1Ct6ntN4qim3hLK0VR7JSlPUL84QBhjKc4B2s+j+GksnFkiFoojo8K0P8OeQZ5QDHoUe2sYJInsK5zidL4/6E3WmKcgIxRqmj1T+LT89VjCfSZaqZ6oulLn7nbtwj2MS/2E1ccpJRholyI1Qd9mvhH+waRvHUUSBewUex/Lt7aVFu8iHZvAK7CVHAnGUH64d0eh8kqmVAtWTLqOMSYpGU1unO+vTbKrebPWmlBUPxgQjwF98Lw1ZwMD3M9qw62/ZMwlz/WT3nzT+CCzfscCGR/n5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=suse.com;
Received: from AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22)
 by AM6PR04MB4901.eurprd04.prod.outlook.com (2603:10a6:20b:1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 8 Oct
 2021 05:56:40 +0000
Received: from AM7PR04MB6821.eurprd04.prod.outlook.com
 ([fe80::2d84:325b:5918:7a19]) by AM7PR04MB6821.eurprd04.prod.outlook.com
 ([fe80::2d84:325b:5918:7a19%5]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 05:56:39 +0000
Message-ID: <561f21f4-9b85-8f1e-2f5a-957c1d888c11@suse.com>
Date:   Fri, 8 Oct 2021 13:56:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: linux-next: build failure after merge of the btrfs tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211008150346.557cf8aa@canb.auug.org.au>
From:   Qu Wenruo <wqu@suse.com>
In-Reply-To: <20211008150346.557cf8aa@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0052.namprd17.prod.outlook.com
 (2603:10b6:a03:167::29) To AM7PR04MB6821.eurprd04.prod.outlook.com
 (2603:10a6:20b:105::22)
MIME-Version: 1.0
Received: from [0.0.0.0] (149.28.201.231) by BY5PR17CA0052.namprd17.prod.outlook.com (2603:10b6:a03:167::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 05:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0ff8908-79da-49a0-aa07-08d98a206570
X-MS-TrafficTypeDiagnostic: AM6PR04MB4901:
X-Microsoft-Antispam-PRVS: <AM6PR04MB49016A805D2FE12F2CC90312D6B29@AM6PR04MB4901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLbQMl7itb30MnBjxD28sOzCEbuXNjtSQvFO+ihLB2u/tI7GGuGAKuvLeFZQz3aBsZOOYDnJSG9twQR0nYhvHePcg8V3bsmP0DPfHVA6aumI7G23UDsec0U3MnR9WP/6msScCpaxgEGa29c1yNe6YfBHw0Bccrac3flQCVPVEB/aMp2Di4Ar6q7iNGWHVZhiHBRfgPriWhQVrAuTl/rGF+dgCIDoDkUq1/qqDUJMc3ZnrPHrzsaW5fNOzRNe7wosR3D1lWwm82urIJ3p84uGkgJMon6OphSx55hcV4gHDm2ZeYBu8mFTyYKlo4Zebbu+RDrldaTEp6+fSqjKIVGW+0e3XplRFHCAPuCPpMKlgXK07L+19XlAljLHDYm84+TNMq/dO85bJJGNClqzdR7dvlLzkoxDmyez4t3ygIQ+7AIScEaD30RfHW2E4eb1JVau6u35Cljcjt1HWpM5jwabhdvfQk3cQxOBYNlFzlexENg4PzHx/fgTeFySNZeM7Lfd5f+xLFgExhp88R3rI73FeuqYfcitaP0M2Zhc8gO9WXAt9nfmpiBNMo/kEekhZxpcK4x8vtbQ5GxlCttNs6X0W86Iqeo7c50mjbv30B6PuPcGAvjg6Fvhk+UnNw3nB7lhUSAbiwp7kZvM8uzb8AF4RAiuu4cp4+hve1hdy+/Csd+Q2S7tlC9GFaJQu2/HA8hQiPP9RHk91VBjYQpZZfrRcf6HLwCWjCEkg2LwO14qPF5lpiKWU3MuBiUIvKt6mHMY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB6821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(2906002)(110136005)(508600001)(31696002)(36756003)(8936002)(8676002)(316002)(16576012)(4744005)(6666004)(6706004)(956004)(53546011)(26005)(38100700002)(186003)(31686004)(86362001)(5660300002)(4326008)(2616005)(83380400001)(6486002)(66556008)(66946007)(66476007)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmRGTVZxaUpLRUhZOVhtZXBnMTZzUXBRRENhQ3FKWURRbHJteDJ3L0cyWjlB?=
 =?utf-8?B?WmU5WUhxc1Fhd1QwOHNEdGkxN1ZOL0VhQ2N1QXRHbktvUmkxZ2hyYkVUTHVN?=
 =?utf-8?B?MktsdjQ5V0pPZVRza3RMc2pvdjU3UFpDbTlTUndVcVRqM1FtVm9XZ0RqcC9i?=
 =?utf-8?B?dmcyWHh2RGd3aXdYZEtRcjVUS2ZtZHNxQmdURnRXYjVtRCtyYTQxaUhmRmkv?=
 =?utf-8?B?WXdvM25ZTTlWWEkxQmtOYW5kZ0RoeThNVElFa3crUGx5THhIelZGZWhiQ1I4?=
 =?utf-8?B?ZVNLOGpZK3RlVmV0ODN5NVRIWHVyTytKSWo2ZGNnMU9KZThhQ1hsa0VEZ3BH?=
 =?utf-8?B?SXBKbU9ZWS9IdDducnpCck01Z0xiSHNSUm1SRm05NHRuc2hDUXRTRUpCd05o?=
 =?utf-8?B?Y1VJb2ZySVNETDVHVFZiSmFnZm1NQjlDTGtEMjhGb2NvUmM5N0xZRSszTEJz?=
 =?utf-8?B?VG5ueGVZekRHN0crYm9lR2p4STNCL0p3Mmo4ZElBWGdqYmpQR2xuQzBUdStE?=
 =?utf-8?B?NXdadi80RUJwdXgybGlSM0tBRGZ5bDVqZEkra1dhbVdnQzBzeTlvUDhicTFD?=
 =?utf-8?B?TjNCd3JYN2paZUJ6NnFaeTQ5SGVvU0xrakNPcW9OK2JiWlZNTEVVRXoyVldV?=
 =?utf-8?B?dmJCcm1ERTlPN3lpNVdjblRCbWxNSTdwbUNuZ1RHcnRVblVlY2RiSHRXN29r?=
 =?utf-8?B?cjMxNi84a1hTSjBEalYrVGMwRUlBOS9BdXdwVTVSb2dTNm5JWWkyTWpvNHZ5?=
 =?utf-8?B?aUFCTnlnOWZDcFBSTS80ajNKUzNWdWMxbUJYd3VkMGpCUmFIODhXWFpVRmQ5?=
 =?utf-8?B?T0RpMHQxZWNEb21XL1liSVEvV2ZEbEcycllVcmRyM3FOTjVpNVZQVkYzbEp1?=
 =?utf-8?B?bWROQTNCTEZDMFV3dzBSbFZXRVpIdTFTZWNJSXVBWjBqa2Fxa2hHUmttYTZr?=
 =?utf-8?B?d1gwcDVuVTRMVnFXRy9kZkIrYW1IbFdZQ2YrcFg3YUQvbnlncjR3Rmt3bzVm?=
 =?utf-8?B?NUpTRTVRbTNNTDhYdDBrdjkrazlmaHJ0T0Y1bE1xdURQenFXQTNTQkJuNEs4?=
 =?utf-8?B?U3ZiTkhnVUtUQklWcmlCc0xtQkdhRVJJQXYyVGpGSnB5MlROaFFMeW5hdW5C?=
 =?utf-8?B?SDlhM2F6VGJqdHUwN2lmT1NxblNRTVd6MnFtQW43Q1A5U0Y5RTVWclc3TEZq?=
 =?utf-8?B?Y1djTWVHRCtadHlET0hjWVlva1hpb2dnZVV1WjRVZGsxTy8vNGlSSFFuMWRC?=
 =?utf-8?B?ek9oaVNNVGQvQ2ltSHBpdUFDQ1hkRXk0Q244VDhoc0RmU0FVOFJucGJ4MkpJ?=
 =?utf-8?B?RnBFcnVOem0xdU1Zb1JKSGdSNTdyV1dkaTRDSzZmQjF6cFpiV3RLZkxEdnYr?=
 =?utf-8?B?UHdmOExvVnJqMWF0WDV2TlU2YXN0SWg2Nis0M1k5ZnRvM21BbHNnQ2hFWGhG?=
 =?utf-8?B?dlNMLzBCd2JLOVF0Y3pyUFpTcnNhS1hQYldlZVdsdDVjVjllNnpFR3krWjVC?=
 =?utf-8?B?V3V6QnRHNlFSOWRGazJGVjRmeXo3T2FSMHZzdHpQajNCQnpSTTB5NnFpV0g0?=
 =?utf-8?B?Wm0vRWtUSklNZm5UbkZwZHhyVGxxcU5waFJyWTVxT21PZ3kxQjJxQWh6aEIw?=
 =?utf-8?B?djBWM0RFbjc5TmFDVWQvdEU0Y3VwUjdYMndydmh4bHFxRWVsd1Yyd0JqSUM3?=
 =?utf-8?B?QklzUFBEWk9zMmk3dS9PMWZKbklpN2V0TlhlMWNib1REbW1UZFhsZ0Z0K2ZY?=
 =?utf-8?Q?VNSzhZve8WfVJDDeIFXEzk9ZGzxv3m2idmIiFbF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ff8908-79da-49a0-aa07-08d98a206570
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB6821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 05:56:39.7534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifTbl7tv+FOkxHs1VE1NlONqvQfLzlpAPxGmEvrxTapG4IDD8VBPp7TRnJAptJy1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4901
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2021/10/8 12:03, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the btrfs tree, today's linux-next build (nds32 allyesconfig
> nds32le-gcc8) failed like this:
> 
> nds32le-linux-ld: fs/btrfs/lzo.o: in function `lzo_compress_pages':
> (.text+0x226): undefined reference to `__umoddi3'
> nds32le-linux-ld: (.text+0x22a): undefined reference to `__umoddi3'
> nds32le-linux-ld: (.text+0x660): undefined reference to `__umoddi3'
> nds32le-linux-ld: (.text+0x664): undefined reference to `__umoddi3'
> 
> Probably Caused by commit
> 
>    0078783c7089 ("btrfs: rework lzo_compress_pages() to make it subpage compatible")

Yes, that's the commit.

It's calling (u64) % (u32), causing the problem.

And we got an earlier report with a better solution by doing (u64) & 
(u32 mask - 1).

I guess the latest version is not yet pushed to -next.

Thanks,
Qu
> 
> This caused build failures in several other 32 bit architecture builds.
> 

