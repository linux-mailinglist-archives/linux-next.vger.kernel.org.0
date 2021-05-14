Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478C6380F74
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 20:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhENSOJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 May 2021 14:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbhENSOI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 May 2021 14:14:08 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4006C061574
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 11:12:56 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u21so45811746ejo.13
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nktD1feno+Anf1frG3kC+TyrHIcTOfivN6tBXZ2+MFU=;
        b=rFDT/hz7gLcVkc67g9MhtiwRi6EJeYKNicvaJFk80SL0AnQbq3VqEuqttBpxiZh53k
         kD828mb/fep9z79miLLqYl2n7EPrJo/IcDjtKR9INCosver6NfqNIubRHW+JgMWSICO3
         niXydNVkVVjCLSxVAYdjcv9mIhW8kemtZ7DLDB4j+Cjn8kQCRQGQ5VYyBdHNryZ7Beoa
         5nySAecVlU4gFfF9NcdaKppdXjH6c4QCXUWGbNl7b4ljQGNU+V50fFRWr+6mMU0TZUpI
         5aa2sU7X2Y66DdPBFCsrm/I0D8UJtNt4NUQKoieiQmvyMWOWaAYpKd7TDacEkBtDFtDO
         rtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nktD1feno+Anf1frG3kC+TyrHIcTOfivN6tBXZ2+MFU=;
        b=iR7/OfIjWdmOsOzt9COwsh6bMFH3dBPqnpqenen+X632EhwLXnF91vP6q5fBd/8Gp1
         yHXJcTwwkzD7ZT58nHyfYSzaAy7UBmvOx3H0+TR30QFPvpDBcS8I3kOEK65DDbZ//Rap
         tj1JtlzrVASHxbjyCeT5fdSPi1F2MBBZKrR2Exus+BtM1aB+qS7qBGK70OM6KfCXGmWk
         6Ipf/jW5//bSHj4m/X2JILE/rqGt72wuwdvZwGksywPPYPCdqqMAo+7XZ5HXM1c7iM5p
         aY9GXhAKyYfJfJnfKcGQavJ10XdWyIQ3yXYdjiixCmfSe9iYxMjlDhMRv0BfVebMoN4p
         iyrA==
X-Gm-Message-State: AOAM533LuqzeIDlWm7i8U51BpHo3fJATccCacQyvJkN6t+41sEbVIkWc
        Jwwm612svLbRVDVyre+9L9aZ76n/uA1JiGu5t28q7w==
X-Google-Smtp-Source: ABdhPJzP/OJK9iDVFNpBPGinszGU6hXyWD+hs9ZtAZKZO16jM2cEqjJekWcpMrOwKiTmTSvy359AzpY52DeyRO//KZo=
X-Received: by 2002:a17:906:4e59:: with SMTP id g25mr11833087ejw.133.1621015975277;
 Fri, 14 May 2021 11:12:55 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 14 May 2021 23:42:44 +0530
Message-ID: <CA+G9fYvYxqVhUTkertjZjcrUq8LWPnO7qC==Wum3gYCwWF9D6Q@mail.gmail.com>
Subject: [next] x86_64 defconfig failed with clang-10
To:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

My two cents,
We know clang-10 support is stopped, but our build system is still running
these builds with clang-10. one of those observations is,

The LKFT build failures were noticed while building x86_64 and i386 with
clang-10 on linux next-20210514 tag.

  - x86_64 (defconfig) with clang-10 - FAIL
  - i386 (defconfig) with clang-10 - FAIL
  - x86_64 (defconfig) with clang-11 - PASS
  - i386 (defconfig) with clang-11 - PASS
  - x86_64 (defconfig) with clang-12 - PASS
  - i386 (defconfig) with clang-12 - PASS

Build log:
----------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=x86_64
CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang'

drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
eb_relocate_parse_slow()+0x427: stack state mismatch: cfa1=4+120
cfa2=-1+0
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
eb_copy_relocations()+0x1d5: stack state mismatch: cfa1=4+104
cfa2=-1+0
x86_64-linux-gnu-ld: arch/x86/kernel/kprobes/opt.o: in function
`arch_prepare_optimized_kprobe':
opt.c:(.text+0x798): undefined reference to `__compiletime_assert_251'
make[1]: *** [/builds/linux/Makefile:1272: vmlinux] Error 1


ref:
https://builds.tuxbuild.com/1sW0ag5finSjVuErrrzeunjj1nx/

--
Linaro LKFT
https://lkft.linaro.org
