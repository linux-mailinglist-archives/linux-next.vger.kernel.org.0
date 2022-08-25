Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE405A0E5D
	for <lists+linux-next@lfdr.de>; Thu, 25 Aug 2022 12:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241278AbiHYKtB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Aug 2022 06:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241243AbiHYKs4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2022 06:48:56 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF53A2634
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 03:48:55 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-11d08d7ece2so17657086fac.0
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=8yezS67UjohYjkR2uYPnl+2W/QH+CI5jH+JmDR2etME=;
        b=cBjJDG+O1Z5ulYzna6FATto9ambYkbLRB41H+alqYu6I9gbtY3lQuyqQ88fLmttp6n
         K0ayucRoib1hlI4UOdr54fAkwV+QfkIcKVFgVUT8cqtfeDXQ50nsF/Ka1nPJIU+VitTX
         F7n6jxrVphemL6oQrdfcnaua7jgDfp7/MauuWBLEuyXZVRIfdHinou7/Fnh31EFcwD32
         3ck7JFJzLY28Oy/AVrQvvxaVlXDiicsPIg1tYT57wphUU+hyKg0ibDg3Q6qelrXJlU/V
         mLiJHmNH4r0ZUtxydUgKV1zHsngveb5INiEUsEwx9/+jn1qh39g2uBMXui/M73NUsKX7
         m4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=8yezS67UjohYjkR2uYPnl+2W/QH+CI5jH+JmDR2etME=;
        b=BF8Y3i1PZwGMwe9Ox6piImOur48OzK8kbxOeRtJeXjzm+HZuEsdQSzIvPCEpEo4Ed8
         Js57utxbiQ4oWj9avVBxvtISuFkUWL+6wyMQMYvkeHwxTpyv1H4AoO9I5mI3JQW/oM8r
         GgZANl/9KYGnFcEqGtEUPLwh0vhbjQfRgENY3EEABtoAWXZPpLqQtccyiQmu/Fm2ahqu
         57Dh7Qe0LhmAH1LNgayXx0q4eYFwGmZyEB3o/ucJQPulTEgKC2IoKkTrTTwXnd2SxJ/D
         gfyFpzraWKU/jOUXTkdjdavtDAG464xiTXbQpu9YO4ZloKEPaVTJdNW6ywqir/qHAcS7
         YhWg==
X-Gm-Message-State: ACgBeo1qCouQ66E6NPrw60C4qr6u/OvIEeSk1xOvoIO7/gmI9Cq0bVkg
        gV4d8Oysj8TCctP274VKEKF03El4YU7qKJJgZ9j/CQ==
X-Google-Smtp-Source: AA6agR78Trz7cKkr6hrmRkMhJNnHKdXi0bmX/cF+W43D3720j2E8BabHK1UIMZcPxUEyCAyKdJBjPmgtEwfUbHjymtk=
X-Received: by 2002:a05:6870:a18c:b0:118:5b96:1cc4 with SMTP id
 a12-20020a056870a18c00b001185b961cc4mr1599384oaf.290.1661424534425; Thu, 25
 Aug 2022 03:48:54 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 25 Aug 2022 16:18:43 +0530
Message-ID: <CA+G9fYvHLy63+jV3qMtHtQLufoeEpAjrteQ7+2Dvdt8CcGk9MA@mail.gmail.com>
Subject: [next] kernel/smpboot.c:435:6: error: variable 'oldstate' is used
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
To:     Uros Bizjak <ubizjak@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Longpeng(Mike)" <longpeng2@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The x86_64 and i386 clang builds failed due to these warnings / errors
on Linux next-20220825.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

kernel/smpboot.c:435:6: error: variable 'oldstate' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/smpboot.c:449:6: note: uninitialized use occurs here
        if (oldstate == CPU_DEAD) {
            ^~~~~~~~
kernel/smpboot.c:435:2: note: remove the 'if' if its condition is always false
        if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/smpboot.c:428:14: note: initialize the variable 'oldstate' to
silence this warning
        int oldstate;
                    ^
                     = 0
1 error generated.
make[2]: *** [scripts/Makefile.build:250: kernel/smpboot.o] Error 1

Build link: https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/

Steps to reproduce:
-------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
--kconfig https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/config
LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
