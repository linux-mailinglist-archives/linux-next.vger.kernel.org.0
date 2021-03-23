Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7D6345796
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 06:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhCWF5I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 01:57:08 -0400
Received: from mail-bn7nam10on2056.outbound.protection.outlook.com ([40.107.92.56]:60833
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229452AbhCWF4k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 01:56:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7HluNCyF2MPQjGgrjgGDTpmEG7BCMn0a4/0qTroKj4Uac2oynDprE8jKA0A0OucSV4HR0N/yBxwWtmlogLf1xNGs+77BA5HUaXK0bQEgo/xNY6Q4jW6xrIaDQFtDBngMLYhhXK29AfPqStXFlJT8uxaIfS69ZdcTgm5FiZZDUsOIY+W20zUfVUgzm7VgAhsXFsnb95qOyZQXRic9lWylAaW/2FpdDlRhKbbiZ8U/KCohkHRcF6z8mMLmgzRZ7H/zsiYB3ZxUA+iVF5ctXWjB2Zx7AspiQJra3Zd9aTTCNtBzsyC2CPa4kbDz2O2bg7/rjcFcDkjKfpkXCcWN2NV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sbV7LL6/MR2j6zF2Z3OdCSPyDn+NzcUDmG7k+j6lQ8=;
 b=eG8nd3L3/rxM0+MC7V4HyhEp+NeOr04+ikfcq1KCI3WjxO26jt5USFphml5bel0mhg3GoMQZF9rnfg2guWio/RHmaqaOQdRSIJh0QuZFP8hAwXo7lffSR58UsI/hfUVgvKMXM9kqq9M1qrtrBOJovTMgR7aRLZDXDMJk+q7BTogrtasMNDn3hqBsXByDOjg8Ck6ey5GTPm/j2gsmuzQEjYH6NR3zELdOUkzypL/+Fc/Fh4ymxxDfOT1swBdUy6YXXHjfyf5+2Czfqz+sF7r5K9vA6jXCw0YgSZl/zKrjmt613stlCeIX9PCHRr0zjz6RtJfI7U7v1NG6kSYDl9NwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sbV7LL6/MR2j6zF2Z3OdCSPyDn+NzcUDmG7k+j6lQ8=;
 b=uIOFSERFL1Kl/gvKaXnHHpoaYTCq0ciPKsMfnSh0TXkZ49NyGPVV11Zu5fPWag0kuANpdVK4K1/FSkzwE/kgaPPHzVG744BaPG3C23hIpdd098+rpVk950jt62ju/WNtoZuom7QjTu92ISaaqPIhBz9ZhMml5+Cywm5UBBC0NoU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW3PR12MB4395.namprd12.prod.outlook.com
 (2603:10b6:303:5c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 05:56:38 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e%11]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 05:56:38 +0000
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210323164356.2cbcfef4@canb.auug.org.au>
From:   "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <8fbabc52-b913-e6a7-d2ce-58e63380eebe@amd.com>
Date:   Tue, 23 Mar 2021 11:43:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210323164356.2cbcfef4@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BM1PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::34) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by BM1PR01CA0140.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 05:56:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 974dfbf9-7cf7-44a2-f49f-08d8edc06c10
X-MS-TrafficTypeDiagnostic: MW3PR12MB4395:
X-Microsoft-Antispam-PRVS: <MW3PR12MB43954F1E329627B473AFE31297649@MW3PR12MB4395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:17;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9WIe8O+LMUzsX6V2r1DmMfUNpW0dcI35KTyk3H8wVn8yRN0XfVy8l094/AJDiWMMw76CvkDbcW1sC6VvZvZCn+/XeXezSO6uvg0wUvsFBVI+FrHE+FAToj8HwmUQdh/2THxpqZLOGtuZ+qU3Bs3GEbzz/XBROwKpy4t5Rml0L9e+ZcqAnNJxfScmRGUn5kpsxz5vdy+wtwcdyaoYD/Ax3pYBuU3D+7mVGuKZixGbhwyLexDQCAjUNfsHys8DQF+75twESpnNcl2YpKIBGP8bv3R88iSJGsNkMFAXLupRxyhwrrabwm4s8asiyMEZS3FwNNtpuLIEC7G9/sVzc4rSqS4TC5pZKA31C3O2cJLUCnqSNKCkI0tY3lY+2dw06BiYQpYpxE92N+HA+cOsUb3R6Rp0CclXCdiVzevQ11aPahDWotONcuplnjC/XJAx/0RUTl2b7xo4Oz9ypSLnTlWVXJKrpTTO6pm+iAhK2azkLPxKim4yeuLz4tuAVLI/famBOLyUf1ti4CsjU0yVPxCndlV/BiE0mRl7GQ/jj3SVkEFkXVfD76TsEcXAgGje119eT5xZEa8AO7ckoIF6ipOVcc2uYnfv2FLZRdncMUBkV7Fa2OCWD2A1QQI6XWVtj1hK7maQH8oUkxAf5MC8j4gJZ2rC2abSnyMphetUs17h7vg5/UuIXgqfmJs8x5lL9fYzgBOZ54pY1anAFYDyvcLPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1201MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(66556008)(66476007)(110136005)(31686004)(478600001)(2616005)(86362001)(31696002)(186003)(316002)(5660300002)(8936002)(38100700001)(54906003)(66946007)(16576012)(4326008)(956004)(16526019)(36756003)(8676002)(26005)(53546011)(4744005)(6486002)(52116002)(2906002)(6666004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?rMViPXwaoMngfoVdBnVlN6TEBBYrIlxwOFZz866PapFHwfFf0iLp5IfQ?=
 =?Windows-1252?Q?rt6hvinLMMTLVVcZ35ab78nEb0/WeYnaEFIC9QOmBuQX0TW1BF+1D1nJ?=
 =?Windows-1252?Q?swfWCb5KTRXd1JxZvAPHN0iG01CiBfTr10hv2Bt8iWiHCGVP0z6HIUyw?=
 =?Windows-1252?Q?xYypepyLV7kZsv5RqyWr11i+lDVNcz1VqncLq4v/aJXo51Ve0XAghHn3?=
 =?Windows-1252?Q?FIuw4hr/kXYdzg1S84LFXQVlfa87vgn7B33SeciG4KYTUjllyEbXWLaE?=
 =?Windows-1252?Q?nOMicRVawzUtJI5kir0FSb2G1hznuORypfKXP6ezrga9HxAX08ZQZ2Ky?=
 =?Windows-1252?Q?O6NQUPjnfHllUrYP8GoXNppfZyceyCS36NH+dANooCTFQ448TCbQWKFu?=
 =?Windows-1252?Q?jV1sfZ0EcTgksbgzhul6Af/b9OtFLGREh3z4XFRBIVOeQQpyvhN/5h+H?=
 =?Windows-1252?Q?t/MI1cJZG5jZBd5wKdacOF8LVtdJFdo7ndL8D+0uAodZAdodRM3bwHpn?=
 =?Windows-1252?Q?KjjtEvgfe9317JNRc1Cnvgtjpq5RdTWkysB1G9Ol+bc1cvEAW2SKFpSp?=
 =?Windows-1252?Q?IUdz2YaFT6q8lSriNxaV+AmvqnjZd54dsGGf3Ift0n6gCSASrhfGbbuX?=
 =?Windows-1252?Q?a0JpbKxtSoZcSt/bYvFkYLwwq5dXL5F0qL+hoPZCXnvt03MbTbifT42h?=
 =?Windows-1252?Q?4i9O/Thg0MzQtvJt/CZpSfU0nT3Vgi3Jz2IJq2C7cgbFJqXItjfGm1I+?=
 =?Windows-1252?Q?PXufNf+nGWO7C6KaEhZECoOHHMMkO5endh3tVOHIVi/q6Nj5M3yOQCBj?=
 =?Windows-1252?Q?IFJ518XnPW4FpwaGGi7jrf8SjnwHdQu72sl16dbwCOa7ikMAu4o9wT1V?=
 =?Windows-1252?Q?Z7nL//YyZ9/fg1kHvkJcT1stDlY08CMMBL/MHBHhlV+yOWbSR1IauiNF?=
 =?Windows-1252?Q?CFbgzXlGKEJpzfT4QMqBBjCUbKGL99KCZnF/+Unb0fvoqizjg8ohTX1r?=
 =?Windows-1252?Q?h+TvmQkL4SeFyh3VWdhftjOGmPDSeBQqv17PPf46sz5zX9iqhJY7+H4O?=
 =?Windows-1252?Q?AdUu8XOOH+gPwLI3CP3d08qjnxS+BzsXEa0iMzgAzotPGJseQt14tZl8?=
 =?Windows-1252?Q?aIs8+dXh6Jz3LaUx2soUOProrQl9MmNN4Kk/yPh3vuBLM+gThRUV2WzV?=
 =?Windows-1252?Q?EJ7JwKiyHU3/UPjnCv2QHXTzgWhrKxTm1N9hBuOrKmtI9Kl03hH83KIa?=
 =?Windows-1252?Q?IVi5IdQJrgiiWKy2pJrb1mgowGXESqe8ZyHPBs6tPqiYCEVcD7qtJyK+?=
 =?Windows-1252?Q?VlaCHwyY0UexFOtsoevvCwSNIDbWuoHWx6dKSegpbIqhvk7C299/BqDY?=
 =?Windows-1252?Q?KOACzLzJHKDRFyu6A66PRPqHJ04cdhbWLfLSWszDJAUqoNGI35TdKWfK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974dfbf9-7cf7-44a2-f49f-08d8edc06c10
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 05:56:38.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVRjfRux2y2oQ9l39DsWghXmAzBan2h3zgr2dr/Cfx2+2o0ESPXqVv3LhduMW32zdtPG0nBLODPOYhJOYIiuWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 3/23/21 11:13 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> sound/soc/amd/acp-da7219-max98357a.c:684:28: warning: 'cz_rt5682_card' defined but not used [-Wunused-variable]
>    684 | static struct snd_soc_card cz_rt5682_card = {
>        |                            ^~~~~~~~~~~~~~
> sound/soc/amd/acp-da7219-max98357a.c:671:28: warning: 'cz_card' defined but not used [-Wunused-variable]
>    671 | static struct snd_soc_card cz_card = {
>        |                            ^~~~~~~
> 
> Introduced by commit
> 
>    7e71b48f9e27 ("ASoC: amd: Add support for RT5682 codec in machine driver")
> 

Will add ACPI dependency in Kconfig and submit the supplement patch.
