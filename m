Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A9741EB2D
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 12:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhJAKv5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 06:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352654AbhJAKv4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 06:51:56 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7238BC06177B
        for <linux-next@vger.kernel.org>; Fri,  1 Oct 2021 03:50:11 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id s17so32573886edd.8
        for <linux-next@vger.kernel.org>; Fri, 01 Oct 2021 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Q0Ww4rdF93vuhLA9EB8gy8zyZFUhPSXKcFE+ISMqwg0=;
        b=wcZvcDO43h0zIQAIwDovuHJoDyirgyV5cYvW5x/H2yCkDuPswY2OXVOEu2D6AO34fY
         ANbbxnLfGpBpoFxboRHaYI6de6ydIWbE9N/zqKULfh62kUJseMiS6lXYkZhCq1l3MPYe
         vV/m835fq8UqpAUioTWa1xBfwLmCMRRHHGD32+KqCy1io9pahXpjxvmraJcDHpafrg6S
         7fwzn/I7Dnx6kukl7wxM0JCKQGwgXRkn0f3MywMCJJSo0hpDiiGLO19qaMuSTab4GlXx
         pDdDxXeyS9MRNBmBB4u6kydOaUCPQ0rhs/5kvQkB/ChD/LGPuggPgFz7aE2PmmGJjJWi
         ZVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Q0Ww4rdF93vuhLA9EB8gy8zyZFUhPSXKcFE+ISMqwg0=;
        b=ZTlZIPBCcchDLL3E1++aJR+qPlhS6uBUGP6AGB2QqrvrD2ZsAJu/2BH511et/SF15b
         aJebdu16sbRjqWLfmlPVQ1Zx0Aq1NabIOldCbDtXNzBsC6fWx+WjQEXg1R07Rm8pGRTO
         9jP0aYTCa88mpJTOuDQXSWpY3GrTcyB/hL07018a79Z0Ck8/kxkSuL7onH57TwHf+0Ye
         L+HvXoqI+LKCgj4eujaNirmSnpBIDn3HqfsVxWke9DgkQ2I+B/IsRnX4+1v+flEqVaCP
         KMyVAD8g5INRWAjQnBoW6sf7t9YN1fYtJlIM7AEyvvbTnuoDgTDqBTxlEShRFUjVz6rA
         AFpA==
X-Gm-Message-State: AOAM531r0lheh8pBwy0eevH2EfUL+OFX24fyU4Dm2tf0xQ/s6B8uJUsl
        yn7QdeW6zDRTFjnhBwae6lYJgVIWmUdBjS15wCWvhg==
X-Google-Smtp-Source: ABdhPJwC3mpxAp+yFDP18LlzEJJAxEi6YO60QJjagz4jHMt+1+jwJGVWTjZvA/aTzdbygkEXB/7hehkVUmcIc20uTW8=
X-Received: by 2002:a05:6402:1778:: with SMTP id da24mr13776581edb.398.1633085409734;
 Fri, 01 Oct 2021 03:50:09 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 1 Oct 2021 16:19:58 +0530
Message-ID: <CA+G9fYsKjyOL1xj+GFC=Ab7Yw+b0Tg9jf8uvnN2tOc6OdupA-Q@mail.gmail.com>
Subject: swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first use in this function)
To:     open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build errors noticed while building Linux next 20211001
with gcc-11 for powerpc architecture.

kernel/sched/debug.c: In function 'print_cfs_group_stats':
kernel/sched/debug.c:460:41: warning: unused variable 'stats'
[-Wunused-variable]
  460 |                struct sched_statistics *stats =
__schedstats_from_se(se);
      |                                         ^~~~~
In file included from include/linux/blkdev.h:6,
                 from include/linux/blk-mq.h:5,
                 from drivers/block/swim3.c:24:
drivers/block/swim3.c: In function 'swim3_attach':
drivers/block/swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first
use in this function)
 1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
      |                                      ^~~~~~~~~~~~
include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
  276 |         __register_blkdev(major, name, NULL)
      |                           ^~~~~
drivers/block/swim3.c:1200:38: note: each undeclared identifier is
reported only once for each function it appears in
 1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
      |                                      ^~~~~~~~~~~~
include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
  276 |         __register_blkdev(major, name, NULL)
      |                           ^~~~~
make[3]: *** [scripts/Makefile.build:288: drivers/block/swim3.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:571: drivers/block] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:2034: drivers] Error 2

Build config:
https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: a25006a77348ba06c7bc96520d331cd9dd370715
    git_short_log: a25006a77348 (\"Add linux-next specific files for 20211001\")
    kconfig:  ppc6xx_defconfig
    kernel_version: 5.15.0-rc3
    target_arch: powerpc
    toolchain: gcc-11

steps to reproduce:
https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
