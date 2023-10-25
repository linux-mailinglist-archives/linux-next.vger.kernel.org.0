Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACF27D72F9
	for <lists+linux-next@lfdr.de>; Wed, 25 Oct 2023 20:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343542AbjJYSJm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Oct 2023 14:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbjJYSJc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Oct 2023 14:09:32 -0400
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05613199C
        for <linux-next@vger.kernel.org>; Wed, 25 Oct 2023 11:08:50 -0700 (PDT)
Date:   Wed, 25 Oct 2023 14:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1698257329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CZTl21BN1alzLn7qAdWExIV6MEwxBnoUCe7NRgZuavY=;
        b=r1+AYMGE/is5Lo0jTucIjnkQelnR9HlOOO4+ncPhpVzpQT3tlNaoUo9K2CnTDR8/BrkR0m
        c2kpxhokFHsiQZ3JHYANxZpTQUnRg4nmF0f3cvp2qwFasrwt3TBXM0yZnCLr9yboiOp2z5
        Aq3qef/ap20+LhCy3BkI7ZqXK4XUcA4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org
Cc:     linux-bcachefs@vger.kernel.org, linux-next@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: bcachefs RCU warnings
Message-ID: <20231025180845.sq6tpl6c4hefdbg7@moria.home.lan>
References: <CAMVG2su2RvAaTAyj8kFtUZcRfcZuKncxqhL3h-Ag8JQeSR=jxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMVG2su2RvAaTAyj8kFtUZcRfcZuKncxqhL3h-Ag8JQeSR=jxw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hey Paul, RCU folks :)

I've got no idea what these warnings mean and haven't seen them before,
do you suppose one of you could point me in the right direction?

On Wed, Oct 25, 2023 at 09:28:09PM +0800, Daniel J Blueman wrote:
> Hi Kent et al,
> 
> On 6.6.0-rc7-next-20231024 with my bcachefs exerciser [1], I was able
> to reproduce three related kernel warnings due to RCU grace period
> counts being zero, ie WARN_ON_ONCE(READ_ONCE(rsp->gp_count) == 0).
> 
> If this is something of interest, I'll find a minimal reproducer.
> These warnings aside, bcachefs is looking really solid.
> 
> Thanks,
>   Daniel
> 
> -- [1] https://github.com/dblueman/bcachefs-gym
> 
> -- [2]
> 
> WARNING: CPU: 15 PID: 259240 at kernel/rcu/sync.c:171 rcu_sync_exit+0xe3/0xf0
> Modules linked in: brd tls cfg80211 intel_rapl_msr intel_rapl_common
> amd64_edac edac_mce_amd kvm_amd binfmt_misc kvm irqbypass ipmi_ssif
> rapl wmi_bmof nls_iso8859_1 ccp ptdma k10temp acpi_ipmi ipmi_si
> ipmi_devintf ipmi_msghandler input_leds joydev mac_hid efi_pstore
> dmi_sysfs ip_tables x_tables autofs4 rndis_host cdc_ether usbnet m
> ii btrfs blake2b_generic hid_generic usbhid raid10 hid raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0
> multipath linear crct10dif_pclmul crc32_pclmul ast polyval_clmulni
> polyval_generic i2c_algo_bit ghash_clmulni_intel drm_shmem_helper
> sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 nvme ahci drm
> nvme_core tg3 l
> ibahci xhci_pci i2c_piix4 xhci_pci_renesas wmi aesni_intel crypto_simd
> cryptd [last unloaded: brd]
> CPU: 15 PID: 259240 Comm: bch-data/3edb8b Tainted: G W
> 6.6.0-rc7-next-20231024 #1
> Hardware name: Supermicro AS -3014TS-i/H12SSL-i, BIOS 2.5 09/08/2022
> RIP: 0010:rcu_sync_exit+0xe3/0xf0
> Code: c6 e0 06 c7 b2 e8 dd 0e 01 00 4c 89 e7 e8 b5 54 91 01 5b 41 5c
> 41 5d 5d 31 c0 31 f6 31 ff e9 8f 35 a9 01 0f 0b e9 3d ff ff ff <0f> 0b
> e9 4d ff ff ff 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90
> RSP: 0018:ffffc90024127b60 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff8883b7383740 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc90024127b78 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff8883b7383798
> R13: ffff8883b7383744 R14: ffff8883b7383740 R15: ffff8883b7380498
> FS: 0000000000000000(0000) GS:ffff88bf0e780000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fea708bae00 CR3: 000000034b860003 CR4: 0000000000770ef0
> PKRU: 55555554
> Call Trace:
> <TASK>
> ? show_regs+0x6c/0x80
> ? __warn+0xa4/0x1c0
> ? rcu_sync_exit+0xe3/0xf0
> ? report_bug+0x1bc/0x1f0
> ? handle_bug+0x46/0x90
> ? exc_invalid_op+0x18/0x50
> ? asm_exc_invalid_op+0x1b/0x20
> ? rcu_sync_exit+0xe3/0xf0
> percpu_up_write+0x4d/0x60
> bch2_replicas_gc_end+0x60/0x110
> bch2_journal_flush_device_pins+0x2d7/0x4b0
> ? __entry_text_end+0x102619/0x10261d
> ? __pfx_bch2_journal_flush_device_pins+0x10/0x10
> ? __pfx_scnprintf+0x10/0x10
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? raw_spin_rq_unlock+0x17/0x70
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? finish_task_switch.isra.0+0xc1/0x410
> ? __switch_to+0x281/0x6d0
> bch2_data_job+0x1fb/0x500
> ? __pfx_bch2_data_job+0x10/0x10
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? try_to_wake_up+0x4b1/0xca0
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? __pfx_bch2_data_thread+0x10/0x10
> bch2_data_thread+0x60/0xa0
> kthread+0x188/0x1d0
> ? __pfx_kthread+0x10/0x10
> ret_from_fork+0x47/0x80
> ? __pfx_kthread+0x10/0x10
> ret_from_fork_asm+0x1a/0x30
> </TASK>
> 
> WARNING: CPU: 15 PID: 259240 at kernel/rcu/sync.c:129 rcu_sync_enter+0x1d6/0x200
> Modules linked in: brd tls cfg80211 intel_rapl_msr intel_rapl_common
> amd64_edac edac_mce_amd kvm_amd binfmt_misc kvm irqbypass ipmi_ssif
> rapl wmi_bmof nls_iso8859_1 ccp ptdma k10temp acpi_ipmi ipmi_si
> ipmi_devintf ipmi_msghandler input_leds joydev mac_hid efi_pstore
> dmi_sysfs ip_tables x_tables autofs4 rndis_host cdc_ether usbnet m
> ii btrfs blake2b_generic hid_generic usbhid raid10 hid raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0
> multipath linear crct10dif_pclmul crc32_pclmul ast polyval_clmulni
> polyval_generic i2c_algo_bit ghash_clmulni_intel drm_shmem_helper
> sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 nvme ahci drm
> nvme_core tg3 l
> ibahci xhci_pci i2c_piix4 xhci_pci_renesas wmi aesni_intel crypto_simd
> cryptd [last unloaded: brd]
> CPU: 15 PID: 259240 Comm: bch-data/3edb8b Tainted: G W
> 6.6.0-rc7-next-20231024 #1
> Hardware name: Supermicro AS -3014TS-i/H12SSL-i, BIOS 2.5 09/08/2022
> RIP: 0010:rcu_sync_enter+0x1d6/0x200
> Code: 89 ef e8 2d fb f9 ff 48 89 df e8 35 45 3f 00 8b 03 83 f8 01 7e
> d8 48 8d b5 68 ff ff ff 4c 89 ef e8 6f c1 f9 ff e9 0b ff ff ff <0f> 0b
> 4c 89 ff 41 83 c6 01 e8 ec 45 3f 00 44 89 73 04 4c 89 ef e8
> RSP: 0018:ffffc90024127b00 EFLAGS: 00010086
> RAX: 0000000000000000 RBX: ffff8883b7383740 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc90024127bc8 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff92004824f60
> R13: ffff8883b7383748 R14: 00000000ffffffff R15: ffff8883b7383744
> FS: 0000000000000000(0000) GS:ffff88bf0e780000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fea708bae00 CR3: 000000034b860003 CR4: 0000000000770ef0
> PKRU: 55555554
> Call Trace:
> <TASK>
> ? show_regs+0x6c/0x80
> ? __warn+0xa4/0x1c0
> ? rcu_sync_enter+0x1d6/0x200
> ? report_bug+0x1bc/0x1f0
> ? handle_bug+0x46/0x90
> ? exc_invalid_op+0x18/0x50
> ? asm_exc_invalid_op+0x1b/0x20
> ? rcu_sync_enter+0x1d6/0x200
> ? __pfx_rcu_sync_enter+0x10/0x10
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? __kasan_check_write+0x14/0x30
> percpu_down_write+0x2f/0x2b0
> ? bch2_replicas_gc2+0x122/0x6f0
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? __kmalloc+0x61/0xf0
> bch2_replicas_gc2+0x155/0x6f0
> ? __pfx_bch2_replicas_gc2+0x10/0x10
> ? raw_spin_rq_unlock+0x17/0x70
> ? finish_task_switch.isra.0+0xc1/0x410
> ? __switch_to+0x281/0x6d0
> bch2_data_job+0x298/0x500
> ? __pfx_bch2_data_job+0x10/0x10
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? try_to_wake_up+0x4b1/0xca0
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? __pfx_bch2_data_thread+0x10/0x10
> bch2_data_thread+0x60/0xa0
> kthread+0x188/0x1d0
> ? __pfx_kthread+0x10/0x10
> ret_from_fork+0x47/0x80
> ? __pfx_kthread+0x10/0x10
> ret_from_fork_asm+0x1a/0x30
> </TASK>
> 
> WARNING: CPU: 38 PID: 262351 at kernel/rcu/sync.c:193 rcu_sync_dtor+0x96/0xb0
> Modules linked in: brd tls cfg80211 intel_rapl_msr intel_rapl_common
> amd64_edac edac_mce_amd kvm_amd binfmt_misc kvm irqbypass ipmi_ssif
> rapl wmi_bmof nls_iso8859_1 ccp ptdma k10temp acpi_ipmi ipmi_si
> ipmi_devintf ipmi_msghandler input_leds joydev mac_hid efi_pstore
> dmi_sysfs ip_tables x_tables autofs4 rndis_host cdc_ether usbnet mii
> btrfs blake2b_generic hid_generic usbhid raid10 hid raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0
> multipath linear crct10dif_pclmul crc32_pclmul ast polyval_clmulni
> polyval_generic i2c_algo_bit ghash_clmulni_intel drm_shmem_helper
> sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 nvme ahci drm
> nvme_core tg3 libahci xhci_pci i2c_piix4 xhci_pci_renesas wmi
> aesni_intel crypto_simd cryptd [last unloaded: brd]
> CPU: 38 PID: 262351 Comm: umount Tainted: G W 6.6.0-rc7-next-20231024 #1
> Hardware name: Supermicro AS -3014TS-i/H12SSL-i, BIOS 2.5 09/08/2022
> RIP: 0010:rcu_sync_dtor+0x96/0xb0
> Code: e8 4f 44 3f 00 c7 03 03 00 00 00 4c 89 e7 e8 01 54 91 01 e8 fc
> 80 00 00 48 89 df e8 54 43 3f 00 8b 03 85 c0 74 c8 0f 0b eb c4 <0f> 0b
> 48 89 df e8 40 43 3f 00 8b 03 83 f8 02 75 89 0f 0b eb 85 cc
> RSP: 0018:ffffc9000d35fc60 EFLAGS: 00010286
> RAX: 00000000ffffffff RBX: ffff8883b7383740 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc9000d35fc78 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff8883b7383770
> R13: ffff8883b7380040 R14: ffff8883b7380000 R15: 0000000000000000
> FS: 00007f2033aef800(0000) GS:ffff88bf0f300000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fea708bae00 CR3: 000000042bf7e005 CR4: 0000000000770ef0
> PKRU: 55555554
> Call Trace:
> <TASK>
> ? show_regs+0x6c/0x80
> ? __warn+0xa4/0x1c0
> ? rcu_sync_dtor+0x96/0xb0
> ? report_bug+0x1bc/0x1f0
> ? handle_bug+0x46/0x90
> ? exc_invalid_op+0x18/0x50
> ? asm_exc_invalid_op+0x1b/0x20
> ? rcu_sync_dtor+0x96/0xb0
> percpu_free_rwsem+0x2a/0x60
> bch2_fs_release+0x131/0x340
> kobject_put+0x103/0x250
> bch2_fs_free+0x144/0x190
> bch2_kill_sb+0x50/0x70
> deactivate_locked_super+0x69/0x110
> deactivate_super+0x64/0x80
> cleanup_mnt+0x141/0x220
> __cleanup_mnt+0x12/0x20
> task_work_run+0x10b/0x190
> ? __pfx_task_work_run+0x10/0x10
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? __x64_sys_umount+0xff/0x110
> exit_to_user_mode_prepare+0x169/0x190
> syscall_exit_to_user_mode+0x28/0x60
> do_syscall_64+0x6b/0xf0
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? syscall_exit_to_user_mode+0x36/0x60
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? do_syscall_64+0x6b/0xf0
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? irqentry_exit_to_user_mode+0x17/0x20
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? irqentry_exit+0x43/0x50
> ? srso_alias_return_thunk+0x5/0xfbef5
> ? sysvec_call_function+0x48/0xd0
> entry_SYSCALL_64_after_hwframe+0x6c/0x74
> RIP: 0033:0x7f203391ee5b
> Code: c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 f3 0f 1e fa 31 f6
> e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d
> 00 f0 ff ff 77 05 c3 0f 1f 40 00 48 8b 15 89 6f 0d 00 f7 d8
> RSP: 002b:00007ffcadb990e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 0000560145c5a5c0 RCX: 00007f203391ee5b
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000560145c5e820
> RBP: 0000560145c5a6d8 R08: 0000000000000073 R09: 00007ffcadb98031
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000560145c5e820 R14: 0000560145c5e7f0 R15: 0000560145c5a5c0
> </TASK>
> -- 
> Daniel J Blueman
