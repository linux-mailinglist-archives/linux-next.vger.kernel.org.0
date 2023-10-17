Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40597CCA14
	for <lists+linux-next@lfdr.de>; Tue, 17 Oct 2023 19:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbjJQRpx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Oct 2023 13:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjJQRpv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2023 13:45:51 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B6B83
        for <linux-next@vger.kernel.org>; Tue, 17 Oct 2023 10:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WytGEZW/s6LAQlBK5KgO/NY3OicgPs1bdW+XJtwfNDtoK7I5zgXG384D3lpZHtrqMExSuuG6/ywAoYcT14P1VXSx5J1QYrJjGWOyycv/OlTftq0Gu8CK0Y3id8sOA9SUVJ4ixdP1zjvrPR4U42RqWO5wZhI85nlVV2SPI6HoAcosAi/snX+Bkca7coBoIYVw0fGXodPnamvZ4PAOm6l104J5v+lXIm8yHTjxawUtm78Jdaargbwcb3zpUN5L8ltkmzn63MAnz08fG68rmZh65OsokWUR9nzGmaon9k0ZIpcqCVS39YgT1GWUrZLE9Zyif9Zcym4E9uVfktLNengoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH8YuQi0k7G73lI//SG+73G3nfy6jtFifvSl3aIcbYw=;
 b=nKsEVTGtOBC2wfGNC1ddRNgbKicN9Fhy7SEKt3uNmoZG+euwGdqLs5pA9Yah836GRw3PsEIiN1KgVKETsm7XgMtyhpD8frc2lveiqW7l00+2R6HpmpVzWAfZ8W2J1PAoEcMR9CpD1SHHd6iYqtR+doVtsr0TRmxDRXjQafbsyAeko+JyYCgMJE2Svps3o461bfPXWMI1sZg/McKmJ66Ov5fwahHZaWH7NQWKHTIKQqG1ULPPiYB4lxEQSE3JqaCqzzakGJ208zgv8CZjFt1j7nx1/1M6LJ1sBwRHGwGEcJg9mXCZIunyXbxwzN8kkkJunAUYXOjuchovLGt3mhjmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH8YuQi0k7G73lI//SG+73G3nfy6jtFifvSl3aIcbYw=;
 b=dDslYbhADPG/caF1nnD2SNFa/jOTfDClWlP7HA6wpwAehbfXFT5VKeOfZuwx7JeNBkddRPWLyDXtAZ1o5fFQ21hnv0gT/ck+4/SxwCjSwR4kcchsxlLSHDKpkSNPRJtBW0L4mvnS3OH+eZBx8qPhx4wdOwGs42VimP7hTGWl+BM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 17:45:47 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::9620:780c:562e:33a1]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::9620:780c:562e:33a1%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 17:45:46 +0000
Message-ID: <af5900a6-e3ae-4cf1-9a29-89484f411a1c@amd.com>
Date:   Tue, 17 Oct 2023 11:45:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Reduce stack size for DML2
Content-Language: en-US
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>,
        Roman Li <roman.li@amd.com>, linux-next@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
        "Mahfooz, Hamza" <hamza.mahfooz@amd.com>
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
 <20231017172231.GA2348194@dev-arch.thelio-3990X>
From:   Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20231017172231.GA2348194@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR15CA0067.namprd15.prod.outlook.com
 (2603:10b6:408:80::44) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f116a6-9456-4380-617e-08dbcf38e495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqXCt5fcwYI8CIIzIe91y6zz7TZ3AoPW4NjeyTJV6LgGZL9a0rCvZTFeeNkSPLgkuwe/R3xhLBpXtW7xCEBI6YmNaNDICOyDAIwFMlyXi34qg8cVZFFJaYsDqb1T9B/8iUQGfvFomCBc26aE0vDLSVBjFFg2TrntHzuRfv1FCVc68eLtnfOgd06aZcsSaPEVLq7S7R2q1Bi1BkXRCixdHsHJIv6gE4hhCZGvm08GkHeia6SOlyKoATVsTOtYZZ2h8Aw+wakp+VmyTe9g6LzDrR9D/eNmA/SgGTxPH682DoFXNjxjirx4Qv8ATIDjkuHFwlR+DhZBAYsAgi+2cqynl8jQTj417cJlfd+BVUWDH84A2NwzphC48SH2AHZ7ZTKV0+arUmcxp5L1qBcq2EsyhSxsYdIOlVxkl8LtaNoF5Esivhh4UDUYohxId6U21wtJANCu6z7/2Hl+cgC4IWZLPg2/Seqht+PjLks2zEhrVAq5+jpTUrmKUQIvVAZbORbNkFyPvnl6RHBfAW+fdQGchwJUgmV8FuuXZE4vvHUxw11ItO5MdTIfuJeq+TbnmfqZ3yfiM09dqzin5LE57Ia9dgBLI8j4EoO6kD0F7R1O04RMXW1SQGNHNv7q5N3bVkLo5YaaQsvWxoHvZcS1sMJQvlwedfkyMPgW+3Y2sktL8Ys=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB2941.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(53546011)(31686004)(478600001)(66476007)(54906003)(66556008)(6486002)(6916009)(6666004)(966005)(66946007)(83380400001)(31696002)(86362001)(38100700002)(41300700001)(316002)(2616005)(26005)(6506007)(6512007)(4326008)(36756003)(2906002)(8676002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnBEREZkeDVGUm9tS3U5RGlyQkNGT2E5eDh5TDRQeTdaaXp3aEdnUFByRTNF?=
 =?utf-8?B?NlpFT09ncE5pU2xoTEJ5OTRObVNZUXRBYno0TlFVbDQ3NE9LRC93QlIycFNp?=
 =?utf-8?B?YzNycWRBdVAzWmZNa0ZZSE43ZHRSa1JxVUpTM0g0RW1NZm9vVk1NenZ2QXND?=
 =?utf-8?B?N1FKTk5aZG82N3lMT1JrUk9IQ2g3WG5uT0NPWnh3MmpUeThyMGlQU1lVK1NJ?=
 =?utf-8?B?cUxiZkxLWkZCSVByODhDUERHMU5zVWk5ckxPYi8zS1kwNGJyckJqMjNicGxM?=
 =?utf-8?B?Ym1JaXFUWk15Njd2TGVWL20zaW0reStERTR1clMyb3VQbzU1TUxNamtWM1Zx?=
 =?utf-8?B?SVFCS3RWd3owa1VJaXRDcmZJR1d3NkpDb0xFaEZyY2R1ZjNSamRXWGdRM2c0?=
 =?utf-8?B?Vi9BVzQxL00wdXQ4ZnA2bXZyQVcrMlQzdGYzc1BzTDJhYTRhT3JvNmxoLzZk?=
 =?utf-8?B?TE9VSGVabEVWcG41eWpoZDExUkN2MmtISElKMllyY0psb2FINjBiMzhIQndO?=
 =?utf-8?B?WEk0QWhWQmd3N3VEdklnSTQzTVgvcFIrM1Zpbll5Ukp1V3pnRFFsaEp6Z3RQ?=
 =?utf-8?B?TzViRHdGSWhjNEROZ1dtVnp3RHFNOXgzN2REa2tqMkcxZEpFYTd5MXZqNndy?=
 =?utf-8?B?VklTOEpzUnNpKzBqWk4rcE5iQThnbW85aGVPdnovUjZVZFprd2wra1lkeUtu?=
 =?utf-8?B?bWJBTEtVTThWMythR0orYUtVWE9adnI0aXlrOUdzYVNYUGo0UFVpK0lOY1li?=
 =?utf-8?B?Tnc3MzB3eGdaQ0NudDMrbmJua21PcitxUHBZN0pyZi9rbEtxa1hGdkxDR00w?=
 =?utf-8?B?VFhFckxTbmdwUENRcEhvZjdScUpOR2dncC9Fa1JhQ0VGMlFqQklhYkJWZEFH?=
 =?utf-8?B?ODZWeDhmUzZ2SzZPQy9MaVEwdi9vYm1iSnlMSHZoaDVJMmh2dU9tU1dQRU8v?=
 =?utf-8?B?OXNkVUx5UDVna3NhUnh4eUlEVDQrT0xLaTR5YUJaVU16Y09zQVlGMHcrWjQ5?=
 =?utf-8?B?bmFWTnhrUnJNWnBaS0EwLzVQN0gzaVRWZHNJbS9wNzJ5dHJuUHI1MkVpdFli?=
 =?utf-8?B?Mnl0SVZFdlhpenN0TWJzWlZDejUzd1M4aTBEY1pwQXhQVHQwalkvbVkwVm9H?=
 =?utf-8?B?Qlh4TVJpUnNsVHFnY3MwdmtrOWt3YUFpdmtTSElDQ0N5VW40eERhME1zY3B1?=
 =?utf-8?B?cVZHV01BcXhvSmdIRDhSL0FPZHFKWmZySmVnbTNJVWFmdXByeW5TQzd3b1JL?=
 =?utf-8?B?aHg5UVVrOXAyb05Sdkc4bHpyTXBCNUxiT1JhVzdpVkJCd2xpOWZYZDkwNzEw?=
 =?utf-8?B?U3ltd1lhREdCVEpVd3V1VGM3ZktmTjdCSEU2YWd3ckZzajVydmlNeDhGaW5Q?=
 =?utf-8?B?RTcyTnB2TFVEeDlic2RKa3l1VkF3NkdmaC9kQWVzSEIxNXV0NGNuSVpPQUNR?=
 =?utf-8?B?ZEdvYllJTEpJUU80NXdVS1RzZzZ0ZzNCSzRKWEgxOW5tSUsrZFREVUNGUVJm?=
 =?utf-8?B?a1F3L3lObGlvNmVVMUxQR2VZYUZ2emVtbGR1ZWhmcElGRHlORmttaWRJTWhG?=
 =?utf-8?B?Q3N6aThlQWNsa09jeEtXckp6dklYWGZMeDBRUk1tZGh6QjIrcVBXWmg1dW1m?=
 =?utf-8?B?U1pGQy81eTQrczc1YTNkSjRyQ1JDODZYVThOQjNzU0pveERJa3dUZjZRYW0z?=
 =?utf-8?B?blJQMHkrWURUWlNkWkxRMTdOWXhEU2s3MGlPK0hVZFlnVzVIVFc4TkllOTkw?=
 =?utf-8?B?WEVGNEhDdXNNU3BuYVc2TElCSWd0TFN5OUZ2VjhhWDRKeUFwbGZSdFZvQlll?=
 =?utf-8?B?cmh5YndQTlExcXQxOFBac1I5eHd4S1lzTkNuSkpzUGxDenc3VGZYSm1SUHp1?=
 =?utf-8?B?UmlYMWd2UUlKUGtLdmZNeU5RL0N2MktCZFBIS014anJ3WCt0ZDN1NE9ZYnRR?=
 =?utf-8?B?dmQxTURDZUpFVlcrOStuUnNYVUFBTkdBQTNuSFk3aHRRT3loR0kxWHZZRG5t?=
 =?utf-8?B?K0lLYjdyTmJHSnBKcmU5Zmh6YlY1Q0JxWWxYTkhHY1o1TzJCVTZ5QSt2SGgy?=
 =?utf-8?B?NXJQaUc5UzNFL3d6STAya1BwZmhpQTZJb2hMdkZOTDZ0SWc2S25DVWRydEx1?=
 =?utf-8?Q?q0BK6zu+sAbLAJoMgh0dv4O7B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f116a6-9456-4380-617e-08dbcf38e495
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 17:45:46.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GmSdk24bmCOma6jRIcXhkbvBUoe/fwoLQpzB5l4Vh9W3hz2JWC7zSvHIyrEJEzQBEjk6y2Ug6CdoWHisc1GwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Nathan,
(+Hamza)

First of all, thanks a lot for your feedback. You can see my comments 
inline.

On 10/17/23 11:22, Nathan Chancellor wrote:
> Hi Rodrigo,
> 
> On Mon, Oct 16, 2023 at 08:19:16AM -0600, Rodrigo Siqueira wrote:
>> Stephen discovers a stack size issue when compiling the latest amdgpu
>> code with allmodconfig. This patchset addresses that issue by splitting
>> a large function into two smaller parts.
>>
>> Thanks
>> Siqueira
>>
>> Rodrigo Siqueira (2):
>>    drm/amd/display: Reduce stack size by splitting function
>>    drm/amd/display: Fix stack size issue on DML2
>>
>>   .../amd/display/dc/dml2/display_mode_core.c   | 3289 +++++++++--------
>>   1 file changed, 1653 insertions(+), 1636 deletions(-)
>>
>> -- 
>> 2.42.0
>>
> 
> This series appears in -next as commit c587ee30f376 ("drm/amd/display:
> Reduce stack size by splitting function"); while it may help stack usage
> for GCC, clang still suffers. All clang versions that the kernel
> supports show a warning for dml_prefetch_check(), the following is with
> LLVM 17.0.2 from kernel.org [1].
> 
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6263:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
>     6263 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
>          |             ^
> 
> With clang 18.0.0 (tip of tree) and 15.0.7, I see:
> 
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8277:6: error: stack frame size (2056) exceeds limit (2048) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
>     8277 | void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struct dml_clk_cfg_st *clk_cfg)
>          |      ^
> 
> For what it's worth, building with GCC 13.2.0 with a slighly lower
> -Wframe-larger-than value reveals that dml_prefetch_check() is right at
> the current limit and the stack usage of dml_core_mode_programming()
> when built with GCC is not too far of clang's, so it seems like there
> should be a more robust set of fixes, such as the ones that I have
> already done for older generations of this code.
> 
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
>     6705 | }
>          | ^
> 
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_core_mode_programming':
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:9893:1: error: the frame size of 1880 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
>     9893 | } // dml_core_mode_programming
>          | ^
> 
> 41012d715d5d drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
> 21485d3da659 drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
> 37934d4118e2 drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
> a3fef74b1d48 drm/amd/display: Reduce number of arguments of dml32_CalculatePrefetchSchedule()
> c4be0ac987f2 drm/amd/display: Reduce number of arguments of dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
> 25ea501ed85d drm/amd/display: Reduce number of arguments of dml314's CalculateFlipSchedule()
> ca07f4f5a98b drm/amd/display: Reduce number of arguments of dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
> 
> It would be really nice if these would somehow make it back to the
> original sources so that we stop going through this every time a new
> version of this code shows up.

I'm familiar with that approach of reducing the stack size. Correct me 
if I'm wrong, but the idea can be summarized as:

1. Move the local variable to a new struct.
2. Add the new struct as a reference to the main struct.
3. Update the function to use the elements in those structs.

I used this approach a lot in the past to reduce the stack size. 
However, I think this case is a little bit different. The target 
function is display_mode_core, which does not have a lot of local 
variables, as you can see in the below link:

https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c#L6212

> I thought that AMD has started testing
> with clang, how were these warnings not caught before the code was
> merged? If you are unable to look into these warnings, I can try to
> double back to this once I look into the other fires in -next...

Yeah, our CI uses GCC and Clang, but the version provided by the distro. 
Additionally, we do not use allmodconfig per patch; we use a custom 
config file to keep the build time under control.
Anyway, we tried to understand why this issue only showed up with the 
allmodconfig, and Hamza figured out that enabling the KCSAN option in 
our config file exposes those stack issues. I don't know the details 
behind KCSAN, but it looks like it will expand the stack size in the 
functions.

Maybe can you check in your side if disable KCSAN also fix the issues on 
clang? Do you have any other suggestion on how I can try to reduce the 
stack size in this particular case?

Thanks
Siqueira

> 
> [1]: https://mirrors.edge.kernel.org/pub/tools/llvm/
> 
> Cheers,
> Nathan

