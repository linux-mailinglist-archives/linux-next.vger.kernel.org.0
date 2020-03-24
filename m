Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305A5191974
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 19:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgCXSuv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 14:50:51 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:35276 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgCXSuv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Mar 2020 14:50:51 -0400
Received: by mail-pl1-f174.google.com with SMTP id g6so7792484plt.2
        for <linux-next@vger.kernel.org>; Tue, 24 Mar 2020 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tU7mnuXsCuzwqHFl/XTF3FYiDsxTibuiGDM+khtLhDc=;
        b=R4Qu3CJN6InYOTCcJKPG+PCWqqMlZNW47UJtuydCWSVBZOp9EXfrl9Em5qVySIqGP8
         GVNohV7wqMyoGrO0LACXs3tiFat+RLz1hwYaXfmvj6IUKwD628Anr8avTM4zJMs4OIyf
         ujg3tzGnHdvsFOLr6O5BfQvNlN199VZBU+GHrKLWBQkvjmllrvb5Vws/2VE92/kXENIs
         ujpn1h2fsh7vwfyPPgejyE4p3oG7gHVL4amc+XlggJ1hqQmlLx6J5cyFYQDkY7rFjavl
         4Z6Yh7hqTp/E+9tLBhRiJ46WCnqZAcT+jbHMypkCP0YgrexQs+euexjjZ0w/JyhdxFXv
         nY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tU7mnuXsCuzwqHFl/XTF3FYiDsxTibuiGDM+khtLhDc=;
        b=IqrJFgR0eMBWbWYJ6MMESScfsO9Xa02h5lHuM5wq42o5OUkqNpVM1PGemxgu+01b1Q
         /vrPCKuaq+OL+UuHyNfvlWvf7CO4hi0pmB7kNOoAkLJNh+2CStDJC+uo18zK1dqYklKy
         CksQqThX31wHvWPFvQo7UsgcU9+KowgmTCbl3sjD5IB6nMEP7omqYYYN0Y8g+RDlKYon
         q/0Vv+8+Ql7QnobT8a+CnWHamJOYti/m7AkxOQzlvJHKJz3sYCu+JlkMBFsGd5r1M2Ty
         UY0dBatnkWBFnXeRzodGWXtHT8cndYxnxZzU0bO3KyIF8o2hF0HFZP9BLWTKjYx21U8O
         L1aQ==
X-Gm-Message-State: ANhLgQ0WARre/MIFjULzsu9v/E9qjKrH+erfBbaArMyYHhSklb5MBg3i
        afx2+1pWHSum8m6DcyEzqKihppbG5Jg=
X-Google-Smtp-Source: ADFU+vvutKuIRp+u/kSA40Am4XzogSRj9LvRSa0tBw5eVsRoYZmvRqKHY7BNoioLfCGp42nvkXhNXA==
X-Received: by 2002:a17:90a:d205:: with SMTP id o5mr6924620pju.46.1585075848619;
        Tue, 24 Mar 2020 11:50:48 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c7sm11431927pgg.11.2020.03.24.11.50.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:50:47 -0700 (PDT)
Message-ID: <5e7a5687.1c69fb81.6affa.d493@mx.google.com>
Date:   Tue, 24 Mar 2020 11:50:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc7-236-gaf338e2cb004
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 279 boots: 7 failed,
 261 passed with 5 offline, 6 untried/unknown (v5.6-rc7-236-gaf338e2cb004)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 279 boots: 7 failed, 261 passed with 5 offline, 6 =
untried/unknown (v5.6-rc7-236-gaf338e2cb004)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc7-236-gaf338e2cb004/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-236-gaf338e2cb004/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-236-gaf338e2cb004
Git Commit: af338e2cb004a98ef30ed65a5463b373d4478c48
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 106 unique boards, 24 SoC families, 30 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: v5.6-rc6-295-g=
996cfaad8d71 - first fail: v5.6-rc6-370-ga32dcb4acc60)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 39 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc6-370-ga32dcb4a=
cc60)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-370-ga=
32dcb4acc60)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.6-rc6-370-ga32dcb4ac=
c60)
          meson-gxm-q200:
              lab-baylibre: failing since 1 day (last pass: v5.6-rc6-295-g9=
96cfaad8d71 - first fail: v5.6-rc6-370-ga32dcb4acc60)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-370-ga=
32dcb4acc60)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-rc6-370-ga32dcb4ac=
c60)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-rc6-370-ga32dcb4ac=
c60)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.6-rc6-370-ga32dcb4acc6=
0)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-370-ga=
32dcb4acc60)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
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

---
For more info write to <info@kernelci.org>
