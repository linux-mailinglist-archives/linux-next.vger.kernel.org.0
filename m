Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61694D4F45
	for <lists+linux-next@lfdr.de>; Thu, 10 Mar 2022 17:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239589AbiCJQai (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Mar 2022 11:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239827AbiCJQai (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2022 11:30:38 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00765C34E
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 08:29:36 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id q19so5146132pgm.6
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RL46p9arwKp3LAXTWDvOJa8Y4E+mRVhY8H0EMezokUk=;
        b=mfBhwZShMUPI9ChnDhVWp8+Mc+rgm5Sov1Ho+dcZ3PKfsLRlkjNVVbxrGQpKTaVRvs
         2BQq849VpkCEs9aRbvsp6naHMlRO8P0o3lEcd4h8ESjW9GQyMHHmXDMssqtm5aQmPp0+
         Khf998hEiS8Xd47jk/b4LVA/6HB9K7bvpyeuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RL46p9arwKp3LAXTWDvOJa8Y4E+mRVhY8H0EMezokUk=;
        b=QC0aSy0RpOKOJoyNOVltVwxCrHMkyJ7RYNm7s8JRYNR5+Ypg00i8WXuRqagPTQqQK9
         9yGN7DOGwVyIkDvzB8QsD2OfBXW2TlIJ/hJYtQLyGkI1FyyQ7gMmtWbxlnsGY+kCnRh+
         3Le2pMdwCOwHah2CuorckBR4iEOQrUez0OvkkRg509aod71+WIwJa529V88uSlRjODE5
         s8pUyA8vPE1wamoU5F5PMF54HxJmRa7mO5NhRsS2MSjtBSaW4wTk53Y59o8q1lNaaBih
         Yvgn3E73VU3g1AvF3rlu8ZYXxvVfS3VNPV0IjMpcJ6P1CnoKlpqFzyTZuGzjJh1pZ8xU
         82WQ==
X-Gm-Message-State: AOAM5301GrLPxF9YF166sWIHAVYl1sddd+e0qdDd7NXr6c7ISyJTwHbv
        mvvRoeJJoxCyw1OP4/accw7UfA==
X-Google-Smtp-Source: ABdhPJysAZW/GhPi58TCaMTmdE9TJ45M4VcC5NgbExKELXZfTLXdWy7gnsV/rHsjrIW86G1xwVmpdg==
X-Received: by 2002:a63:9143:0:b0:37c:ed47:3d28 with SMTP id l64-20020a639143000000b0037ced473d28mr4818635pge.193.1646929776414;
        Thu, 10 Mar 2022 08:29:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j14-20020a056a00174e00b004f776098715sm3140051pfc.68.2022.03.10.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 08:29:36 -0800 (PST)
Date:   Thu, 10 Mar 2022 08:29:34 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Murphy Zhou <jencce.kernel@gmail.com>,
        Hugh Dickins <hughd@google.com>,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux-Next <linux-next@vger.kernel.org>
Subject: Re: linux-next: panic on 20220307 tree
Message-ID: <202203100825.8EAF86328B@keescook>
References: <CADJHv_t0wMLJLCSkSh2CWTA=RKgYK0oxqqhnTdmuwtKSzdP5Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADJHv_t0wMLJLCSkSh2CWTA=RKgYK0oxqqhnTdmuwtKSzdP5Jg@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 08, 2022 at 10:44:57AM +0800, Murphy Zhou wrote:
> Hi,
> 
> Hit this shortly after build the next tree and reboot.
> 
> [   72.985994] ------------[ cut here ]------------
> [   72.986023] ------------[ cut here ]------------
> [   73.009468] kernel BUG at include/linux/swapops.h:258!
> [   73.033065] kernel BUG at include/linux/swapops.h:258!

This is in here:

static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
{
        struct page *p = pfn_to_page(swp_offset(entry));

        /*
         * Any use of migration entries may only occur while the
         * corresponding page is locked
         */
        BUG_ON(is_migration_entry(entry) && !PageLocked(p));

        return p;
}

Hugh, David, Andrew, might any of the recent mm/memory.c work caused
problems in here? (Or is this already fixed?)

-Kees

> [   73.033079] invalid opcode: 0000 [#1] PREEMPT SMP PTI
> [   73.107068] CPU: 16 PID: 5709 Comm: mksquashfs Tainted: G        W
> I       5.17.0-rc6-next-20220307 #1
> [   73.148943] Hardware name: HP ProLiant DL380p Gen8, BIOS P70 08/02/2014
> [   73.178737] RIP: 0010:migration_entry_wait_on_locked+0x266/0x300
> [   73.206068] Code: 06 88 44 24 07 eb d7 66 90 e9 09 ff ff ff 48 8b
> 43 08 a8 01 0f 85 8d 00 00 00 66 90 48 89 d8 48 8b 00 a8 01 0f 85 e6
> fd ff ff <0f> 0b 48 8d 58 ff e9 ec fd ff ff 65 48 8b 04 25 40 ef 01 00
> 48 83
> [   73.291471] RSP: 0000:ffffb2f68bf27d60 EFLAGS: 00010246
> [   73.315812] RAX: 0057ffffc009000c RBX: ffffdead13400000 RCX: 0000000000000000
> [   73.348177] RDX: ffffdead1111d3e8 RSI: 0000000000000000 RDI: 000000000000001b
> [   73.380458] RBP: 0000000000000000 R08: ffff991900168a78 R09: 0000000000000000
> [   73.412830] R10: 0000000000000000 R11: 0000000000000000 R12: ffffdead1111d3e8
> [   73.445535] R13: 0400000000000000 R14: 0400000000000080 R15: ffff9918d107ce10
> [   73.477657] FS:  00007f0cb9ffb640(0000) GS:ffff9918af800000(0000)
> knlGS:0000000000000000
> [   73.515499] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   73.544576] CR2: 000055d3d30cc2e0 CR3: 0000000460914004 CR4: 00000000001706e0
> [   73.578491] Call Trace:
> [   73.590469]  <TASK>
> [   73.600493]  ? dio_warn_stale_pagecache.part.0+0x50/0x50
> [   73.624513]  __handle_mm_fault+0x5cb/0x700
> [   73.642955]  handle_mm_fault+0xc5/0x290
> [   73.660168]  do_user_addr_fault+0x1b4/0x680
> [   73.678949]  exc_page_fault+0x62/0x140
> [   73.696792]  ? asm_exc_page_fault+0x8/0x30
> [   73.716177]  asm_exc_page_fault+0x1e/0x30
> [   73.734348] RIP: 0033:0x55d3d2da7658
> [   73.750529] Code: 25 00 80 00 ff 05 00 00 00 01 09 d8 48 8b 54 24
> 08 64 48 2b 14 25 28 00 00 00 75 5a 48 83 c4 10 5b 5d 41 5c c3 0f 1f
> 44 00 00 <48> 8b 05 81 4c 32 00 4c 8d 4c 24 04 ff 50 20 83 f8 ff 74 0a
> 85 c0
> [   73.836254] RSP: 002b:00007f0cb9ffadf0 EFLAGS: 00010246
> [   73.860578] RAX: 0000000000000000 RBX: 0000000000020000 RCX: 0000000000020000
> [   73.894417] RDX: 00007f0c616c5d00 RSI: 00007f0c9c2026a0 RDI: 00007f0c9c020bd0
> [   73.926629] RBP: 00007f0c9c2026a0 R08: 0000000000020000 R09: 0000000000000000
> [   73.958922] R10: 0000000000020000 R11: 00007f0c616c5d00 R12: 00007f0c616c5d00
> [   73.991337] R13: 0000000000000002 R14: 00007f0e19ca43f0 R15: 0000000000000000
> [   74.024964]  </TASK>
> 
> 
> Kernel config is attached.



-- 
Kees Cook
