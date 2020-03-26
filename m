Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B753193E1E
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 12:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgCZLoj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 07:44:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44650 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727948AbgCZLoj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2020 07:44:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id b72so2617216pfb.11
        for <linux-next@vger.kernel.org>; Thu, 26 Mar 2020 04:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vzQSMlZDUXfHwHaj9aO0sBu7RhezGnNGMnvAIUqQbi4=;
        b=Vcs6Dh9T+Z8l+E2nQjLnN8BQJqwfe3NPllF8xrkvXj0D1E7fMkO0kZ//x6IFrxOZqJ
         bqB6aI0BBgYGFia+JjbDda/MhcHElRtdtWvoBZwXqSyEmbatJC/xW45NCfRcoTF2tlbK
         LDRTvrSfvdQ85CBVir4uGR5aX1qfVS95ZSAkMFxwDS9jKKF/0cQEOTd7VMpwfuFTVJB7
         0+HgwXdubqhRjpSoD5T8WyRL3pXJGx8CCho+B8t8Lg1yUsHTzvalrbd4sTPlcwCR5Gd5
         4ZqihdbXsqJVpcif0H5x3tmS3yRfEScEF+Z9kHybDdglgjes+6zOV7KlIVfY3Pe4bRJR
         Bzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vzQSMlZDUXfHwHaj9aO0sBu7RhezGnNGMnvAIUqQbi4=;
        b=BVzNVHyGWQdkfZT8CGytgl9NjUmxVMeqna0KIvCjRyE0ku7HLxc3vKRlnkkyh3UFYn
         WBkcNTpse/reNpnhIqVHpxr+FkBfWTxyWcUZqttHGWYlW9PVRx0UCfJ7hJjZ/pvjRpM8
         ZMUGICWPIJtEjAPhpVBzLz9wZodD+Kq92IZ12aA0o34ty2AaEs5Cym4//owC5TpLCKoW
         ZpIjBFNTV5zvDZAM1B4UvWKEDwD1ZSbIZKkOIBcdi5PoED1D01Qqy4vlu0qWzKTP6ZRd
         WNOVcx++w1hUlu+TZt3ILYLIaySzwe5B/zflhO8jss7SnSsiePi/ErQ/yg943S2IGnK6
         92AA==
X-Gm-Message-State: ANhLgQ0HMpX7mNqqS4sEn8TsI3wPUMahSpjw/9Mlm0Wj0z55pyD5XAPh
        f3udE3DswncPQZTspJFp3G7R4NbirW8=
X-Google-Smtp-Source: ADFU+vvhNZodU+BoLpFDSfxFCjfm2PuyLnVDHRb4MQLucrhvkIyxSP7xZ5P49sBku3Qo8lWo5SViHw==
X-Received: by 2002:a65:5a4f:: with SMTP id z15mr8199009pgs.103.1585223077456;
        Thu, 26 Mar 2020 04:44:37 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q15sm26696pfn.89.2020.03.26.04.44.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 04:44:36 -0700 (PDT)
Message-ID: <5e7c95a4.1c69fb81.f399c.00e2@mx.google.com>
Date:   Thu, 26 Mar 2020 04:44:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-337-g9a2ad1626af6
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 270 boots: 5 failed,
 251 passed with 5 offline, 6 untried/unknown,
 3 conflicts (v5.6-rc7-337-g9a2ad1626af6)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 270 boots: 5 failed, 251 passed with 5 offline, 6 =
untried/unknown, 3 conflicts (v5.6-rc7-337-g9a2ad1626af6)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc7-337-g9a2ad1626af6/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-337-g9a2ad1626af6/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-337-g9a2ad1626af6
Git Commit: 9a2ad1626af61c3d68f80b6a7301a94bd6ed0028
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 25 SoC families, 31 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 40 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.6-rc7-277-g1e07787fb=
89d)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc7-277-g1e07787f=
b89d)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-277-g1=
e07787fb89d)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-277-g1=
e07787fb89d)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc7-277-g1e07787fb=
89d)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-277-g1=
e07787fb89d)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig+kselftest:
        qemu_i386:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
