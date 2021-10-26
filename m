Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A317343B877
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 19:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbhJZRqk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 13:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbhJZRqj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 13:46:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA241C061745
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 10:44:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id m17so5523953edc.12
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=tmXVzuh5dkyrAII+ZVrZrBIPLN2O4THznBgHQCPFnbQ=;
        b=Dqi3PP/SSAWFWG3gfFkOGyGSEegQad3EgGyE34NDLLAELVK50eCq1MDlOhgmBPwOU6
         so2oMwx8riSKbOO2mzEapG+9A6CRdtzRiSu3Y2NZ918aQTUcvOnEQBpUTC0i7yFT18qw
         XvmE3p37xBMf/1zXADOuvDJFF8+rbErRKKvQ6WrLtvKyH7G9Jp1nujOWNxj50IVXj1wm
         BpYRzv7tWEq4TDOG+41TYA22vLr1Kg734dVaWfNKDwROR+iCblGttPlsJw1JRqIkUDFg
         EF5y6WjI+0R4VxsGN6ksjPs0HRVys6LuGpN9HdX8BTjsZwe4H7dpGfgVwHlCsQhkgT0U
         TA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=tmXVzuh5dkyrAII+ZVrZrBIPLN2O4THznBgHQCPFnbQ=;
        b=jmrDXAawgZueRxXMQge8ZBKDfLzSb0bGD6RCnwaMFYP+dYa/V+wMV6EQteDb0GvRbs
         ytnwUMTnCueee7GRm7ZbOemxNNtiS9SCKsL0c/uL6g7MFjQI+QoEIcVyhqo6xQ/UIini
         l/SUsjBTE5SoM/ewLTNVsqPvySOz6iiZs35XGxN2at2P7QNV7wLL0AfTB3g/xhzAEUV+
         y7+8YjajEAJahmfNDVJF6MpQkxtTRq6DdsO01HWXmxoJkbUkZ8IgotpeOhP3wrx0MWqL
         r+U9/+XPalSDqIf/hjA/shANnUMMwslcbvKEX1JpAVA5iBxnqKL6RzQbb3DTAIASxYzF
         2P0Q==
X-Gm-Message-State: AOAM533Tj+ohkfgOWi/gjte8JB5xE6sUTCwOXgwYsmdPqafZm5eN5d7b
        h2CdI9Rrzi3mLB00zSJWqSDE+ENclVuTMEqLkOSMxw==
X-Google-Smtp-Source: ABdhPJzpc5E2MH0dqfxYAdQeV4sDDHg8gxDgPhXTBuOBsaV+P2Ti1CzuJ28DAy8IRpeA3OQ6rZ34ANCraRU5f+j8IkI=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr23553041edu.357.1635270254187;
 Tue, 26 Oct 2021 10:44:14 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 26 Oct 2021 23:14:03 +0530
Message-ID: <CA+G9fYuAuu3vXMh_Re9Vcrne2BvAbJz=zujeoh5NQ8qmQqs2Mg@mail.gmail.com>
Subject: parisc: sched.h:2138:38: error: 'const struct thread_info' has no
 member named 'cpu'
To:     linux-parisc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Please ignore this email if it is already reported ]

Regression found on parisc gcc-8/9/10 and gcc-11 built with defconfig
Following build warnings / errors reported on linux next 20211026.

metadata:
    git_describe: next-20211026
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: 2376e5fe91bc (\"Add linux-next specific files for 20211026\")
    target_arch: parisc
    toolchain: gcc-10

build error :
--------------
In file included from <command-line>:
/builds/linux/include/linux/sched.h: In function 'task_cpu':
/builds/linux/include/linux/sched.h:2138:38: error: 'const struct
thread_info' has no member named 'cpu'
 2138 |  return READ_ONCE(task_thread_info(p)->cpu);
      |                                      ^~


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/202T6V9WW7HdyiYW1pERBsc94FT/build.log

build config:
-------------
https://builds.tuxbuild.com/202T6V9WW7HdyiYW1pERBsc94FT/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch parisc --toolchain gcc-10
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org
