Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC6B3946B9
	for <lists+linux-next@lfdr.de>; Fri, 28 May 2021 19:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbhE1SB2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 May 2021 14:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbhE1SB2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 May 2021 14:01:28 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3E5C061574
        for <linux-next@vger.kernel.org>; Fri, 28 May 2021 10:59:53 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e15so2003652plh.1
        for <linux-next@vger.kernel.org>; Fri, 28 May 2021 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=UFD5nsv+q65bshrjQhnamB8YjPMeQv1fXH6wdUsGCqo=;
        b=GQUiuk8cb1JgjykeGaU7pz7cTh8KkTWrxQcNVSIzI9eS7y9pswC2v06LH/jJ+VF+Gu
         AToH8vXeTXDVbxLFH5OrPaatB+Ew5W1EXai/wvERdtH+k06p8MZqLPUCbLCjqHv62zhg
         cFQ8fXyDVtTN/ohKE4BArEBNhjW0hBgjTtZ4pgVJw4tKL4nHE7Gb2X7S+JsAN9c85D2w
         A7f6lhbXcgaUKnPKZ6VVr8dSrzs5tYfyDmE6SwdAI9uIyT3Sj+OqK8co8SnV6JbOlX5v
         YZNXVEp9M3PLcrktvu9vkq3Rf/Qg7oLynbzBuRThUrqw7p2KYV1Rsud+MOqdKQl8BmTD
         dVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=UFD5nsv+q65bshrjQhnamB8YjPMeQv1fXH6wdUsGCqo=;
        b=eUlNxh/+W4HgQonwJsx1YVrSRUrgL+MYeHwvDYqLrr+86Rzvkx6otBt7dx1tWRujkQ
         WLdaT6nlh3oQQwK9vbMhWOfXy5DyRanjvRF+eysDRo97vBaYW2p7VN8QdWWNclw/srLs
         yxkJXwQFL4PaKYYiy1YDstfCknAaxVDXumifVxVW1M6Glxm0aF2R7jX2SveqHLGDydh5
         9G1IjnivA8INiUSisMOgZ0Fa6jR3eEoxngq02qD8LUPp5+dSEdA8heYwNF5VpvZKGuw1
         Me5uDjIY7K6gyYhU0/HCqE9kgdg+p5pYkS74MkYJOEWPLNFJoaZvXqAEGhd/8pwdGdnn
         3l9A==
X-Gm-Message-State: AOAM530onBpE9Z7bbeqdxjbeDUDs6ArDxonSQaYJZbgBDnxQSylCJYn4
        Gxzk1GUxQ01Vti7qUJy39/M=
X-Google-Smtp-Source: ABdhPJzXvVGrAiSiy9umdu/oprHrG4Bb/49aXBLoFsUITPrmUoeQsg9p/T24zysXjgRHaKlWPwfObw==
X-Received: by 2002:a17:90a:1b8f:: with SMTP id w15mr5621062pjc.101.1622224792779;
        Fri, 28 May 2021 10:59:52 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id u8sm4920262pgg.51.2021.05.28.10.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 10:59:52 -0700 (PDT)
Date:   Sat, 29 May 2021 02:59:47 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     sfr@canb.auug.org.au, nathan@kernel.org
Cc:     linux-next@vger.kernel.org
Subject: OOPs when compiling with clang-11
Message-ID: <20210528175947.GA11557@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Nathan and Stephen Rothwell,
An interesting kernel bug occurred when
compiling with clang-11.

if there's someone to be added as cc, plase add it.

I'm on 5.13.0-rc2-next-20210520,
clang-11 is Ubuntu clang version 11.0.0-2~ubuntu20.04.1

I'll try this on linux next 20210529,
But thought reporting is needed.

It's not clear to me if it's related with kernel or clang yet?
(maybe kernel I think)

dmesg is below:

[ 3526.202270] clang-11: Corrupted page table at address 7f8896d91f48
[ 3526.202282] PGD 8000000111903067 P4D 8000000111903067 PUD 10b325067 PMD =
ffe7a0414d080067
[ 3526.202293] BAD
[ 3526.202297] Bad pagetable: 000d [#1] SMP KASAN PTI
[ 3526.202304] CPU: 0 PID: 10379 Comm: clang-11 Not tainted 5.13.0-rc2-next=
-20210520 #1
[ 3526.202312] Hardware name: LG Electronics                   15U560-GR5PK=
/15U560, BIOS 15UA1730 X64 05/29/2017
[ 3526.202316] RIP: 0033:0x7f889de2433e
[ 3526.202324] Code: c8 cd cc cc cc 45 31 d2 41 b8 ff ff ff 7f 45 31 db 41 =
83 c2 01 44 89 d2 41 89 d2 44 89 c8 44 29 d8 d1 e8 44 01 d8 48 8d 0c 80 <8b=
> 0c cb 44 21 c1 39 f1 77 28 8d 50 01 39 97 c8 00 00 00 0f 84 8c
[ 3526.202331] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 3526.202337] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 3526.202342] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 3526.202347] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3526.202351] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 3526.202355] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 3526.202360] FS:  00007f889802c780 GS:  0000000000000000
[ 3526.202364] Modules linked in: rfcomm xt_nat xt_tcpudp xt_conntrack xt_M=
ASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo xt_addrtype ip=
table_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c bpfilter br_netfilter bridge stp llc ccm cmac algif_hash algif_sk=
cipher overlay af_alg bnep binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi snd=
_hda_codec_conexant snd_hda_codec_generic ledtrig_audio intel_rapl_msr inte=
l_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp i915 iwlmvm kv=
m_intel snd_hda_intel kvm mac80211 snd_intel_dspcfg snd_hda_codec crct10dif=
_pclmul libarc4 btusb crc32_pclmul snd_hwdep uvcvideo snd_hda_core ghash_cl=
mulni_intel hid_generic btrtl mei_hdcp wmi_bmof iwlwifi aesni_intel btbcm c=
rypto_simd videobuf2_vmalloc btintel cryptd videobuf2_memops snd_pcm videob=
uf2_v4l2 rapl videobuf2_common bluetooth videodev snd_seq intel_cstate cfg8=
0211 input_leds joydev usbhid efi_pstore mc i2c_algo_bit at24 hid ecdh_gene=
ric serio_raw ecc snd_timer
[ 3526.202542]  drm_kms_helper snd_seq_device lg_laptop sparse_keymap sysco=
pyarea sysfillrect wmi sysimgblt snd fb_sys_fops cec mei_me rc_core soundco=
re video mei acpi_pad mac_hid intel_xhci_usb_role_switch intel_pch_thermal =
sch_fq_codel drm parport_pc ppdev lp parport ip_tables x_tables autofs4 rts=
x_pci_sdmmc r8169 xhci_pci rtsx_pci realtek i2c_i801 xhci_pci_renesas psmou=
se i2c_smbus ahci libahci
[ 3526.202628] ---[ end trace 1d17d15d3774d69d ]---
[ 3526.315201] RIP: 0033:0x7f889de2433e
[ 3526.315222] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 3526.315230] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 3526.315235] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 3526.315240] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3526.315244] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 3526.315249] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 3526.315254] FS:  00007f889802c780(0000) GS:ffff8881cba00000(0000) knlGS:=
0000000000000000
[ 3526.315260] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3526.315264] CR2: 00007f8896d91f48 CR3: 0000000131634002 CR4: 00000000003=
706f0
[ 3526.329371] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 3526.329382] BUG: KASAN: user-memory-access in lock_page_memcg+0x22/0x140
[ 3526.329399] Read of size 8 at addr 0000088105342008 by task clang-11/103=
79

[ 3526.329417] CPU: 2 PID: 10379 Comm: clang-11 Tainted: G      D          =
 5.13.0-rc2-next-20210520 #1
[ 3526.329430] Hardware name: LG Electronics                   15U560-GR5PK=
/15U560, BIOS 15UA1730 X64 05/29/2017
[ 3526.329436] Call Trace:
[ 3526.329610]  dump_stack_lvl+0x9e/0xd2
[ 3526.329627]  ? lock_page_memcg+0x22/0x140
[ 3526.329637]  kasan_report.cold+0x112/0x117
[ 3526.329815]  ? lock_page_memcg+0x22/0x140
[ 3526.329828]  __asan_load8+0x86/0xa0
[ 3526.329839]  lock_page_memcg+0x22/0x140
[ 3526.330017]  page_remove_rmap+0x25/0x4d0
[ 3526.330033]  zap_huge_pmd+0x22e/0x4e0
[ 3526.330211]  unmap_page_range+0x128a/0x1530
[ 3526.330231]  ? vm_normal_page_pmd+0x220/0x220
[ 3526.330410]  unmap_single_vma+0xc1/0x160
[ 3526.330426]  unmap_vmas+0x105/0x1b0
[ 3526.330436]  ? zap_vma_ptes+0x70/0x70
[ 3526.330617]  ? finish_task_switch.isra.0+0x143/0x3e0
[ 3526.330630]  ? __kasan_check_write+0x14/0x20
[ 3526.330816]  ? invalidate_bh_lrus_cpu+0x5a/0x80
[ 3526.330833]  exit_mmap+0x125/0x320
[ 3526.331010]  ? do_munmap+0x20/0x20
[ 3526.331025]  ? __kasan_check_write+0x14/0x20
[ 3526.331035]  ? mutex_unlock+0x22/0x40
[ 3526.331221]  mmput+0xae/0x1f0
[ 3526.331233]  do_exit+0x5a9/0x1200
[ 3526.331414]  ? kasan_unpoison_task_stack+0x14/0x20
[ 3526.331430]  ? mm_update_next_owner+0x400/0x400
[ 3526.331444]  ? do_user_addr_fault+0x4d8/0x880
[ 3526.331457]  ? fpregs_assert_state_consistent+0x5a/0x70
[ 3526.331473]  ? exit_to_user_mode_prepare+0x37/0x1b0
[ 3526.331491]  rewind_stack_do_exit+0x17/0x20
[ 3526.331507] RIP: 0033:0x7f889de2433e
[ 3526.331517] Code: Unable to access opcode bytes at RIP 0x7f889de24314.
[ 3526.331525] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 3526.331536] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 3526.331710] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 3526.331720] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3526.331729] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 3526.331737] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 3526.331751] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 3526.331760] BUG: unable to handle page fault for address: 00000881053420=
08
[ 3526.331767] #PF: supervisor read access in kernel mode
[ 3526.331776] #PF: error_code(0x0000) - not-present page
[ 3526.331784] PGD 0 P4D 0
[ 3526.331796] Oops: 0000 [#2] SMP KASAN PTI
[ 3526.331807] CPU: 2 PID: 10379 Comm: clang-11 Tainted: G    B D          =
 5.13.0-rc2-next-20210520 #1
[ 3526.331819] Hardware name: LG Electronics                   15U560-GR5PK=
/15U560, BIOS 15UA1730 X64 05/29/2017
[ 3526.331828] RIP: 0010:lock_page_memcg+0x22/0x140
[ 3526.331840] Code: ff ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 =
57 41 56 41 55 41 54 49 89 fc 48 83 c7 08 53 48 83 ec 08 e8 1e 97 fd ff <49=
> 8b 44 24 08 48 8d 50 ff a8 01 4c 0f 45 e2 0f 1f 44 00 00 4d 8d
[ 3526.331853] RSP: 0018:ffff88810d6df970 EFLAGS: 00010286
[ 3526.331864] RAX: 0000000000000001 RBX: ffe7a0414d080067 RCX: ffffffffa96=
f809a
[ 3526.331874] RDX: fffffbfff589a1a1 RSI: 0000000000000246 RDI: ffffffffac6=
70aa0
[ 3526.331882] RBP: ffff88810d6df9a0 R08: 0000000000000001 R09: ffffffffac4=
d0d07
[ 3526.331892] R10: fffffbfff589a1a0 R11: 0000000000000001 R12: 00000881053=
42000
[ 3526.332070] R13: 0000000000000001 R14: 0000088105342000 R15: 00000000000=
00001
[ 3526.332078] FS:  0000000000000000(0000) GS:ffff8881cbb00000(0000) knlGS:=
0000000000000000
[ 3526.332089] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3526.332097] CR2: 0000088105342008 CR3: 0000000116292005 CR4: 00000000003=
706e0
[ 3526.332107] Call Trace:
[ 3526.332115]  page_remove_rmap+0x25/0x4d0
[ 3526.332125]  zap_huge_pmd+0x22e/0x4e0
[ 3526.332307]  unmap_page_range+0x128a/0x1530
[ 3526.332323]  ? vm_normal_page_pmd+0x220/0x220
[ 3526.332504]  unmap_single_vma+0xc1/0x160
[ 3526.332520]  unmap_vmas+0x105/0x1b0
[ 3526.332531]  ? zap_vma_ptes+0x70/0x70
[ 3526.332710]  ? finish_task_switch.isra.0+0x143/0x3e0
[ 3526.332723]  ? __kasan_check_write+0x14/0x20
[ 3526.332735]  ? invalidate_bh_lrus_cpu+0x5a/0x80
[ 3526.332921]  exit_mmap+0x125/0x320
[ 3526.332932]  ? do_munmap+0x20/0x20
[ 3526.333111]  ? __kasan_check_write+0x14/0x20
[ 3526.333126]  ? mutex_unlock+0x22/0x40
[ 3526.333136]  mmput+0xae/0x1f0
[ 3526.333324]  do_exit+0x5a9/0x1200
[ 3526.333335]  ? kasan_unpoison_task_stack+0x14/0x20
[ 3526.333519]  ? mm_update_next_owner+0x400/0x400
[ 3526.333533]  ? do_user_addr_fault+0x4d8/0x880
[ 3526.333540]  ? fpregs_assert_state_consistent+0x5a/0x70
[ 3526.333725]  ? exit_to_user_mode_prepare+0x37/0x1b0
[ 3526.333738]  rewind_stack_do_exit+0x17/0x20
[ 3526.333924] RIP: 0033:0x7f889de2433e
[ 3526.333933] Code: Unable to access opcode bytes at RIP 0x7f889de24314.
[ 3526.333937] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 3526.334118] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 3526.334127] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 3526.334133] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3526.334309] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 3526.334318] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 3526.334332] Modules linked in: rfcomm xt_nat xt_tcpudp xt_conntrack xt_M=
ASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo xt_addrtype ip=
table_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c bpfilter br_netfilter bridge stp llc ccm cmac algif_hash algif_sk=
cipher overlay af_alg bnep binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi snd=
_hda_codec_conexant snd_hda_codec_generic ledtrig_audio intel_rapl_msr inte=
l_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp i915 iwlmvm kv=
m_intel snd_hda_intel kvm mac80211 snd_intel_dspcfg snd_hda_codec crct10dif=
_pclmul libarc4 btusb crc32_pclmul snd_hwdep uvcvideo snd_hda_core ghash_cl=
mulni_intel hid_generic btrtl mei_hdcp wmi_bmof iwlwifi aesni_intel btbcm c=
rypto_simd videobuf2_vmalloc btintel cryptd videobuf2_memops snd_pcm videob=
uf2_v4l2 rapl videobuf2_common bluetooth videodev snd_seq intel_cstate cfg8=
0211 input_leds joydev usbhid efi_pstore mc i2c_algo_bit at24 hid ecdh_gene=
ric serio_raw ecc snd_timer
[ 3526.335315]  drm_kms_helper snd_seq_device lg_laptop sparse_keymap sysco=
pyarea sysfillrect wmi sysimgblt snd fb_sys_fops cec mei_me rc_core soundco=
re video mei acpi_pad mac_hid intel_xhci_usb_role_switch intel_pch_thermal =
sch_fq_codel drm parport_pc ppdev lp parport ip_tables x_tables autofs4 rts=
x_pci_sdmmc r8169 xhci_pci rtsx_pci realtek i2c_i801 xhci_pci_renesas psmou=
se i2c_smbus ahci libahci
[ 3526.335800] CR2: 0000088105342008
[ 3526.335809] ---[ end trace 1d17d15d3774d69e ]---
[ 3526.611787] RIP: 0033:0x7f889de2433e
[ 3526.611967] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 3526.611980] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 3526.611990] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 3526.611997] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3526.612001] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 3526.612176] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 3526.612186] FS:  0000000000000000(0000) GS:ffff8881cbb00000(0000) knlGS:=
0000000000000000
[ 3526.612196] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3526.612204] CR2: 0000088105342008 CR3: 0000000116292005 CR4: 00000000003=
706e0
[ 3526.612210] Fixing recursive fault but reboot is needed!
[ 3996.251760] clang-11: Corrupted page table at address 7f34d759cf48
[ 3996.251792] PGD 800000012a69c067 P4D 800000012a69c067 PUD 113e1c067 PMD =
ffe7a04311540067
[ 3996.251803] BAD
[ 3996.251808] Bad pagetable: 000d [#3] SMP KASAN PTI
[ 3996.251815] CPU: 1 PID: 11000 Comm: clang-11 Tainted: G    B D          =
 5.13.0-rc2-next-20210520 #1
[ 3996.251823] Hardware name: LG Electronics                   15U560-GR5PK=
/15U560, BIOS 15UA1730 X64 05/29/2017
[ 3996.251828] RIP: 0033:0x7f34de62f33e
[ 3996.251835] Code: c8 cd cc cc cc 45 31 d2 41 b8 ff ff ff 7f 45 31 db 41 =
83 c2 01 44 89 d2 41 89 d2 44 89 c8 44 29 d8 d1 e8 44 01 d8 48 8d 0c 80 <8b=
> 0c cb 44 21 c1 39 f1 77 28 8d 50 01 39 97 c8 00 00 00 0f 84 8c
[ 3996.251842] RSP: 002b:00007ffced89c910 EFLAGS: 00010202
[ 3996.251849] RAX: 000000000000fffb RBX: 00007f34d731d010 RCX: 00000000000=
4ffe7
[ 3996.251854] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000020=
b81e0
[ 3996.251859] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3996.251863] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffced8=
9cc00
[ 3996.251868] R13: 000000008063d59f R14: 00007ffced89cbd0 R15: 00007ffced8=
9cc00
[ 3996.251873] FS:  00007f34d8837780 GS:  0000000000000000
[ 3996.251877] Modules linked in: rfcomm xt_nat xt_tcpudp xt_conntrack xt_M=
ASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo xt_addrtype ip=
table_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c bpfilter br_netfilter bridge stp llc ccm cmac algif_hash algif_sk=
cipher overlay af_alg bnep binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi snd=
_hda_codec_conexant snd_hda_codec_generic ledtrig_audio intel_rapl_msr inte=
l_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp i915 iwlmvm kv=
m_intel snd_hda_intel kvm mac80211 snd_intel_dspcfg snd_hda_codec crct10dif=
_pclmul libarc4 btusb crc32_pclmul snd_hwdep uvcvideo snd_hda_core ghash_cl=
mulni_intel hid_generic btrtl mei_hdcp wmi_bmof iwlwifi aesni_intel btbcm c=
rypto_simd videobuf2_vmalloc btintel cryptd videobuf2_memops snd_pcm videob=
uf2_v4l2 rapl videobuf2_common bluetooth videodev snd_seq intel_cstate cfg8=
0211 input_leds joydev usbhid efi_pstore mc i2c_algo_bit at24 hid ecdh_gene=
ric serio_raw ecc snd_timer
[ 3996.252070]  drm_kms_helper snd_seq_device lg_laptop sparse_keymap sysco=
pyarea sysfillrect wmi sysimgblt snd fb_sys_fops cec mei_me rc_core soundco=
re video mei acpi_pad mac_hid intel_xhci_usb_role_switch intel_pch_thermal =
sch_fq_codel drm parport_pc ppdev lp parport ip_tables x_tables autofs4 rts=
x_pci_sdmmc r8169 xhci_pci rtsx_pci realtek i2c_i801 xhci_pci_renesas psmou=
se i2c_smbus ahci libahci
[ 3996.252156] ---[ end trace 1d17d15d3774d69f ]---
[ 3996.365591] RIP: 0033:0x7f889de2433e
[ 3996.365612] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 3996.365620] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 3996.365625] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 3996.365629] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3996.365634] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 3996.365638] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 3996.365644] FS:  00007f34d8837780(0000) GS:ffff8881cba80000(0000) knlGS:=
0000000000000000
[ 3996.365649] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3996.365654] CR2: 00007f34d759cf48 CR3: 0000000110a92005 CR4: 00000000003=
706e0
[ 3996.377863] BUG: unable to handle page fault for address: 000008810c4550=
08
[ 3996.377877] #PF: supervisor read access in kernel mode
[ 3996.377882] #PF: error_code(0x0000) - not-present page
[ 3996.377887] PGD 0 P4D 0
[ 3996.377899] Oops: 0000 [#4] SMP KASAN PTI
[ 3996.378081] CPU: 2 PID: 11000 Comm: clang-11 Tainted: G    B D          =
 5.13.0-rc2-next-20210520 #1
[ 3996.378091] Hardware name: LG Electronics                   15U560-GR5PK=
/15U560, BIOS 15UA1730 X64 05/29/2017
[ 3996.378095] RIP: 0010:lock_page_memcg+0x22/0x140
[ 3996.378110] Code: ff ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 =
57 41 56 41 55 41 54 49 89 fc 48 83 c7 08 53 48 83 ec 08 e8 1e 97 fd ff <49=
> 8b 44 24 08 48 8d 50 ff a8 01 4c 0f 45 e2 0f 1f 44 00 00 4d 8d
[ 3996.378292] RSP: 0018:ffff888128f9f970 EFLAGS: 00010286
[ 3996.378299] RAX: 0000000000000000 RBX: ffe7a04311540067 RCX: ffffffffa9a=
df5b2
[ 3996.378307] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 000008810c4=
55008
[ 3996.378315] RBP: ffff888128f9f9a0 R08: 0000000000000001 R09: ffff888113e=
1c5d7
[ 3996.378492] R10: ffffed10227c38ba R11: 0000000000000001 R12: 000008810c4=
55000
[ 3996.378498] R13: 0000000000000001 R14: 000008810c455000 R15: 00000000000=
00001
[ 3996.378503] FS:  0000000000000000(0000) GS:ffff8881cbb00000(0000) knlGS:=
0000000000000000
[ 3996.378509] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3996.378517] CR2: 000008810c455008 CR3: 0000000118614002 CR4: 00000000003=
706e0
[ 3996.378525] Call Trace:
[ 3996.378707]  page_remove_rmap+0x25/0x4d0
[ 3996.378718]  zap_huge_pmd+0x22e/0x4e0
[ 3996.378730]  unmap_page_range+0x128a/0x1530
[ 3996.378914]  ? switch_mm_irqs_off+0x30c/0x5c0
[ 3996.378927]  ? vm_normal_page_pmd+0x220/0x220
[ 3996.378935]  ? __kasan_check_write+0x14/0x20
[ 3996.379116]  ? tlb_finish_mmu+0x17e/0x350
[ 3996.379132]  unmap_single_vma+0xc1/0x160
[ 3996.379150]  unmap_vmas+0x105/0x1b0
[ 3996.379164]  ? zap_vma_ptes+0x70/0x70
[ 3996.379175]  ? finish_task_switch.isra.0+0x143/0x3e0
[ 3996.379187]  ? __kasan_check_write+0x14/0x20
[ 3996.379371]  ? invalidate_bh_lrus_cpu+0x5a/0x80
[ 3996.379395]  exit_mmap+0x125/0x320
[ 3996.379451]  ? do_munmap+0x20/0x20
[ 3996.379465]  ? __kasan_check_write+0x14/0x20
[ 3996.379479]  ? mutex_unlock+0x22/0x40
[ 3996.379663]  mmput+0xae/0x1f0
[ 3996.379671]  do_exit+0x5a9/0x1200
[ 3996.379682]  ? kasan_unpoison_task_stack+0x14/0x20
[ 3996.379867]  ? mm_update_next_owner+0x400/0x400
[ 3996.379881]  ? do_user_addr_fault+0x4d8/0x880
[ 3996.379891]  ? __kasan_check_read+0x11/0x20
[ 3996.379899]  ? fpregs_assert_state_consistent+0x5a/0x70
[ 3996.379909]  ? exit_to_user_mode_prepare+0x37/0x1b0
[ 3996.380091]  rewind_stack_do_exit+0x17/0x20
[ 3996.380104] RIP: 0033:0x7f34de62f33e
[ 3996.380109] Code: Unable to access opcode bytes at RIP 0x7f34de62f314.
[ 3996.380116] RSP: 002b:00007ffced89c910 EFLAGS: 00010202
[ 3996.380295] RAX: 000000000000fffb RBX: 00007f34d731d010 RCX: 00000000000=
4ffe7
[ 3996.380304] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000020=
b81e0
[ 3996.380309] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3996.380317] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffced8=
9cc00
[ 3996.380493] R13: 000000008063d59f R14: 00007ffced89cbd0 R15: 00007ffced8=
9cc00
[ 3996.380505] Modules linked in: rfcomm xt_nat xt_tcpudp xt_conntrack xt_M=
ASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo xt_addrtype ip=
table_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c bpfilter br_netfilter bridge stp llc ccm cmac algif_hash algif_sk=
cipher overlay af_alg bnep binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi snd=
_hda_codec_conexant snd_hda_codec_generic ledtrig_audio intel_rapl_msr inte=
l_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp i915 iwlmvm kv=
m_intel snd_hda_intel kvm mac80211 snd_intel_dspcfg snd_hda_codec crct10dif=
_pclmul libarc4 btusb crc32_pclmul snd_hwdep uvcvideo snd_hda_core ghash_cl=
mulni_intel hid_generic btrtl mei_hdcp wmi_bmof iwlwifi aesni_intel btbcm c=
rypto_simd videobuf2_vmalloc btintel cryptd videobuf2_memops snd_pcm videob=
uf2_v4l2 rapl videobuf2_common bluetooth videodev snd_seq intel_cstate cfg8=
0211 input_leds joydev usbhid efi_pstore mc i2c_algo_bit at24 hid ecdh_gene=
ric serio_raw ecc snd_timer
[ 3996.382498]  drm_kms_helper snd_seq_device lg_laptop sparse_keymap sysco=
pyarea sysfillrect wmi sysimgblt snd fb_sys_fops cec mei_me rc_core soundco=
re video mei acpi_pad mac_hid intel_xhci_usb_role_switch intel_pch_thermal =
sch_fq_codel drm parport_pc ppdev lp parport ip_tables x_tables autofs4 rts=
x_pci_sdmmc r8169 xhci_pci rtsx_pci realtek i2c_i801 xhci_pci_renesas psmou=
se i2c_smbus ahci libahci
[ 3996.383145] CR2: 000008810c455008
[ 3996.383324] ---[ end trace 1d17d15d3774d6a0 ]---
[ 3996.611336] RIP: 0033:0x7f889de2433e
[ 3996.611523] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 3996.611531] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 3996.611539] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 3996.611546] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 3996.611729] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 3996.611737] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 3996.611745] FS:  0000000000000000(0000) GS:ffff8881cbb00000(0000) knlGS:=
0000000000000000
[ 3996.611751] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3996.611755] CR2: 000008810c455008 CR3: 0000000118614002 CR4: 00000000003=
706e0
[ 3996.611761] Fixing recursive fault but reboot is needed!
[ 4025.769018] clang-11: Corrupted page table at address 7f1b42642f48
[ 4025.769030] PGD 8000000106d24067 P4D 8000000106d24067 PUD 110e83067 PMD =
ffe7a01818dc0067
[ 4025.769041] BAD
[ 4025.769045] Bad pagetable: 000d [#5] SMP KASAN PTI
[ 4025.769053] CPU: 0 PID: 11479 Comm: clang-11 Tainted: G    B D          =
 5.13.0-rc2-next-20210520 #1
[ 4025.769060] Hardware name: LG Electronics                   15U560-GR5PK=
/15U560, BIOS 15UA1730 X64 05/29/2017
[ 4025.769065] RIP: 0033:0x7f1b496d533e
[ 4025.769073] Code: c8 cd cc cc cc 45 31 d2 41 b8 ff ff ff 7f 45 31 db 41 =
83 c2 01 44 89 d2 41 89 d2 44 89 c8 44 29 d8 d1 e8 44 01 d8 48 8d 0c 80 <8b=
> 0c cb 44 21 c1 39 f1 77 28 8d 50 01 39 97 c8 00 00 00 0f 84 8c
[ 4025.769079] RSP: 002b:00007ffdbefe13f0 EFLAGS: 00010202
[ 4025.769086] RAX: 000000000000fffb RBX: 00007f1b423c3010 RCX: 00000000000=
4ffe7
[ 4025.769091] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 0000000001e=
211e0
[ 4025.769096] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 4025.769100] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffdbef=
e16e0
[ 4025.769104] R13: 000000008063d59f R14: 00007ffdbefe16b0 R15: 00007ffdbef=
e16e0
[ 4025.769109] FS:  00007f1b438dd780 GS:  0000000000000000
[ 4025.769113] Modules linked in: rfcomm xt_nat xt_tcpudp xt_conntrack xt_M=
ASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo xt_addrtype ip=
table_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c bpfilter br_netfilter bridge stp llc ccm cmac algif_hash algif_sk=
cipher overlay af_alg bnep binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi snd=
_hda_codec_conexant snd_hda_codec_generic ledtrig_audio intel_rapl_msr inte=
l_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp i915 iwlmvm kv=
m_intel snd_hda_intel kvm mac80211 snd_intel_dspcfg snd_hda_codec crct10dif=
_pclmul libarc4 btusb crc32_pclmul snd_hwdep uvcvideo snd_hda_core ghash_cl=
mulni_intel hid_generic btrtl mei_hdcp wmi_bmof iwlwifi aesni_intel btbcm c=
rypto_simd videobuf2_vmalloc btintel cryptd videobuf2_memops snd_pcm videob=
uf2_v4l2 rapl videobuf2_common bluetooth videodev snd_seq intel_cstate cfg8=
0211 input_leds joydev usbhid efi_pstore mc i2c_algo_bit at24 hid ecdh_gene=
ric serio_raw ecc snd_timer
[ 4025.769290]  drm_kms_helper snd_seq_device lg_laptop sparse_keymap sysco=
pyarea sysfillrect wmi sysimgblt snd fb_sys_fops cec mei_me rc_core soundco=
re video mei acpi_pad mac_hid intel_xhci_usb_role_switch intel_pch_thermal =
sch_fq_codel drm parport_pc ppdev lp parport ip_tables x_tables autofs4 rts=
x_pci_sdmmc r8169 xhci_pci rtsx_pci realtek i2c_i801 xhci_pci_renesas psmou=
se i2c_smbus ahci libahci
[ 4025.769377] ---[ end trace 1d17d15d3774d6a1 ]---
[ 4025.876881] RIP: 0033:0x7f889de2433e
[ 4025.876904] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 4025.876915] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 4025.876922] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 4025.876929] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 4025.876936] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 4025.876943] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 4025.876951] FS:  00007f1b438dd780(0000) GS:ffff8881cba00000(0000) knlGS:=
0000000000000000
[ 4025.876960] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4025.876967] CR2: 00007f1b42642f48 CR3: 000000011bf94003 CR4: 00000000003=
706f0
[ 4025.892281] BUG: unable to handle page fault for address: 0000088060bbb0=
08
[ 4025.892290] #PF: supervisor read access in kernel mode
[ 4025.892295] #PF: error_code(0x0000) - not-present page
[ 4025.892300] PGD 0 P4D 0
[ 4025.892307] Oops: 0000 [#6] SMP KASAN PTI
[ 4025.892314] CPU: 2 PID: 11479 Comm: clang-11 Tainted: G    B D          =
 5.13.0-rc2-next-20210520 #1
[ 4025.892321] Hardware name: LG Electronics                   15U560-GR5PK=
/15U560, BIOS 15UA1730 X64 05/29/2017
[ 4025.892327] RIP: 0010:lock_page_memcg+0x22/0x140
[ 4025.892337] Code: ff ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 =
57 41 56 41 55 41 54 49 89 fc 48 83 c7 08 53 48 83 ec 08 e8 1e 97 fd ff <49=
> 8b 44 24 08 48 8d 50 ff a8 01 4c 0f 45 e2 0f 1f 44 00 00 4d 8d
[ 4025.892343] RSP: 0018:ffff88810531f970 EFLAGS: 00010286
[ 4025.892350] RAX: 0000000000000000 RBX: ffe7a0182eec0067 RCX: ffffffffa9a=
df5b2
[ 4025.892355] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000088060b=
bb008
[ 4025.892359] RBP: ffff88810531f9a0 R08: 0000000000000001 R09: ffff888110e=
83097
[ 4025.892364] R10: ffffed10221d0612 R11: 0000000000000001 R12: 0000088060b=
bb000
[ 4025.892369] R13: 0000000000000001 R14: 0000088060bbb000 R15: 00000000000=
00001
[ 4025.892373] FS:  0000000000000000(0000) GS:ffff8881cbb00000(0000) knlGS:=
0000000000000000
[ 4025.892379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4025.892384] CR2: 0000088060bbb008 CR3: 000000011279c001 CR4: 00000000003=
706e0
[ 4025.892389] Call Trace:
[ 4025.892394]  page_remove_rmap+0x25/0x4d0
[ 4025.892404]  zap_huge_pmd+0x22e/0x4e0
[ 4025.892412]  unmap_page_range+0x128a/0x1530
[ 4025.892423]  ? vm_normal_page_pmd+0x220/0x220
[ 4025.892432]  unmap_single_vma+0xc1/0x160
[ 4025.892440]  unmap_vmas+0x105/0x1b0
[ 4025.892447]  ? zap_vma_ptes+0x70/0x70
[ 4025.892454]  ? finish_task_switch.isra.0+0x143/0x3e0
[ 4025.892461]  ? __kasan_check_write+0x14/0x20
[ 4025.892470]  ? invalidate_bh_lrus_cpu+0x5a/0x80
[ 4025.892479]  exit_mmap+0x125/0x320
[ 4025.892486]  ? do_munmap+0x20/0x20
[ 4025.892493]  ? __kasan_check_write+0x14/0x20
[ 4025.892501]  ? mutex_unlock+0x22/0x40
[ 4025.892510]  mmput+0xae/0x1f0
[ 4025.892519]  do_exit+0x5a9/0x1200
[ 4025.892525]  ? kasan_unpoison_task_stack+0x14/0x20
[ 4025.892534]  ? mm_update_next_owner+0x400/0x400
[ 4025.892541]  ? do_user_addr_fault+0x4d8/0x880
[ 4025.892548]  ? fpregs_assert_state_consistent+0x5a/0x70
[ 4025.892557]  ? exit_to_user_mode_prepare+0x37/0x1b0
[ 4025.892566]  rewind_stack_do_exit+0x17/0x20
[ 4025.892575] RIP: 0033:0x7f1b496d533e
[ 4025.892580] Code: Unable to access opcode bytes at RIP 0x7f1b496d5314.
[ 4025.892584] RSP: 002b:00007ffdbefe13f0 EFLAGS: 00010202
[ 4025.892590] RAX: 000000000000fffb RBX: 00007f1b423c3010 RCX: 00000000000=
4ffe7
[ 4025.892595] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 0000000001e=
211e0
[ 4025.892599] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 4025.892604] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffdbef=
e16e0
[ 4025.892608] R13: 000000008063d59f R14: 00007ffdbefe16b0 R15: 00007ffdbef=
e16e0
[ 4025.892787] Modules linked in: rfcomm xt_nat xt_tcpudp xt_conntrack xt_M=
ASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo xt_addrtype ip=
table_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c bpfilter br_netfilter bridge stp llc ccm cmac algif_hash algif_sk=
cipher overlay af_alg bnep binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi snd=
_hda_codec_conexant snd_hda_codec_generic ledtrig_audio intel_rapl_msr inte=
l_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp i915 iwlmvm kv=
m_intel snd_hda_intel kvm mac80211 snd_intel_dspcfg snd_hda_codec crct10dif=
_pclmul libarc4 btusb crc32_pclmul snd_hwdep uvcvideo snd_hda_core ghash_cl=
mulni_intel hid_generic btrtl mei_hdcp wmi_bmof iwlwifi aesni_intel btbcm c=
rypto_simd videobuf2_vmalloc btintel cryptd videobuf2_memops snd_pcm videob=
uf2_v4l2 rapl videobuf2_common bluetooth videodev snd_seq intel_cstate cfg8=
0211 input_leds joydev usbhid efi_pstore mc i2c_algo_bit at24 hid ecdh_gene=
ric serio_raw ecc snd_timer
[ 4025.894295]  drm_kms_helper snd_seq_device lg_laptop sparse_keymap sysco=
pyarea sysfillrect wmi sysimgblt snd fb_sys_fops cec mei_me rc_core soundco=
re video mei acpi_pad mac_hid intel_xhci_usb_role_switch intel_pch_thermal =
sch_fq_codel drm parport_pc ppdev lp parport ip_tables x_tables autofs4 rts=
x_pci_sdmmc r8169 xhci_pci rtsx_pci realtek i2c_i801 xhci_pci_renesas psmou=
se i2c_smbus ahci libahci
[ 4025.894454] CR2: 0000088060bbb008
[ 4025.894463] ---[ end trace 1d17d15d3774d6a2 ]---
[ 4026.239403] RIP: 0033:0x7f889de2433e
[ 4026.239420] RSP: 002b:00007ffd0471d920 EFLAGS: 00010202
[ 4026.239433] RAX: 000000000000fffb RBX: 00007f8896b12010 RCX: 00000000000=
4ffe7
[ 4026.239442] RDX: 0000000000000001 RSI: 000000000063d59f RDI: 00000000006=
301e0
[ 4026.239641] RBP: 000000008063d5a2 R08: 000000007fffffff R09: 00000000000=
1fff7
[ 4026.239651] R10: 0000000000000001 R11: 0000000000000000 R12: 00007ffd047=
1dc10
[ 4026.239660] R13: 000000008063d59f R14: 00007ffd0471dbe0 R15: 00007ffd047=
1dc10
[ 4026.239670] FS:  0000000000000000(0000) GS:ffff8881cbb00000(0000) knlGS:=
0000000000000000
[ 4026.239679] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4026.239880] CR2: 0000088060bbb008 CR3: 000000011279c001 CR4: 00000000003=
706e0
[ 4026.239892] Fixing recursive fault but reboot is needed!

