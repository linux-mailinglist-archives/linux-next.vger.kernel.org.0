Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C623340491
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 12:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhCRL00 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 07:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhCRL0I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 07:26:08 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09DDC06175F
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 04:26:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id e7so6140784edu.10
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/X2uhjyCyP9bVL0ZCIGJk+B5JfymTwMH7DMVHF84py4=;
        b=kcO/8i6u6F7ObPux8XRCXKqs4v6CJQ9fojdoDBsanzft2GsAVGt9SJivArRvzA3SQ6
         uul7/AMDQci10DsXCOabXsP9zM7rg6r6iZQ3/qBGqvxgmDF+YkxvWyZovU0/0MJ7y4hq
         eJYQm/ERmVmfjPM8fkOtJuq5f8L1fi4r3eqMkRgnZYGuA+AQ5B34kSSbRddV3lbXQL+5
         oiSLFHiaW+tol5zF16V+/fQgsYEdEjswf1LAF+DS361jebrcqFhdH45qpPAwUbY0h5wc
         1juusfGoWwJF+Yi1mPPI5OSByXnZctXpWucKRPVFtrqJHmVhgLYAg6a16CNFNk6KwQmU
         yO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/X2uhjyCyP9bVL0ZCIGJk+B5JfymTwMH7DMVHF84py4=;
        b=mnV0qyHfEWPHU26p71IQ7EqAwVFQqYQo1hj+9JO6Vq47AEbAG7sKzrRzRzwPNhjDxE
         4/iaOz/tO8U2Q4tadaVPWspAm3CYpF1x1qLRMGMllERtzthJ4BPKCvDtkd5F49N9frnE
         0X4vb5SjvlGStDPLpd8VcItNLe4es7/Ya/Z3r5bDMAc4B5BJR9OUjui0uZoqndyjb9oP
         tRoSzDqmAK41bYZH7f0dBs1g71Yf/fGT5wYkhPG2GJYjwTXH7+v5RFJfBLRG/tneninD
         CAckb8lcd4c181zw8Z9wzP7Xo6LbWkst9l7lb/n7DslJMtLdEr5wB3Qm9ZmysXYhFOYo
         j06g==
X-Gm-Message-State: AOAM533oKi4mGTy0E9dN0JIE6KVBksfZcPi1u2blkS2jHn6fS2yOGdOo
        02tk9VsCFKFCPmTBp/9QA6WuEWJ2PmqmvBk86f7OycFV3h4yGetb
X-Google-Smtp-Source: ABdhPJxQKEcG1V/mPJiklxwhYGHC8gy8vnroQ7vjZPKcNn4AzM2gRBUaOkdzi/lE7yNSn73C5mkynRwKn/ksuMuiGqM=
X-Received: by 2002:aa7:dc04:: with SMTP id b4mr2961551edu.221.1616066765526;
 Thu, 18 Mar 2021 04:26:05 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 18 Mar 2021 16:55:54 +0530
Message-ID: <CA+G9fYtZWp4MPs4QmM2gKTZGxX8PNzYRFHDy+zkhVTgOmitr7Q@mail.gmail.com>
Subject: next: arm64: compiler_types.h:320:38: error: call to
 '__compiletime_assert_417' declared with attribute error: BUILD_BUG_ON
 failed: KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While building arm64 kernel modules the following kernel warnings /
errors noticed on
linux next 20210318 tag the gcc version is 7.3.0. I will check latest
gcc version builds
and keep you updated.

 In file included from <command-line>:0:0:
 In function 'resiliency_test',
     inlined from 'test_slub_init' at   lib/test_slub.c:120:2:
   include/linux/compiler_types.h:320:38: error: call to
'__compiletime_assert_417' declared with attribute error: BUILD_BUG_ON
failed: KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10
   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                       ^
   include/linux/compiler_types.h:301:4: note: in definition of macro
'__compiletime_assert'
     prefix ## suffix();    \
     ^~~~~~
   include/linux/compiler_types.h:320:2: note: in expansion of macro
'_compiletime_assert'
   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                      ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro
'BUILD_BUG_ON_MSG'
   BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
   ^~~~~~~~~~~~~~~~
   lib/test_slub.c:101:2: note: in expansion of macro 'BUILD_BUG_ON'
   BUILD_BUG_ON(KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10);
   ^~~~~~~~~~~~
 make[2]: *** [  scripts/Makefile.build:273: lib/test_slub.o] Error 1
 make[1]: *** [  Makefile:1980: lib] Error 2

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=juno,label=docker-buster-lkft/984/consoleFull

https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=juno,label=docker-buster-lkft/984/consoleFull


- Naresh
