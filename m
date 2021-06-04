Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B647439B5CD
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 11:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhFDJWc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 05:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhFDJWc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 05:22:32 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4122C061761
        for <linux-next@vger.kernel.org>; Fri,  4 Jun 2021 02:20:29 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b9so13395072ejc.13
        for <linux-next@vger.kernel.org>; Fri, 04 Jun 2021 02:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hy/qFdBqxnuvliwIjp97UN0D29BYkAVb7TMvJfgcgs0=;
        b=QeWMrNbKywBFEOv7REdQjtOA11T9a4l+Go6fuCCYNNrMLtH8qzH3JyR763YM9BXDlV
         Rkvp9FVhrH4XQ8vmyD7SOv/nwSa8tglOsz4hTkkaoLv3r8WtIU0NbhDO/r0t3dCsizGX
         NtaO1sLKVSS54+UUv3RyCxhRu2MBloCMHahVb3LqhiZPe8UUGz2MgbWfa6uX6ddvFXjf
         B3Q2smzYEKAsCMK4Lf1kbFV9fDxOuYmRPsgupPV+x35pu3D/CMwSFmeavi9aFPqSLG3T
         YY/mlqv53Vy1BVGzffrup+S50mxeGBbQBjtEXpyOm8gP3+XKwhzH40n6i7yErt2np8/E
         WMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hy/qFdBqxnuvliwIjp97UN0D29BYkAVb7TMvJfgcgs0=;
        b=ulPx68ffPfKN3MPhRQvtnp083f6vxt8uyIAr00qecl2lOBntdtgFLrygawpNrjoX8A
         CxzKr0inK8709XonSvAfl3FgjI3f/3o8hmnsr4kMIK789wKi5kukYTAeJSUzNhaGZ48Q
         y4LAsduAHgQk2LqJMrDo29ps0HXByZ2l1wjN8mTJhUcEwfNhf5TK2UPiwSub4SK3jhIO
         CGUHK+VpR6KFjFGkxH8rX/WDtRlRDkh4FoTHQPGmv8L5yhqwuCK0i5Hes4pQUDzDOA1W
         9xCcrF3VaJfT4ZP3pz2q1dvGR759iUne5RY+XnTrOATVo6kWecHR/jJLZf3+qIopDG6B
         ulyA==
X-Gm-Message-State: AOAM530D9zgX39zXNDA//SAxe7NtVueydE9uYoye6/q7apKxAKtv1l/H
        NOkV+s9YGQHqINatyLAm/FRt2bKvw77W4nuywA8KJbJ4tgGjKl5P
X-Google-Smtp-Source: ABdhPJwkGJjRjKIcmJirI7Y6tIxR9hgQPaSiTRjT1j1NsCCJNsKTajl1oRrxbpDpDy2+lhQRgv0f9CB3LE9YFl7PsMI=
X-Received: by 2002:a17:906:9d05:: with SMTP id fn5mr3247466ejc.133.1622798427976;
 Fri, 04 Jun 2021 02:20:27 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 4 Jun 2021 14:50:16 +0530
Message-ID: <CA+G9fYsnWUYuahxv3+vQx3UQ_CvJ5caiQwb7BXEuDGxPjmrM1w@mail.gmail.com>
Subject: [next] fs: cifsglob.h:955:20: error: passing argument 2 of 'test_bit'
 from incompatible pointer type
To:     linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Steve French <sfrench@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The following builds failed on Linux next-20210604 due to warnings / errors.

  - arm (s3c2410_defconfig) with gcc- 8 / 9 / 10
  - parisc (defconfig) with gcc-8 / 9 / 10
  - powerpc (ppc6xx_defconfig) with gcc- 8 / 9 /10

In file included from fs/cifs/transport.c:38:
fs/cifs/transport.c: In function 'cifs_pick_channel':
fs/cifs/cifsglob.h:955:20: error: passing argument 2 of 'test_bit'
from incompatible pointer type [-Werror=incompatible-pointer-types]
  955 |  test_bit((index), &(ses)->chans_need_reconnect)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
           |
           size_t * {aka unsigned int *}
fs/cifs/transport.c:1065:7: note: in expansion of macro
'CIFS_CHAN_NEEDS_RECONNECT'
 1065 |   if (CIFS_CHAN_NEEDS_RECONNECT(ses, index))
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from arch/powerpc/include/asm/bitops.h:193,
                 from include/linux/bitops.h:32,
                 from include/linux/kernel.h:12,
                 from include/linux/list.h:9,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from fs/cifs/transport.c:23:
include/asm-generic/bitops/non-atomic.h:104:66: note: expected 'const
volatile long unsigned int *' but argument is of type 'size_t *' {aka
'unsigned int *'}
  104 | static inline int test_bit(int nr, const volatile unsigned long *addr)
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:272: fs/cifs/transport.o] Error 1
fs/cifs/sess.c: In function 'cifs_chan_set_need_reconnect':
fs/cifs/sess.c:98:22: error: passing argument 2 of 'set_bit' from
incompatible pointer type [-Werror=incompatible-pointer-types]
   98 |  set_bit(chan_index, &ses->chans_need_reconnect);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~
             |
             size_t * {aka unsigned int *}


Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Full build log:
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1317929765#L247

Steps to reproduce:
-----------------------------

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime podman --target-arch arm --toolchain gcc-8 --kconfig
s3c2410_defconfig


--
Linaro LKFT
https://lkft.linaro.org
