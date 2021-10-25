Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514A9438DE1
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 05:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhJYDn7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 23:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhJYDn6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 23:43:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8A6C061745
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 20:41:36 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g10so12314529edj.1
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=R7r5nV+f/BLs6fBG2/3YXVcabtEftBenYKHwNbGZbTg=;
        b=W1Gj0aUVM4PZBvsqrYgNabx+2o0sAFXJfxuWrvZuz81/vBcETq4HcBg9HbY1ZQtY0W
         aFSbPLRyZrOklE8ndalUleWi5OhQcyPoey20uDDrWAmkSAkx4Ll6uoCkjEfsJj+LjcKS
         ySkY5If+ecHR0Qd0G26F1C6PXjY+qEY5BzdkHpqCOZ/TO0cjKFEJgShu6747lGNLxT6L
         4lpRFeZB7xQKO+I5nKiVn6Kewjgi54i9QiYBPi49OWfFyoOSimY+vYw+VLKSGxvGoPby
         cW0PArQaGzZ5WJu41D9Me+OxseLlT8MPBnhXXBnaUZuUi/pLu+0czoJBtLRfp8b4MPno
         aO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=R7r5nV+f/BLs6fBG2/3YXVcabtEftBenYKHwNbGZbTg=;
        b=56hiYx6o8Xo3uYx3kq5xTXiWokewhSpv9MZpr9eWKzmj03FqkFFQPZJveQQmDxGFRP
         +LshUPmhyaY5CbZVN7I8DaI1Yg4Q4hMQbRfzuhAZNc3UMkEO4OSTIS6tDOyYzyGZ0neI
         cLNu+rwfTxTLep2FcGFKmqmsEn1TYPGa7Hm7HtmB9mknSBkQ0AN3pRPvnbw6qD5ze2AE
         wejKLfuQArLKe2Sn7vHhZZu1wH4OLT1KOKQWu6DCTd9HzWaQoI92/n0H2kRW95sV5WSN
         EL0A4pJ59nm+p81bywY1og7LKaSc2LEez+Gm1ljZR5zPg3zy/9Zw8VxcvZpK++RABRoj
         x+NA==
X-Gm-Message-State: AOAM531BQqo2rtlz5OYD2izTdPu09gR3THQyb88gYql6P7ij2JRiHLV5
        sp7+sAG9NlLwtIa/RKjLeGsRffJVxwper1aZrUiI0C7EA8JlTQ==
X-Google-Smtp-Source: ABdhPJxGK/M3vP5WQITSyq+LlYH5oIDbC/nuAqxCOTUZ5mnIjHNBXdvaE88d9YkAUkIB2Jj3BkHqfa9v+hG2B9xOA9E=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr9134161edu.357.1635133293072;
 Sun, 24 Oct 2021 20:41:33 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 25 Oct 2021 09:11:21 +0530
Message-ID: <CA+G9fYvoEw4WrgMa36ybVrd04sROJmhXJXKiSrN6ZVs7=hdX+w@mail.gmail.com>
Subject: kernel/sched/core.c:6299:35: error: 'struct task_struct' has no
 member named 'plug'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Christian Brauner <christian@brauner.io>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Regression found on arm gcc-11 built with tinyconfig
Following build warnings / errors reported on linux next 20211022.

metadata:
    git_describe: next-20211022
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: cf6c9d12750c (\"Add linux-next specific files for 20211022\")
    target_arch: arm
    toolchain: gcc-11

build error :
--------------
kernel/sched/core.c: In function 'sched_submit_work':
kernel/sched/core.c:6299:35: error: 'struct task_struct' has no member
named 'plug'
 6299 |                 blk_flush_plug(tsk->plug, true);
      |                                   ^~
kernel/sched/core.c: In function 'io_schedule_prepare':
kernel/sched/core.c:8331:20: error: 'struct task_struct' has no member
named 'plug'
 8331 |         if (current->plug)
      |                    ^~

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/1zrAO09dMNS9qQgDFaILyvKNS3A/build.log

build config:
-------------
https://builds.tuxbuild.com/1zrAO09dMNS9qQgDFaILyvKNS3A/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig tinyconfig

--
Linaro LKFT
https://lkft.linaro.org
