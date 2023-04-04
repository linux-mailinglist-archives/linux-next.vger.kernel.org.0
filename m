Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0400A6D5A19
	for <lists+linux-next@lfdr.de>; Tue,  4 Apr 2023 09:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbjDDH5J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Apr 2023 03:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233558AbjDDH5I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2023 03:57:08 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527B11987
        for <linux-next@vger.kernel.org>; Tue,  4 Apr 2023 00:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N57iJPbFsJKYCj5EhOCW80ynfcKb5ih7sjqTqdbaa/jimbtaVLeNK0voWv7NMb2ch2zRExtWdBfpvhp6raAxoF5lRRYH/VtXoSJ7gZMzSVgtFNH1vRYjP1TfPhf7Gzlbbm0/XscZ5ob8pTA0MNaMzLCubuBYFvixhfEaCZn4Va7Lf3KST5Tw0PTipy2OEfyzlqzBgMxhJlsWMZRDKHaotxoP9qqZJazmvpcFe5ubgYVc5sgLLIvqP4nRtR7v6ZT4UAXhZuB43cZsBUiXkkawVTXT+28PnrdvSD/kYP3OfrAde61BJCZBh0K+PkALpmHDhrgX+xOhgRPDIeC+WHXLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4Pg1Qp9VfRr7T8F5Q9x4gkZyswJ5qHG44mjEC6JT9k=;
 b=j9mwtSPq/Ll8iMkaTK99i+XIJIA2/Yp5xEIS/jxRmDLzAd0FiMsrFb3m3pRXJQzZUDaJTmGHKB94Bz8MSA0fbCfXKvZb1GmNfP3puXK+7ZUfDzDQKFOBz1ry5LpafuP1w9KLPh2C6FwR7V7Or3jcnFbnHZ7kqc9DwhrPPUSeo3BscuJolIXCg2l+5jKt4j0tDPHt9CyespXOEx5OBFz0PBBGAV4DP7l1MyXDLGaPvTrCxS98BUxK+Yc4FaJgrYbAKjSFm5xDwwnHH6srE1MfUPRhpteEwQ97IMt7gWkFqA6H3f87gYpKz5NQSC+9HS2Zt1P7KzcuT1hpTGwxkz0VKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4Pg1Qp9VfRr7T8F5Q9x4gkZyswJ5qHG44mjEC6JT9k=;
 b=0mzcG9+4v4HQg12TQnTrkwBHCiIRsIEzZ791W8TtW9i0sXHs9VyhgoVWIrBjj4dU+DpCEVo6GJe/jILhRM+Ubd5h2kxCNuGKo6+oOqXyBq3pJlBEuWk8hjAVLMJ3uJhqLT/XBQ4FpLNGIgHiOZN16FIPE5+YDLxPIivUrqWIv0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 07:56:59 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::e748:b085:209a:1a71]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::e748:b085:209a:1a71%9]) with mapi id 15.20.6156.028; Tue, 4 Apr 2023
 07:56:58 +0000
Message-ID: <dfd986d8-b7b7-a307-0a5c-87d03afba136@amd.com>
Date:   Tue, 4 Apr 2023 13:26:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
X-Mozilla-News-Host: news://54.189.247.149:119
Content-Language: en-US
Cc:     sfr@canb.auug.org.au
From:   "Aithal, Srikanth" <sraithal@amd.com>
Subject: next-20230404: amd64: drm_crtc_next_vblank_start - kernel NULL
 pointer dereference, address: 0000000000000074
To:     linux-next@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::7) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|DS7PR12MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fc1596-3580-49bc-9cfa-08db34e22a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xL4mccuyJbTb67C6B7OfvufU5Xgqo/E8/8Dewnp5njVyBPdrszZhGwCXY7y/aUnfmPvQJ2mfDe8S1K+1BDXPLuEvgJL/dkZvCZnU24c1p8q72ERmmDsZm2rhtBAnNzWT+g9szTc/HjUIVRIYXfioOJEKdFD6Zl2uCyxs6GOm0EEUUzjs7RvvfbKDiuM7pvkjkRZffc0akxfQUtS2LUgYWv6jGxGLPsBszpRxAtdw2LJi2SqOTO5FJdSKPQaouCwteN6e0/MunPr7fZekFLHRNSSU3FyIAWQQA8zPrjkKM2O/pbRJn2fozZrwosJGfqK0qgkmnFo2T1pOQ1sErzuhRk7/N4pztacz1RM0ENlkr/8rBr0ClkG8vft8LBbiuD1sNgf5JZeOp6BYKooKzI+P/PVpoa+xTe/3sbkLGr9q2ihIBtv1SxHKfv1WXqZSUNIFuwC+KKLDYTc5Wj0ZRDMXOWMZXO2UQKXJj3jRHlt+wO9oEmz+kn4moj1jJDYTYeGl5SeIvGo3w3WErI5EcdwI8OkehbRBNJvFNhzyiNPUyj6ubbRcbmagblzAvPoku7oEMu9O0fuSjf5d/jsYjKyS/vJRLSO078h9qYD1LviZtsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(45080400002)(2906002)(8936002)(38100700002)(41300700001)(5660300002)(36756003)(31696002)(478600001)(316002)(966005)(6486002)(2616005)(26005)(6512007)(6506007)(6666004)(8676002)(83380400001)(4326008)(6916009)(66556008)(66946007)(31686004)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjJ6Ym1DSktCQ1RDYVpTRjF2ZlA5VmpTL3RUV3hIRHFMc3pxdU5UYVBxNzVX?=
 =?utf-8?B?RTlaOC9xYTNYOC9YeUMwUXNCZjg1WVJBalk0LzZlZGlGUUJQZjkzT25xR29j?=
 =?utf-8?B?WG9pS3o3b0RhditaVzJ3dFhvQUo2ZTNnVHNhK3ZibjBqdDd5OTNDTWlpWHps?=
 =?utf-8?B?R2Y2QlN3NWdQak02QTMwWWpYS0RSWUorWmNmcW94TG9MOURzajhma2I1bSt3?=
 =?utf-8?B?ajdMLzduLzFtRlF6TmZyRDFJY2JiVTQ5akRFT2dpNU1raGVDa2tNU3Avczkx?=
 =?utf-8?B?SFByd0ZMRzVWMVhXd3VQSzRoKzVtYzlIWXplQ1hZQnVLdWVmRUFuRS9GRkZI?=
 =?utf-8?B?SE1VRnAxR0EwZWF4WUFwVnNxWlBHbmEyWnRha1ozM1lEMVlRVHNBM3RFSWM4?=
 =?utf-8?B?ZHlvbFg3b1FqdkhzK0MyVW1pK0JvRFcwajNvRUdpV1F2VWRtL0R5eGEwVVF6?=
 =?utf-8?B?UzNTTXRaQTJIZWJ2aVZYTkpiWkhvVU1rQ2ZqcVVaWmFoRWZwbDU0a2NLYmJO?=
 =?utf-8?B?V0pCMzBDdm9Wak4xM2JGRURndHNrT2wxL3dLRWFSZW1tWnRJK2szbWF1eXdq?=
 =?utf-8?B?OEM0UTZZYlNxUjBETTJwRm5xSnNmejY4WmwyaXpONHVkRXdQeWRJaUEvbHgr?=
 =?utf-8?B?Mnlab2MrU3o3U0tjeHpFclFVdTZZT0FQZ2o5WFA5Rm5CdFdRT3c1ZXR3OUZC?=
 =?utf-8?B?RDhaTmpsVU1Weng2TFF4eC9ZSStXWmNBRGd5R1FoWHZmVi9IMGE1UTNOU0g0?=
 =?utf-8?B?ZGsxcVhoVzVsNXlQT0dNb2o4cFFpZDNCQTYxb05mZWhWcjl6S1Vad20rOGdZ?=
 =?utf-8?B?N0lwckhkVW5UcDBVK0V6NjFPTFlPRm9FcDVPeWNlMjlZdFk1R0Njbk9xQnBq?=
 =?utf-8?B?OG5iMjUvUC9zakUzcjBtOHQ5bGpGN2FQQWs5Tk9TbmRXOFJBQ1VpL0pUczEr?=
 =?utf-8?B?anRIWnZEQ2FHYTdLSkYybXN3Zm5KUG9pSHhWWG9HcmNaZW1hSjNackdJTU11?=
 =?utf-8?B?TEZVTmd5T0NEV1F0NGdKeHcrWXUrTnVvaG5zU2ZXYzZ2bklGQU9QSFEwRURO?=
 =?utf-8?B?STRjbzlEZm1TTWZ6YlptVDAzcXRwQ0Y0WVpBa0l5a1Q4a1ZkVUtMeVh4eWlT?=
 =?utf-8?B?bDhpdCtSdXpSYUY5alNORDZyRnRoL2tjbjZvSlZ6MG1EdFh0OWN3a0p4Q01L?=
 =?utf-8?B?cldWNUxmTEdPK1hWYkJ3VzVKb0xaQ0VXcm5HZ1VFTE0weGlXbFdweGNmQ3VN?=
 =?utf-8?B?QzVtTWthRllmcjZmY0w5Mi8vSDFnbmZ5MGNoM3FoL3JXMFgvTXZLQ1Z2enlP?=
 =?utf-8?B?VlJjejdYODVMN0JhL1hNQ3Rka2xmR3l6Ty92djhEdVJhODF0RUVHZ0g0MjQ4?=
 =?utf-8?B?N3dTL1VsY0QrTDZRUHNwTjFrUTlhazI0V01mZy9wTENRSjdaRU9Rc0FhbVF6?=
 =?utf-8?B?bzRsdStYTkZkQlFxUzkrK3FTWGJuenl3U0ZKRXFjcU93WjYrVHRBSWMwaVhK?=
 =?utf-8?B?b1RMZkVGU0pISjh5QUNLSDFud2Z6VHJGbTRRMGZkVFE0bllZMnhVbTJ4Mmda?=
 =?utf-8?B?NVI4dTd2c0xYVm9sOVFJUHA2N0U3YU5EZzZjSW90MmUzc0hGR0VsL0p4OWVp?=
 =?utf-8?B?N0xpQ1dGSjEyTFMzcHVkU2IxY0pPNlY2eU8ra3VhVnovb3lKTjlsekp1MTdI?=
 =?utf-8?B?OEc4MExVeENraWRxSFlCV1pLVXBXZXdOUWFMTkNySTEwVEtJRUlQRFYvWTNG?=
 =?utf-8?B?d3d0b09pa0k3RSs4eVNXK1lQbXBhR3oyY1hzWmI0QTM3WHZreUR4SFpZWGdi?=
 =?utf-8?B?SHc1VHJVS2ZnSk44eThyUkN1d3JpcGMvT2FsZ3pScEZrT3kyZkk1ZGZBMFBE?=
 =?utf-8?B?dWV4K3ZEcy9TdjZ5cnZMZHlnKzA1b3c0dmxDaWw0TElVaXR6bkxFQmFXaHh3?=
 =?utf-8?B?aWo0MW1rZURjQjZJMVlUOWUrdGNsZGUwbGZvbWV3ZVpnVjExL055RDE2Q0hT?=
 =?utf-8?B?VXR5SkdIQ2lFejE5UkpIeHJJempBNzFpcGZkdmdrU3BTN2tHaXp3V3QvWTkx?=
 =?utf-8?B?RjhkcFRVdENqMlRraU56TldRUE8wS1dZdWxhRUc1K0RvaUNaSDNMNWJoQlFH?=
 =?utf-8?Q?iLzXSER1JN4FG76mOUmNZHCOT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fc1596-3580-49bc-9cfa-08db34e22a2e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 07:56:57.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeKYP41sLiFrjLEcYQRCEvFJUmHv9Qin1MA2ZSyRJtXFiEaoFXv7BoUMUkvzfuyQxVCw69E9PEyAb2BM7vnoag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5981
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

Observing below kernel crash on AMD arch, from next-20230330 onwards 
till recent build [next-20230404]:

[   68.282610] BUG: kernel NULL pointer dereference, address: 
0000000000000074
[   68.282611] #PF: supervisor read access in kernel mode
[   68.282613] #PF: error_code(0x0000) - not-present page
[   68.282614] PGD 0 P4D 0
[   68.282615] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   68.282618] CPU: 24 PID: 905 Comm: kworker/24:1 Not tainted 
6.3.0-rc5-next-20230403next-20230403 #1
[   68.282620] Hardware name: Dell Inc. PowerEdge R6515/07PXPY, BIOS 
2.8.5 08/18/2022
[   68.282621] Workqueue: events fbcon_register_existing_fbs
[   68.282626] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
[   68.282653] Code: 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 
48 8d 0c c0 48 89 e5 41 54 53 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 
00 <8b> 53 74 85 d2 74 3f 8b 43 78 85 c0 74 38 31 d2 49 89 f4 e8 1c ff
[   68.282655] RSP: 0018:ffffb30e0fbf7b00 EFLAGS: 00010246
[   68.282656] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000000
[   68.282657] RDX: ffff896b06f26000 RSI: ffffb30e0fbf7b20 RDI: 
ffff896b06f26928
[   68.282657] RBP: ffffb30e0fbf7b10 R08: ffff898a7fcd4000 R09: 
ffff896b1078f580
[   68.282658] R10: 0000000000000100 R11: 0000000000000000 R12: 
0000000000000000
[   68.282659] R13: ffff896b12280600 R14: 0000000000000000 R15: 
ffff896b2f375330
[   68.282659] FS:  0000000000000000(0000) GS:ffff898a00400000(0000) 
knlGS:0000000000000000
[   68.282660] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   68.282661] CR2: 0000000000000074 CR3: 00000001513b8001 CR4: 
0000000000770ee0
[   68.282662] PKRU: 55555554
[   68.282663] Call Trace:
[   68.282664]  <TASK>
[   68.282667]  drm_atomic_helper_wait_for_fences+0x87/0x1f0 
[drm_kms_helper]
[   68.282679]  ? drm_gem_begin_shadow_fb_access+0x29/0x40 [drm_kms_helper]
[   68.282691]  drm_atomic_helper_commit+0x9e/0x150 [drm_kms_helper]
[   68.282701]  drm_atomic_commit+0x9d/0xd0 [drm]
[   68.282722]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
[   68.282745]  drm_client_modeset_commit_atomic+0x1e2/0x220 [drm]
[   68.282767]  drm_client_modeset_commit_locked+0x5b/0x170 [drm]
[   68.282788]  drm_client_modeset_commit+0x2a/0x50 [drm]
[   68.282808]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xa1/0xd0 
[drm_kms_helper]
[   68.282819]  drm_fb_helper_set_par+0x3d/0x70 [drm_kms_helper]
[   68.282829]  fbcon_init+0x27d/0x500
[   68.282831]  visual_init+0xd5/0x140
[   68.282834]  do_bind_con_driver+0x1a0/0x3b0
[   68.282836]  do_take_over_console+0x112/0x1b0
[   68.282838]  do_fbcon_takeover+0x60/0xc0
[   68.282840]  do_fb_registered+0x1bc/0x1d0
[   68.282842]  fbcon_register_existing_fbs+0x51/0x90
[   68.282843]  process_one_work+0x215/0x430
[   68.282847]  worker_thread+0x38/0x3d0
[   68.282848]  ? __pfx_worker_thread+0x10/0x10
[   68.282850]  kthread+0xfd/0x130
[   68.282852]  ? __pfx_kthread+0x10/0x10
[   68.282853]  ret_from_fork+0x2c/0x50
[   68.282856]  </TASK>
[   68.282857] Modules linked in: stp llc nft_fib_inet nft_fib_ipv4 
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 ip_set nf_tables nfnetlink sunrpc nls_iso8859_1 ipmi_ssif 
intel_rapl_msr intel_rapl_common amd64_edac kvm_amd kvm crct10dif_pclmul 
crc32_pclmul ghash_clmulni_intel sha512_ssse3 aesni_intel acpi_ipmi 
crypto_simd cryptd ipmi_si ccp rapl sp5100_tco ipmi_devintf input_leds 
joydev wmi_bmof pcspkr efi_pstore i2c_piix4 k10temp ipmi_msghandler 
acpi_power_meter evbug mac_hid sch_fq_codel xfs libcrc32c hid_generic 
usbkbd usbmouse usbhid hid mgag200 drm_kms_helper syscopyarea 
sysfillrect sysimgblt i2c_algo_bit drm_shmem_helper drm mpt3sas tg3 
raid_class scsi_transport_sas wmi msr autofs4
[   68.282891] CR2: 0000000000000074
[   68.282892] ---[ end trace 0000000000000000 ]---
[   68.302761] pstore: backend (erst) writing error (-28)
[   68.302763] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]


Commit d39e48ca80c0  is causing the issue. I have verified same issue 
exists on https://gitlab.freedesktop.org/drm/msm [tag: dma-fence-deadline].

Thanks,
Srikanth Aithal <sraithal@amd.com>
