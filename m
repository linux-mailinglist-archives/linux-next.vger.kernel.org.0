Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F741BB59C
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 07:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgD1FCb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 01:02:31 -0400
Received: from mail-eopbgr680070.outbound.protection.outlook.com ([40.107.68.70]:45999
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725792AbgD1FCb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 01:02:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGfN0l0QAkzqXrpzOKfu6Nkr+gQFWYng/M/BqFnHRgv26BfJ2sDoRBpDH+WklJiElg+dOBy1Q0lzlSM/W4078gaiwbMR8Z1wZ8r1SSv0PHWiDrmIGgHmdt5FHpsehnaekKGBw+7QcjY9Hp3cIpxX1e+k/3Eqak2Cx+/3x2qgXXeH7ECgrvgTZ1wa0u3wxKuxs5B/cr6Szm+XaqwfMHz4Nb/2wx2yO2CDQHGrLRl4caHaW4IUM3HNOUel26XZH15aZoFXNb/r50mpHRaCoqSwzPX+29uVemgbGSsDB7BSmAM5Hwp669bqGTNaE1ydQdKCT/+lqoiVtR7kSjlnFfjDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+at1g2m0VyXyxoV2WTS0ruWiKOsJ10Y+70e8usDpz0=;
 b=FT0Z4LZUQ2ZRhcjMD3dsdHzOSUqsdgK6OYorOHH9LT1SzkkZ11bTLnLIk0++7wsvGnIw2cjscUSWNFS8PmhEqJ+2wrInaRZZXSFAFJArIC7U29OV0LYknqfR6GaHjcRxGkXvDZ3eXr6Js8ccnxkuojRwoBbTpi+AsQolBZTer050a6sFgx9zInwYKeBMYSq4XTCEnLqmpQbnBKKTKXmP1rXxxbUntAMs+uTrzpb/eS2XXc8+MojjE0//efZeXmgjCz7sxf9NrNoMNpRCiVVQtNnZ30M44OPaPvQMOoTv2qjmoTkOeISGiezr/31WfQA4H3etm6IsKoNvZ2rwxn7AJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+at1g2m0VyXyxoV2WTS0ruWiKOsJ10Y+70e8usDpz0=;
 b=IHFQ/LXIRLw3zBVYqBHhEr3hNvNQw6kKnwZVGoFn3UznYGQXpGJFuajM5H8jdEdoi++GhPTcrItN9HnHnxmGlXpXx77Y6EWQ26DeW8aZVY1eU8q2Ra9gZreQLIttQmX6xkVVKZUEvWj4Z2c5Zn925k9mpNhQXlLXN9gMslUHUn4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sanju.Mehta@amd.com; 
Received: from DM6PR12MB3420.namprd12.prod.outlook.com (2603:10b6:5:3a::27) by
 DM6PR12MB3499.namprd12.prod.outlook.com (2603:10b6:5:11e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.22; Tue, 28 Apr 2020 05:02:28 +0000
Received: from DM6PR12MB3420.namprd12.prod.outlook.com
 ([fe80::7545:386:8328:18a0]) by DM6PR12MB3420.namprd12.prod.outlook.com
 ([fe80::7545:386:8328:18a0%6]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 05:02:28 +0000
Subject: Re: linux-next: build warning after merge of the spi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
References: <20200428141611.0ed0969a@canb.auug.org.au>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <2b6a132c-8659-d2ed-917e-09aef47aeac3@amd.com>
Date:   Tue, 28 Apr 2020 10:31:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200428141611.0ed0969a@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::29) To DM6PR12MB3420.namprd12.prod.outlook.com
 (2603:10b6:5:3a::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.32.32] (165.204.159.242) by BM1PR01CA0135.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Tue, 28 Apr 2020 05:02:25 +0000
X-Originating-IP: [165.204.159.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94dc526d-27c0-4e2c-813a-08d7eb315908
X-MS-TrafficTypeDiagnostic: DM6PR12MB3499:|DM6PR12MB3499:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3499C19C3573C71C73868891E5AC0@DM6PR12MB3499.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0387D64A71
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3420.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(110136005)(66556008)(5660300002)(26005)(478600001)(66476007)(53546011)(956004)(31696002)(6486002)(16576012)(81156014)(54906003)(8936002)(316002)(2616005)(186003)(8676002)(52116002)(2906002)(558084003)(36756003)(31686004)(16526019)(4326008)(66946007)(6666004);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ULYFiRnWjsz9CAYbeFpx3rhN3F1AsKmVBTI+++10gMANhk1uCpHmUDvG9ovSN5dmbU/h4NU/tHSYfqUh+SMDKHUVYC/Ya+4boK6qpcgUQ03ZqulzHI2lgoWG8x/PN1SIFWTqwCICLS82uEZigp2rjN8YZG3y+8Isa03EvocbejQq1j9yynVbyHbQMu2u7yglBpitPXY0q+HT4LClTrZSgPPCROt24LoE1iCV5hS2+6Lb+ijokTiVj32+cJxZEzN574uA1y7KEx874iGzmYEW3XpHDxrZdveyjsu6AMT4Ko+Iz6EXM6o7Wp4RdFbl8bzCAB4rRrVWrgrE44X2iSeOJFQCDCvxhhbGQdNSY1c8ORq2yL7p68BnIIVZpLLuNjgnRWjwxpLHzigPU0MsYsBhq3diFRl+45MhvDql6iy3MoRB5deaUI99OT/bKQ+vF6t
X-MS-Exchange-AntiSpam-MessageData: WO8wm8AnBA+eST0P2uXLLrSIQTV+9BKeQc1lTqyv+kNA3S1sHxPgUgT5fGLSCkwHSozzgMl0E9YzFqwIw27qziZ5j1BxUlHECc8Z4w0Pob7wf1LRp6iR71FZYjc6iDn0uRq3dG4s2A5F3ZfWxc/fUeYUb5MyfLGT/dU9MkkTCPVPr/rJp9XgGnL59jdGvDCeYAyovNLrADoyzv4GhYUh7gV4QCYgB1oAavs6gFTL0+tVttXEPwBeqDdzoxpCg23hYiN6VcT+EeP+aZW4+HfMhT94RY99B+XJ+/g8+MpOzjk83+qE/HrFyP6gyisAYaoct3RowU5IP6fIg3T//38/cKvCVKExNL/Wj70QzLgaEBIkOHnVV/+i62XaTAqZ71rzJooXOPgHv6lV35S+d1k/VAccryB0FFCx2fBoXIQFhtEY0/xHsfHDESukfQygvI5zm/5MJGgN4375ic3bpfue0gjhh0MsXJ8FaBK+QWIyYvUIpsKpt5TH5xlAoFYS1RTXuQEeZq3YnZRHiABculoanqF7dh2+EzEnv42ImGXE1fD/dG8Vpby6j/sKXHvibr2BPGW/9Ky0Il/3Vx1IMpoT/zNyFy/Ei4dfhS3DwJfeqscJHNR7IUv+xp1kFbrFKyMpd/zm/2jdYmYcnif2PrBWSo26Hfc/eODQPuB2AabqNuJvDsHoBjYJVfXKSwXbzkCfFuC9ftKhzuYXSSPegYMRJaMmaXpLzpbNs+n3ndQJYO6o9iBs5ibDkwnMUIGcKdQh5NSGEJa538YHFh42YxDnvdccCgAdUK1mYzjLCUEnJ2jYTFHxYjPlZpkhGTH2L9Gt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94dc526d-27c0-4e2c-813a-08d7eb315908
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 05:02:28.0476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSDjL2tdJvxUeWw3ZjOCU8d1bbl8eQUCVwKcZOqkbruLqaFf+/xgVW4Zab96ykhbGXReo15T70BvQklORsXtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3499
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I have just sent a fixup patch for this. Could it still reach 5.8?

Thanks & regards
Sanjay Mehta

On 4/28/2020 9:46 AM, Stephen Rothwell wrote:
> [CAUTION: External Email]
> 
