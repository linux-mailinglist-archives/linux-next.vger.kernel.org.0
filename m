Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AFB2947A9
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 07:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440312AbgJUFFX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 01:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440302AbgJUFFX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 01:05:23 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA66C0613CE
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2020 22:05:22 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id n5so1111020ile.7
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2020 22:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TSmk+CUeMC40ldFbF6oW/AydEBIYRcBxKh34Sk+KxDs=;
        b=QedtFi9aWDiAbYqLlkRKWBISzp9pjw66dacIyHmYrdqI1ae55ju9s2zVad3l1F8Nur
         MWajYO4jkVR0TkP10wsFhEXpiAVTRw3ClyVGwi7FWWa9mxDO1wnk70f4uEvHS8y+cCBv
         1mFf35MKoZA7s+3LynsPrpzgGMdVSKHLhOPKA7mH4dd3vCJO2F/wyv3uZgc8dyBU5Hi4
         FA9lO9essQOmSPeQF+R6K1+CSzwANZXk8Pyk43c+pTrMcFBnEfk+G0exsn3DSKTrLYGn
         ENCp9LgGE9vlmJwDibWgOX2zOZ6lRrW1JfGPOMurYwCFhJwnvnj67eggv7tDCKySgjv2
         oh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TSmk+CUeMC40ldFbF6oW/AydEBIYRcBxKh34Sk+KxDs=;
        b=OQdxQW5YPuT2WCzNTMHm9dJHpZSBqbASE9NUuWnIg60nIHR592oyVhGe7pwTJo19u0
         S0VZ8Hrf34Vzi/kBbUOxGog9PGQzKBiuBOgR4W1RqbONRohUI4SymXrmPz87geJjHVyA
         wP18HL4VQM3s68doXG4usuuXc1ISaNeGx/UmOGEYhZa0O0BSEladzN3psZkmmea+XQoT
         /kmxUK3VyyyTRm8DFdE5FcHx4PXEbDeLb8KEL+VT+xlT+CXA4Zl05Yji62gUpoHg2KB/
         FZQY6NHJBCE1AiUVroSlFUhpAip/Ijd/vd24iLMcg9TVs1/J9VBhuh0hgUnxxCCAnAzF
         13dw==
X-Gm-Message-State: AOAM530AgxRgQtHXYWWw2XJ62j4ce80ztM/MB5Q65nFRRkwmAQLnJY0R
        TVGqCzgrN+YIYU4ho5uyGcSrndctWNfaqqndm3OHHfrYAJGWOh1K
X-Google-Smtp-Source: ABdhPJxWmTg/ZXvwBDJQrQngv3o5Cpm6ToHK3iIIuewaT+aH77PrCkDjPLt+URUPEkJVDp00VkHoPeBiDWghGun4O+g=
X-Received: by 2002:a92:9944:: with SMTP id p65mr1037022ili.127.1603256721681;
 Tue, 20 Oct 2020 22:05:21 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 21 Oct 2020 10:35:10 +0530
Message-ID: <CA+G9fYuL9O2BLDfCWN7+aJRER3sQW=C-ayo4Tb7QKdffjMYKDw@mail.gmail.com>
Subject: arm64 build broken on linux next 20201021 - include/uapi/asm-generic/unistd.h:862:26:
 error: array index in initializer exceeds array bounds
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Netdev <netdev@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arch@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Christian Brauner <christian@brauner.io>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

arm64 build broken while building linux next 20201021 tag.

include/uapi/asm-generic/unistd.h:862:26: error: array index in
initializer exceeds array bounds
#define __NR_watch_mount 441
                         ^

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

build error log on arm64:
--------------------------------
include/uapi/asm-generic/unistd.h:862:26: error: array index in
initializer exceeds array bounds
#define __NR_watch_mount 441
                         ^
arch/arm64/kernel/sys.c:56:29: note: in definition of macro '__SYSCALL'
#define __SYSCALL(nr, sym) [nr] = __arm64_##sym,
                            ^~
include/uapi/asm-generic/unistd.h:863:11: note: in expansion of macro
'__NR_watch_mount'
__SYSCALL(__NR_watch_mount, sys_watch_mount)
          ^~~~~~~~~~~~~~~~
include/uapi/asm-generic/unistd.h:862:26: note: (near initialization
for 'sys_call_table')
#define __NR_watch_mount 441
                         ^
arch/arm64/kernel/sys.c:56:29: note: in definition of macro '__SYSCALL'
#define __SYSCALL(nr, sym) [nr] = __arm64_##sym,
                            ^~
include/uapi/asm-generic/unistd.h:863:11: note: in expansion of macro
'__NR_watch_mount'
__SYSCALL(__NR_watch_mount, sys_watch_mount)
          ^~~~~~~~~~~~~~~~
arch/arm64/kernel/sys.c:56:35: warning: excess elements in array initializer
#define __SYSCALL(nr, sym) [nr] = __arm64_##sym,
                                  ^
include/uapi/asm-generic/unistd.h:863:1: note: in expansion of macro '__SYSCALL'
__SYSCALL(__NR_watch_mount, sys_watch_mount)
^~~~~~~~~
arch/arm64/kernel/sys.c:56:35: note: (near initialization for 'sys_call_table')
#define __SYSCALL(nr, sym) [nr] = __arm64_##sym,
                                  ^
include/uapi/asm-generic/unistd.h:863:1: note: in expansion of macro '__SYSCALL'
__SYSCALL(__NR_watch_mount, sys_watch_mount)
^~~~~~~~~
scripts/Makefile.build:283: recipe for target 'arch/arm64/kernel/sys.o' failed
| make[3]: *** [arch/arm64/kernel/sys.o] Error 1
scripts/Makefile.build:500: recipe for target 'arch/arm64/kernel' failed
| make[2]: *** [arch/arm64/kernel] Error 2

full test log,
https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=hikey,label=docker-lkft/882/consoleText


-- 
Linaro LKFT
https://lkft.linaro.org
