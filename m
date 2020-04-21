Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093451B2D25
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 18:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgDUQvD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Apr 2020 12:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725963AbgDUQu7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Apr 2020 12:50:59 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF92FC061A41
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 09:50:59 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q18so3473430pgm.11
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=g/IB8m4zmtjIF3jxnZGr1WAhfm8fIUkEsyg4g+eO0vY=;
        b=j/rgHm9TPHdVGNswVGH0JmEjaorI3UTbwWBO6l9+IzHgNBkktJCa17XAuIzwkTF3zl
         Fl+tx2Wa2jcQf9uSniaY4h0hxs+fhpakrPyfktk/Ni/3AYd7x0wNxmHIVv4ajdqNvP7o
         +kI0fhgybdvR3Q6GwI/SN6Vy2MEmChsZAcc5se2zRJE1/SrXRIfqkocL1fWks3gkeojW
         dIa/EFcJtz51t+N+SquMmtF1dksONgXh0+sT+CWm36ZD7KioJ6pdF1oLBJ8RSi1TUd6X
         zXyjR6mr9nlgAGDDmB4F0m92gjoAVkDKMKX/DY9rgjm4lEr0eJZoK0HH9fYJVslRoWk7
         P4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=g/IB8m4zmtjIF3jxnZGr1WAhfm8fIUkEsyg4g+eO0vY=;
        b=lmjAOKtW91Qd16gPmFw6j7NJ9FQelxhtHiuJ4YRSxafoSBHsPUaXegSB5Ez8YblBwv
         lDEV6WSrv+RTlDngteeenEV7blMLOb87RS/Ap1SKk1YKagxWIMLjUgoQ72ZKjYkG4tpq
         K6H/nzvyCeZw5gAsw/aeCrvwc6rLdL7HbFzZWMXrelEVO4YjXg2RrbC49gs/W5IgKfMW
         +yA7FZDfMdqj81nLRZPmnOF4tLSyDtGJFh0r2zdIkgFsQdIAE2YjP4Uzeoz423UGs6zK
         B/AbtP2sE8spzoAU0X7eB5CrEXtX3aVJAJfjZfCMF4eWF+hkHBeiTXdU+ANOL1Bxpp/M
         51GA==
X-Gm-Message-State: AGi0Pua8AaHvy2uc5NR/NRsoAUrGdKvtogKK/7w1VgcJLdA8f6HtjOjI
        bnJurolTEf0AMwEdYjFYyYn7P+Z7/i8=
X-Google-Smtp-Source: APiQypJyrTXwH1ZhYXAPqNDQvPufmUBIR4L2hTYpZGP5vfKpQ7lHFl91RKEyzZQpjVDqS/czVu+VeQ==
X-Received: by 2002:a63:545:: with SMTP id 66mr22242625pgf.66.1587487858884;
        Tue, 21 Apr 2020 09:50:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y6sm2881002pjw.23.2020.04.21.09.50.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 09:50:58 -0700 (PDT)
Message-ID: <5e9f2472.1c69fb81.b13c2.7cd7@mx.google.com>
Date:   Tue, 21 Apr 2020 09:50:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200421
Subject: next/master boot: 154 boots: 6 failed, 144 passed with 1 offline,
 3 untried/unknown (next-20200421)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 154 boots: 6 failed, 144 passed with 1 offline, 3 untried=
/unknown (next-20200421)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200421/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200421/

Tree: next
Branch: master
Git Describe: next-20200421
Git Commit: 39a314cd1168cbcb05ebcd973098c8f1440a3064
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 21 SoC families, 28 builds out of 230

Boot Regressions Detected:

arm:

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200417)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 25 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200417)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200417)

Boot Failures Detected:

x86_64:
    x86_64_defconfig:
        gcc-8:
            qemu_x86_64: 1 failed lab

    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            stih410-b2120: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        clang-10:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
