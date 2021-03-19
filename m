Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBEB3420BE
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 16:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCSPTb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 11:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhCSPTV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Mar 2021 11:19:21 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242DAC06174A
        for <linux-next@vger.kernel.org>; Fri, 19 Mar 2021 08:19:21 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a7so10313961ejs.3
        for <linux-next@vger.kernel.org>; Fri, 19 Mar 2021 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ESHJ/xpoPLprVXdQr5aaOZYnopxfXbBpJirRzC/e87Y=;
        b=E1MyGjANCGe2v1YDOi96jNvi7AX9CiZZmnHh1dSazPD1exZJyAptoayn8NzA5DugW2
         S9Bq3IxiqzonMdby7vQqkLZymeQ/YqoQKl6AHc1DIs74zoWGSinBLjNjpW/wgApb5JWR
         NTgx2Luub+h+oYIdTdrmV16G45JfxJCMAoreKRCpkkh7wIa9JiBUovV2I3jO/eRL9BYe
         +JM9GSDfCUxIQkNFnfGWclE0C8KqDnkSwA86q/8JV8M9zZcWSm/+eUZHrtCUkq/w29Jp
         7wPTc2ntAdVDdoocZ2GaWP/RvQyE8jADbYDJ2Hz8FgLm3bYrcMf+jcS9iOhlxknUN2Cd
         jl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ESHJ/xpoPLprVXdQr5aaOZYnopxfXbBpJirRzC/e87Y=;
        b=IA1dC6YfUxndRnq9BOsHAAsHsKVTzsRKVWntKc8WphFDErulqUF/80hGjXlMbNFcD4
         jDmnYGBL1upFKpC7aP7b4dMo2XDMstPSnYn/ICIV/ZJlev0Stwp1V+vy8dQldMTFpOYh
         sT2USrfNn6vKK95WuKZg6h8kKmAwK9wWbLJqwFwgofz73FiD241jVo6d4LSF7OGpAI4w
         S6FklgPEwb8WvXqKi97jOZ52qzIRkqC4eRuXYfJ937gvnqeRRtdzkkpEdi52lwHxQyfh
         xNT+TGARE121ezdBs1qAMtHp3REjw7swlhEo/3dcXqA0TWU1eFSlpQzbRPNorbWAGSPd
         AJsA==
X-Gm-Message-State: AOAM531A60a4LBGcpBQ5VBS0Cr11fkizDkUYQ3vLMKHijQ7eGQo5tEcm
        kwRfk3Jzm89f1YmWsqfwykFyNXQzVTprUslMGbumox8ppz1S1nNG
X-Google-Smtp-Source: ABdhPJwf2apA+WfsgXrym8IqCYDGSzycBSor+WUmQjtqmk0mRHE7fsQ5goyIyML5cG3xukXE3lSGhjODQL4SmWPmlLo=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr4861822eju.375.1616167158632;
 Fri, 19 Mar 2021 08:19:18 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 19 Mar 2021 20:49:07 +0530
Message-ID: <CA+G9fYu-t_JwoBVXKhiDUY-FRdX3F3LgbDw9bFeiuciwC70TaQ@mail.gmail.com>
Subject: arm64: compiler_types.h:320:38: error: call to __compiletime_assert_417
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, glittao@gmail.com,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Vlastimil Babka <vbabka@suse.cz>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[This email landed to Spam for some reason, sending it again with modified
subject]

While building arm64 kernel modules the following kernel warnings /
errors noticed on linux next 20210318 tag the gcc version is 7.3.0.
Build PASS with gcc-8, gcc-9 and gcc-10.

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

--
Linaro LKFT
https://lkft.linaro.org
