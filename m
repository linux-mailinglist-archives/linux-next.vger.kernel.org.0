Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716E95A0EB0
	for <lists+linux-next@lfdr.de>; Thu, 25 Aug 2022 13:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbiHYLHc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Aug 2022 07:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbiHYLHc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2022 07:07:32 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7EAACA15
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 04:07:31 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id g21so14829506qka.5
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NFLgYkCaEI5s4PbUxMHY3+5s8XqDi7XgHlnjcMfnmFM=;
        b=EjFCQyIwTjWf3QQFss/peM3xmIAfM1QI/FpiaFOZH3MDcn8eQ/vD7BNZdsW0F/o2Zp
         Xkx25BADn8V6xRArayGRfDlFumP7yr9KsB/6Awnrf5/89Th7AcswlHItjX8AKnPTI8ml
         ty2ttCErQVm6iIacMIqxtY5HGXz4y9IdzFUck5fWSdTbMRRrippJE7ZsGJTPRmDEVfYK
         RKBCbwIV+h1Bea4Lm+9IchfPiYJ6fYAS1K49Mq60OCqStd1unXf87gkMi7fgSnRuAu+Y
         5H0IpHvN3ITbhcAnEPYEzGsOdoBL6S/xydBUDMldcg8ngt1JMrqFpWK9QYPshmhIFIZ5
         iIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NFLgYkCaEI5s4PbUxMHY3+5s8XqDi7XgHlnjcMfnmFM=;
        b=mgAtQPZy6p9KcpWHV0FPLo7QYkrnTj7SQnq4vYfuH8bhYwee7KP6ELqMeiEYG2PGLh
         qS66ZEglPMVyMww000H/F/uyUvs1OcqqfSMmXB58PUvNfy1qKy2rwOMjBZno+4WeHJuO
         OAu0dThOqby0ERp7+MB2ZrVqVrXW7LRIyO1wS2QW3CEoLhvIe9FdwA1VyzkKzALAvPHn
         XmW4eCDcfbhyiWERuNP+mljfHICfSTb/bilEqyaEUL7rJ+1E5By86ZTvkDPUMMR8FzaZ
         Jrjayo8c1LOxRcfCOFxdRN+5/dBCmOPQQhMilC4eOQdYNCIH5j01jShOzzcpYa+RTtX9
         PAjQ==
X-Gm-Message-State: ACgBeo2oKRrxE6e6HCcRybr2FqDm9nm6TfQrkQMjLL+UamCzcC4FTwoo
        AFz27fYsFnDbsqnuzJvH5CIqix15aBP5W/BpBQo=
X-Google-Smtp-Source: AA6agR77tGQAQAwf1DpfAy4TV+DnFug5v7sbHYdetgTRO0PHI9Um7Ub2YFnFEwFcZX4K2Kue83ASqE7ElO7U2TNPWz8=
X-Received: by 2002:a05:620a:2587:b0:6a7:ee6f:bf2a with SMTP id
 x7-20020a05620a258700b006a7ee6fbf2amr2570783qko.542.1661425650405; Thu, 25
 Aug 2022 04:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHLy63+jV3qMtHtQLufoeEpAjrteQ7+2Dvdt8CcGk9MA@mail.gmail.com>
In-Reply-To: <CA+G9fYvHLy63+jV3qMtHtQLufoeEpAjrteQ7+2Dvdt8CcGk9MA@mail.gmail.com>
From:   Uros Bizjak <ubizjak@gmail.com>
Date:   Thu, 25 Aug 2022 13:07:19 +0200
Message-ID: <CAFULd4bT4UrdQctUdJHSV9rjpRb02PHGRwxXcg=PZF9eiAfnXg@mail.gmail.com>
Subject: Re: [next] kernel/smpboot.c:435:6: error: variable 'oldstate' is used
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Longpeng(Mike)" <longpeng2@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 25, 2022 at 12:48 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The x86_64 and i386 clang builds failed due to these warnings / errors
> on Linux next-20220825.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> kernel/smpboot.c:435:6: error: variable 'oldstate' is used
> uninitialized whenever 'if' condition is true
> [-Werror,-Wsometimes-uninitialized]
>         if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/smpboot.c:449:6: note: uninitialized use occurs here
>         if (oldstate == CPU_DEAD) {
>             ^~~~~~~~
> kernel/smpboot.c:435:2: note: remove the 'if' if its condition is always false
>         if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/smpboot.c:428:14: note: initialize the variable 'oldstate' to
> silence this warning
>         int oldstate;
>                     ^
>                      = 0
> 1 error generated.
> make[2]: *** [scripts/Makefile.build:250: kernel/smpboot.o] Error 1
>
> Build link: https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/

Please see

https://lore.kernel.org/lkml/CAFULd4bgdGosQ3byMW9S+ov0uDO9iK3jCmZ-fkZQbCGOpfUvXQ@mail.gmail.com/

for the fix.

Uros.

> Steps to reproduce:
> -------------------
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
>
> tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
> --kconfig https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/config
> LLVM=1 LLVM_IAS=1
>
> --
> Linaro LKFT
> https://lkft.linaro.org
