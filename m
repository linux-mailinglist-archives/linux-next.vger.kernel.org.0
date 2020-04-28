Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1D61BCC09
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 21:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgD1TFF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 15:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728539AbgD1TFF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 15:05:05 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E4FC03C1AB;
        Tue, 28 Apr 2020 12:05:04 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e26so34682167otr.2;
        Tue, 28 Apr 2020 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9mawD2gvz/eqn5BFKTza4oVQ2SByQxW/24pgvyCMUE8=;
        b=Fdw7gz7MMVRw9oItUSWDsiTku21evW1zad4hFmvLnJEQYB25msghyg8QPQMeTxErrg
         xfhyK4xVf2Nw5qnZLBngikg5i99Mzng3gvVBZlhV1MHkx36wpr0N9dsjmcGz7lKtkYlv
         R1kPrvqAyfQlciybOZJB9mlsDpBAPp/bsb0/KxKz8fJXMmuP0kH6k+oVtaW8qPthLaJe
         UMHLt5U8/mn9DQ0v843hXBGhWu5esf3JikvFUxMWgx8fZZP6c6O/Wvd8WLb5vpCDCAYp
         bAT9VNr2S2TozkuextPiUIFVM0/0OV92JrJg+D61BG//01Yt4OdpMgM8SbiwR/dKn0hh
         3uZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9mawD2gvz/eqn5BFKTza4oVQ2SByQxW/24pgvyCMUE8=;
        b=aw/XSBb2UdUbRIoALJUzE+PTa4+rSYAcSqr4MQ9UnfZ19Noes4hmxJesYCwxBdX3Ba
         Chp7PMw1ipxqFB1S4aBE0eWtwTHOKtbGJdUzg9MDn3vf+jyW0hNyiJdIWAWBUch3dXPF
         4HWITmAG7bpEf6/SsWCDzIwYUaVy6fk80nCF/h78F4L1YS3Ezilcip4YnwPo/VygHGEo
         M/PLYpom0KFdHmneaKpCDm6/uzpj3cptPVf7kZTj5zXwnCak+w680JzvEO8EJlzq4OIX
         CaOQa5ys3t4J52R5rzR6/JqjmklfPBnxFYBUXIbwSp9DF8NqHdCmhdZqtcSJzLz4nFF2
         UPIg==
X-Gm-Message-State: AGi0PuYnxCjeVodmjPjX0nPddByziWXVhz80Kp5QaaMODDHzsqKmKosP
        YP5yMiYeLMWGEJzFZDwYgyw=
X-Google-Smtp-Source: APiQypKQbJq0XD420xh+OdLmBYlmBeL4TIoGxvn2rlBhDIrLX4rpFLBUzLsA6hEWYXqgEBS8v4qsAw==
X-Received: by 2002:aca:488a:: with SMTP id v132mr4198275oia.166.1588100704232;
        Tue, 28 Apr 2020 12:05:04 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t10sm5186959oou.38.2020.04.28.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 12:05:01 -0700 (PDT)
Date:   Tue, 28 Apr 2020 12:04:59 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
        linux-s390@vger.kernel.org
Subject: Re: linux-next: Tree for Apr 28
Message-ID: <20200428190459.GA2299615@ubuntu-s3-xlarge-x86>
References: <20200428181006.06b4e3bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428181006.06b4e3bc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 28, 2020 at 06:10:06PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200424:
> 
> The qcom tree still had its build failure for which I reverted a commit.
> 
> The hwmon-staging tree gained a build failure for which I reverted
> a commit.
> 
> The mac80211-next tree gained a build failure so I used the version
> from next-20200424.
> 
> The drm-misc tree still had its build failure for which I disabled a
> COMPILE_TEST setting.
> 
> The akpm-current tree gained a conflict against the risc-v tree.
> 
> The akpm tree lost a patch that turned up elsewhere.
> 
> Non-merge commits (relative to Linus' tree): 4451
>  5474 files changed, 151275 insertions(+), 63274 deletions(-)

I am seeing the following build error on s390 defconfig, caused by
commit 743f242d65ec ("mm: support compat_sys_process_madvise").
Apologies if it has already been reported, I did a search of lore and
found nothing.

Cheers,
Nathan

$ make -j$(nproc) -s ARCH=s390 CROSS_COMPILE=s390x-linux- defconfig all
...
mm/madvise.c: In function '__se_compat_sys_process_madvise':
./include/linux/compiler.h:394:38: error: call to '__compiletime_assert_162' declared with attribute error: BUILD_BUG_ON failed: sizeof(unsigned long) > 4 && !__TYPE_IS_PTR(unsigned long)
  394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                      ^
./include/linux/compiler.h:375:4: note: in definition of macro '__compiletime_assert'
  375 |    prefix ## suffix();    \
      |    ^~~~~~
./include/linux/compiler.h:394:2: note: in expansion of macro '_compiletime_assert'
  394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
./arch/s390/include/asm/compat.h:18:2: note: in expansion of macro 'BUILD_BUG_ON'
   18 |  BUILD_BUG_ON(sizeof(t) > 4 && !__TYPE_IS_PTR(t)); \
      |  ^~~~~~~~~~~~
./include/linux/syscalls.h:110:27: note: in expansion of macro '__SC_DELOUSE'
  110 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
      |                           ^
./include/linux/syscalls.h:111:35: note: in expansion of macro '__MAP3'
  111 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:112:35: note: in expansion of macro '__MAP4'
  112 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:113:35: note: in expansion of macro '__MAP5'
  113 | #define __MAP6(m,t,a,...) m(t,a), __MAP5(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:114:22: note: in expansion of macro '__MAP6'
  114 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
      |                      ^~~~~
./arch/s390/include/asm/syscall_wrapper.h:80:36: note: in expansion of macro '__MAP'
   80 |   long ret = __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));\
      |                                    ^~~~~
./include/linux/compat.h:66:2: note: in expansion of macro 'COMPAT_SYSCALL_DEFINEx'
   66 |  COMPAT_SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
      |  ^~~~~~~~~~~~~~~~~~~~~~
mm/madvise.c:1314:1: note: in expansion of macro 'COMPAT_SYSCALL_DEFINE6'
 1314 | COMPAT_SYSCALL_DEFINE6(process_madvise, int, which, compat_pid_t, upid,
      | ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/compiler.h:394:38: error: call to '__compiletime_assert_164' declared with attribute error: BUILD_BUG_ON failed: sizeof(unsigned long) > 4 && !__TYPE_IS_PTR(unsigned long)
  394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                      ^
./include/linux/compiler.h:375:4: note: in definition of macro '__compiletime_assert'
  375 |    prefix ## suffix();    \
      |    ^~~~~~
./include/linux/compiler.h:394:2: note: in expansion of macro '_compiletime_assert'
  394 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
./arch/s390/include/asm/compat.h:18:2: note: in expansion of macro 'BUILD_BUG_ON'
   18 |  BUILD_BUG_ON(sizeof(t) > 4 && !__TYPE_IS_PTR(t)); \
      |  ^~~~~~~~~~~~
./include/linux/syscalls.h:108:27: note: in expansion of macro '__SC_DELOUSE'
  108 | #define __MAP1(m,t,a,...) m(t,a)
      |                           ^
./include/linux/syscalls.h:109:35: note: in expansion of macro '__MAP1'
  109 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:110:35: note: in expansion of macro '__MAP2'
  110 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:111:35: note: in expansion of macro '__MAP3'
  111 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:112:35: note: in expansion of macro '__MAP4'
  112 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:113:35: note: in expansion of macro '__MAP5'
  113 | #define __MAP6(m,t,a,...) m(t,a), __MAP5(m,__VA_ARGS__)
      |                                   ^~~~~~
./include/linux/syscalls.h:114:22: note: in expansion of macro '__MAP6'
  114 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
      |                      ^~~~~
./arch/s390/include/asm/syscall_wrapper.h:80:36: note: in expansion of macro '__MAP'
   80 |   long ret = __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));\
      |                                    ^~~~~
./include/linux/compat.h:66:2: note: in expansion of macro 'COMPAT_SYSCALL_DEFINEx'
   66 |  COMPAT_SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
      |  ^~~~~~~~~~~~~~~~~~~~~~
mm/madvise.c:1314:1: note: in expansion of macro 'COMPAT_SYSCALL_DEFINE6'
 1314 | COMPAT_SYSCALL_DEFINE6(process_madvise, int, which, compat_pid_t, upid,
      | ^~~~~~~~~~~~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:266: mm/madvise.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile:1723: mm] Error 2
make[1]: *** Waiting for unfinished jobs....
...
