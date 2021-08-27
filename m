Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767503F9176
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 02:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243831AbhH0AyI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 20:54:08 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:25028 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243811AbhH0AyI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Aug 2021 20:54:08 -0400
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17R0qumb018917;
        Fri, 27 Aug 2021 09:52:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17R0qumb018917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630025576;
        bh=v5UrnPxdJDQzEP3fPOndvdGBkcAodv7VU8EbX3JopoU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ijBW58/sB0mmqZ8oXYanrbnQr72qd3d5hYs+b4+l20Qkz9960/VBdPBwqXnZgNPnK
         m+yzs/iPwN5GpJGo9GGJ1Yx1iXGWCq+Qle66YpFzsRlJjNMVaX36WCtBxD8Mikse35
         KanmAt5t0ogLo8LqWOkEYe9E5Yxm2E1IaNIw4KvOs4THN1TcPugJqXoqzV6/dHm36O
         IsSxT5MN98k8wWQXLiNgZSNGXjbpQcSg/TChNfqYb8x+SlymmPFTDsViFgJ3Tb286j
         xJBq3D/fI4lj3KdeVyLJzWqZfTo+71c9t8Wb+cFzXeU2miysX1YhjFoocoqOCkarkE
         k84SyNYgfYyfQ==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id y11so4200322pfl.13;
        Thu, 26 Aug 2021 17:52:56 -0700 (PDT)
X-Gm-Message-State: AOAM532bficr7KOKHzX4r389DL72Qy0lby9rpaSn46tvKXSBJXky10E8
        TEXVUVh9gUu5Nk3zu/J/4yIGC2Vnw4dY4cAJAcA=
X-Google-Smtp-Source: ABdhPJxTdJjeA2wMBM5dBg4ozXGqDFuPcHkZAEvFkrCDapueZUB1arFHJvgqF2Gbv5NKJhRK2+Chm8BlORSSQGi4ihY=
X-Received: by 2002:aa7:98da:0:b029:3e0:8b98:df83 with SMTP id
 e26-20020aa798da0000b02903e08b98df83mr6339470pfm.63.1630025575406; Thu, 26
 Aug 2021 17:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210826191330.40dc43e8@canb.auug.org.au>
In-Reply-To: <20210826191330.40dc43e8@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 27 Aug 2021 09:52:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASL2JNb4zT7UFr41dLO0oEuvc6yUg__qhc59q8aNqWxEg@mail.gmail.com>
Message-ID: <CAK7LNASL2JNb4zT7UFr41dLO0oEuvc6yUg__qhc59q8aNqWxEg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 26, 2021 at 6:13 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
>
> make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '__build'.
>
> Caused by commit
>
>   624a912f84bc ("kbuild: detect objtool changes correctly and remove .SECONDEXPANSION")
>
> (at least, reverting that commit fixes it)
>
> I use a separate object directory and, in this case, it is newly created.
>
> A build with V=1 and -s removed (and no -j) gives this around the
> failure:
>
> make -f /home/sfr/next/next/scripts/Makefile.build obj=scripts/mod
> make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '__build'.  Stop.
> make[1]: *** [/home/sfr/next/next/Makefile:1309: prepare0] Error 2
>
> I have reverted that commit for today.
> --
> Cheers,
> Stephen Rothwell



Hmm, it is strange.


I re-applied that commit based on today's linux-next
(git cherry-pick  624a912f84bc)

allnoconfig built successfully.


My build log is as follows.

Can you tell the exact steps to reproduce the error?



masahiro@grover:~/ref/linux-next$ git log -2 --oneline
5046c6516ca2 (HEAD -> tmp) kbuild: detect objtool changes correctly
and remove .SECONDEXPANSION
88fac11862d3 (tag: next-20210826, origin/master, origin/HEAD) Add
linux-next specific files for 20210826
masahiro@grover:~/ref/linux-next$ rm -rf /tmp/foo
masahiro@grover:~/ref/linux-next$ make O=/tmp/foo  allnoconfig all
make[1]: Entering directory '/tmp/foo'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
  GEN     Makefile
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/export.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  UPD     include/config/kernel.release
  UPD     include/generated/uapi/linux/version.h
  UPD     include/generated/utsrelease.h
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  UPD     include/generated/bounds.h
  UPD     include/generated/timeconst.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    /home/masahiro/ref/linux-next/scripts/checksyscalls.sh
  CALL    /home/masahiro/ref/linux-next/scripts/atomic/check-atomics.sh
  CC      init/main.o
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  CC      init/do_mounts.o
  CC      init/noinitramfs.o
  CC      init/calibrate.o
  CC      init/init_task.o
  AR      init/built-in.a
  AR      usr/built-in.a
  CC      arch/x86/entry/vdso/vma.o
  CC      arch/x86/entry/vdso/extable.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  AS      arch/x86/entry/vdso/vdso32/note.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
/home/masahiro/ref/linux-next/arch/x86/entry/vdso/Makefile:135: FORCE
prerequisite is missing
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  HOSTCC  arch/x86/entry/vdso/vdso2c
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  AR      arch/x86/entry/vdso/built-in.a

  [snip]



-- 
Best Regards
Masahiro Yamada
