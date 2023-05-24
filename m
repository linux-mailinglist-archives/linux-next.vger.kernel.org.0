Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7846C70EEE3
	for <lists+linux-next@lfdr.de>; Wed, 24 May 2023 09:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239821AbjEXHDj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 May 2023 03:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239820AbjEXHCt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 May 2023 03:02:49 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F2AA3
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 00:02:36 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-437de9222a9so201556137.0
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 00:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684911755; x=1687503755;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zathy20xS7vJeZuKOGggo3NoBWnp0DVNbyEjeiM6xS4=;
        b=GS0T+2ZiZtIWhMLKI1BCOYeVgv/IGtV84JHpGDoKwUETz4c5FtzkwVnkLZRCAUXr1w
         UOjLF0XImHP0TCxXerBTDu66jzWaLqIR9nA8v6V3EWkXUKhwccAiz/r4JNsXzNNbfyFu
         nkw+g0Ehx1u0wgcDZr5f8Pz/jHmmPlEZAglyd6lx2LTlJhSwj5U9kaoBXf/dQ3pujEmR
         r20QDnFLKHPJ373hZiYFZ+HMh3Tp2Fd/nANKSufzOjFVaDzoXf/4zxNzYDQeWcR6iT+g
         kcmTH8SLmxfacnyj+71eWYp0Vr8Xvd9/4o5fysO5cedJS1mDIsMXl9PfLh5zO+vTPfGp
         xvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684911755; x=1687503755;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zathy20xS7vJeZuKOGggo3NoBWnp0DVNbyEjeiM6xS4=;
        b=JcK95h5NQ8xnUQXJB9fTxjNK/643fBN11YWZ1m7+5INSlvtVbzDS5MdzAIqriBpwvh
         CPdb8psS89lWa+QZVcHTQ8lxkwX1eSJUXiB4AURjZ5NyNyPHgYzJFzsEJt7t0+W8nimz
         eIq2miWGkvzDTEw2G6+8bzEPL+IFnXC7lP2Lo3UsK4V6iYcjzSnyAo1U153+127ZV6K8
         pbQB3ErWBAReR0JgliELhCwrL88JzqwEXSbrVAJOO/DQezR7KbvlgnLQi8dfKBe/9kqE
         s9G1QRQLZlWri9gDVc6G8/XvN3wnz57k/73QjzA7Jv4p3XJiiDitfvtVVfb6H5QE9Mvn
         txdg==
X-Gm-Message-State: AC+VfDxxzDd30Z4+juECoV9JisaUJij1LwZzLA1eNlQ+V7WoIx7d6uII
        6QPcqfjoqGtoVkd/vminzkclFE5ofWUZzo3e/1ENOD7GKKc/h85TLfCHvg==
X-Google-Smtp-Source: ACHHUZ5YvfK9jIfenGUN1SYu3dWbneLgbIzcETIs71ai8XaJGabWjDHqNLVp3vKy8J/gVDKADHkGbupXtaLmckg4avo=
X-Received: by 2002:a05:6102:2f4:b0:437:db1d:7edf with SMTP id
 j20-20020a05610202f400b00437db1d7edfmr5330791vsj.26.1684911755092; Wed, 24
 May 2023 00:02:35 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 24 May 2023 12:32:24 +0530
Message-ID: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
Subject: next: clang: x86_64: /intel_display.c:6012:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        lkft-triage@lists.linaro.org
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, arun.r.murthy@intel.com,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next-20230523 and next-20230524 the x86_64 and i386 builds failed
with clang.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going \
  --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 \
  SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- \
  'HOSTCC=sccache clang' 'CC=sccache clang' \
   LLVM=1 LLVM_IAS=1

drivers/gpu/drm/i915/display/intel_display.c:6012:3: error:
unannotated fall-through between switch labels
[-Werror,-Wimplicit-fallthrough]
                case I915_FORMAT_MOD_X_TILED:
                ^
drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert
'break;' to avoid fall-through
                case I915_FORMAT_MOD_X_TILED:
                ^
                break;
1 error generated.

log:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230524/testrun/17171777/suite/build/test/clang-lkftconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230524/testrun/17171777/suite/build/test/clang-lkftconfig/history/



--
Linaro LKFT
https://lkft.linaro.org
