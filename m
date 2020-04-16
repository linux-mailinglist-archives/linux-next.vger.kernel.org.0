Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51721ABDA4
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 12:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504467AbgDPKJ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 06:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504441AbgDPKJw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2020 06:09:52 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40C9C061A0C
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 03:09:48 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id d17so1439727pgo.0
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VqRckhGxye+fPnC0OM91D+aCGtnwcdmQcIA42GPz92A=;
        b=ozmTesSX+MbOSC+V9HaQWSGNzx0RyvzgDpiw7M6pH2QmKAXhQIKSV8ODK1yeJcg9k4
         p3e37UrOJUo3t/R58BT6+dkuWdxwDFRBLbA2CVVgcRTUNu3Nzg2mRDYthzNIwaEMuTwI
         kfRnPM/T/y1N7xk5Ek0AU630eLvEnLcZsUCvkL+Ifkknh6xZwU9sUPdcDi6mH91TYDcq
         0xdYT60g6wZ5SRJHNB0eK+DNiC08lz5cU//EF+QucQV4neucJ2+waKAmi/XxyuGUNe2B
         8OERAGxy+1mj+JSdiEnzoW63GGIm8YSbWL9wKVgYwt6EoKtagEPSbVOHawq6Yit0otpI
         +Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VqRckhGxye+fPnC0OM91D+aCGtnwcdmQcIA42GPz92A=;
        b=E4PBrbn7uuofR/MtZJpwJjNTfPKqGhRFF2UhB4AZmMLAnLWlg3OwRXMZAYULZ3G14w
         nqh8mNyJ7CLoOKP3J4+L6OW5pKvVNBlxKO3EJUrTUS7luGNT79mzoz1efMFkW9b2qj6L
         ErYietQtU25sdoIXsacdTIoZDAXavC76WZgh7P3D1MS4Aj9CH04QWn70MlHxqqWeRMg9
         cpZ1Lelqk2IorODwPZp7TYV7hSYzplvaZu4ewFuqD6Hh7XbitWBSSIusbyg30ujEi7rx
         796/48IXNi9TJOhi1y1fcJVoinrG7BpYmbO/sJ7p6YfNM0BY8ATGsjjCHniO/05Ii0yS
         /ulQ==
X-Gm-Message-State: AGi0PuZE5MQVe6/x9DJj44kTIqemqW+waHtNF0dswYjGOf9sm/S0fO59
        NbOQTj2a/XpmE7EBN9qBInpZBS+I/iw=
X-Google-Smtp-Source: APiQypKv/0dr29QMTamMSSc7LKnLYooAeEI9u8gh7IsBTEvvFZZqDdKbOwMJTor1TzsTN9Z/HELiOA==
X-Received: by 2002:a63:ea4e:: with SMTP id l14mr30783794pgk.431.1587031787947;
        Thu, 16 Apr 2020 03:09:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k63sm2145261pjb.6.2020.04.16.03.09.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 03:09:47 -0700 (PDT)
Message-ID: <5e982eeb.1c69fb81.9fa71.66e9@mx.google.com>
Date:   Thu, 16 Apr 2020 03:09:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc1-279-gd450baa50f41
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 276 boots: 6 failed,
 255 passed with 8 offline, 6 untried/unknown,
 1 conflict (v5.7-rc1-279-gd450baa50f41)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 6 failed, 255 passed with 8 offline, 6 =
untried/unknown, 1 conflict (v5.7-rc1-279-gd450baa50f41)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc1-279-gd450baa50f41/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc1-279-gd450baa50f41/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc1-279-gd450baa50f41
Git Commit: d450baa50f41235ebfb3248de33d448c999b8bab
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 24 SoC families, 30 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 61 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.7-rc1-227-g598f941cf=
1a8)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc1-227-g598f941c=
f1a8)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 2 days (last pass: v5.6-3095-g771732=
386d6d - first fail: v5.6-12726-gcb0447b07277)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-227-g5=
98f941cf1a8)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.7-rc1-227-g598f941cf=
1a8)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-227-g5=
98f941cf1a8)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.7-rc1-227-g598f941cf=
1a8)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc1-227-g598f941cf1a=
8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-227-g5=
98f941cf1a8)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 5 days (last pass: v5.6-1=
2182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxbb-p200: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
