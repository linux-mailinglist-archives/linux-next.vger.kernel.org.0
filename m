Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB613A2ADA
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 13:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhFJL5P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 07:57:15 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:36680 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhFJL5O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2021 07:57:14 -0400
Received: by mail-ed1-f49.google.com with SMTP id w21so32583641edv.3
        for <linux-next@vger.kernel.org>; Thu, 10 Jun 2021 04:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4qMF7JTBYZPTkfoUxEfMGRS4U/sbmt/HerhagcW9ih0=;
        b=qjDH5fNAAD/GL8f2FHXw0a4WQ6sXYZqGrOngMavri12bD0g2O1AbUtbrHSDAFS5jxZ
         fOZ5ezHtaekWcZiJ7qGKF4zUHxAj9BKOL/OSsjr1Oyc3+2V2F8apg8YVJM3hCo9Cu2zq
         X3f8kGIBWH+X3Uj5jKeCaAWlJpMLKIIMITqP4Mt1PuUJMWqJRG1UG8UOEBbn06+lZWLe
         UBO5pEdDm8633nCe+wHkwGRUELq1h4w8/24hrIoviSWdQkFByVH6G93MNcQfHSJhRb64
         Cc7q6g5URQGxTGvCk6bhXA6V49V+9/L2phISlmRC4Y0e6TPRwCBVOI52JY4pVN0l5BnW
         qkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4qMF7JTBYZPTkfoUxEfMGRS4U/sbmt/HerhagcW9ih0=;
        b=P3noP/KbfeuqpWwYRDpkvti3tQR7Qlf+qh29LCbwfjOhKNdR1u8h6MFgdF9+b26Mu3
         nmRE8UTFLzB724TG4O374jlTir437UdEaU4Rd7/IZA/lOmcf7AJqJlMVKKBaNPnvr0iT
         NW6WS6dtlfZkLVb6P2ERm6nF7YI6xBWNSCGjVjRa6n/gA79WQNs1qA2WoNaK0ijh4e3S
         tFM4cdfwat6njIyrK1IZLQxxLkxIwoCRZXVjMnUdZgl1EDA6Dzb6lmtknD0HP1bSQNNU
         lAcPkzL7dsuLqxz4tErCv6bg/0XK+1hacrw9OQebx+dcqdNyAIZjO1f4StiSy5fApocp
         XhRw==
X-Gm-Message-State: AOAM533rL5ccQ83yiW8Gu808Lebqlb6w09+n5w6lnS0kyG4j7O6ErIHm
        n+ef/AciCmPTSPnvrD1tvzoxpeir3M7u7+85tc7vtrtQfJzzgnju
X-Google-Smtp-Source: ABdhPJwtN6NoyIb4L2vLWKIfPE3/jQBKdgkBzeOLxBsZHAtOgsVSYnxhhF9W+zndQH3ut6My+wgfWkcKf56ObmZlevY=
X-Received: by 2002:a05:6402:152:: with SMTP id s18mr4197413edu.221.1623326057184;
 Thu, 10 Jun 2021 04:54:17 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 10 Jun 2021 17:24:06 +0530
Message-ID: <CA+G9fYtNjffuSTiRa_=0V14nvFSnOJXbXZnMuNORGeDHfedKGw@mail.gmail.com>
Subject: [next] [powerpc] tau_6xx.c:204:30: error: too many arguments for
 format [-Werror=format-extra-args]
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        lkft-triage@lists.linaro.org
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Finn Thain <fthain@linux-m68k.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While building Linux next-20210610 following builds failed due to
these warnings / errors.

 - powerpc (ppc6xx_defconfig) with gcc-8
 - powerpc (ppc6xx_defconfig) with gcc-9
 - powerpc (ppc6xx_defconfig) with gcc-10


arch/powerpc/kernel/tau_6xx.c: In function 'TAU_init':
arch/powerpc/kernel/tau_6xx.c:204:30: error: too many arguments for
format [-Werror=format-extra-args]
  tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1, 0);
                              ^~~~~
cc1: all warnings being treated as errors

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

steps to reproduce:

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch powerpc --toolchain gcc-9
--kconfig ppc6xx_defconfig

ref:
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1334701929#L116

--
Linaro LKFT
https://lkft.linaro.org
