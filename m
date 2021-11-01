Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97D0441B6D
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 14:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhKANDB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 09:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbhKANDB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 09:03:01 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE93C061714
        for <linux-next@vger.kernel.org>; Mon,  1 Nov 2021 06:00:28 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r4so63443699edi.5
        for <linux-next@vger.kernel.org>; Mon, 01 Nov 2021 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JMrm6iIHu12TX3Le4ZvAmNYNTqandA0I6XEzD8Uf33o=;
        b=gwjeetL2ktZtLy08R+FARZYDrmM1v4KmXYqLcvKdG+NT0ALJL5NV4SPVOgHHDNbeGg
         +nkHXAgZiN3NnbiCPdl1pVgCFr2bZZrIQp8Q0wb/iu5Rw0qT+9QUVLfYnlkVrLJ/oPZl
         345bEJeFjUc+trpYcEyfrevR8bUBQA9EoJGSmquvGxO0jHt+g/ybnQ8SsHjpTkdHJWZT
         qwPqdFIyzFS+fWXbwXaF4TZKl7imcCwfCaDwlDXKQI5T5KmQpIEkO/4CDMg+7HBiF37H
         /zYvVH7x8zlgR8yhek6nk9Eyjbdm9Yq8WSdu9gM4Zoml2e4ddRXZv+IDE1E7A4Glart8
         LvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JMrm6iIHu12TX3Le4ZvAmNYNTqandA0I6XEzD8Uf33o=;
        b=x9Gau117H+WMMlfqHm1FjIH+RAQe0vxVL4ZmtJJl4kyVBCVhoV3VFtT9xvtVkdzw9Y
         w6t5b+kLkV2R/L3blGKjtg3qsLnqvYT/5xaMDbtH1s1o7endXLGyT4x/7AwfRBWp4L7m
         4UbL6i6idwxfuIIQPAkCUwBT+5iA8LRp6CC1g5wCWugsWThHXZH3F6XqHZFGkbh2kfT0
         gpFz5m1Gq/OlpIYiGO0FeeN+UOibrVRvn39RSh4gxCXR4li7ERl27dEtPiAQETPzi90u
         srDWaxxzu1mxcyGK9EUf/DyED4t62NWYT9FybM/iUzoEX8uE4PCea3PhuRYcukTwgWYv
         A3Ig==
X-Gm-Message-State: AOAM533idbj3t3wzNbOTK8Xm7y1mKuSlRjeFFFXidj3S8R9QlBNnupPs
        KU6tVuQosshVwORMGP2XyaeYuu0p7C9jokjCbKFByue9Sr/oDQ==
X-Google-Smtp-Source: ABdhPJwtYyX1GF3y4Z4lMZPNRfYDnfkp8peq6RWPpVFDHcRur2l+TJc6ny5O2tIs5KVvkIZJ429ycZOYfCLz8qWG9mw=
X-Received: by 2002:a17:907:76b0:: with SMTP id jw16mr12828713ejc.169.1635771626270;
 Mon, 01 Nov 2021 06:00:26 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 1 Nov 2021 18:30:15 +0530
Message-ID: <CA+G9fYso1sBLRAMpc0bdPiim8GvMhmwuRDaEZ0xbP1TZz864ZA@mail.gmail.com>
Subject: [next] Error: selected processor does not support `isb ' in ARM mode
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Juerg Haefliger <juergh@canonical.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Please ignore this email report if it is already reported]

Regression found on arm gcc-11 built with following config
Following build warnings / errors reported on linux next-20211101.

metadata:
    git_describe: next-20211101
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    git_short_log: 9febf1194306 (\"Add linux-next specific files for 20211101\")
    target_arch: arm
    toolchain: gcc-11

build error :
--------------
/tmp/ccyCNFmn.s: Assembler messages:
/tmp/ccyCNFmn.s:1114: Error: selected processor does not support `isb
' in ARM mode
/tmp/ccyCNFmn.s:2033: Error: selected processor does not support `isb
' in ARM mode
make[3]: *** [/builds/linux/scripts/Makefile.build:288:
arch/arm/vfp/vfpmodule.o] Error 1
/tmp/ccy2h2RX.s: Assembler messages:
/tmp/ccy2h2RX.s:387: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccy2h2RX.s:466: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccy2h2RX.s:505: Error: selected processor does not support `dsb
ishst' in ARM mode
/tmp/ccy2h2RX.s:509: Error: selected processor does not support `sev'
in ARM mode
/tmp/ccy2h2RX.s:524: Error: selected processor does not support `dsb '
in ARM mode
/tmp/ccy2h2RX.s:556: Error: selected processor does not support `dsb
st' in ARM mode
/tmp/ccy2h2RX.s:599: Error: selected processor does not support `dsb
st' in ARM mode
make[2]: *** [/builds/linux/scripts/Makefile.build:288:
arch/arm/mach-actions/platsmp.o] Error 1
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1993: arch/arm/mach-actions] Error 2


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/20JSORlPpF83BDZzJEvnIbuof6E/

build config:
-------------
https://builds.tuxbuild.com/20JSORlPpF83BDZzJEvnIbuof6E/config

steps to reproduce:
--------------------
https://builds.tuxbuild.com/20JSORlPpF83BDZzJEvnIbuof6E/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
