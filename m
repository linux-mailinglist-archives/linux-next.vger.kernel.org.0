Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E3F1E06AD
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 08:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbgEYGKv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 02:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgEYGKv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 02:10:51 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C9CC061A0E
        for <linux-next@vger.kernel.org>; Sun, 24 May 2020 23:10:51 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t7so7129025plr.0
        for <linux-next@vger.kernel.org>; Sun, 24 May 2020 23:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8mKA0+BS+KJFLZwQIj+qY82lM41q4ImVQn+GqQ94hDc=;
        b=ARgG0RgkhKXOZS458/W+P/HnDSMS1kkv6kQ9B4cuBw6cFg3nbv8/GOelUyNrCaJio/
         VslBAm5TaWpa6HA4HcqYm2L9kM1WdcMUQdK6zwyqaFD1IaFPqVEg07pAtuV7ZO2x+xn6
         m7nLbYbmGqaX7DeSwGLWfRkZxrW99jr1BApcFkmj/a98Fw00scyfRzo+exGJn/RCnfFf
         f3MCWijaiuI2svQkqn5LN7tBa3rSGJtKD5t5qcvLTMS97RnCj4eEZrJVHuKvdtgv/e9a
         tY9C1kqUrP2EpZjuXyHqT7zFuoRdVsgtFTXvjlvZb+JhUcRjFAAQo0XJzq4H4kMAhqc5
         kOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8mKA0+BS+KJFLZwQIj+qY82lM41q4ImVQn+GqQ94hDc=;
        b=rdNMIKuNag+YLWQ7Kp4p99LM1ZuudTSPl5AZdNRgbvO3J7QiPEQ18ShtFVg8P98rLP
         cxK6zT5EcEOJ6W2qB94CWoUmZWkOExOYov0Wlo8usYW+AgO6dahi9toDVnZ9oXDQT9Zq
         AzaWtZvlrbokyFxHlpTR+f+VdA3dRNsEy+ZbL06RhF9ArZ0TcX/Cgefhmdo9FEhvkEAd
         kx9/HOaD50hXrAK4LJ7OgMDmIs9PRkTcJGr6lcdF2crQsB1155IVQFnh7QLKG7B0UOc7
         rb2omK8ccR017/n3pD+de2+6xG1WX8iUb626wC48E+gW090sLfNE9kUER4tIKOThq8zo
         bc4A==
X-Gm-Message-State: AOAM533D7yu1PSEC9ZY4rL0LC9LBUMhC5ZPr4H3NjvFodd8vo4mlJ9BC
        B8yk47WOG84KgCZH03BQ2G8SgU6vFec=
X-Google-Smtp-Source: ABdhPJzc4241qAv1PIBwpbCAe5JFMYRJSTY0I3BOdag7oWgtEQG/Zq1JGS8avsHgBZg/Pxoqa2uMxg==
X-Received: by 2002:a17:902:301:: with SMTP id 1mr26010462pld.65.1590387050481;
        Sun, 24 May 2020 23:10:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d8sm10947733pgb.42.2020.05.24.23.10.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 23:10:49 -0700 (PDT)
Message-ID: <5ecb6169.1c69fb81.84e07.97d7@mx.google.com>
Date:   Sun, 24 May 2020 23:10:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc6-387-ge8afbc5782a5
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 177 boots: 5 failed,
 168 passed with 4 offline (v5.7-rc6-387-ge8afbc5782a5)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-rc6-387=
-ge8afbc5782a5/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 177 boots: 5 failed, 168 passed with 4 offline (v5=
.7-rc6-387-ge8afbc5782a5)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc6-387-ge8afbc5782a5/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc6-387-ge8afbc5782a5/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc6-387-ge8afbc5782a5
Git Commit: e8afbc5782a57ab2d1f9b899fd813503f772ea7b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 80 unique boards, 22 SoC families, 21 builds out of 217

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 19 days (last pass: v5.7-rc3-277-=
ga37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

arm64:

    defconfig:
        gcc-8:
          sm8150-mtp:
              lab-bjorn: failing since 24 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 44 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
