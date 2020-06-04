Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57BB1EE592
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 15:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgFDNpf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 09:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgFDNpe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 09:45:34 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE42C08C5C0
        for <linux-next@vger.kernel.org>; Thu,  4 Jun 2020 06:45:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e9so3455574pgo.9
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2020 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=D+fZrjLixI2/LkLfpiRFU/0reoa69VxOqZOocc9S5MA=;
        b=hyYWRC/vQ7DCk//PyAWuLyetMnOBImNKx2AvInmOAUHhP3wt/Rh0Gu/8cYiXpOcCyz
         pUolmrrHO6unIffhFApi4DTNCPEMOS3Fq4JqpfNlHUOklV8tKy9XV5t6RireFDLwIbDz
         VUd7l2ZCgZIllnlqVhbHga2hs67Ga5QMDc78dgPue8fBdOSN4eYNffhUEgYrZcdW/IR8
         yZAiXOfonrjEEq/M/26Z85QK8xZC2YM9+d2bCDfcB5x301FPdxvF0+//cvMQX//fB7XZ
         0jOdmMsz3LUZEJGiaFlWBPhzFS9Mqv14ev1pd0pUtyHrrWSnME1ZWBZyzj43/QTEyaBy
         1L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=D+fZrjLixI2/LkLfpiRFU/0reoa69VxOqZOocc9S5MA=;
        b=iiqqFywlFns1QI+3ikBoC4zHga0sml3sbdcXW+s/RRASo+cp45acqXIHw4Dki64bGB
         9CdXy7qUwGWrgY8eRGW41B+LNjQA9rxGiPTaFiqt5jG4h/5FkVPAZ91GIzP1aFZbmldL
         00U391FDItbtANfnv4FvHFI7aqYqwpLtFHV72WdotEU53qivEM6MASMX7RRw1jUbi6kg
         8bgZpK1gDvE6o6yQMoeIPZAVmOn/9t87ygwfeYH9RY9gmCIkOYapwcjFLbKQxs9w5BGV
         07HhHRQY1uGOGSR7s08be3tYtAFS1wCNVKi4V9dG+pdD6fcM8AAUpPbtU6f5mBomy/da
         CoeQ==
X-Gm-Message-State: AOAM532PbIHmrezoUX4jVP1It6GfslEu0vDDCVLnOrBdBDP7IznIq1Iw
        FJjOgCek8VmBhA3xn7ZOjddn0NkMUjg=
X-Google-Smtp-Source: ABdhPJzNqXB/eVUzSEbc5HbozfrE7OOtm1Sq3uH6hsJFi64gxpDeoBVJ3MVuFD8IPyEBTDFYH0pETQ==
X-Received: by 2002:aa7:9252:: with SMTP id 18mr4464492pfp.17.1591278332102;
        Thu, 04 Jun 2020 06:45:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n38sm4257006pgm.1.2020.06.04.06.45.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:45:30 -0700 (PDT)
Message-ID: <5ed8fafa.1c69fb81.1a404.b689@mx.google.com>
Date:   Thu, 04 Jun 2020 06:45:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200604
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 144 boots: 6 failed, 134 passed with 2 offline,
 2 untried/unknown (next-20200604)
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
https://kernelci.org/test/job/next/branch/master/kernel/next-20200604/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 144 boots: 6 failed, 134 passed with 2 offline, 2 untried=
/unknown (next-20200604)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200604/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200604/

Tree: next
Branch: master
Git Describe: next-20200604
Git Commit: d4899e5542c15062cc55cac0ca99025bb64edc61
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 19 SoC families, 23 builds out of 166

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 107 days (last pass: next-2020021=
4 - first fail: next-20200217)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200603)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200603)

Boot Failures Detected:

arm:
    imx_v6_v7_defconfig:
        gcc-8:
            imx7s-warp: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
