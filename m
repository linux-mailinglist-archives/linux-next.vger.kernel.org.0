Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D22C7D6D19
	for <lists+linux-next@lfdr.de>; Wed, 25 Oct 2023 15:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbjJYN2Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Oct 2023 09:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbjJYN2Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Oct 2023 09:28:24 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F64F133
        for <linux-next@vger.kernel.org>; Wed, 25 Oct 2023 06:28:22 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso8911323a12.2
        for <linux-next@vger.kernel.org>; Wed, 25 Oct 2023 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1698240500; x=1698845300; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tbd0adpM40BLzQdImZJeJGGivejpf0oJIMJjFweoWA0=;
        b=nYYcq2qGyRBd0smIOqatl2fBsyEFx1/DyqNngiRFBvggn0ahAxyISgqo45f8PwRMY4
         0GgNof8is+yciYr28uB1RXllgKfSpVGdDvNw+1XA5VOCvpGAEr+/n5tEbA058CuX8jEO
         LcNEPqrIaAGNIpEEo3OTRkO3ayRiX2Ryvup5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698240500; x=1698845300;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbd0adpM40BLzQdImZJeJGGivejpf0oJIMJjFweoWA0=;
        b=bkMYn9SX6bs3wIKhSZkII2JZABsq45Ni0yV/0d4haO3UOoCXtRr4t8xyyD6piQcwU9
         hwQpcuf6caqW1OtWk/on1D8aw1hYSdQPUZxnOaB5JdljQ5u2+h96oBka87oiHLICZzBu
         p3qLqJ7wqZ34Xuz03SSqv63REBk6u2ZErU4IXTfZg4bgRvIPouf0J805aQzcMI7XKFqp
         Y13WTTpMHOEUHFp9G5/29pX1qm7aUXnXfgUNWFQEWE8n1IkANirNYcdVsXkNgSl+xbKo
         6wBTSUjssvZf1YXOYe7A6R+81cfV0QWDmfivvRJmwIpq4P/6vLu7cPLMzYhhdhWR0LUB
         suUw==
X-Gm-Message-State: AOJu0YxpUN0l3bzE82pmOuxV/5z1iy/MPcN3exHFaq3XTY6ZtI4ZrXU7
        ZvICMEz/ZYj7jeSZuuJw44XLgGMAgNQdiY2uGlWRFG0cjcyxeLhRRRKaeA==
X-Google-Smtp-Source: AGHT+IHoi6pgGn9m0l1U1JhmrJqSAJjB9VwYZBf/+LuOJZoeSjmTSZjPglkjsEH7PunJoLIIWrwtPltmw7iUzc8ploc=
X-Received: by 2002:a05:6402:4305:b0:53e:7ec9:753d with SMTP id
 m5-20020a056402430500b0053e7ec9753dmr11370122edc.27.1698240500494; Wed, 25
 Oct 2023 06:28:20 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel J Blueman <daniel@quora.org>
Date:   Wed, 25 Oct 2023 21:28:09 +0800
Message-ID: <CAMVG2su2RvAaTAyj8kFtUZcRfcZuKncxqhL3h-Ag8JQeSR=jxw@mail.gmail.com>
Subject: bcachefs RCU warnings
To:     linux-bcachefs@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kent et al,

On 6.6.0-rc7-next-20231024 with my bcachefs exerciser [1], I was able
to reproduce three related kernel warnings due to RCU grace period
counts being zero, ie WARN_ON_ONCE(READ_ONCE(rsp->gp_count) == 0).

If this is something of interest, I'll find a minimal reproducer.
These warnings aside, bcachefs is looking really solid.

Thanks,
  Daniel

-- [1] https://github.com/dblueman/bcachefs-gym

-- [2]

WARNING: CPU: 15 PID: 259240 at kernel/rcu/sync.c:171 rcu_sync_exit+0xe3/0xf0
Modules linked in: brd tls cfg80211 intel_rapl_msr intel_rapl_common
amd64_edac edac_mce_amd kvm_amd binfmt_misc kvm irqbypass ipmi_ssif
rapl wmi_bmof nls_iso8859_1 ccp ptdma k10temp acpi_ipmi ipmi_si
ipmi_devintf ipmi_msghandler input_leds joydev mac_hid efi_pstore
dmi_sysfs ip_tables x_tables autofs4 rndis_host cdc_ether usbnet m
ii btrfs blake2b_generic hid_generic usbhid raid10 hid raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0
multipath linear crct10dif_pclmul crc32_pclmul ast polyval_clmulni
polyval_generic i2c_algo_bit ghash_clmulni_intel drm_shmem_helper
sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 nvme ahci drm
nvme_core tg3 l
ibahci xhci_pci i2c_piix4 xhci_pci_renesas wmi aesni_intel crypto_simd
cryptd [last unloaded: brd]
CPU: 15 PID: 259240 Comm: bch-data/3edb8b Tainted: G W
6.6.0-rc7-next-20231024 #1
Hardware name: Supermicro AS -3014TS-i/H12SSL-i, BIOS 2.5 09/08/2022
RIP: 0010:rcu_sync_exit+0xe3/0xf0
Code: c6 e0 06 c7 b2 e8 dd 0e 01 00 4c 89 e7 e8 b5 54 91 01 5b 41 5c
41 5d 5d 31 c0 31 f6 31 ff e9 8f 35 a9 01 0f 0b e9 3d ff ff ff <0f> 0b
e9 4d ff ff ff 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90024127b60 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8883b7383740 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90024127b78 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8883b7383798
R13: ffff8883b7383744 R14: ffff8883b7383740 R15: ffff8883b7380498
FS: 0000000000000000(0000) GS:ffff88bf0e780000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fea708bae00 CR3: 000000034b860003 CR4: 0000000000770ef0
PKRU: 55555554
Call Trace:
<TASK>
? show_regs+0x6c/0x80
? __warn+0xa4/0x1c0
? rcu_sync_exit+0xe3/0xf0
? report_bug+0x1bc/0x1f0
? handle_bug+0x46/0x90
? exc_invalid_op+0x18/0x50
? asm_exc_invalid_op+0x1b/0x20
? rcu_sync_exit+0xe3/0xf0
percpu_up_write+0x4d/0x60
bch2_replicas_gc_end+0x60/0x110
bch2_journal_flush_device_pins+0x2d7/0x4b0
? __entry_text_end+0x102619/0x10261d
? __pfx_bch2_journal_flush_device_pins+0x10/0x10
? __pfx_scnprintf+0x10/0x10
? srso_alias_return_thunk+0x5/0xfbef5
? raw_spin_rq_unlock+0x17/0x70
? srso_alias_return_thunk+0x5/0xfbef5
? finish_task_switch.isra.0+0xc1/0x410
? __switch_to+0x281/0x6d0
bch2_data_job+0x1fb/0x500
? __pfx_bch2_data_job+0x10/0x10
? srso_alias_return_thunk+0x5/0xfbef5
? try_to_wake_up+0x4b1/0xca0
? srso_alias_return_thunk+0x5/0xfbef5
? __pfx_bch2_data_thread+0x10/0x10
bch2_data_thread+0x60/0xa0
kthread+0x188/0x1d0
? __pfx_kthread+0x10/0x10
ret_from_fork+0x47/0x80
? __pfx_kthread+0x10/0x10
ret_from_fork_asm+0x1a/0x30
</TASK>

WARNING: CPU: 15 PID: 259240 at kernel/rcu/sync.c:129 rcu_sync_enter+0x1d6/0x200
Modules linked in: brd tls cfg80211 intel_rapl_msr intel_rapl_common
amd64_edac edac_mce_amd kvm_amd binfmt_misc kvm irqbypass ipmi_ssif
rapl wmi_bmof nls_iso8859_1 ccp ptdma k10temp acpi_ipmi ipmi_si
ipmi_devintf ipmi_msghandler input_leds joydev mac_hid efi_pstore
dmi_sysfs ip_tables x_tables autofs4 rndis_host cdc_ether usbnet m
ii btrfs blake2b_generic hid_generic usbhid raid10 hid raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0
multipath linear crct10dif_pclmul crc32_pclmul ast polyval_clmulni
polyval_generic i2c_algo_bit ghash_clmulni_intel drm_shmem_helper
sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 nvme ahci drm
nvme_core tg3 l
ibahci xhci_pci i2c_piix4 xhci_pci_renesas wmi aesni_intel crypto_simd
cryptd [last unloaded: brd]
CPU: 15 PID: 259240 Comm: bch-data/3edb8b Tainted: G W
6.6.0-rc7-next-20231024 #1
Hardware name: Supermicro AS -3014TS-i/H12SSL-i, BIOS 2.5 09/08/2022
RIP: 0010:rcu_sync_enter+0x1d6/0x200
Code: 89 ef e8 2d fb f9 ff 48 89 df e8 35 45 3f 00 8b 03 83 f8 01 7e
d8 48 8d b5 68 ff ff ff 4c 89 ef e8 6f c1 f9 ff e9 0b ff ff ff <0f> 0b
4c 89 ff 41 83 c6 01 e8 ec 45 3f 00 44 89 73 04 4c 89 ef e8
RSP: 0018:ffffc90024127b00 EFLAGS: 00010086
RAX: 0000000000000000 RBX: ffff8883b7383740 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90024127bc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff92004824f60
R13: ffff8883b7383748 R14: 00000000ffffffff R15: ffff8883b7383744
FS: 0000000000000000(0000) GS:ffff88bf0e780000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fea708bae00 CR3: 000000034b860003 CR4: 0000000000770ef0
PKRU: 55555554
Call Trace:
<TASK>
? show_regs+0x6c/0x80
? __warn+0xa4/0x1c0
? rcu_sync_enter+0x1d6/0x200
? report_bug+0x1bc/0x1f0
? handle_bug+0x46/0x90
? exc_invalid_op+0x18/0x50
? asm_exc_invalid_op+0x1b/0x20
? rcu_sync_enter+0x1d6/0x200
? __pfx_rcu_sync_enter+0x10/0x10
? srso_alias_return_thunk+0x5/0xfbef5
? __kasan_check_write+0x14/0x30
percpu_down_write+0x2f/0x2b0
? bch2_replicas_gc2+0x122/0x6f0
? srso_alias_return_thunk+0x5/0xfbef5
? __kmalloc+0x61/0xf0
bch2_replicas_gc2+0x155/0x6f0
? __pfx_bch2_replicas_gc2+0x10/0x10
? raw_spin_rq_unlock+0x17/0x70
? finish_task_switch.isra.0+0xc1/0x410
? __switch_to+0x281/0x6d0
bch2_data_job+0x298/0x500
? __pfx_bch2_data_job+0x10/0x10
? srso_alias_return_thunk+0x5/0xfbef5
? try_to_wake_up+0x4b1/0xca0
? srso_alias_return_thunk+0x5/0xfbef5
? __pfx_bch2_data_thread+0x10/0x10
bch2_data_thread+0x60/0xa0
kthread+0x188/0x1d0
? __pfx_kthread+0x10/0x10
ret_from_fork+0x47/0x80
? __pfx_kthread+0x10/0x10
ret_from_fork_asm+0x1a/0x30
</TASK>

WARNING: CPU: 38 PID: 262351 at kernel/rcu/sync.c:193 rcu_sync_dtor+0x96/0xb0
Modules linked in: brd tls cfg80211 intel_rapl_msr intel_rapl_common
amd64_edac edac_mce_amd kvm_amd binfmt_misc kvm irqbypass ipmi_ssif
rapl wmi_bmof nls_iso8859_1 ccp ptdma k10temp acpi_ipmi ipmi_si
ipmi_devintf ipmi_msghandler input_leds joydev mac_hid efi_pstore
dmi_sysfs ip_tables x_tables autofs4 rndis_host cdc_ether usbnet mii
btrfs blake2b_generic hid_generic usbhid raid10 hid raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0
multipath linear crct10dif_pclmul crc32_pclmul ast polyval_clmulni
polyval_generic i2c_algo_bit ghash_clmulni_intel drm_shmem_helper
sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 nvme ahci drm
nvme_core tg3 libahci xhci_pci i2c_piix4 xhci_pci_renesas wmi
aesni_intel crypto_simd cryptd [last unloaded: brd]
CPU: 38 PID: 262351 Comm: umount Tainted: G W 6.6.0-rc7-next-20231024 #1
Hardware name: Supermicro AS -3014TS-i/H12SSL-i, BIOS 2.5 09/08/2022
RIP: 0010:rcu_sync_dtor+0x96/0xb0
Code: e8 4f 44 3f 00 c7 03 03 00 00 00 4c 89 e7 e8 01 54 91 01 e8 fc
80 00 00 48 89 df e8 54 43 3f 00 8b 03 85 c0 74 c8 0f 0b eb c4 <0f> 0b
48 89 df e8 40 43 3f 00 8b 03 83 f8 02 75 89 0f 0b eb 85 cc
RSP: 0018:ffffc9000d35fc60 EFLAGS: 00010286
RAX: 00000000ffffffff RBX: ffff8883b7383740 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000d35fc78 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8883b7383770
R13: ffff8883b7380040 R14: ffff8883b7380000 R15: 0000000000000000
FS: 00007f2033aef800(0000) GS:ffff88bf0f300000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fea708bae00 CR3: 000000042bf7e005 CR4: 0000000000770ef0
PKRU: 55555554
Call Trace:
<TASK>
? show_regs+0x6c/0x80
? __warn+0xa4/0x1c0
? rcu_sync_dtor+0x96/0xb0
? report_bug+0x1bc/0x1f0
? handle_bug+0x46/0x90
? exc_invalid_op+0x18/0x50
? asm_exc_invalid_op+0x1b/0x20
? rcu_sync_dtor+0x96/0xb0
percpu_free_rwsem+0x2a/0x60
bch2_fs_release+0x131/0x340
kobject_put+0x103/0x250
bch2_fs_free+0x144/0x190
bch2_kill_sb+0x50/0x70
deactivate_locked_super+0x69/0x110
deactivate_super+0x64/0x80
cleanup_mnt+0x141/0x220
__cleanup_mnt+0x12/0x20
task_work_run+0x10b/0x190
? __pfx_task_work_run+0x10/0x10
? srso_alias_return_thunk+0x5/0xfbef5
? __x64_sys_umount+0xff/0x110
exit_to_user_mode_prepare+0x169/0x190
syscall_exit_to_user_mode+0x28/0x60
do_syscall_64+0x6b/0xf0
? srso_alias_return_thunk+0x5/0xfbef5
? syscall_exit_to_user_mode+0x36/0x60
? srso_alias_return_thunk+0x5/0xfbef5
? do_syscall_64+0x6b/0xf0
? srso_alias_return_thunk+0x5/0xfbef5
? irqentry_exit_to_user_mode+0x17/0x20
? srso_alias_return_thunk+0x5/0xfbef5
? irqentry_exit+0x43/0x50
? srso_alias_return_thunk+0x5/0xfbef5
? sysvec_call_function+0x48/0xd0
entry_SYSCALL_64_after_hwframe+0x6c/0x74
RIP: 0033:0x7f203391ee5b
Code: c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 f3 0f 1e fa 31 f6
e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d
00 f0 ff ff 77 05 c3 0f 1f 40 00 48 8b 15 89 6f 0d 00 f7 d8
RSP: 002b:00007ffcadb990e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000560145c5a5c0 RCX: 00007f203391ee5b
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000560145c5e820
RBP: 0000560145c5a6d8 R08: 0000000000000073 R09: 00007ffcadb98031
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000560145c5e820 R14: 0000560145c5e7f0 R15: 0000560145c5a5c0
</TASK>
-- 
Daniel J Blueman
