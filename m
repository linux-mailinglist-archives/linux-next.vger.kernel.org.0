Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16987D8D59
	for <lists+linux-next@lfdr.de>; Fri, 27 Oct 2023 05:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjJ0DOI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Oct 2023 23:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJ0DOG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Oct 2023 23:14:06 -0400
X-Greylist: delayed 31099 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Oct 2023 20:14:04 PDT
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57353192
        for <linux-next@vger.kernel.org>; Thu, 26 Oct 2023 20:14:04 -0700 (PDT)
Date:   Thu, 26 Oct 2023 23:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1698376442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CbMorbQVwFRre8b9OrSrVHjRrCPalqwbSn1gKiEYWf0=;
        b=i4hxtFhbdg+K/Du15hotGG9gEkB80Dml2N1BSksDEqGzKE1FERxnJ4gWmH+KfbR+B+r2cZ
        /4CvnavT1bRkgMUI0eKGvzmfAAg8GlzUYMmRcAc5CjXrWIBg9ozMu64r80a0m5SfpppH15
        FQr5+KW5CNxh+rMmuwxvqdgi7kAB+4Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     rcu@vger.kernel.org, linux-bcachefs@vger.kernel.org,
        linux-next@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
Subject: Re: bcachefs RCU warnings
Message-ID: <20231027031358.fw6goxp3b6gfapwm@moria.home.lan>
References: <CAMVG2su2RvAaTAyj8kFtUZcRfcZuKncxqhL3h-Ag8JQeSR=jxw@mail.gmail.com>
 <20231025180845.sq6tpl6c4hefdbg7@moria.home.lan>
 <5a94d7fd-9e0a-4e3b-b95c-23e5c77bfee1@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a94d7fd-9e0a-4e3b-b95c-23e5c77bfee1@paulmck-laptop>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 26, 2023 at 07:35:56PM -0700, Paul E. McKenney wrote:
> On Wed, Oct 25, 2023 at 02:08:45PM -0400, Kent Overstreet wrote:
> > Hey Paul, RCU folks :)
> > 
> > I've got no idea what these warnings mean and haven't seen them before,
> > do you suppose one of you could point me in the right direction?
> > 
> > On Wed, Oct 25, 2023 at 09:28:09PM +0800, Daniel J Blueman wrote:
> > > Hi Kent et al,
> > > 
> > > On 6.6.0-rc7-next-20231024 with my bcachefs exerciser [1], I was able
> > > to reproduce three related kernel warnings due to RCU grace period
> > > counts being zero, ie WARN_ON_ONCE(READ_ONCE(rsp->gp_count) == 0).
> > > 
> > > If this is something of interest, I'll find a minimal reproducer.
> > > These warnings aside, bcachefs is looking really solid.
> > > 
> > > Thanks,
> > >   Daniel
> > > 
> > > -- [1] https://github.com/dblueman/bcachefs-gym
> > > 
> > > -- [2]
> > > 
> > > WARNING: CPU: 15 PID: 259240 at kernel/rcu/sync.c:171 rcu_sync_exit+0xe3/0xf0
> 
> The usual cause would be mismatched rcu_sync_enter() and rcu_sync_exit(),
> as in one more rcu_sync_exit() than rcu_sync_enter()...
> 
> > > Modules linked in: brd tls cfg80211 intel_rapl_msr intel_rapl_common
> > > amd64_edac edac_mce_amd kvm_amd binfmt_misc kvm irqbypass ipmi_ssif
> > > rapl wmi_bmof nls_iso8859_1 ccp ptdma k10temp acpi_ipmi ipmi_si
> > > ipmi_devintf ipmi_msghandler input_leds joydev mac_hid efi_pstore
> > > dmi_sysfs ip_tables x_tables autofs4 rndis_host cdc_ether usbnet m
> > > ii btrfs blake2b_generic hid_generic usbhid raid10 hid raid456
> > > async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0
> > > multipath linear crct10dif_pclmul crc32_pclmul ast polyval_clmulni
> > > polyval_generic i2c_algo_bit ghash_clmulni_intel drm_shmem_helper
> > > sha512_ssse3 drm_kms_helper sha256_ssse3 sha1_ssse3 nvme ahci drm
> > > nvme_core tg3 l
> > > ibahci xhci_pci i2c_piix4 xhci_pci_renesas wmi aesni_intel crypto_simd
> > > cryptd [last unloaded: brd]
> > > CPU: 15 PID: 259240 Comm: bch-data/3edb8b Tainted: G W
> > > 6.6.0-rc7-next-20231024 #1
> > > Hardware name: Supermicro AS -3014TS-i/H12SSL-i, BIOS 2.5 09/08/2022
> > > RIP: 0010:rcu_sync_exit+0xe3/0xf0
> > > Code: c6 e0 06 c7 b2 e8 dd 0e 01 00 4c 89 e7 e8 b5 54 91 01 5b 41 5c
> > > 41 5d 5d 31 c0 31 f6 31 ff e9 8f 35 a9 01 0f 0b e9 3d ff ff ff <0f> 0b
> > > e9 4d ff ff ff 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90
> > > RSP: 0018:ffffc90024127b60 EFLAGS: 00010246
> > > RAX: 0000000000000000 RBX: ffff8883b7383740 RCX: 0000000000000000
> > > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > > RBP: ffffc90024127b78 R08: 0000000000000000 R09: 0000000000000000
> > > R10: 0000000000000000 R11: 0000000000000000 R12: ffff8883b7383798
> > > R13: ffff8883b7383744 R14: ffff8883b7383740 R15: ffff8883b7380498
> > > FS: 0000000000000000(0000) GS:ffff88bf0e780000(0000) knlGS:0000000000000000
> > > CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00007fea708bae00 CR3: 000000034b860003 CR4: 0000000000770ef0
> > > PKRU: 55555554
> > > Call Trace:
> > > <TASK>
> > > ? show_regs+0x6c/0x80
> > > ? __warn+0xa4/0x1c0
> > > ? rcu_sync_exit+0xe3/0xf0
> > > ? report_bug+0x1bc/0x1f0
> > > ? handle_bug+0x46/0x90
> > > ? exc_invalid_op+0x18/0x50
> > > ? asm_exc_invalid_op+0x1b/0x20
> > > ? rcu_sync_exit+0xe3/0xf0
> > > percpu_up_write+0x4d/0x60
> 
> ...correspond to one more percpu_up_write() than percpu_down_write().
> 
> If it is possible to reproduce this easily, one way to get more
> information would be to run with lockdep.

Thanks, that was exactly it :)

Daniel, the fix is in my -testing branch (and will shortly be in
master), can you confirm?
