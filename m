Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F034714CDD3
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2020 16:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgA2PyV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jan 2020 10:54:21 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]:36980 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgA2PyU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jan 2020 10:54:20 -0500
Received: by mail-wm1-f45.google.com with SMTP id f129so302747wmf.2
        for <linux-next@vger.kernel.org>; Wed, 29 Jan 2020 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kXw/Lvn4JDjWylx5WeYQBY0Z1EWHFua3XzY3/p3ZL14=;
        b=U5uz8YRvOmgCCKCLH6UR2RljGTi2BQUU+bRSB/hGns+x4zZwYG44BqHUf3kyhSUXiW
         4sEpnN+A20Xg1hFfvq4vccHOeOR4M8D/jVmtMr/TBAqStZzkYOQo+iDl7bVht6cxpDvj
         p+kbka3gvC/89c1S/pRUb4QJ/IvBioAN2qS6W29nNbtd6KBTjE1ZmtDJHpdZqjCMwcka
         YQgYEOydOhTOAGFHnPKsV4dozTyFFcqlaVcBWksVS747KJz9fvigTyWHiKznIy41WKbj
         N6/7vKe1/bjRNQq3/NV2ZJENgi8mLTcAVl5A9SvUPEk+yVTB+GTDM74W1VMDVvwg+SzS
         5Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kXw/Lvn4JDjWylx5WeYQBY0Z1EWHFua3XzY3/p3ZL14=;
        b=jHdUe4fWX+m0t6ph+zLb04DTMbLdCbYp3yCxyYpVyOD0GsoqmLL1y9kBUp/pNpFkEh
         N14UOpELR0BD+wkpPJIzkZHKD+S2YTlVXzZ5WRjel/1Az/k4R0CW5UofZ/CG2voHDUNg
         pWk4wMFfptU/WWVkkX0fYh7HtLYgGgLg23PacmILw5IM4+EmFIwDFllFG9IC+tpldv1y
         DkLrMsLocCSqtRVBboLj5il6W+vu04ltPSFmF3oOYZ0KnFEgWP4YaDpu13NhB3FcGf9A
         piFkmuE8pCTi4dZuc3Sd8ypV2kN6hGhygHiR2VXi9DPrfDziaqF/duSZkHoFf+CRZqbv
         GN2w==
X-Gm-Message-State: APjAAAXtNnSqMBIF0QF+PJXQEVcvAG5FsqoBdeUlcZstz3Rq7I9rRK59
        ffJnmqYUx+QMfA3SpTrKMERnDYx2jj1XoA==
X-Google-Smtp-Source: APXvYqy7GflwA2529rPJmQu62g7tZdkGTXBXZMyXeBvirP1z8PsIiSzjQ/1Sp3m8cTUggnAIG+VKxQ==
X-Received: by 2002:a05:600c:2551:: with SMTP id e17mr12496675wma.187.1580313258477;
        Wed, 29 Jan 2020 07:54:18 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v8sm3367270wrw.2.2020.01.29.07.54.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 07:54:18 -0800 (PST)
Message-ID: <5e31aaaa.1c69fb81.72dfd.f75a@mx.google.com>
Date:   Wed, 29 Jan 2020 07:54:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200129
X-Kernelci-Report-Type: boot
Subject: next/master boot: 148 boots: 10 failed,
 136 passed with 2 untried/unknown (next-20200129)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 148 boots: 10 failed, 136 passed with 2 untried/unknown (=
next-20200129)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200129/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200129/

Tree: next
Branch: master
Git Describe: next-20200129
Git Commit: 335e1cb5b8c0f961767537c3bb8db47b8fcb5671
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 63 unique boards, 15 SoC families, 17 builds out of 198

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: new failure (last pass: next-20200122)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: new failure (last pass: next-20200122)
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200122)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200123)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200123)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          hip07-d05:
              lab-collabora: new failure (last pass: next-20200122)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-baylibre: new failure (last pass: next-20200123)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-baylibre: new failure (last pass: next-20200123)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

x86_64:
    x86_64_defconfig:
        gcc-8:
            qemu_x86_64: 1 failed lab

    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 1 failed lab

---
For more info write to <info@kernelci.org>
