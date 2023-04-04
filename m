Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A2F6D61AE
	for <lists+linux-next@lfdr.de>; Tue,  4 Apr 2023 14:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbjDDMyW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Apr 2023 08:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbjDDMyT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2023 08:54:19 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657B640DD
        for <linux-next@vger.kernel.org>; Tue,  4 Apr 2023 05:54:12 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso33800235pjb.3
        for <linux-next@vger.kernel.org>; Tue, 04 Apr 2023 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680612852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFK+Q+ba/QwPMVJS/Qd7an8+mdkRzGgMPppNPrnIvwo=;
        b=h6lxwTPK9PAFnSZvsbu2Io83PMCOmRkBu0lkp2fQZDYSP+On6S+CrLLaqxftxyIItG
         dielMmZ2fjc1JXYG2osMX21+OF5MKSClZ7NGP3HMUg4XdJCImhq/G+bwtDWQ+vJn24bg
         R7ID+8XbzrswgL2YTUlsfYKOs/xfuq+NTZkNrgpS9gBcFYqZ3tr+r93SQeOeVTZZaPs3
         qd767y+xxMLE+Ik7QX41+VPbFUcH9Ok7TXORSrSClhxfM88Y/rFbw3yQ1uT8rvahooW7
         DYmJTSxQzth05Zsx+ayNAAGK9RJXa0MPpx71BxSDm0E7YQkQ0YxGapo52crrQBHavjAV
         g/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680612852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFK+Q+ba/QwPMVJS/Qd7an8+mdkRzGgMPppNPrnIvwo=;
        b=A+K0MLvZmaehKJt48+JT9t/8Wojo+LlojQD4puFE3pevL+XT/BJrExfjFl/eVGS+qU
         pdEy49lIcBq+GYx4Fj0v08ukWFNdQRyDN6bFbCYHB2Vur09IUx7J8gotEFwMa0QP5GYZ
         GC6tZob6bI+V8nruWG18nbl8aZDdYfcWvnZWiTzUClhyl+LkU4STszqLkooyn4lM0ERT
         QKyawF7E8u4qukrX0+2xufCxFi1dnAV+SWmBdYOdjvLUqClUsfBHUmUrwjEYKVWJNgWj
         KuTUfGiaLv83to7A0mRSc8JLo/gDCJPgNRgrb6bd/nvf3nkDqWoTZiwMbG1JFw9H58UC
         +v8A==
X-Gm-Message-State: AAQBX9eF1ZNDG25PLj0Tbo7f254W8i6l1FcIHOtZ+SD4YkZ9Vme9CokA
        P/5IaFHoIqFqaFs9H0MbtRDE4p9mXi63Kw==
X-Google-Smtp-Source: AKy350YaCV4biJOVsF9OJkjH/zyoUNkvPfRuay4mvY+WRAH1hl8UhaEkKPC47MBIZ5E8T0fn6IZHrA==
X-Received: by 2002:a17:902:e748:b0:19d:1fce:c9ec with SMTP id p8-20020a170902e74800b0019d1fcec9ecmr3268883plf.37.1680612851632;
        Tue, 04 Apr 2023 05:54:11 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-24.three.co.id. [180.214.233.24])
        by smtp.gmail.com with ESMTPSA id t4-20020a1709028c8400b0019f1205bdcbsm8295563plo.147.2023.04.04.05.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 05:54:11 -0700 (PDT)
Message-ID: <6e16291a-4765-0b85-b80b-f96e1482e11c@gmail.com>
Date:   Tue, 4 Apr 2023 19:54:06 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: next-20230404: amd64: drm_crtc_next_vblank_start - kernel NULL
 pointer dereference, address: 0000000000000074
Content-Language: en-US
To:     "Aithal, Srikanth" <sraithal@amd.com>, linux-next@vger.kernel.org
Cc:     sfr@canb.auug.org.au
References: <dfd986d8-b7b7-a307-0a5c-87d03afba136@amd.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <dfd986d8-b7b7-a307-0a5c-87d03afba136@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/4/23 14:56, Aithal, Srikanth wrote:
> Hello,
> 
> Observing below kernel crash on AMD arch, from next-20230330 onwards till recent build [next-20230404]:
> 
> [   68.282610] BUG: kernel NULL pointer dereference, address: 0000000000000074
> [   68.282611] #PF: supervisor read access in kernel mode
> [   68.282613] #PF: error_code(0x0000) - not-present page
> [   68.282614] PGD 0 P4D 0
> [   68.282615] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   68.282618] CPU: 24 PID: 905 Comm: kworker/24:1 Not tainted 6.3.0-rc5-next-20230403next-20230403 #1
> [   68.282620] Hardware name: Dell Inc. PowerEdge R6515/07PXPY, BIOS 2.8.5 08/18/2022
> [   68.282621] Workqueue: events fbcon_register_existing_fbs
> [   68.282626] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
> [   68.282653] Code: 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 48 8d 0c c0 48 89 e5 41 54 53 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 00 <8b> 53 74 85 d2 74 3f 8b 43 78 85 c0 74 38 31 d2 49 89 f4 e8 1c ff
> [   68.282655] RSP: 0018:ffffb30e0fbf7b00 EFLAGS: 00010246
> [   68.282656] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> [   68.282657] RDX: ffff896b06f26000 RSI: ffffb30e0fbf7b20 RDI: ffff896b06f26928
> [   68.282657] RBP: ffffb30e0fbf7b10 R08: ffff898a7fcd4000 R09: ffff896b1078f580
> [   68.282658] R10: 0000000000000100 R11: 0000000000000000 R12: 0000000000000000
> [   68.282659] R13: ffff896b12280600 R14: 0000000000000000 R15: ffff896b2f375330
> [   68.282659] FS:  0000000000000000(0000) GS:ffff898a00400000(0000) knlGS:0000000000000000
> [   68.282660] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   68.282661] CR2: 0000000000000074 CR3: 00000001513b8001 CR4: 0000000000770ee0
> [   68.282662] PKRU: 55555554
> [   68.282663] Call Trace:
> [   68.282664]  <TASK>
> [   68.282667]  drm_atomic_helper_wait_for_fences+0x87/0x1f0 [drm_kms_helper]
> [   68.282679]  ? drm_gem_begin_shadow_fb_access+0x29/0x40 [drm_kms_helper]
> [   68.282691]  drm_atomic_helper_commit+0x9e/0x150 [drm_kms_helper]
> [   68.282701]  drm_atomic_commit+0x9d/0xd0 [drm]
> [   68.282722]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [   68.282745]  drm_client_modeset_commit_atomic+0x1e2/0x220 [drm]
> [   68.282767]  drm_client_modeset_commit_locked+0x5b/0x170 [drm]
> [   68.282788]  drm_client_modeset_commit+0x2a/0x50 [drm]
> [   68.282808]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xa1/0xd0 [drm_kms_helper]
> [   68.282819]  drm_fb_helper_set_par+0x3d/0x70 [drm_kms_helper]
> [   68.282829]  fbcon_init+0x27d/0x500
> [   68.282831]  visual_init+0xd5/0x140
> [   68.282834]  do_bind_con_driver+0x1a0/0x3b0
> [   68.282836]  do_take_over_console+0x112/0x1b0
> [   68.282838]  do_fbcon_takeover+0x60/0xc0
> [   68.282840]  do_fb_registered+0x1bc/0x1d0
> [   68.282842]  fbcon_register_existing_fbs+0x51/0x90
> [   68.282843]  process_one_work+0x215/0x430
> [   68.282847]  worker_thread+0x38/0x3d0
> [   68.282848]  ? __pfx_worker_thread+0x10/0x10
> [   68.282850]  kthread+0xfd/0x130
> [   68.282852]  ? __pfx_kthread+0x10/0x10
> [   68.282853]  ret_from_fork+0x2c/0x50
> [   68.282856]  </TASK>
> [   68.282857] Modules linked in: stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink sunrpc nls_iso8859_1 ipmi_ssif intel_rapl_msr intel_rapl_common amd64_edac kvm_amd kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha512_ssse3 aesni_intel acpi_ipmi crypto_simd cryptd ipmi_si ccp rapl sp5100_tco ipmi_devintf input_leds joydev wmi_bmof pcspkr efi_pstore i2c_piix4 k10temp ipmi_msghandler acpi_power_meter evbug mac_hid sch_fq_codel xfs libcrc32c hid_generic usbkbd usbmouse usbhid hid mgag200 drm_kms_helper syscopyarea sysfillrect sysimgblt i2c_algo_bit drm_shmem_helper drm mpt3sas tg3 raid_class scsi_transport_sas wmi msr autofs4
> [   68.282891] CR2: 0000000000000074
> [   68.282892] ---[ end trace 0000000000000000 ]---
> [   68.302761] pstore: backend (erst) writing error (-28)
> [   68.302763] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
> 
> 
> Commit d39e48ca80c0  is causing the issue. I have verified same issue exists on https://gitlab.freedesktop.org/drm/msm [tag: dma-fence-deadline].
> 

Should have been fixed by [1], please test.

Thanks.

[1]: https://lore.kernel.org/lkml/20230403160314.1210533-1-robdclark@gmail.com/

-- 
An old man doll... just what I always wanted! - Clara

