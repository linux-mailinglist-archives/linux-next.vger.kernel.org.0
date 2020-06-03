Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247221ED900
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 01:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgFCXSm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 19:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgFCXSl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 19:18:41 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F1BC08C5C0
        for <linux-next@vger.kernel.org>; Wed,  3 Jun 2020 16:18:41 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id m2so255619pjv.2
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2020 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DK4rVIjRYCYNvY1fi/8txK8bKzC8IP47AmoT/IcqE0c=;
        b=DU2RHJ3DaQio6B4sA+5bvnhD5pYlj00gVXu+OTI/obL17iubDvCq9DwJ5oeUVbOfpC
         IIOZGUE56mEm3ci9AiIYl9KO3y6pP0O5thqKAphTLiRzaXraTzqq/ooLJCrsMeeAAANU
         ZAu6jbEwg0UufLqsdAhC2ZOm3q6XzexenD7iqH8B8EawrUvjk5ILCt1FFiiZCfdrdow9
         mYy14x4b9TnuusYd4gJjViFcfelPHsYJDP5f7Dc/l4foGgm8+Klz2PHpO3XZU5jo84PR
         19s+7VFqaWXn2PdP9kWYngfxDpzEn/B3GDDqy6NpTIR6hL8lOe5JOIRN+T/zK2qcnxYR
         8VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DK4rVIjRYCYNvY1fi/8txK8bKzC8IP47AmoT/IcqE0c=;
        b=MQZQ7Sr/56k5JPwCcxxekUqFN2CQstOuutIH35ZCyUXu9QS0okNEVgIHYxC6nk6HQV
         OEy7tyY+sUQHMKFTPDQcK6rNY0iywq6QGKOB/OAh+4SJ5wwP0J9XDw9mW3MP8d0N1dTM
         8gmlaDCmpt6hr9BKLmjd5LJlwsqzw8R2YT9aBTEMdfD6/6hvSg8hVuI8zh8bfqqFmpme
         D41xKrP47CwSCXu44e2SIVdjoKocVwLL2q5DMDkNDxMpzzKdSJqHYpZbRQHWKRkiilZ5
         0HYm1UcJKAW7cIkArDftbNxZaBEO3CSTacAXAbV3KXr6rXxnUjq4iv4iCVQqK0u5oA+6
         Y8TA==
X-Gm-Message-State: AOAM532BYwa0K84Ybq64ptbBfj1PLPOtLfenq0al8xZ+EssYi+p2zHCH
        aamx2ABr/i7qo3CT2If+3DvmIAL9pmw=
X-Google-Smtp-Source: ABdhPJxNp4RzjkAK+UVVJqeTEGmaQ7v6mha/tLEjdf1qdE++fGTI5/1/jx9+pXzqnPH0jcQBXUDBRQ==
X-Received: by 2002:a17:90b:e84:: with SMTP id fv4mr2382816pjb.132.1591226320707;
        Wed, 03 Jun 2020 16:18:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gm11sm3459083pjb.9.2020.06.03.16.18.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 16:18:40 -0700 (PDT)
Message-ID: <5ed82fd0.1c69fb81.fd29f.949e@mx.google.com>
Date:   Wed, 03 Jun 2020 16:18:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200603
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 71 boots: 3 failed, 59 passed with 2 offline,
 4 untried/unknown, 3 conflicts (next-20200603)
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
https://kernelci.org/test/job/next/branch/master/kernel/next-20200603/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 71 boots: 3 failed, 59 passed with 2 offline, 4 untried/u=
nknown, 3 conflicts (next-20200603)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200603/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200603/

Tree: next
Branch: master
Git Describe: next-20200603
Git Commit: 48f99181fc118d82dc8bf6c7221ad1c654cb8bc2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 53 unique boards, 17 SoC families, 21 builds out of 167

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200529)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 107 days (last pass: next-2020021=
4 - first fail: next-20200217)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 68 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200602)

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

i386:
    i386_defconfig:
        qemu_i386:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
