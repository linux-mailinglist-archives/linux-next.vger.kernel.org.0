Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C89C810389E
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 12:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbfKTLWn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 06:22:43 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43111 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfKTLWm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2019 06:22:42 -0500
Received: by mail-lj1-f196.google.com with SMTP id y23so27059420ljh.10
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2019 03:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UTkXgjkYRybCH/ZS4RWR8tpgnHj6/1Pw2cuT0ewUYO8=;
        b=Xt22LJecb0aZixz44RtWTZ5wWdFSf2CFyf9ta6FjFahun+oKUHy7c6hGli6dUFoGKY
         OhyZQwNIqUpZVWhdcHe8b8hhhlNM9KZN3/6tNwt7ktLmjqqh6pNxhNWhElx/jj+ZgS0b
         zxzMXq7o/Wa5zT3yxyrdFi0ip1H6bNyE46sC00urjGlxwYV4lx/H/N/PG9zsp6Ayvf6d
         BIGZL6bId0oK4nnJ6HUmqYOgWf3RvxqA4YoPOAMZ8OIdG+Tksv9fu57thSEI5ClsoZne
         MrrN7tufYt5azx/hgZocTofRZp4pC1FMkfPWzYcXhCWAjlVAXD4/fAw1v/vsNb4IHU1I
         hDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UTkXgjkYRybCH/ZS4RWR8tpgnHj6/1Pw2cuT0ewUYO8=;
        b=UF3oVwblBF63V49a7za7RE3W5jNSrNJGTI9IjPcr7Ha1XIYEZWgtA+AXUjNfSAPDUT
         TQwYPBBWTFfeQMTwqzXS36uruLS3YzsjZ38Hl3BH47yKgYbId459sZrdm04EWvFm2q1x
         DPMMShs5GZtcndqzBU2CgGuajCGBBvSn8Jq4lD8dqzjptaGNkwM1wOQT8qez96/huIBm
         gIyxq8x45aof4ONg4FyFPiE9WFwv8xpprH751KN7A0tgm8VFbBFHpYrvhyLXKCnYNdXy
         2pdEKVKJ6uWI3UNQgwbg1JbrNu6ISET+dxdmXOxMso6UTe41mkytu3jzXyQHq/+NN8Qv
         /wEg==
X-Gm-Message-State: APjAAAUgANCihrCJS0P56d3OskOrfJwIrjwjefCPcUqVZo2/yArsoL6G
        mcuhwRqjQ6LZIAY9YwtynOjQYbdh3GkPAkdr146+j+bfedg=
X-Google-Smtp-Source: APXvYqx8/Ld2bcP/DCH7muH6RTT5RJVfqWwIO9KUyYktuYJLrzxNJzvAwt0iX9ypsOo9I33kzcF59aYo5vjIrcGo7to=
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr2176648ljl.135.1574248960061;
 Wed, 20 Nov 2019 03:22:40 -0800 (PST)
MIME-Version: 1.0
References: <20191120203434.2a0727b3@canb.auug.org.au>
In-Reply-To: <20191120203434.2a0727b3@canb.auug.org.au>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 20 Nov 2019 16:52:28 +0530
Message-ID: <CA+G9fYufQjPVsDATdyDn+xtxD1FrwnVGKJ+bpVAxvoropJ=7hg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 20
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-perf-users@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Perf build failed on linux next for i386 and armv7.

On Wed, 20 Nov 2019 at 15:04, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Changes since 20191119:
>
> The net tree gained a conflict against Linus' tree.
>
> Non-merge commits (relative to Linus' tree): 11697
>  10361 files changed, 506041 insertions(+), 224327 deletions(-)

i386 build failed log,
---------------------------
 In file included from libbpf.c:52:0:
 libbpf.c: In function 'bpf_program__collect_reloc':
 libbpf_internal.h:59:22: error: format '%lu' expects argument of type
 'long unsigned int', but argument 3 has type 'Elf64_Addr {aka long
long unsigned int}' [-Werror=format=]
   libbpf_print(level, "libbpf: " fmt, ##__VA_ARGS__); \
                       ^
 libbpf_internal.h:62:27: note: in expansion of macro '__pr'
  #define pr_warn(fmt, ...) __pr(LIBBPF_WARN, fmt, ##__VA_ARGS__)
                            ^~~~
 libbpf.c:1874:5: note: in expansion of macro 'pr_warn'
      pr_warn("bad call relo offset: %lu\n", sym.st_value);
      ^~~~~~~
 libbpf.c:1874:38: note: format string is defined here
      pr_warn("bad call relo offset: %lu\n", sym.st_value);
                                     ~~^
                                     %llu
 Makefile:652: arch/x86/Makefile: No such file or directory
 cc1: all warnings being treated as errors

 find: unknown predicate `-m32/arch'

 Try 'find --help' for more information.
   CC       perf/1.0-r9/perf-1.0/staticobjs/libbpf_probes.o
 i686-linaro-linux-gcc: warning: '-x c' after last input file has no effect
   CC       perf/1.0-r9/perf-1.0/staticobjs/xsk.o
 i686-linaro-linux-gcc: error: unrecognized command line option
'-m32/include/uapi/asm-generic/errno.h'
 i686-linaro-linux-gcc: fatal error: no input files
 compilation terminated.

arm build log:
------------------
 Makefile:652: arch/arm/Makefile: No such file or directory
 In file included from libbpf.c:52:0:
 libbpf.c: In function 'bpf_program__collect_reloc':
 libbpf_internal.h:59:22: error: format '%lu' expects argument of type
 'long unsigned int', but argument 3 has type 'Elf64_Addr {aka long
long unsigned int}' [-Werror=format=]
   libbpf_print(level, "libbpf: " fmt, ##__VA_ARGS__); \
                       ^
 libbpf_internal.h:62:27: note: in expansion of macro '__pr'
  #define pr_warn(fmt, ...) __pr(LIBBPF_WARN, fmt, ##__VA_ARGS__)
                            ^~~~
 libbpf.c:1874:5: note: in expansion of macro 'pr_warn'
      pr_warn("bad call relo offset: %lu\n", sym.st_value);
      ^~~~~~~
 libbpf.c:1874:38: note: format string is defined here
      pr_warn("bad call relo offset: %lu\n", sym.st_value);
                                     ~~^
                                     %llu

ref:
https://ci.linaro.org/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=intel-core2-32,label=docker-lkft/650/consoleText
https://ci.linaro.org/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/650/consoleText

- Naresh
