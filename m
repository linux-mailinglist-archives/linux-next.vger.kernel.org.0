Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4B8386B8C
	for <lists+linux-next@lfdr.de>; Mon, 17 May 2021 22:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238806AbhEQUlQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 May 2021 16:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237722AbhEQUlP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 May 2021 16:41:15 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63BAC061573
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 13:39:58 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id v6so8868533ljj.5
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eWLNFGlfwzWOozc88A/wtY40ed6i6D9kMoBVlA8pWdI=;
        b=NrIz577DDXV5+qA0Xf8/tl7jG2nWhbIrDV7xEb5stowU+uDLWDOZVp/BMtipe3f4rE
         KLJvN4giPdwZyvut4I32dddOwWhn6ctW8yw9h0teH62O1nDlHJTmY4aNvJ8HSSEGQ34u
         4qRUS1E3+EFeBsUmwsRf0+Pg1+wkZwesWx0R0Es10RC3zdkfHHG0DFwMuetXv+/OZgrk
         KV9QlEqBDUTqtqdWlb5BbvHdLPchzY3vBHv6XWzr5DidGF5JoW28M1zWyXmARAg+FnPF
         paBJnABpxmaktEhIA5a37MQRBLdNHRbmj6+Ynv4kvL3ilbCb+werni0/D+8vY1pnsyQx
         0PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eWLNFGlfwzWOozc88A/wtY40ed6i6D9kMoBVlA8pWdI=;
        b=nmfPGFd3BocOCmNBSp+26gZawks7n233cU86gbgtADW2FHqNP0GknnSaS0LrcAXvip
         cgx105UWmRIiYku20E+CYKoP/tOwg3HQwH2NGxU9Sn/GOblwAJwcjspFdOrjmkFL9QLN
         BuwQShSyNsY4nqjdYVfvJ6hwqpnFIRACc0dE1zeqwLAm+QJS6yIiUQs+HM7y5hYebKWh
         w3NdyUT1KXrJc2oekjlDv+xhBE72Hg2dLf6a4cGrH6Q40gfSgoNUpY4f5Bt2XXo6IAdb
         SOSSydALQ1RWAp9g1BsqEuUcotii0g0wPcTbwtW2hSrCv2eSIVPZ4IB33Z+CTYqx+Q49
         J00w==
X-Gm-Message-State: AOAM5303hM0v6oQ4Nq6lNzbIzWAkMEwnMwk5qSJXmW2zuZ53AyPAqrbU
        kIccOAWuV6P4ElcktnWD3dvlemYJkiEKeP4KVPjTLad6dBWmDg==
X-Google-Smtp-Source: ABdhPJxseCB88WqAEz2KlWGYcoLrEhP+X4pqOYPzLDWopUv5JiMh+9rfGCfQq6CIc2Mtdge92Kmb1S2O0FqK622ucI4=
X-Received: by 2002:a2e:b710:: with SMTP id j16mr948049ljo.479.1621283996770;
 Mon, 17 May 2021 13:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvYxqVhUTkertjZjcrUq8LWPnO7qC==Wum3gYCwWF9D6Q@mail.gmail.com>
 <e6ee5c21-a460-b4f7-9d0a-e2711ec16185@kernel.org>
In-Reply-To: <e6ee5c21-a460-b4f7-9d0a-e2711ec16185@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 17 May 2021 13:39:46 -0700
Message-ID: <CAKwvOd=4wux6NG_6tF6C_xjU0ps+Fh5hfW5a_0U+xcPgL+XJYg@mail.gmail.com>
Subject: Re: [next] x86_64 defconfig failed with clang-10
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 14, 2021 at 1:54 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 5/14/2021 11:12 AM, Naresh Kamboju wrote:
> > My two cents,
> > We know clang-10 support is stopped, but our build system is still running
>
> For the record, we are still building with clang-10 as that is the
> minimum supported version for the kernel.
>
> > these builds with clang-10. one of those observations is,
> >
> > The LKFT build failures were noticed while building x86_64 and i386 with
> > clang-10 on linux next-20210514 tag.
> >
> >    - x86_64 (defconfig) with clang-10 - FAIL
> >    - i386 (defconfig) with clang-10 - FAIL
> >    - x86_64 (defconfig) with clang-11 - PASS
> >    - i386 (defconfig) with clang-11 - PASS
> >    - x86_64 (defconfig) with clang-12 - PASS
> >    - i386 (defconfig) with clang-12 - PASS
> >
> > Build log:
> > ----------
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=x86_64
> > CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
> > clang'
> >
> > drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
> > eb_relocate_parse_slow()+0x427: stack state mismatch: cfa1=4+120
> > cfa2=-1+0
> > drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
> > eb_copy_relocations()+0x1d5: stack state mismatch: cfa1=4+104
> > cfa2=-1+0
> > x86_64-linux-gnu-ld: arch/x86/kernel/kprobes/opt.o: in function
> > `arch_prepare_optimized_kprobe':
> > opt.c:(.text+0x798): undefined reference to `__compiletime_assert_251'
> > make[1]: *** [/builds/linux/Makefile:1272: vmlinux] Error 1
>
> Thanks for the report. Our CI also reported this:
>
> https://github.com/ClangBuiltLinux/continuous-integration2/runs/2582534773?check_suite_focus=true
>
> My bisect landed on "mm, slub: change run-time assertion in
> kmalloc_index() to compile-time" in -next (I have added the author and
> reviewers to cc):
>
> $ git bisect log
> # bad: [cd557f1c605fc5a2c0eb0b540610f50dc67dd849] Add linux-next
> specific files for 20210514
> # good: [315d99318179b9cd5077ccc9f7f26a164c9fa998] Merge tag
> 'pm-5.13-rc2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> git bisect start 'cd557f1c605fc5a2c0eb0b540610f50dc67dd849'
> '315d99318179b9cd5077ccc9f7f26a164c9fa998'
> # good: [9634d7cb3c506ae886a5136d12b4af696b9cee8a] Merge remote-tracking
> branch 'drm-misc/for-linux-next'
> git bisect good 9634d7cb3c506ae886a5136d12b4af696b9cee8a
> # good: [294636a24ae819a7caf0807d05d8eb5b964ec06f] Merge remote-tracking
> branch 'rcu/rcu/next'
> git bisect good 294636a24ae819a7caf0807d05d8eb5b964ec06f
> # good: [cb753d0611f912439c8e814f4254d15fa8fa1d75] Merge remote-tracking
> branch 'gpio-brgl/gpio/for-next'
> git bisect good cb753d0611f912439c8e814f4254d15fa8fa1d75
> # bad: [b1e7389449084b74a044a70860c6a1c7466781cb] lib/string_helpers:
> switch to use BIT() macro
> git bisect bad b1e7389449084b74a044a70860c6a1c7466781cb
> # bad: [bf5570ed0654a21000e5dad9243ea1ba30bfe208] kasan: use
> dump_stack_lvl(KERN_ERR) to print stacks
> git bisect bad bf5570ed0654a21000e5dad9243ea1ba30bfe208
> # bad: [4a292ff7a819404039588c7a9af272aca22c869e] fixup! mm: gup: pack
> has_pinned in MMF_HAS_PINNED
> git bisect bad 4a292ff7a819404039588c7a9af272aca22c869e
> # good: [93e440dd0e482b6cde20630d58016a451fb2b431] ocfs2: fix snprintf()
> checking
> git bisect good 93e440dd0e482b6cde20630d58016a451fb2b431
> # good: [f32aeffdb407b6390ef17ccac87e1a1a76663354] slub: remove
> resiliency_test() function
> git bisect good f32aeffdb407b6390ef17ccac87e1a1a76663354
> # bad: [2c9b936dae88dbdbb28666a741c87b08abb1b755] mm/page-writeback:
> update the comment of Dirty position control
> git bisect bad 2c9b936dae88dbdbb28666a741c87b08abb1b755
> # bad: [597da4750c8e8f5f304419f3c66b713a88f3ebbe]
> tools/vm/page_owner_sort.c: check malloc() return
> git bisect bad 597da4750c8e8f5f304419f3c66b713a88f3ebbe
> # bad: [0ec3603432be3abba93ee7aa512cb6d83dd1c291] kfence: test: fix for
> "mm, slub: change run-time assertion in kmalloc_index() to compile-time"
> git bisect bad 0ec3603432be3abba93ee7aa512cb6d83dd1c291
> # bad: [ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51] mm, slub: change
> run-time assertion in kmalloc_index() to compile-time
> git bisect bad ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51
> # first bad commit: [ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51] mm, slub:
> change run-time assertion in kmalloc_index() to compile-time
>
> https://git.kernel.org/next/linux-next/c/ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51
>
> It looks like LLVM fixed this in
> http://github.com/llvm/llvm-project/commit/6aabb109becfee37126ff7db3d41a41b5779f359.
>
> I think this happens because arch_prepare_optimized_kprobe() calls
> kzalloc() with a size of MAX_OPTINSN_SIZE, which is
>
> #define MAX_OPTINSN_SIZE                                \
>         (((unsigned long)optprobe_template_end -        \
>           (unsigned long)optprobe_template_entry) +     \
>          MAX_OPTIMIZED_LENGTH + JMP32_INSN_SIZE)
>
> and the optprobe_template_{end,entry} are not evaluated as constants.
>
> I am not sure what the solution is. There seem to be a growing list of
> issues with LLVM 10 that were fixed in LLVM 11, which might necessitate
> requiring LLVM 11 and newer to build the kernel, given this affects a
> defconfig.

If we can make the compile time validation done instead at runtime for
clang-10, that would be preferable. Then when we drop clang-10
support, we can revert that.  Looking at the diff, I think we could
reinstate parts like so:

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 9d316aac0aba..4c13e2cd415c 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -412,6 +412,9 @@ static __always_inline unsigned int
__kmalloc_index(size_t size,
        if (size <=  8 * 1024 * 1024) return 23;
        if (size <=  16 * 1024 * 1024) return 24;
        if (size <=  32 * 1024 * 1024) return 25;
+#if CLANG_VERSION <= 100000
+       if (size <=  64 * 1024 * 1024) return 26;
+#endif

        if (size_is_constant)
                BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
diff --git a/mm/slab_common.c b/mm/slab_common.c
index a0b8ffeae4ae..ecb6104b9dbb 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -799,6 +799,9 @@ const struct kmalloc_info_struct kmalloc_info[]
__initconst = {
        INIT_KMALLOC_INFO(8388608, 8M),
        INIT_KMALLOC_INFO(16777216, 16M),
        INIT_KMALLOC_INFO(33554432, 32M)
+#if CLANG_VERSION <= 10000
+       ,INIT_KMALLOC_INFO(67108864, 64M)
+#endif
 };

 /*
-- 
Thanks,
~Nick Desaulniers
