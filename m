Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923E85AFD42
	for <lists+linux-next@lfdr.de>; Wed,  7 Sep 2022 09:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiIGHRn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Sep 2022 03:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiIGHRl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Sep 2022 03:17:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FADA3479
        for <linux-next@vger.kernel.org>; Wed,  7 Sep 2022 00:17:38 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id v6so1499098ljj.0
        for <linux-next@vger.kernel.org>; Wed, 07 Sep 2022 00:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=89+MkwCQRLAHkFEhXocRBmWuzdBCcd8GcaLlx6vSdK4=;
        b=mWUos+G4meLEIpM5B5tSJgqfGT5qpSbpn+rdZVeadkZnBWLelim7TPaMEtKqFnCb5x
         qaQW4+1W6y5PwSJsJP64h6SkRokfUsQdjuIXt2Bij29/dOMLg/gQeohNaCdr7nzHmfZV
         Fdk75ophPXB+Bwugz3NNgr4gm51+NMBslWWEShVW08npuscO1IaDvOHL55rQrp71rEK4
         3hldg8EwPFDOB05fqVcITdL8Zrx0NKe7zHfQdX0kNTFlbfwfrdu4CYqCM68eMo/vqwcO
         jbzJJT5GRMI8YXbkiTJUHzQO/4gQU1XAXIRyGIq7HnR3D942NJCM+51TcEX/Mp1VNhF6
         qH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=89+MkwCQRLAHkFEhXocRBmWuzdBCcd8GcaLlx6vSdK4=;
        b=fMvh7jsismnANxvlDfz4gbIuP6AJ+fV6+KbD8mfEUX81EJ01Jjv6DJ+HbcTYuvkl5u
         ypZ8miTR39DhKdkRj1xnVOu9c3QoV4kGLjughJXgWkfoAXf6AbguUreThrboFG/rLtbw
         n4D6ZPtf2Au0rZuJkJff3LK94yiv97LwbjoJBh2h86O+uy9zvX/GMx11V54kMV1XyZFL
         ToSwZNF7ugz5ajW1V1KFkluvJwOM+MSX3Ve9V/f0hjHTM44jCgG1sL2ZQUwfVm/PZGEd
         AXTYMfpocMGY8T7JCKBAhkvAZ/UKtSGuaBZkWAKqvzTGmc2my/mgfUSKBZLs19kYAt+s
         OTNw==
X-Gm-Message-State: ACgBeo1H7m5h3QEOLyMjLXKmxHnljwZBYMIqJrZiedOG9HC5L4i9pqMA
        lySzIr4kSq8qqMyr73xwj+Eug82X2f/KOAxqtofQ5g==
X-Google-Smtp-Source: AA6agR71di9AUXjm1EUAWrxZPkPvbGJ5UTGC0woWSGfCPIomzzbd6bY/6fvZKlDkb7mw8EwP1pyMQz6gziNPl5xaI/o=
X-Received: by 2002:a2e:a589:0:b0:261:b223:488b with SMTP id
 m9-20020a2ea589000000b00261b223488bmr592996ljp.33.1662535056337; Wed, 07 Sep
 2022 00:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000974e2805e802137e@google.com> <20220906173154.6f2664c8fc6b83470c5dfea1@linux-foundation.org>
 <YxfpkzZhJ7GfRuKd@yury-laptop> <20220906225312.263c4493a744cbcb66288283@linux-foundation.org>
In-Reply-To: <20220906225312.263c4493a744cbcb66288283@linux-foundation.org>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 7 Sep 2022 09:17:24 +0200
Message-ID: <CACT4Y+bXks8ohNAxdJ7gGOc=tg7bC7Pz+nBJi_J9zHa5Jhta9w@mail.gmail.com>
Subject: Re: [syzbot] linux-next boot error: KASAN: slab-out-of-bounds Read in _find_next_bit
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Yury Norov <yury.norov@gmail.com>,
        syzbot <syzbot+08ca1fa706a22cc17efe@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 7 Sept 2022 at 07:53, Andrew Morton <akpm@linux-foundation.org> wrote:
> > > > The buggy address belongs to the object at ffff888017576600
> > > >  which belongs to the cache kmalloc-192 of size 192
> > > > The buggy address is located 184 bytes inside of
> > > >  192-byte region [ffff888017576600, ffff8880175766c0)
> > >
> > > At offset 184 of a 192-byte region.
> > >
> > > So what's wrong with doing that?  Does KASAN have an off-by-one?
> >
> > Hi Andrew, all,
> >
> > This is a bug in FIND_NEXT_BIT(). It should be
> >   if (idx >= sz / BITS_PER_LONG)                                   \
> >           goto out;                                                \
> >
> > instead of
> >   if (idx > sz / BITS_PER_LONG)                                    \
> >           goto out;                                                \
> >
> > The fix is in bitmap-for-next, expected to be in -next by tomorrow.
> > Sorry for the noise.
>
> OK... but why is KASAN reporting a bad access from an area
> which appears to be OK?

Hi Andrew,

Good point. Filed https://bugzilla.kernel.org/show_bug.cgi?id=216457 for this.
Copy-pasting description below:

KASAN says:

==================================================================
BUG: KASAN: slab-out-of-bounds in _find_next_bit+0x143/0x160 lib/find_bit.c:109
Read of size 8 at addr ffff8880175766b8 by task kworker/1:1/26
...
The buggy address belongs to the object at ffff888017576600
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 184 bytes inside of
 192-byte region [ffff888017576600, ffff8880175766c0)
...
Memory state around the buggy address:
>ffff888017576680: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
                                        ^
==================================================================

This "address is located 184 bytes inside of 192-byte region" is
confusing b/c it does not look like an out-of-bounds access.

What happens here is that the allocation request was for 184 bytes, so
the last 8 bytes in the 192-byte slab are poisoned. But KASAN does not
store the requested size in the object header, so it just prints the
full slab size everywhere.

User-space ASAN does store 48-bit requested size in the header. But
KASAN uses additional bytes in the header for:

struct kasan_alloc_meta {
depot_stack_handle_t aux_stack[2];

So we don't have space for requested size w/o increasing header size
(currently should be 16 bytes).

We could either try to infer requested size from the shadow (count
poisoned bytes at the end); or improve wording of the message at least
to make it clear that 192 is just full slab size.

For context see:
https://lore.kernel.org/all/20220906173154.6f2664c8fc6b83470c5dfea1@linux-foundation.org/
