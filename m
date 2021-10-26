Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E867743B836
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 19:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237829AbhJZRfB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 13:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237827AbhJZRfB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 13:35:01 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FD1C061745
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 10:32:36 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h7so5859838ede.8
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=VmdSeOz3tGynEfdRHSi/l2aNe64eCuVaGO+sKEKzIEs=;
        b=lFV1Kn9YSWpfRCXDLTgIzTtK5Onr2mc2xw8HrdtAXKgEOa8JSMMOp+98zvouEDwNbi
         LECWd36JYV6hYOh7pSs09hzFodgLMAqbeBHPUtLI/OFMrjklw1ze+9RsWJc4Xgdp9Ycd
         yJTFVP46RJ66WeBfZCYfQMJEURfUi08jaTynqLog1wiWpN+BJlzeGq8LVpxQcSDWERUS
         qM60ROO/o+LXmKhmPFYjeXtKCW0UwXGUikQW6NXM9WL/B9T12Nxna/LMwG/bxJL2xc7n
         VoDp+86dk9OienrE3chWVnqRzRfEiJuoGS0a7iR/SClLyg08YfRidoWz2vOvZaTRqH4f
         vWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=VmdSeOz3tGynEfdRHSi/l2aNe64eCuVaGO+sKEKzIEs=;
        b=phhFDZyfSitmwFR3ItwGxCwnCeMpx8UlA4+bvnIOi3Qfz6KmO3xrqTGEktW0F5tuNk
         CLN1f0n1W62fYLCPnxznS7XyR2k1oG1ySmtaQvNuhv9KDHb/PphE27I08nFqZvSBnsQT
         Bfa4Sd7zNscrusnDTSZPD2vCgjOaPpxMEqAgfDi5XiebErlMDv/V/vUrThQFQTuzr3cv
         6se8Bsxhy+qhfGw0hLg7ejOzRp4kzIoI99UDMYu2MopekT/f+wbXUxHpD/m+WJCv7A6h
         bLTcg+btZzMwWoMuUV2cM3xO44vBjT5Ys2ni4nPPSd+/LxSLrYjhhTOgxQ7QdHM31ceY
         +0rA==
X-Gm-Message-State: AOAM531wfUPiBfe/DGXnG1bg1crKOq97kfFZLGSFXOrN58MXpiIPs/HJ
        4tyIOy2fvH0TO6zqY3hVCDL5RtTwmFfFdiN17cWu4Q==
X-Google-Smtp-Source: ABdhPJzOdAE7OzEdd31gDoFVlnoaXRqLqGfNn3B0fTL1hI5KdSaeQgNdrCI+0YkElhBcHgyE5wnKl4iwKHdUpBckXGc=
X-Received: by 2002:a05:6402:5255:: with SMTP id t21mr36568076edd.103.1635269555221;
 Tue, 26 Oct 2021 10:32:35 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 26 Oct 2021 23:02:24 +0530
Message-ID: <CA+G9fYtFTjVz-hN=HdF56vKYpY5LhKoscyWTv7gQxzjoboHzwQ@mail.gmail.com>
Subject: s390: {standard input}:11: Error: Unrecognized opcode: `pushq'
To:     linux-s390@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Alexander Gordeev <agordeev@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Please ignore this email if it is already reported ]

Regression found on s390 gcc-8/9/10 and gcc-11 built with defconfig
Following build warnings / errors reported on linux next 20211025.

metadata:
    git_describe: next-20211025
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: 9ae1fbdeabd3 (\"Add linux-next specific files for 20211025\")
    target_arch: s390
    toolchain: gcc-10

build error :
--------------
<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
{standard input}: Assembler messages:
{standard input}:11: Error: Unrecognized opcode: `pushq'
{standard input}:12: Error: Unrecognized opcode: `movq'
{standard input}:13: Error: Unrecognized opcode: `pushq'
{standard input}:14: Error: Unrecognized opcode: `movq'
{standard input}:15: Error: Unrecognized opcode: `call'
{standard input}:16: Error: Unrecognized opcode: `popq'
{standard input}:17: Error: Unrecognized opcode: `leave'
{standard input}:18: Error: Unrecognized opcode: `ret'
make[3]: *** [/builds/linux/scripts/Makefile.build:288:
samples/ftrace/ftrace-direct-multi.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/builds/linux/scripts/Makefile.build:571: samples/ftrace] Error 2


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/1zzgG8V6qSBH9457ca0kOcQR756/build.log

build config:
-------------
https://builds.tuxbuild.com/1zzgG8V6qSBH9457ca0kOcQR756/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch s390 --toolchain gcc-10
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org
