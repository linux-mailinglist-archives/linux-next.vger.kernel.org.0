Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A4C362CD3
	for <lists+linux-next@lfdr.de>; Sat, 17 Apr 2021 04:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbhDQCN4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 22:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhDQCN4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 22:13:56 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA68C061574
        for <linux-next@vger.kernel.org>; Fri, 16 Apr 2021 19:13:30 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id m18so12688204plc.13
        for <linux-next@vger.kernel.org>; Fri, 16 Apr 2021 19:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HDLagmSPKVIC8YwEugdlX+JOq0osdASHr/4IVGo6Pfc=;
        b=g3IZn3NI5qFqjBGPJy5zsh0WrajY5wHztmgci+Y4r25a0SomvvGhR6ZONSRNj/q4Al
         /jzR+2hHoMvAipPNHRl0oaE+wZwc545EQdrv/O37nMmMqZtCbS4Uxx/XSGUrYgQ20ize
         fZ55SIbW9h8ESjQLppVSaJXAJbwOCWp4S0bwQncIWKSjpVqqTlxpBfDcOv28xLyKKDsH
         NO1FC7bRC+jY7lLJvpdgv+Y4x1/jLM5Bv2WVzlytSgfp+sDrREzrX98gSCQboSCApp9k
         KYPqQ2zqCgwuUgZPndly7irNKFhlAw1C7gxuw0IgY9KiOgqPdbtp79CdepZKqFaN2WsG
         xDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HDLagmSPKVIC8YwEugdlX+JOq0osdASHr/4IVGo6Pfc=;
        b=r4DhxLwLpporeTgwwo0NHFe3wRcQ9cn/fkVFYxNX8ruYV6Ig3MPm4lz4nLMr8+Nk4G
         sFk8HYVKLt4+GdffFhPgJLMW9Xf/oDrplHrJL4IlxtRM4G14Tiz15TujBnRf51Rxccko
         mI5MRYg0epV7cc3BsLp7ZFDFfVyDELPN9uPQvVYsqCDpyCEUIHn7/bpJCMfW4SbTFaz3
         7FS7wWu2wCxH9cpinkJq4YLlGScb1cy/x5wmpITlkoi3phGqkujP03ONx+pBI0mmPumj
         Uoj8xeERFgOxKnwi0Ptv+Nhzk9A9t7Cy2Dc/TA9XvVbDjtftMILG5XvWB70QN3e8zeZj
         7usg==
X-Gm-Message-State: AOAM531TqWX7UMBPQgitJ6VSNIMEHG83tqZgyAHTFWVsIx9uMeuNdY+P
        hHW9rEDPv3AdzbnJCDnBHxUTRw9G6CFoNw==
X-Google-Smtp-Source: ABdhPJzmEFjU7lVkmqhuCtFHRFTCWweSBxaXwb4T3c571x4lT7KZs/7l5yxLNxeBPM+OmueaSHopTQ==
X-Received: by 2002:a17:90b:3646:: with SMTP id nh6mr12664149pjb.119.1618625607558;
        Fri, 16 Apr 2021 19:13:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d3sm7124498pjw.35.2021.04.16.19.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 19:13:26 -0700 (PDT)
Message-ID: <607a4446.1c69fb81.6111.3e27@mx.google.com>
Date:   Fri, 16 Apr 2021 19:13:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210416
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 573 runs, 701 regressions (next-20210416)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 573 runs, 701 regressions (next-20210416)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | clang-11 | defconfig=
                    | 31         =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 31         =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 31         =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-8    | defconfig=
                    | 31         =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | clang-11 | defconfig=
                    | 39         =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 39         =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 39         =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-8    | defconfig=
                    | 39         =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana            | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 2          =

qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-vexpress-a15      | arm   | lab-baylibre    | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15      | arm   | lab-broonie     | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15      | arm   | lab-cip         | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15      | arm   | lab-collabora   | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15      | arm   | lab-linaro-lkft | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-baylibre    | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-broonie     | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-cip         | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-collabora   | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-linaro-lkft | gcc-8    | vexpress_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2        | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3        | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =

qemu_i386                  | i386  | lab-baylibre    | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-broonie     | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-collabora   | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-linaro-lkft | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-baylibre    | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-broonie     | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-cip         | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-collabora   | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-linaro-lkft | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-baylibre    | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-broonie     | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-cip         | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-collabora   | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-linaro-lkft | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-baylibre    | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-broonie     | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-cip         | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-collabora   | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-linaro-lkft | clang-10 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-baylibre    | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-broonie     | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-cip         | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-collabora   | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-linaro-lkft | clang-11 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-baylibre    | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-broonie     | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-cip         | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-collabora   | gcc-8    | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-linaro-lkft | gcc-8    | i386_defc=
onfig               | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

rk3288-veyron-jaq          | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 29         =

rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 29         =

rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 29         =

rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 29         =

rk3399-gru-kevin           | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 30         =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 30         =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 30         =

stm32mp157c-lxa-mc1        | arm   | lab-pengutronix | clang-10 | multi_v7_=
defconfig           | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210416/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210416
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      18250b538735142307082e4e99e3ae5c12d44013 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607a065b930caf53a1dac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a065b930caf53a1dac=
6b3
        failing since 18 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0243575d303d56dac6d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0243575d303d56dac=
6d3
        failing since 51 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02c5dad8cbf7badac708

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02c5dad8cbf7badac=
709
        failing since 22 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a200e6abb1fc1f9dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a200e6abb1fc1f9dac=
6b2
        failing since 3 days (last pass: next-20210409, first fail: next-20=
210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a37de47728e1222dac6c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a37de47728e1222dac=
6c8
        failing since 3 days (last pass: next-20210409, first fail: next-20=
210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | clang-11 | defconfig=
                    | 31         =


  Details:     https://kernelci.org/test/plan/id/607a05d9eac4e87bbcdac6e3

  Results:     59 PASS, 33 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-driver-present: https://kernelci.org/test/ca=
se/id/607a05d9eac4e87bbcdac6e9
        new failure (last pass: next-20210412)

    2021-04-16 21:46:28.156000+00:00  <8>[   45.691325] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/60=
7a05d9eac4e87bbcdac6ea
        new failure (last pass: next-20210412)

    2021-04-16 21:46:29.189000+00:00  <8>[   46.709830] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2021-04-16 21:46:29.190000+00:00  /lava-15630/1/../bin/lava-test-case   =


  * baseline.bootrr.leds-gpio-probed: https://kernelci.org/test/case/id/607=
a05d9eac4e87bbcdac6ec
        new failure (last pass: next-20210412)

    2021-04-16 21:46:30.202000+00:00  <8>[   47.742949] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dleds-gpio-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a05d9eac4e87bbcdac6ed
        new failure (last pass: next-20210412)

    2021-04-16 21:46:57.515000+00:00  <8>[   75.049682] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a05d9=
eac4e87bbcdac6ee
        new failure (last pass: next-20210412)

    2021-04-16 21:46:31.226000+00:00  <8>[   48.760748] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 21:46:32.266000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:32.266000+00:00  <8>[   49.778588] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-probed RESULT=3Dfail>
    2021-04-16 21:46:32.266000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:32.267000+00:00  <8>[   49.797261] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2021-04-16 21:46:32.267000+00:00  /lava-15630/1/../bin/lava-test-case   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a05d9eac4e87bbcdac713
        new failure (last pass: next-20210412)

    2021-04-16 21:46:33.861000+00:00  <8>[   51.395824] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a05d9=
eac4e87bbcdac714
        new failure (last pass: next-20210412)

    2021-04-16 21:46:34.873000+00:00  <8>[   52.413969] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a05d9eac4e87bbcdac715
        new failure (last pass: next-20210412) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a05d9eac4e87bbcdac716
        new failure (last pass: next-20210412)

    2021-04-16 21:46:36.908000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:36.909000+00:00  <8>[   54.449636] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a05d9eac4e87bbcdac717
        new failure (last pass: next-20210412)

    2021-04-16 21:46:37.927000+00:00  <8>[   55.467818] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a05d9eac4e87bbcdac718
        new failure (last pass: next-20210412)

    2021-04-16 21:46:38.945000+00:00  <8>[   56.486026] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a05d9eac4e87bbcdac719
        new failure (last pass: next-20210412)

    2021-04-16 21:46:39.999000+00:00  <8>[   57.504112] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 21:46:39.999000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:40+00:00  <8>[   57.520013] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 21:46:40+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:40+00:00  <8>[   57.535513] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 21:46:40+00:00  /lava-15630/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a05d9eac4e87bbcdac71d
        new failure (last pass: next-20210412)

    2021-04-16 21:46:41.033000+00:00  <8>[   58.568865] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a05d9eac4e87bbcdac71e
        new failure (last pass: next-20210412)

    2021-04-16 21:46:42.083000+00:00  <8>[   59.587905] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2021-04-16 21:46:42.083000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:42.083000+00:00  <8>[   59.603967] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2021-04-16 21:46:42.083000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:42.083000+00:00  <8>[   59.620251] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2021-04-16 21:46:42.083000+00:00  /lava-15630/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a05d9eac4e87bbcdac727
        new failure (last pass: next-20210412)

    2021-04-16 21:46:45.201000+00:00  <8>[   62.737029] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a05d9eac4e87bbcdac728
        new failure (last pass: next-20210412)

    2021-04-16 21:46:46.221000+00:00  <8>[   63.756414] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a05d9eac4e87bbcdac729
        new failure (last pass: next-20210412)

    2021-04-16 21:46:47.239000+00:00  <8>[   64.774263] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a05d9eac4e87bbcdac72a
        new failure (last pass: next-20210412)

    2021-04-16 21:46:48.258000+00:00  <8>[   65.793150] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a05d9eac4e87bbcdac72b
        new failure (last pass: next-20210412)

    2021-04-16 21:46:49.276000+00:00  <8>[   66.811088] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a05d9eac4e87bbcdac72c
        new failure (last pass: next-20210412)

    2021-04-16 21:46:50.294000+00:00  <8>[   67.830174] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a05d9eac4e87bbcdac72d
        new failure (last pass: next-20210412)

    2021-04-16 21:46:51.313000+00:00  <8>[   68.848464] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a05d9eac4e87bbcdac72e
        new failure (last pass: next-20210412)

    2021-04-16 21:46:52.332000+00:00  <8>[   69.866566] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a05d9eac4e87bbcdac72f
        new failure (last pass: next-20210412)

    2021-04-16 21:46:53.350000+00:00  <8>[   70.885555] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a05d9eac4e87bbcdac730
        new failure (last pass: next-20210412)

    2021-04-16 21:46:54.370000+00:00  <8>[   71.905045] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a05d9eac4e87bbcdac731
        new failure (last pass: next-20210412)

    2021-04-16 21:46:55.401000+00:00  <28>[   72.918682] udevd[133]: worker=
 [147] /bus/gpio is taking a long time
    2021-04-16 21:46:55.402000+00:00  <28>[   72.925468] udevd[133]: worker=
 [148] /bus/hid is taking a long time
    2021-04-16 21:46:55.402000+00:00  /lava-15630/1/..<28>[   72.932121] ud=
evd[133]: worker [138] /bus/clocksource is taking a long time
    2021-04-16 21:46:55.402000+00:00  /bin/lava-test-c<28>[   72.940900] ud=
evd[133]: worker [141] /bus/cpu is taking a long time
    2021-04-16 21:46:55.402000+00:00  ase
    2021-04-16 21:46:55.406000+00:00  <8>[   72.944227] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio2-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a05d9eac4e87bbcdac732
        new failure (last pass: next-20210412)

    2021-04-16 21:46:55.449000+00:00  <28>[   72.964312] udevd[133]: worker=
 [143] /bus/event_source is taking a long time
    2021-04-16 21:46:55.450000+00:00  <28>[   72.971769] udevd[133]: worker=
 [146] /bus/genpd is taking a long time
    2021-04-16 21:46:55.450000+00:00  <28>[   72.978604] udevd[133]: worker=
 [142] /bus/edac is taking a long time
    2021-04-16 21:46:55.451000+00:00  <28>[   72.985346] udevd[133]: worker=
 [137] /bus/clockevents is taking a long time
    2021-04-16 21:46:56.464000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:56.465000+00:00  <8>[   73.968108] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 21:46:56.465000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:56.465000+00:00  <8>[   73.984290] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-driver-present RESULT=3Dpass>
    2021-04-16 21:46:56.465000+00:00  /lava-15630/1/../bin/lava-test-case
    2021-04-16 21:46:56.466000+00:00  <8>[   74.000212] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-probed RESULT=3Dpass> =

    ... (1 line(s) more)  =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a05d9eac4e87bbcdac6ed
        new failure (last pass: next-20210412)

    2021-04-16 21:46:57.515000+00:00  <8>[   75.049682] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a05d9eac4e87bbcdac737
        new failure (last pass: next-20210412)

    2021-04-16 21:46:58.532000+00:00  <8>[   76.067668] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a05d9eac4e87bbcdac738
        new failure (last pass: next-20210412)

    2021-04-16 21:46:59.550000+00:00  <8>[   77.085567] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a05d9eac4e87bbcdac739
        new failure (last pass: next-20210412)

    2021-04-16 21:47:00.568000+00:00  <8>[   78.103503] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a05d9eac4e87bbcdac73a
        new failure (last pass: next-20210412)

    2021-04-16 21:47:01.595000+00:00  <8>[   79.122070] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>
    2021-04-16 21:47:01.595000+00:00  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 31         =


  Details:     https://kernelci.org/test/plan/id/607a0b3ecc81181b80dac6d1

  Results:     59 PASS, 33 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-driver-present: https://kernelci.org/test/ca=
se/id/607a0b3ecc81181b80dac6d7
        new failure (last pass: next-20210413)

    2021-04-16 22:09:09.658000+00:00  <8>[   46.539409] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/60=
7a0b3ecc81181b80dac6d8
        new failure (last pass: next-20210413)

    2021-04-16 22:09:10.693000+00:00  <8>[   47.559165] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2021-04-16 22:09:10.693000+00:00  /lava-15635/1/../bin/lava-test-case   =


  * baseline.bootrr.leds-gpio-probed: https://kernelci.org/test/case/id/607=
a0b3ecc81181b80dac6da
        new failure (last pass: next-20210413)

    2021-04-16 22:09:11.706000+00:00  <8>[   48.593324] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dleds-gpio-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0b3ecc81181b80dac6db
        new failure (last pass: next-20210413)

    2021-04-16 22:09:39.045000+00:00  <8>[   75.927336] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a0b3e=
cc81181b80dac6dc
        new failure (last pass: next-20210413)

    2021-04-16 22:09:12.730000+00:00  <8>[   49.611464] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 22:09:13.742000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:13.743000+00:00  <8>[   50.630163] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a0b3ecc81181b80dac701
        new failure (last pass: next-20210413) =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a0b3e=
cc81181b80dac702
        new failure (last pass: next-20210413)

    2021-04-16 22:09:16.409000+00:00  <8>[   53.295999] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a0b3ecc81181b80dac703
        new failure (last pass: next-20210413) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a0b3ecc81181b80dac704
        new failure (last pass: next-20210413)

    2021-04-16 22:09:18.444000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:18.446000+00:00  <8>[   55.332969] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a0b3ecc81181b80dac705
        new failure (last pass: next-20210413)

    2021-04-16 22:09:19.464000+00:00  <8>[   56.351425] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a0b3ecc81181b80dac706
        new failure (last pass: next-20210413)

    2021-04-16 22:09:20.484000+00:00  <8>[   57.370570] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a0b3ecc81181b80dac707
        new failure (last pass: next-20210413)

    2021-04-16 22:09:21.543000+00:00  <8>[   58.389247] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 22:09:21.543000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:21.543000+00:00  <8>[   58.405772] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 22:09:21.544000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:21.544000+00:00  <8>[   58.424540] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 22:09:21.544000+00:00  /lava-15635/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a0b3ecc81181b80dac70b
        new failure (last pass: next-20210413)

    2021-04-16 22:09:22.579000+00:00  <8>[   59.460413] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a0b3ecc81181b80dac70c
        new failure (last pass: next-20210413)

    2021-04-16 22:09:23.631000+00:00  <8>[   60.481012] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2021-04-16 22:09:23.631000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:23.631000+00:00  <8>[   60.497201] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2021-04-16 22:09:23.631000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:23.631000+00:00  <8>[   60.514044] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2021-04-16 22:09:23.631000+00:00  /lava-15635/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a0b3ecc81181b80dac715
        new failure (last pass: next-20210413)

    2021-04-16 22:09:26.752000+00:00  <8>[   63.632666] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a0b3ecc81181b80dac716
        new failure (last pass: next-20210413)

    2021-04-16 22:09:27.771000+00:00  <8>[   64.652577] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a0b3ecc81181b80dac717
        new failure (last pass: next-20210413)

    2021-04-16 22:09:28.789000+00:00  <8>[   65.670629] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a0b3ecc81181b80dac718
        new failure (last pass: next-20210413)

    2021-04-16 22:09:29.810000+00:00  <8>[   66.690845] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a0b3ecc81181b80dac719
        new failure (last pass: next-20210413)

    2021-04-16 22:09:30.828000+00:00  <8>[   67.709323] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a0b3ecc81181b80dac71a
        new failure (last pass: next-20210413)

    2021-04-16 22:09:31.848000+00:00  <8>[   68.729113] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a0b3ecc81181b80dac71b
        new failure (last pass: next-20210413)

    2021-04-16 22:09:32.870000+00:00  <8>[   69.748395] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a0b3ecc81181b80dac71c
        new failure (last pass: next-20210413)

    2021-04-16 22:09:33.888000+00:00  <8>[   70.767527] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a0b3ecc81181b80dac71d
        new failure (last pass: next-20210413)

    2021-04-16 22:09:34.906000+00:00  <8>[   71.787049] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a0b3ecc81181b80dac71e
        new failure (last pass: next-20210413)

    2021-04-16 22:09:35.925000+00:00  <8>[   72.805989] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a0b3ecc81181b80dac71f
        new failure (last pass: next-20210413)

    2021-04-16 22:09:36.887000+00:00  <28>[   73.755268] udevd[132]: worker=
 [137] /bus/clocksource is taking a long time
    2021-04-16 22:09:36.887000+00:00  <28>[   73.762666] udevd[132]: worker=
 [139] /bus/container is taking a long time
    2021-04-16 22:09:36.887000+00:00  <28>[   73.769862] udevd[132]: worker=
 [141] /bus/edac is taking a long time
    2021-04-16 22:09:36.888000+00:00  <28>[   73.776624] udevd[132]: worker=
 [146] /bus/gpio is taking a long time
    2021-04-16 22:09:36.888000+00:00  <28>[   73.783380] udevd[132]: worker=
 [135] /bus/auxiliary is taking a long time
    2021-04-16 22:09:36.920000+00:00  <28>[   73.790576] udevd[132]: worker=
 [142] /bus/event_source is taking a long time
    2021-04-16 22:09:36.920000+00:00  <28>[   73.798042] udevd[132]: worker=
 [143] /bus/fsl-mc is taking a long time
    2021-04-16 22:09:36.921000+00:00  <28>[   73.804976] udevd[132]: worker=
 [134] /bus/amba is taking a long time
    2021-04-16 22:09:36.921000+00:00  <28>[   73.811711] udevd[132]: worker=
 [140] /bus/cpu is taking a long time
    2021-04-16 22:09:36.921000+00:00  /lava-15635/1/../bin/lava-test-case =

    ... (1 line(s) more)  =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a0b3ecc81181b80dac720
        new failure (last pass: next-20210413)

    2021-04-16 22:09:37.996000+00:00  <8>[   74.844537] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 22:09:37.996000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:37.996000+00:00  <8>[   74.861606] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-driver-present RESULT=3Dpass>
    2021-04-16 22:09:37.996000+00:00  /lava-15635/1/../bin/lava-test-case
    2021-04-16 22:09:37.996000+00:00  <8>[   74.878631] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-probed RESULT=3Dpass>
    2021-04-16 22:09:37.996000+00:00  /lava-15635/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0b3ecc81181b80dac6db
        new failure (last pass: next-20210413)

    2021-04-16 22:09:39.045000+00:00  <8>[   75.927336] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a0b3ecc81181b80dac725
        new failure (last pass: next-20210413)

    2021-04-16 22:09:40.064000+00:00  <8>[   76.945739] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a0b3ecc81181b80dac726
        new failure (last pass: next-20210413)

    2021-04-16 22:09:41.083000+00:00  <8>[   77.965048] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a0b3ecc81181b80dac727
        new failure (last pass: next-20210413)

    2021-04-16 22:09:42.102000+00:00  <8>[   78.983476] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a0b3ecc81181b80dac728
        new failure (last pass: next-20210413)

    2021-04-16 22:09:43.128000+00:00  <8>[   80.002979] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>
    2021-04-16 22:09:43.129000+00:00  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 31         =


  Details:     https://kernelci.org/test/plan/id/607a03d2121bb42978dac739

  Results:     59 PASS, 33 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-driver-present: https://kernelci.org/test/ca=
se/id/607a03d2121bb42978dac73f
        new failure (last pass: next-20210415)

    2021-04-16 21:37:40.613000+00:00  /lava-15626/1/../bin/lava-test-case
    2021-04-16 21:37:40.614000+00:00  <8>[   46.046903] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/60=
7a03d2121bb42978dac740
        new failure (last pass: next-20210415)

    2021-04-16 21:37:41.651000+00:00  <8>[   47.066998] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2021-04-16 21:37:41.651000+00:00  /lava-15626/1/../bin/lava-test-case   =


  * baseline.bootrr.leds-gpio-probed: https://kernelci.org/test/case/id/607=
a03d2121bb42978dac742
        new failure (last pass: next-20210415)

    2021-04-16 21:37:42.665000+00:00  <8>[   48.102256] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dleds-gpio-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a03d2121bb42978dac743
        new failure (last pass: next-20210415)

    2021-04-16 21:38:10.029000+00:00  <8>[   75.461725] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a03d2=
121bb42978dac744
        new failure (last pass: next-20210415)

    2021-04-16 21:37:43.687000+00:00  <8>[   49.120675] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 21:37:44.748000+00:00  /lava-15626/1/../bin/lava-test-case
    2021-04-16 21:37:44.748000+00:00  <8>[   50.140791] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-probed RESULT=3Dfail>
    2021-04-16 21:37:44.748000+00:00  /lava-15626/1/../bin/lava-test-case   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a03d2121bb42978dac769
        new failure (last pass: next-20210415)

    2021-04-16 21:37:46.369000+00:00  <8>[   51.801769] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a03d2=
121bb42978dac76a
        new failure (last pass: next-20210415)

    2021-04-16 21:37:47.383000+00:00  <8>[   52.820872] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a03d2121bb42978dac76b
        new failure (last pass: next-20210415) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a03d2121bb42978dac76c
        new failure (last pass: next-20210415)

    2021-04-16 21:37:49.421000+00:00  /lava-15626/1/../bin/lava-test-case
    2021-04-16 21:37:49.422000+00:00  <8>[   54.859575] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a03d2121bb42978dac76d
        new failure (last pass: next-20210415)

    2021-04-16 21:37:50.440000+00:00  <8>[   55.878023] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a03d2121bb42978dac76e
        new failure (last pass: next-20210415)

    2021-04-16 21:37:51.459000+00:00  <8>[   56.896965] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a03d2121bb42978dac76f
        new failure (last pass: next-20210415)

    2021-04-16 21:37:52.516000+00:00  <8>[   57.916085] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 21:37:52.517000+00:00  /lava-15626/1/../bin/lava-test-case
    2021-04-16 21:37:52.517000+00:00  <8>[   57.932839] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 21:37:52.517000+00:00  /lava-15626/1/../bin/lava-test-case
    2021-04-16 21:37:52.517000+00:00  <8>[   57.949650] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 21:37:52.517000+00:00  /lava-15626/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a03d2121bb42978dac773
        new failure (last pass: next-20210415)

    2021-04-16 21:37:53.552000+00:00  <8>[   58.985179] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a03d2121bb42978dac774
        new failure (last pass: next-20210415)

    2021-04-16 21:37:54.606000+00:00  <8>[   60.005802] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a03d2121bb42978dac77d
        new failure (last pass: next-20210415)

    2021-04-16 21:37:57.730000+00:00  <8>[   63.162326] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a03d2121bb42978dac77e
        new failure (last pass: next-20210415)

    2021-04-16 21:37:58.750000+00:00  <8>[   64.182135] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a03d2121bb42978dac77f
        new failure (last pass: next-20210415)

    2021-04-16 21:37:59.769000+00:00  <8>[   65.201133] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a03d2121bb42978dac780
        new failure (last pass: next-20210415)

    2021-04-16 21:38:00.789000+00:00  <8>[   66.221752] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a03d2121bb42978dac781
        new failure (last pass: next-20210415)

    2021-04-16 21:38:01.807000+00:00  <8>[   67.240410] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a03d2121bb42978dac782
        new failure (last pass: next-20210415)

    2021-04-16 21:38:02.828000+00:00  <8>[   68.260098] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a03d2121bb42978dac783
        new failure (last pass: next-20210415)

    2021-04-16 21:38:03.847000+00:00  <8>[   69.279317] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a03d2121bb42978dac784
        new failure (last pass: next-20210415)

    2021-04-16 21:38:04.866000+00:00  <8>[   70.298268] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a03d2121bb42978dac785
        new failure (last pass: next-20210415)

    2021-04-16 21:38:05.887000+00:00  <8>[   71.319204] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a03d2121bb42978dac786
        new failure (last pass: next-20210415)

    2021-04-16 21:38:06.906000+00:00  <8>[   72.338764] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a03d2121bb42978dac787
        new failure (last pass: next-20210415)

    2021-04-16 21:38:07.858000+00:00  <28>[   73.275966] udevd[133]: worker=
 [138] /bus/clocksource is taking a long time
    2021-04-16 21:38:07.858000+00:00  <28>[   73.283348] udevd[133]: worker=
 [136] /bus/auxiliary is taking a long time
    2021-04-16 21:38:07.858000+00:00  <28>[   73.290546] udevd[133]: worker=
 [139] /bus/container is taking a long time
    2021-04-16 21:38:07.859000+00:00  <28>[   73.297748] udevd[133]: worker=
 [143] /bus/event_source is taking a long time
    2021-04-16 21:38:07.859000+00:00  <28>[   73.305217] udevd[133]: worker=
 [135] /bus/amba is taking a long time
    2021-04-16 21:38:07.894000+00:00  <28>[   73.311981] udevd[133]: worker=
 [141] /bus/cpu is taking a long time
    2021-04-16 21:38:07.895000+00:00  <28>[   73.318659] udevd[133]: worker=
 [137] /bus/clockevents is taking a long time
    2021-04-16 21:38:07.895000+00:00  <28>[   73.326033] udevd[133]: worker=
 [144] /bus/fsl-mc is taking a long time
    2021-04-16 21:38:07.896000+00:00  <28>[   73.332943] udevd[133]: worker=
 [142] /bus/edac is taking a long time
    2021-04-16 21:38:07.925000+00:00  /lava-15626/1/../bin/lava-test-case =

    ... (1 line(s) more)  =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a03d2121bb42978dac788
        new failure (last pass: next-20210415)

    2021-04-16 21:38:08.978000+00:00  <8>[   74.377890] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 21:38:08.979000+00:00  /lava-15626/1/../bin/lava-test-case
    2021-04-16 21:38:08.979000+00:00  <8>[   74.395069] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-driver-present RESULT=3Dpass>
    2021-04-16 21:38:08.979000+00:00  /lava-15626/1/../bin/lava-test-case
    2021-04-16 21:38:08.979000+00:00  <8>[   74.411929] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-probed RESULT=3Dpass>
    2021-04-16 21:38:08.979000+00:00  /lava-15626/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a03d2121bb42978dac743
        new failure (last pass: next-20210415)

    2021-04-16 21:38:10.029000+00:00  <8>[   75.461725] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a03d3121bb42978dac78d
        new failure (last pass: next-20210415)

    2021-04-16 21:38:11.048000+00:00  <8>[   76.480659] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a03d3121bb42978dac78e
        new failure (last pass: next-20210415)

    2021-04-16 21:38:12.067000+00:00  <8>[   77.499878] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a03d3121bb42978dac78f
        new failure (last pass: next-20210415)

    2021-04-16 21:38:13.087000+00:00  <8>[   78.518995] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a03d3121bb42978dac790
        new failure (last pass: next-20210415)

    2021-04-16 21:38:14.112000+00:00  <8>[   79.538344] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>
    2021-04-16 21:38:14.113000+00:00  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-8    | defconfig=
                    | 31         =


  Details:     https://kernelci.org/test/plan/id/607a0a9f147e25361edac6bb

  Results:     59 PASS, 33 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-driver-present: https://kernelci.org/test/ca=
se/id/607a0aa0147e25361edac6c1
        new failure (last pass: next-20210415)

    2021-04-16 22:06:30.873000+00:00  <8>[   46.428311] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/60=
7a0aa0147e25361edac6c2
        new failure (last pass: next-20210415)

    2021-04-16 22:06:31.907000+00:00  <8>[   47.446173] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2021-04-16 22:06:31.907000+00:00  /lava-15634/1/../bin/lava-test-case   =


  * baseline.bootrr.leds-gpio-probed: https://kernelci.org/test/case/id/607=
a0aa0147e25361edac6c4
        new failure (last pass: next-20210415)

    2021-04-16 22:06:32.926000+00:00  ase
    2021-04-16 22:06:32.926000+00:00  <8>[   48.484666] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dleds-gpio-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0aa0147e25361edac6c5
        new failure (last pass: next-20210415)

    2021-04-16 22:07:00.259000+00:00  <8>[   75.815080] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a0aa0=
147e25361edac6c6
        new failure (last pass: next-20210415)

    2021-04-16 22:06:33.949000+00:00  <8>[   49.504130] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 22:06:34.999000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:35+00:00  <8>[   50.521866] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Dat24-probed RESULT=3Dfail>
    2021-04-16 22:06:35+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:35+00:00  <8>[   50.539261] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2021-04-16 22:06:35+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:35.001000+00:00  <8>[   50.555005] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dpass>
    2021-04-16 22:06:35.001000+00:00  /lava-15634/1/../bin/lava-test-case   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a0aa0147e25361edac6eb
        new failure (last pass: next-20210415) =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a0aa0=
147e25361edac6ec
        new failure (last pass: next-20210415)

    2021-04-16 22:06:37.603000+00:00  <8>[   53.163545] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a0aa0147e25361edac6ed
        new failure (last pass: next-20210415) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a0aa0147e25361edac6ee
        new failure (last pass: next-20210415)

    2021-04-16 22:06:39.638000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:39.639000+00:00  <8>[   55.200315] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a0aa0147e25361edac6ef
        new failure (last pass: next-20210415)

    2021-04-16 22:06:40.657000+00:00  <8>[   56.218217] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a0aa0147e25361edac6f0
        new failure (last pass: next-20210415)

    2021-04-16 22:06:41.676000+00:00  <8>[   57.237356] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a0aa0147e25361edac6f1
        new failure (last pass: next-20210415)

    2021-04-16 22:06:42.733000+00:00  <8>[   58.255910] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 22:06:42.733000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:42.733000+00:00  <8>[   58.273288] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 22:06:42.733000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:42.734000+00:00  <8>[   58.288968] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 22:06:42.734000+00:00  /lava-15634/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a0aa0147e25361edac6f5
        new failure (last pass: next-20210415)

    2021-04-16 22:06:43.767000+00:00  <8>[   59.322907] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a0aa0147e25361edac6f6
        new failure (last pass: next-20210415)

    2021-04-16 22:06:44.819000+00:00  <8>[   60.342310] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2021-04-16 22:06:44.819000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:44.819000+00:00  <8>[   60.359164] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2021-04-16 22:06:44.819000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:44.819000+00:00  <8>[   60.375744] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2021-04-16 22:06:44.820000+00:00  /lava-15634/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a0aa0147e25361edac6ff
        new failure (last pass: next-20210415)

    2021-04-16 22:06:47.936000+00:00  <8>[   63.491667] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a0aa0147e25361edac700
        new failure (last pass: next-20210415)

    2021-04-16 22:06:48.956000+00:00  <8>[   64.511525] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a0aa0147e25361edac701
        new failure (last pass: next-20210415)

    2021-04-16 22:06:49.976000+00:00  <8>[   65.531096] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a0aa0147e25361edac702
        new failure (last pass: next-20210415)

    2021-04-16 22:06:50.995000+00:00  <8>[   66.550423] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a0aa0147e25361edac703
        new failure (last pass: next-20210415)

    2021-04-16 22:06:52.014000+00:00  <8>[   67.569232] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a0aa0147e25361edac704
        new failure (last pass: next-20210415)

    2021-04-16 22:06:53.036000+00:00  <8>[   68.591121] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a0aa0147e25361edac705
        new failure (last pass: next-20210415)

    2021-04-16 22:06:54.054000+00:00  <8>[   69.609536] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a0aa0147e25361edac706
        new failure (last pass: next-20210415)

    2021-04-16 22:06:55.073000+00:00  <8>[   70.628419] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a0aa0147e25361edac707
        new failure (last pass: next-20210415)

    2021-04-16 22:06:56.091000+00:00  <8>[   71.646866] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a0aa0147e25361edac708
        new failure (last pass: next-20210415)

    2021-04-16 22:06:57.111000+00:00  <8>[   72.665478] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a0aa0147e25361edac709
        new failure (last pass: next-20210415)

    2021-04-16 22:06:58.103000+00:00  <28>[   73.645021] udevd[133]: worker=
 [138] /bus/clocksource is taking a long time
    2021-04-16 22:06:58.103000+00:00  <28>[   73.652411] udevd[133]: worker=
 [135] /bus/amba is taking a long time
    2021-04-16 22:06:58.103000+00:00  <28>[   73.659185] udevd[133]: worker=
 [144] /bus/fsl-mc is taking a long time
    2021-04-16 22:06:58.104000+00:00  <28>[   73.666132] udevd[133]: worker=
 [137] /bus/clockevents is taking a long time
    2021-04-16 22:06:58.104000+00:00  <28>[   73.673507] udevd[133]: worker=
 [142] /bus/edac is taking a long time
    2021-04-16 22:06:58.159000+00:00  <28>[   73.680277] udevd[133]: worker=
 [141] /bus/cpu is taking a long time
    2021-04-16 22:06:58.159000+00:00  <28>[   73.686937] udevd[133]: worker=
 [139] /bus/container is taking a long time
    2021-04-16 22:06:58.160000+00:00  /lava-15634/1/..<28>[   73.694119] ud=
evd[133]: worker [145] /bus/genpd is taking a long time
    2021-04-16 22:06:58.160000+00:00  /bin/lava-test-c<28>[   73.702314] ud=
evd[133]: worker [136] /bus/auxiliary is taking a long time
    2021-04-16 22:06:58.160000+00:00  ase =

    ... (1 line(s) more)  =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a0aa0147e25361edac70a
        new failure (last pass: next-20210415)

    2021-04-16 22:06:59.210000+00:00  <8>[   74.734822] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 22:06:59.211000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:59.211000+00:00  <8>[   74.751195] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-driver-present RESULT=3Dpass>
    2021-04-16 22:06:59.211000+00:00  /lava-15634/1/../bin/lava-test-case
    2021-04-16 22:06:59.211000+00:00  <8>[   74.767487] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-probed RESULT=3Dpass>
    2021-04-16 22:06:59.211000+00:00  /lava-15634/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0aa0147e25361edac6c5
        new failure (last pass: next-20210415)

    2021-04-16 22:07:00.259000+00:00  <8>[   75.815080] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a0aa0147e25361edac70f
        new failure (last pass: next-20210415)

    2021-04-16 22:07:01.279000+00:00  <8>[   76.834495] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a0aa0147e25361edac710
        new failure (last pass: next-20210415)

    2021-04-16 22:07:02.298000+00:00  <8>[   77.853418] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a0aa0147e25361edac711
        new failure (last pass: next-20210415)

    2021-04-16 22:07:03.317000+00:00  <8>[   78.871766] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a0aa0147e25361edac712
        new failure (last pass: next-20210415)

    2021-04-16 22:07:04.343000+00:00  <8>[   79.890733] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>
    2021-04-16 22:07:04.344000+00:00  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | clang-11 | defconfig=
                    | 39         =


  Details:     https://kernelci.org/test/plan/id/607a0601e306e7ff94dac6bd

  Results:     59 PASS, 41 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.pwm-fan-driver-present: https://kernelci.org/test/case/=
id/607a0601e306e7ff94dac6c1
        new failure (last pass: next-20210412) =


  * baseline.bootrr.pwm-fan-probed: https://kernelci.org/test/case/id/607a0=
601e306e7ff94dac6c2
        new failure (last pass: next-20210412)

    2021-04-16 21:46:45.447000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:45.448000+00:00  <8>[   43.214036] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpwm-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a0601e306e7ff94dac6c3
        new failure (last pass: next-20210412)

    2021-04-16 21:46:46.472000+00:00  <8>[   44.231459] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 21:46:47.489000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:47.491000+00:00  <8>[   45.250542] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:46:48.508000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:48.509000+00:00  <8>[   46.268754] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a0601e306e7ff94dac6c4
        new failure (last pass: next-20210412)

    2021-04-16 21:46:49.557000+00:00  <8>[   47.287482] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:46:49.558000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:49.558000+00:00  <8>[   47.303775] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 21:46:49.558000+00:00  /lava-15628/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a0601e306e7ff94dac6c3
        new failure (last pass: next-20210412)

    2021-04-16 21:46:46.472000+00:00  <8>[   44.231459] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 21:46:47.489000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:47.491000+00:00  <8>[   45.250542] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:46:48.508000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:48.509000+00:00  <8>[   46.268754] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a0601e306e7ff94dac6c4
        new failure (last pass: next-20210412)

    2021-04-16 21:46:49.557000+00:00  <8>[   47.287482] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:46:49.558000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:49.558000+00:00  <8>[   47.303775] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 21:46:49.558000+00:00  /lava-15628/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac6c7
        new failure (last pass: next-20210412)

    2021-04-16 21:47:21.955000+00:00  <8>[   79.714467] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a0601=
e306e7ff94dac6c8
        new failure (last pass: next-20210412)

    2021-04-16 21:46:50.576000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:50.578000+00:00  <8>[   48.337213] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 21:46:51.588000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:51.589000+00:00  <8>[   49.355038] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-probed RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-driver-present: https://kernelci.org/test/case/i=
d/607a0601e306e7ff94dac6c9
        new failure (last pass: next-20210412)

    2021-04-16 21:46:52.614000+00:00  <8>[   50.373440] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-probed: https://kernelci.org/test/case/id/607a06=
01e306e7ff94dac6ca
        new failure (last pass: next-20210412)

    2021-04-16 21:46:53.626000+00:00  <8>[   51.391477] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-driver-present: https://kernelci.org/test/case/=
id/607a0601e306e7ff94dac6cb
        new failure (last pass: next-20210412) =


  * baseline.bootrr.fsl-sai-sai5-probed: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac6cc
        new failure (last pass: next-20210412)

    2021-04-16 21:46:55.666000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:55.670000+00:00  <8>[   53.428061] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai5-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-sai6-probed: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac6cd
        new failure (last pass: next-20210412)

    2021-04-16 21:46:56.722000+00:00  <8>[   54.446300] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai6-probed RESULT=3Dfail>
    2021-04-16 21:46:56.722000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:56.722000+00:00  <8>[   54.463400] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-driver-present RESULT=3Dpass>
    2021-04-16 21:46:56.723000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:46:56.723000+00:00  <8>[   54.480443] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-sai4-probed RESULT=3Dpass>
    2021-04-16 21:46:56.723000+00:00  /lava-15628/1/../bin/lava-test-case   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac6f4
        new failure (last pass: next-20210412)

    2021-04-16 21:46:58.324000+00:00  <8>[   56.083928] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a0601=
e306e7ff94dac6f5
        new failure (last pass: next-20210412)

    2021-04-16 21:46:59.337000+00:00  <8>[   57.102147] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a0601e306e7ff94dac6f6
        new failure (last pass: next-20210412) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a0601e306e7ff94dac6f7
        new failure (last pass: next-20210412)

    2021-04-16 21:47:01.371000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:47:01.372000+00:00  <8>[   59.137793] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a0601e306e7ff94dac6f8
        new failure (last pass: next-20210412)

    2021-04-16 21:47:02.391000+00:00  <8>[   60.155914] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a0601e306e7ff94dac6f9
        new failure (last pass: next-20210412)

    2021-04-16 21:47:03.409000+00:00  <8>[   61.174106] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a0601e306e7ff94dac6fa
        new failure (last pass: next-20210412)

    2021-04-16 21:47:04.463000+00:00  <8>[   62.192336] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 21:47:04.463000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:47:04.463000+00:00  <8>[   62.208278] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 21:47:04.464000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:47:04.464000+00:00  <8>[   62.224001] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 21:47:04.464000+00:00  /lava-15628/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a0601e306e7ff94dac6fe
        new failure (last pass: next-20210412)

    2021-04-16 21:47:05.497000+00:00  <8>[   63.257420] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a0601e306e7ff94dac6ff
        new failure (last pass: next-20210412)

    2021-04-16 21:47:06.547000+00:00  <8>[   64.276504] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2021-04-16 21:47:06.547000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:47:06.547000+00:00  <8>[   64.292533] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2021-04-16 21:47:06.547000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:47:06.548000+00:00  <8>[   64.308824] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2021-04-16 21:47:06.548000+00:00  /lava-15628/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a0601e306e7ff94dac708
        new failure (last pass: next-20210412)

    2021-04-16 21:47:09.666000+00:00  <8>[   67.425881] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac709
        new failure (last pass: next-20210412)

    2021-04-16 21:47:10.685000+00:00  <8>[   68.445321] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a0601e306e7ff94dac70a
        new failure (last pass: next-20210412)

    2021-04-16 21:47:11.720000+00:00  <8>[   69.463299] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-driver-present RESULT=3Dfail>
    2021-04-16 21:47:11.720000+00:00  <28>[   69.471653] udevd[128]: worker=
 [130] /bus/amba is taking a long time
    2021-04-16 21:47:11.721000+00:00  <28>[   69.478425] udevd[128]: worker=
 [140] /bus/genpd is taking a long time
    2021-04-16 21:47:11.721000+00:00  <28>[   69.485284] udevd[128]: worker=
 [143] /bus/hid is taking a long time
    2021-04-16 21:47:11.721000+00:00  <28>[   69.491934] udevd[128]: worker=
 [137] /bus/edac is taking a long time   =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac70b
        new failure (last pass: next-20210412)

    2021-04-16 21:47:11.773000+00:00  <28>[   69.506110] udevd[128]: worker=
 [132] /bus/clockevents is taking a long time
    2021-04-16 21:47:11.773000+00:00  <28>[   69.513460] udevd[128]: worker=
 [136] /bus/cpu is taking a long time
    2021-04-16 21:47:11.774000+00:00  <28>[   69.520108] udevd[128]: worker=
 [133] /bus/clocksource is taking a long time
    2021-04-16 21:47:11.774000+00:00  <28>[   69.527462] udevd[128]: worker=
 [134] /bus/container is taking a long time
    2021-04-16 21:47:11.774000+00:00  <28>[   69.534636] udevd[128]: worker=
 [131] /bus/auxiliary is taking a long time
    2021-04-16 21:47:12.699000+00:00  /lava-15628/1/../bin/lava-test-case
    2021-04-16 21:47:12.721000+00:00  <8>[   70.483483] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a0601e306e7ff94dac70c
        new failure (last pass: next-20210412)

    2021-04-16 21:47:13.741000+00:00  <8>[   71.501328] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a0601e306e7ff94dac70d
        new failure (last pass: next-20210412)

    2021-04-16 21:47:14.761000+00:00  <8>[   72.520606] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a0601e306e7ff94dac70e
        new failure (last pass: next-20210412)

    2021-04-16 21:47:15.779000+00:00  <8>[   73.539071] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a0601e306e7ff94dac70f
        new failure (last pass: next-20210412)

    2021-04-16 21:47:16.797000+00:00  <8>[   74.557000] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a0601e306e7ff94dac710
        new failure (last pass: next-20210412)

    2021-04-16 21:47:17.817000+00:00  <8>[   75.576167] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a0601e306e7ff94dac711
        new failure (last pass: next-20210412)

    2021-04-16 21:47:18.835000+00:00  <8>[   76.595373] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a0601e306e7ff94dac712
        new failure (last pass: next-20210412)

    2021-04-16 21:47:19.853000+00:00  <8>[   77.613657] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio2-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a0601e306e7ff94dac713
        new failure (last pass: next-20210412)

    2021-04-16 21:47:20.903000+00:00  <8>[   78.633111] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 21:47:20.903000+00:00  /lava-15628/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac6c7
        new failure (last pass: next-20210412)

    2021-04-16 21:47:21.955000+00:00  <8>[   79.714467] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac716
        new failure (last pass: next-20210412)

    2021-04-16 21:47:22.973000+00:00  <8>[   80.733565] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a0601e306e7ff94dac717
        new failure (last pass: next-20210412)

    2021-04-16 21:47:23.991000+00:00  <8>[   81.751379] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a0601e306e7ff94dac718
        new failure (last pass: next-20210412)

    2021-04-16 21:47:25.009000+00:00  <8>[   82.769387] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a0601e306e7ff94dac719
        new failure (last pass: next-20210412)

    2021-04-16 21:47:26.035000+00:00  <8>[   83.787811] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>
    2021-04-16 21:47:26.036000+00:00  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 39         =


  Details:     https://kernelci.org/test/plan/id/607a0b4099bb03758cdac6b7

  Results:     59 PASS, 41 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.pwm-fan-driver-present: https://kernelci.org/test/case/=
id/607a0b4099bb03758cdac6bb
        new failure (last pass: next-20210413)

    2021-04-16 22:09:07.557000+00:00  <8>[   42.261071] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpwm-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.pwm-fan-probed: https://kernelci.org/test/case/id/607a0=
b4099bb03758cdac6bc
        new failure (last pass: next-20210413)

    2021-04-16 22:09:08.573000+00:00  <8>[   43.280701] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpwm-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a0b4099bb03758cdac6bd
        new failure (last pass: next-20210413)

    2021-04-16 22:09:09.596000+00:00  <8>[   44.298446] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 22:09:10.614000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:10.616000+00:00  <8>[   45.318471] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:09:11.634000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:11.635000+00:00  <8>[   46.338013] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a0b4099bb03758cdac6be
        new failure (last pass: next-20210413)

    2021-04-16 22:09:12.686000+00:00  <8>[   47.357362] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:09:12.686000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:12.687000+00:00  <8>[   47.373872] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 22:09:12.687000+00:00  /lava-15636/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a0b4099bb03758cdac6bd
        new failure (last pass: next-20210413)

    2021-04-16 22:09:09.596000+00:00  <8>[   44.298446] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 22:09:10.614000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:10.616000+00:00  <8>[   45.318471] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:09:11.634000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:11.635000+00:00  <8>[   46.338013] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a0b4099bb03758cdac6be
        new failure (last pass: next-20210413)

    2021-04-16 22:09:12.686000+00:00  <8>[   47.357362] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:09:12.686000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:12.687000+00:00  <8>[   47.373872] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 22:09:12.687000+00:00  /lava-15636/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac6c1
        new failure (last pass: next-20210413)

    2021-04-16 22:09:45.149000+00:00  <8>[   79.851326] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a0b40=
99bb03758cdac6c2
        new failure (last pass: next-20210413)

    2021-04-16 22:09:13.704000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:13.705000+00:00  <8>[   48.407571] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 22:09:14.717000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:14.718000+00:00  <8>[   49.426119] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-probed RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-driver-present: https://kernelci.org/test/case/i=
d/607a0b4099bb03758cdac6c3
        new failure (last pass: next-20210413)

    2021-04-16 22:09:15.742000+00:00  <8>[   50.444507] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-probed: https://kernelci.org/test/case/id/607a0b=
4099bb03758cdac6c4
        new failure (last pass: next-20210413)

    2021-04-16 22:09:16.760000+00:00  <8>[   51.464034] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-driver-present: https://kernelci.org/test/case/=
id/607a0b4099bb03758cdac6c5
        new failure (last pass: next-20210413) =


  * baseline.bootrr.fsl-sai-sai5-probed: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac6c6
        new failure (last pass: next-20210413)

    2021-04-16 22:09:18.799000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:18.800000+00:00  <8>[   53.502882] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai5-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-sai6-probed: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac6c7
        new failure (last pass: next-20210413)

    2021-04-16 22:09:19.857000+00:00  <8>[   54.522119] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai6-probed RESULT=3Dfail>
    2021-04-16 22:09:19.857000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:19.857000+00:00  <8>[   54.539152] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-driver-present RESULT=3Dpass>
    2021-04-16 22:09:19.858000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:19.858000+00:00  <8>[   54.557095] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-sai4-probed RESULT=3Dpass>
    2021-04-16 22:09:19.858000+00:00  /lava-15636/1/../bin/lava-test-case   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac6ee
        new failure (last pass: next-20210413)

    2021-04-16 22:09:21.493000+00:00  <8>[   56.195670] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a0b40=
99bb03758cdac6ef
        new failure (last pass: next-20210413)

    2021-04-16 22:09:22.507000+00:00  <8>[   57.214862] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a0b4099bb03758cdac6f0
        new failure (last pass: next-20210413) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a0b4099bb03758cdac6f1
        new failure (last pass: next-20210413)

    2021-04-16 22:09:24.543000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:24.544000+00:00  <8>[   59.252901] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a0b4099bb03758cdac6f2
        new failure (last pass: next-20210413)

    2021-04-16 22:09:25.564000+00:00  <8>[   60.272105] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a0b4099bb03758cdac6f3
        new failure (last pass: next-20210413)

    2021-04-16 22:09:26.583000+00:00  <8>[   61.291427] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a0b4099bb03758cdac6f4
        new failure (last pass: next-20210413)

    2021-04-16 22:09:27.640000+00:00  <8>[   62.310506] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 22:09:27.640000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:27.641000+00:00  <8>[   62.326826] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 22:09:27.641000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:27.641000+00:00  <8>[   62.342614] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 22:09:27.641000+00:00  /lava-15636/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a0b4099bb03758cdac6f8
        new failure (last pass: next-20210413)

    2021-04-16 22:09:28.675000+00:00  <8>[   63.377840] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a0b4099bb03758cdac6f9
        new failure (last pass: next-20210413)

    2021-04-16 22:09:29.729000+00:00  <8>[   64.397574] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2021-04-16 22:09:29.730000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:29.730000+00:00  <8>[   64.413871] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2021-04-16 22:09:29.730000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:29.730000+00:00  <8>[   64.433068] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2021-04-16 22:09:29.731000+00:00  /lava-15636/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a0b4099bb03758cdac702
        new failure (last pass: next-20210413)

    2021-04-16 22:09:32.851000+00:00  <8>[   67.553452] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac703
        new failure (last pass: next-20210413)

    2021-04-16 22:09:33.870000+00:00  <8>[   68.572779] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a0b4099bb03758cdac704
        new failure (last pass: next-20210413)

    2021-04-16 22:09:34.827000+00:00  <28>[   69.515843] udevd[125]: worker=
 [134] /bus/edac is taking a long time
    2021-04-16 22:09:34.827000+00:00  <28>[   69.522607] udevd[125]: worker=
 [139] /bus/gpio is taking a long time
    2021-04-16 22:09:34.827000+00:00  <28>[   69.529366] udevd[125]: worker=
 [138] /bus/genpd is taking a long time
    2021-04-16 22:09:34.828000+00:00  <28>[   69.536214] udevd[125]: worker=
 [132] /bus/cpu is taking a long time
    2021-04-16 22:09:34.828000+00:00  <28>[   69.542885] udevd[125]: worker=
 [127] /bus/amba is taking a long time
    2021-04-16 22:09:34.884000+00:00  <28>[   69.549644] udevd[125]: worker=
 [135] /bus/event_source is taking a long time
    2021-04-16 22:09:34.884000+00:00  <28>[   69.557102] udevd[125]: worker=
 [129] /bus/clockevents is taking a long time
    2021-04-16 22:09:34.885000+00:00  <28>[   69.564485] udevd[125]: worker=
 [128] /bus/auxiliary is taking a long time
    2021-04-16 22:09:34.885000+00:00  <28>[   69.571661] udevd[125]: worker=
 [136] /bus/fsl-mc is taking a long time
    2021-04-16 22:09:34.885000+00:00  /lava-15636/1/../bin/lava-test-case =

    ... (1 line(s) more)  =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac705
        new failure (last pass: next-20210413)

    2021-04-16 22:09:35.907000+00:00  <8>[   70.610073] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a0b4099bb03758cdac706
        new failure (last pass: next-20210413)

    2021-04-16 22:09:36.926000+00:00  <8>[   71.628448] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a0b4099bb03758cdac707
        new failure (last pass: next-20210413)

    2021-04-16 22:09:37.946000+00:00  <8>[   72.648232] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a0b4099bb03758cdac708
        new failure (last pass: next-20210413)

    2021-04-16 22:09:38.965000+00:00  <8>[   73.667216] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a0b4099bb03758cdac709
        new failure (last pass: next-20210413)

    2021-04-16 22:09:39.983000+00:00  <8>[   74.685667] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a0b4099bb03758cdac70a
        new failure (last pass: next-20210413)

    2021-04-16 22:09:41.004000+00:00  <8>[   75.705929] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a0b4099bb03758cdac70b
        new failure (last pass: next-20210413)

    2021-04-16 22:09:42.022000+00:00  <8>[   76.725185] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a0b4099bb03758cdac70c
        new failure (last pass: next-20210413)

    2021-04-16 22:09:43.042000+00:00  <8>[   77.744570] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio2-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a0b4099bb03758cdac70d
        new failure (last pass: next-20210413)

    2021-04-16 22:09:44.095000+00:00  <8>[   78.763639] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 22:09:44.096000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:44.096000+00:00  <8>[   78.781072] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-driver-present RESULT=3Dpass>
    2021-04-16 22:09:44.096000+00:00  /lava-15636/1/../bin/lava-test-case
    2021-04-16 22:09:44.096000+00:00  <8>[   78.798451] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-probed RESULT=3Dpass>
    2021-04-16 22:09:44.096000+00:00  /lava-15636/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac6c1
        new failure (last pass: next-20210413)

    2021-04-16 22:09:45.149000+00:00  <8>[   79.851326] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac710
        new failure (last pass: next-20210413)

    2021-04-16 22:09:46.168000+00:00  <8>[   80.870828] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a0b4099bb03758cdac711
        new failure (last pass: next-20210413)

    2021-04-16 22:09:47.186000+00:00  <8>[   81.889273] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a0b4099bb03758cdac712
        new failure (last pass: next-20210413)

    2021-04-16 22:09:48.205000+00:00  <8>[   82.908109] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a0b4099bb03758cdac713
        new failure (last pass: next-20210413)

    2021-04-16 22:09:49.232000+00:00  <8>[   83.927668] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 39         =


  Details:     https://kernelci.org/test/plan/id/607a03d0206a6ca359dac6ed

  Results:     59 PASS, 41 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.pwm-fan-driver-present: https://kernelci.org/test/case/=
id/607a03d0206a6ca359dac6f1
        new failure (last pass: next-20210415)

    2021-04-16 21:37:24.772000+00:00  <8>[   42.260746] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpwm-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.pwm-fan-probed: https://kernelci.org/test/case/id/607a0=
3d0206a6ca359dac6f2
        new failure (last pass: next-20210415)

    2021-04-16 21:37:25.788000+00:00  <8>[   43.279871] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpwm-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a03d0206a6ca359dac6f3
        new failure (last pass: next-20210415)

    2021-04-16 21:37:26.813000+00:00  <8>[   44.299082] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 21:37:27.833000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:27.834000+00:00  <8>[   45.319725] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:37:28.852000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:28.853000+00:00  <8>[   46.339538] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a03d0206a6ca359dac6f4
        new failure (last pass: next-20210415)

    2021-04-16 21:37:29.906000+00:00  <8>[   47.359784] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:37:29.906000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:29.907000+00:00  <8>[   47.377054] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 21:37:29.907000+00:00  /lava-15625/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a03d0206a6ca359dac6f3
        new failure (last pass: next-20210415)

    2021-04-16 21:37:26.813000+00:00  <8>[   44.299082] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 21:37:27.833000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:27.834000+00:00  <8>[   45.319725] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:37:28.852000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:28.853000+00:00  <8>[   46.339538] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a03d0206a6ca359dac6f4
        new failure (last pass: next-20210415)

    2021-04-16 21:37:29.906000+00:00  <8>[   47.359784] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 21:37:29.906000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:29.907000+00:00  <8>[   47.377054] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 21:37:29.907000+00:00  /lava-15625/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a03d0206a6ca359dac6f7
        new failure (last pass: next-20210415)

    2021-04-16 21:38:02.385000+00:00  <8>[   79.870664] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a03d0=
206a6ca359dac6f8
        new failure (last pass: next-20210415)

    2021-04-16 21:37:30.924000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:30.925000+00:00  <8>[   48.410793] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 21:37:31.937000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:31.938000+00:00  <8>[   49.429699] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-probed RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-driver-present: https://kernelci.org/test/case/i=
d/607a03d0206a6ca359dac6f9
        new failure (last pass: next-20210415)

    2021-04-16 21:37:32.962000+00:00  <8>[   50.447359] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-probed: https://kernelci.org/test/case/id/607a03=
d0206a6ca359dac6fa
        new failure (last pass: next-20210415)

    2021-04-16 21:37:33.975000+00:00  <8>[   51.466440] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-driver-present: https://kernelci.org/test/case/=
id/607a03d0206a6ca359dac6fb
        new failure (last pass: next-20210415) =


  * baseline.bootrr.fsl-sai-sai5-probed: https://kernelci.org/test/case/id/=
607a03d0206a6ca359dac6fc
        new failure (last pass: next-20210415)

    2021-04-16 21:37:36.018000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:36.019000+00:00  <8>[   53.505752] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai5-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-sai6-probed: https://kernelci.org/test/case/id/=
607a03d0206a6ca359dac6fd
        new failure (last pass: next-20210415)

    2021-04-16 21:37:37.077000+00:00  <8>[   54.525793] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai6-probed RESULT=3Dfail>
    2021-04-16 21:37:37.077000+00:00  /lava-15625/1/../bin/lava-test-c<5>[ =
  54.539967] random: fast init done
    2021-04-16 21:37:37.077000+00:00  ase
    2021-04-16 21:37:37.077000+00:00  <8>[   54.546721] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-driver-present RESULT=3Dpass>
    2021-04-16 21:37:37.077000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:37.078000+00:00  <8>[   54.563598] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-sai4-probed RESULT=3Dpass>   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a03d1206a6ca359dac724
        new failure (last pass: next-20210415)

    2021-04-16 21:37:38.719000+00:00  <8>[   56.204613] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a03d1=
206a6ca359dac725
        new failure (last pass: next-20210415)

    2021-04-16 21:37:39.733000+00:00  <8>[   57.223796] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a03d1206a6ca359dac726
        new failure (last pass: next-20210415) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a03d1206a6ca359dac727
        new failure (last pass: next-20210415)

    2021-04-16 21:37:41.770000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:41.771000+00:00  <8>[   59.262651] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a03d1206a6ca359dac728
        new failure (last pass: next-20210415)

    2021-04-16 21:37:42.790000+00:00  <8>[   60.281989] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a03d1206a6ca359dac729
        new failure (last pass: next-20210415)

    2021-04-16 21:37:43.810000+00:00  <8>[   61.301521] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a03d1206a6ca359dac72a
        new failure (last pass: next-20210415)

    2021-04-16 21:37:44.869000+00:00  <8>[   62.320919] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 21:37:44.869000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:44.869000+00:00  <8>[   62.337738] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 21:37:44.870000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:44.870000+00:00  <8>[   62.354820] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 21:37:44.870000+00:00  /lava-15625/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a03d1206a6ca359dac72e
        new failure (last pass: next-20210415)

    2021-04-16 21:37:45.905000+00:00  <8>[   63.390985] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a03d1206a6ca359dac72f
        new failure (last pass: next-20210415)

    2021-04-16 21:37:46.958000+00:00  <8>[   64.410989] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2021-04-16 21:37:46.958000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:46.958000+00:00  <8>[   64.428219] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2021-04-16 21:37:46.959000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:37:46.959000+00:00  <8>[   64.445553] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2021-04-16 21:37:46.959000+00:00  /lava-15625/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a03d1206a6ca359dac738
        new failure (last pass: next-20210415)

    2021-04-16 21:37:50.083000+00:00  <8>[   67.569046] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a03d1206a6ca359dac739
        new failure (last pass: next-20210415)

    2021-04-16 21:37:51.104000+00:00  <8>[   68.589569] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a03d1206a6ca359dac73a
        new failure (last pass: next-20210415)

    2021-04-16 21:37:52.044000+00:00  <28>[   69.517555] udevd[126]: worker=
 [140] /bus/gpio is taking a long time
    2021-04-16 21:37:52.044000+00:00  <28>[   69.524323] udevd[126]: worker=
 [141] /bus/hid is taking a long time
    2021-04-16 21:37:52.045000+00:00  <28>[   69.530998] udevd[126]: worker=
 [133] /bus/container is taking a long time
    2021-04-16 21:37:52.045000+00:00  <28>[   69.538199] udevd[126]: worker=
 [130] /bus/clockevents is taking a long time
    2021-04-16 21:37:52.046000+00:00  <28>[   69.545572] udevd[126]: worker=
 [138] /bus/genpd is taking a long time
    2021-04-16 21:37:52.080000+00:00  <28>[   69.552417] udevd[126]: worker=
 [135] /bus/edac is taking a long time
    2021-04-16 21:37:52.081000+00:00  <28>[   69.559206] udevd[126]: worker=
 [129] /bus/auxiliary is taking a long time
    2021-04-16 21:37:52.081000+00:00  <28>[   69.566419] udevd[126]: worker=
 [134] /bus/cpu is taking a long time
    2021-04-16 21:37:52.082000+00:00  <28>[   69.573075] udevd[126]: worker=
 [136] /bus/event_source is taking a long time
    2021-04-16 21:37:52.117000+00:00  /lava-15625/1/../bin/lava-test-case =

    ... (1 line(s) more)  =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a03d1206a6ca359dac73b
        new failure (last pass: next-20210415)

    2021-04-16 21:37:53.143000+00:00  <8>[   70.629160] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a03d1206a6ca359dac73c
        new failure (last pass: next-20210415)

    2021-04-16 21:37:54.163000+00:00  <8>[   71.648443] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a03d1206a6ca359dac73d
        new failure (last pass: next-20210415)

    2021-04-16 21:37:55.185000+00:00  <8>[   72.668291] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a03d1206a6ca359dac73e
        new failure (last pass: next-20210415)

    2021-04-16 21:37:56.202000+00:00  <8>[   73.688495] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a03d1206a6ca359dac73f
        new failure (last pass: next-20210415)

    2021-04-16 21:37:57.221000+00:00  <8>[   74.707383] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a03d1206a6ca359dac740
        new failure (last pass: next-20210415)

    2021-04-16 21:37:58.241000+00:00  <8>[   75.727424] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a03d1206a6ca359dac741
        new failure (last pass: next-20210415)

    2021-04-16 21:37:59.261000+00:00  <8>[   76.746543] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a03d1206a6ca359dac742
        new failure (last pass: next-20210415)

    2021-04-16 21:38:00.279000+00:00  <8>[   77.765613] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio2-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a03d1206a6ca359dac743
        new failure (last pass: next-20210415)

    2021-04-16 21:38:01.334000+00:00  <8>[   78.785151] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 21:38:01.334000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:38:01.334000+00:00  <8>[   78.801646] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-driver-present RESULT=3Dpass>
    2021-04-16 21:38:01.334000+00:00  /lava-15625/1/../bin/lava-test-case
    2021-04-16 21:38:01.334000+00:00  <8>[   78.820976] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-probed RESULT=3Dpass>
    2021-04-16 21:38:01.334000+00:00  /lava-15625/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a03d0206a6ca359dac6f7
        new failure (last pass: next-20210415)

    2021-04-16 21:38:02.385000+00:00  <8>[   79.870664] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a03d1206a6ca359dac746
        new failure (last pass: next-20210415)

    2021-04-16 21:38:03.404000+00:00  <8>[   80.889907] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a03d1206a6ca359dac747
        new failure (last pass: next-20210415)

    2021-04-16 21:38:04.423000+00:00  <8>[   81.908932] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a03d1206a6ca359dac748
        new failure (last pass: next-20210415)

    2021-04-16 21:38:05.442000+00:00  <8>[   82.927853] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a03d1206a6ca359dac749
        new failure (last pass: next-20210415)

    2021-04-16 21:38:06.469000+00:00  <8>[   83.947408] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>
    2021-04-16 21:38:06.469000+00:00  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-8    | defconfig=
                    | 39         =


  Details:     https://kernelci.org/test/plan/id/607a0921df18e1a66fdac6c4

  Results:     59 PASS, 41 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.pwm-fan-driver-present: https://kernelci.org/test/case/=
id/607a0922df18e1a66fdac6c8
        new failure (last pass: next-20210415)

    2021-04-16 22:00:12.528000+00:00  <8>[   42.197083] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpwm-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.pwm-fan-probed: https://kernelci.org/test/case/id/607a0=
922df18e1a66fdac6c9
        new failure (last pass: next-20210415)

    2021-04-16 22:00:13.542000+00:00  <8>[   43.215572] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpwm-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a0922df18e1a66fdac6ca
        new failure (last pass: next-20210415)

    2021-04-16 22:00:14.565000+00:00  <8>[   44.233435] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 22:00:15.584000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:15.586000+00:00  <8>[   45.253324] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:00:16.602000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:16.604000+00:00  <8>[   46.271403] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a0922df18e1a66fdac6cb
        new failure (last pass: next-20210415)

    2021-04-16 22:00:17.655000+00:00  <8>[   47.290758] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:00:17.656000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:17.656000+00:00  <8>[   47.308170] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 22:00:17.656000+00:00  /lava-15632/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/607a0922df18e1a66fdac6ca
        new failure (last pass: next-20210415)

    2021-04-16 22:00:14.565000+00:00  <8>[   44.233435] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>
    2021-04-16 22:00:15.584000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:15.586000+00:00  <8>[   45.253324] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:00:16.602000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:16.604000+00:00  <8>[   46.271403] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/607a0922df18e1a66fdac6cb
        new failure (last pass: next-20210415)

    2021-04-16 22:00:17.655000+00:00  <8>[   47.290758] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-16 22:00:17.656000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:17.656000+00:00  <8>[   47.308170] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-16 22:00:17.656000+00:00  /lava-15632/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac6ce
        new failure (last pass: next-20210415)

    2021-04-16 22:00:50.079000+00:00  <8>[   79.747818] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-probed: https://kernelci.org/test/case/id/607a0922=
df18e1a66fdac6cf
        new failure (last pass: next-20210415)

    2021-04-16 22:00:18.673000+00:00  /lava-15632/1/..<5>[   48.338002] ran=
dom: fast init done
    2021-04-16 22:00:18.674000+00:00  /bin/lava-test-case
    2021-04-16 22:00:18.675000+00:00  <8>[   48.346354] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>
    2021-04-16 22:00:19.690000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:19.691000+00:00  <8>[   49.364753] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-probed RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-driver-present: https://kernelci.org/test/case/i=
d/607a0922df18e1a66fdac6d0
        new failure (last pass: next-20210415)

    2021-04-16 22:00:20.714000+00:00  <8>[   50.382213] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-probed: https://kernelci.org/test/case/id/607a09=
22df18e1a66fdac6d1
        new failure (last pass: next-20210415)

    2021-04-16 22:00:21.728000+00:00  <8>[   51.401778] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dwm8904-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-driver-present: https://kernelci.org/test/case/=
id/607a0922df18e1a66fdac6d2
        new failure (last pass: next-20210415) =


  * baseline.bootrr.fsl-sai-sai5-probed: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac6d3
        new failure (last pass: next-20210415)

    2021-04-16 22:00:23.770000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:23.771000+00:00  <8>[   53.438925] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai5-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-sai6-probed: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac6d4
        new failure (last pass: next-20210415)

    2021-04-16 22:00:24.826000+00:00  <8>[   54.457594] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-sai6-probed RESULT=3Dfail>
    2021-04-16 22:00:24.826000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:24.826000+00:00  <8>[   54.474263] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-driver-present RESULT=3Dpass>
    2021-04-16 22:00:24.826000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:24.827000+00:00  <8>[   54.491905] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dfsl-sai-clk-sai4-probed RESULT=3Dpass>
    2021-04-16 22:00:24.827000+00:00  /lava-15632/1/../bin/lava-test-case   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac6fb
        new failure (last pass: next-20210415)

    2021-04-16 22:00:26.442000+00:00  <8>[   56.110655] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam-probed: https://kernelci.org/test/case/id/607a0922=
df18e1a66fdac6fc
        new failure (last pass: next-20210415)

    2021-04-16 22:00:27.455000+00:00  <8>[   57.129236] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/607a0922df18e1a66fdac6fd
        new failure (last pass: next-20210415) =


  * baseline.bootrr.caam_jr-jr0-probed: https://kernelci.org/test/case/id/6=
07a0922df18e1a66fdac6fe
        new failure (last pass: next-20210415)

    2021-04-16 22:00:29.491000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:29.492000+00:00  <8>[   59.165451] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr0-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
07a0922df18e1a66fdac6ff
        new failure (last pass: next-20210415)

    2021-04-16 22:00:30.512000+00:00  <8>[   60.185234] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
07a0922df18e1a66fdac700
        new failure (last pass: next-20210415)

    2021-04-16 22:00:31.530000+00:00  <8>[   61.203741] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
07a0922df18e1a66fdac701
        new failure (last pass: next-20210415)

    2021-04-16 22:00:32.586000+00:00  <8>[   62.222768] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2021-04-16 22:00:32.586000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:32.586000+00:00  <8>[   62.238868] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2021-04-16 22:00:32.587000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:32.587000+00:00  <8>[   62.254629] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsp805-wdt-watchdog0-probed RESULT=3Dpass>
    2021-04-16 22:00:32.587000+00:00  /lava-15632/1/../bin/lava-test-case   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/607a0922df18e1a66fdac705
        new failure (last pass: next-20210415)

    2021-04-16 22:00:33.621000+00:00  <8>[   63.288372] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/607a0922df18e1a66fdac706
        new failure (last pass: next-20210415)

    2021-04-16 22:00:34.671000+00:00  <8>[   64.307870] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2021-04-16 22:00:34.672000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:34.672000+00:00  <8>[   64.324119] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2021-04-16 22:00:34.672000+00:00  /lava-15632/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/607a0922df18e1a66fdac70f
        new failure (last pass: next-20210415)

    2021-04-16 22:00:37.788000+00:00  <8>[   67.456834] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac710
        new failure (last pass: next-20210415)

    2021-04-16 22:00:38.808000+00:00  <8>[   68.476203] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/607a0922df18e1a66fdac711
        new failure (last pass: next-20210415)

    2021-04-16 22:00:39.747000+00:00  <28>[   69.401532] udevd[127]: worker=
 [136] /bus/edac is taking a long time
    2021-04-16 22:00:39.747000+00:00  <28>[   69.408310] udevd[127]: worker=
 [142] /bus/hid is taking a long time
    2021-04-16 22:00:39.747000+00:00  <28>[   69.414986] udevd[127]: worker=
 [129] /bus/amba is taking a long time
    2021-04-16 22:00:39.748000+00:00  <28>[   69.421756] udevd[127]: worker=
 [138] /bus/fsl-mc is taking a long time
    2021-04-16 22:00:39.748000+00:00  <28>[   69.428701] udevd[127]: worker=
 [140] /bus/genpd is taking a long time
    2021-04-16 22:00:39.783000+00:00  <28>[   69.435558] udevd[127]: worker=
 [135] /bus/cpu is taking a long time
    2021-04-16 22:00:39.784000+00:00  <28>[   69.442232] udevd[127]: worker=
 [130] /bus/auxiliary is taking a long time
    2021-04-16 22:00:39.784000+00:00  <28>[   69.449439] udevd[127]: worker=
 [137] /bus/event_source is taking a long time
    2021-04-16 22:00:39.785000+00:00  <28>[   69.456876] udevd[127]: worker=
 [132] /bus/clocksource is taking a long time
    2021-04-16 22:00:39.826000+00:00  /lava-15632/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-fan-probed: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac712
        new failure (last pass: next-20210415)

    2021-04-16 22:00:40.845000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:40.846000+00:00  <8>[   70.514241] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/607a0922df18e1a66fdac713
        new failure (last pass: next-20210415)

    2021-04-16 22:00:41.865000+00:00  <8>[   71.532591] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm0-probed: https://kernelci.org/test/case/id=
/607a0922df18e1a66fdac714
        new failure (last pass: next-20210415)

    2021-04-16 22:00:42.885000+00:00  <8>[   72.553216] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm1-probed: https://kernelci.org/test/case/id=
/607a0922df18e1a66fdac715
        new failure (last pass: next-20210415)

    2021-04-16 22:00:43.903000+00:00  <8>[   73.571298] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/607a0922df18e1a66fdac716
        new failure (last pass: next-20210415)

    2021-04-16 22:00:44.921000+00:00  <8>[   74.589588] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio0-probed: https://kernelci.org/test/case/i=
d/607a0922df18e1a66fdac717
        new failure (last pass: next-20210415)

    2021-04-16 22:00:45.941000+00:00  <8>[   75.609392] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/607a0922df18e1a66fdac718
        new failure (last pass: next-20210415)

    2021-04-16 22:00:46.960000+00:00  <8>[   76.628594] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio2-probed: https://kernelci.org/test/case/i=
d/607a0922df18e1a66fdac719
        new failure (last pass: next-20210415)

    2021-04-16 22:00:47.979000+00:00  <8>[   77.646976] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio2-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio3-probed: https://kernelci.org/test/case/i=
d/607a0922df18e1a66fdac71a
        new failure (last pass: next-20210415)

    2021-04-16 22:00:49.029000+00:00  <8>[   78.666634] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-gpio3-probed RESULT=3Dfail>
    2021-04-16 22:00:49.030000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:49.030000+00:00  <8>[   78.683001] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-driver-present RESULT=3Dpass>
    2021-04-16 22:00:49.030000+00:00  /lava-15632/1/../bin/lava-test-case
    2021-04-16 22:00:49.030000+00:00  <8>[   78.699211] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dsl28cpld-intc-probed RESULT=3Dpass>
    2021-04-16 22:00:49.031000+00:00  /lava-15632/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac6ce
        new failure (last pass: next-20210415)

    2021-04-16 22:00:50.079000+00:00  <8>[   79.747818] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom0-probed: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac71d
        new failure (last pass: next-20210415)

    2021-04-16 22:00:51.099000+00:00  <8>[   80.766652] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dfail>   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
607a0922df18e1a66fdac71e
        new failure (last pass: next-20210415)

    2021-04-16 22:00:52.117000+00:00  <8>[   81.784970] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/607a0922df18e1a66fdac71f
        new failure (last pass: next-20210415)

    2021-04-16 22:00:53.135000+00:00  <8>[   82.802897] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-rtc-probed: https://kernelci.org/test/case/i=
d/607a0922df18e1a66fdac720
        new failure (last pass: next-20210415)

    2021-04-16 22:00:54.162000+00:00  <8>[   83.821777] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dfail>
    2021-04-16 22:00:54.162000+00:00  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a004f89bc6b9175dac6c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a004f89bc6b9175dac=
6c7
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/607a091adee9879e5fdac6b8

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/607a091adee9879e5fdac6cc
        failing since 10 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-16 22:00:51.368000+00:00  <8>[   55.794408] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
a091adee9879e5fdac6d2
        failing since 10 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-16 22:00:52.473000+00:00  /lava-3538838/1/../bin/lava-test-case=
   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6079fff7a310dbea39dac6dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6079fff7a310dbea39dac=
6dd
        failing since 149 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6079ff45a5c00a5fa5dac6cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6079ff45a5c00a5fa5dac=
6cc
        failing since 149 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6079ff08ca4f3e7a64dac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6079ff08ca4f3e7a64dac=
6d8
        failing since 149 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6079fe7a6f7909c594dac6d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6079fe7a6f7909c594dac=
6d2
        failing since 149 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03b9ee5d4ed15edac6ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03b9ee5d4ed15edac=
6cb
        failing since 149 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-baylibre    | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a055ef15c16748bdac6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a055ef15c16748bdac=
6d1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-broonie     | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0513d759b0dd94dac6eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0513d759b0dd94dac=
6ec
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-cip         | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a055af15c16748bdac6ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a055af15c16748bdac=
6cb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-collabora   | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04f536d961b99bdac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04f536d961b99bdac=
6bc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-linaro-lkft | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a063af0d0a6ebaddac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a063af0d0a6ebaddac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-baylibre    | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a055df15c16748bdac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a055df15c16748bdac=
6ce
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-broonie     | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a050fd759b0dd94dac6e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a050fd759b0dd94dac=
6e6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-cip         | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0540098421a7bfdac6e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0540098421a7bfdac=
6e7
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-collabora   | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04f6dce949f7b8dac6b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04f6dce949f7b8dac=
6b7
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-linaro-lkft | gcc-8    | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0628c46f337ea9dac6c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0628c46f337ea9dac=
6c9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0aafb7ec6c87acdac6c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0aafb7ec6c87acdac=
6c6
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0b187417e03577dac6ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0b187417e03577dac=
6ed
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0abd7fda3db2b5dac6d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0abd7fda3db2b5dac=
6d5
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a409d2d177e84dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a409d2d177e84dac=
6c3
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a4058959e258bdac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a4058959e258bdac=
6b8
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a070252e62b6894dac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a070252e62b6894dac=
6be
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a071cf2dbdfd842dac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a071cf2dbdfd842dac=
6d6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0725e745ebb472dac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0725e745ebb472dac=
6d6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a07063994789c60dac6d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a07063994789c60dac=
6d3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06f1de3419dbf3dac6db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06f1de3419dbf3dac=
6dc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a014d83047378dcdac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a014d83047378dcdac=
6c4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02782f4bd1df90dac6cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02782f4bd1df90dac=
6cd
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a01763976ed931edac6ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a01763976ed931edac=
6eb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02936c8f672b0ddac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02936c8f672b0ddac=
6d6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a016c3976ed931edac6e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a016c3976ed931edac=
6e3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0304e3362870cbdac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0304e3362870cbdac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a015b5726059042dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a015b5726059042dac=
6c3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a027840fa450ab5dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a027840fa450ab5dac=
6c3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04bede160e15b6dac6ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04bede160e15b6dac=
700
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0523f4893c5f57dac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0523f4893c5f57dac=
6c4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a9a087accb414dac6c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a9a087accb414dac=
6c5
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a74307a700213dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a74307a700213dac=
6b2
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0ae8ae4743ddcbdac6b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0ae8ae4743ddcbdac=
6b5
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a479d2d177e84dac6c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a479d2d177e84dac=
6c9
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a3ccedce25591dac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a3ccedce25591dac=
6bc
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a07163994789c60dac6e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a07163994789c60dac=
6e2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a07434036a22feddac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a07434036a22feddac=
6be
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0726e2bf4093f3dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0726e2bf4093f3dac=
6bb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06faf2dbdfd842dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06faf2dbdfd842dac=
6c1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06f2d160651a8ddac6dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06f2d160651a8ddac=
6de
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a016272d854bc65dac6b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a016272d854bc65dac=
6b5
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a028c40fa450ab5dac6cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a028c40fa450ab5dac=
6d0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a016272d854bc65dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a016272d854bc65dac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02a3dad8cbf7badac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02a3dad8cbf7badac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a015d83047378dcdac6ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a015d83047378dcdac=
6f0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02726c8f672b0ddac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02726c8f672b0ddac=
6bb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a01643976ed931edac6ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a01643976ed931edac=
6cf
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a027b20211945fbdac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a027b20211945fbdac=
6be
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04bd0e8b8d0b9ddac6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04bd0e8b8d0b9ddac=
6d1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04e54fbf64a26ddac6ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04e54fbf64a26ddac=
6eb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a5ecef7f1f989dac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a5ecef7f1f989dac=
6bc
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a60a09fa460b6dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a60a09fa460b6dac=
6bd
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a916c9a130aa8dac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a916c9a130aa8dac=
6b4
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a46b0ea213c59dac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a46b0ea213c59dac=
6d8
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a3a3fd6e7d22ddac6b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a3a3fd6e7d22ddac=
6b5
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06edf2dbdfd842dac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06edf2dbdfd842dac=
6b3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a071be745ebb472dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a071be745ebb472dac=
6c1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a07524036a22feddac6cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a07524036a22feddac=
6cc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a070cf2dbdfd842dac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a070cf2dbdfd842dac=
6ca
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06f0c03e2b1232dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06f0c03e2b1232dac=
6b8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a014c5f2739a674dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a014c5f2739a674dac=
6b8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02797f41e14fa9dac6ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02797f41e14fa9dac=
6cb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a016777437d3475dac71f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a016777437d3475dac=
720
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a028e6c8f672b0ddac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a028e6c8f672b0ddac=
6ce
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a01465f2739a674dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a01465f2739a674dac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02897f41e14fa9dac6cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02897f41e14fa9dac=
6d0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a015983047378dcdac6e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a015983047378dcdac=
6e9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a027020211945fbdac6b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a027020211945fbdac=
6b6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0497c137748daadac6d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0497c137748daadac=
6d5
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0524098421a7bfdac6d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0524098421a7bfdac=
6d2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a7299cb383f45dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a7299cb383f45dac=
6c3
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a64679d3014d0dac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a64679d3014d0dac=
6be
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a56cedce25591dac6ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a56cedce25591dac=
6cf
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a3db0ea213c59dac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a3db0ea213c59dac=
6c4
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a379d2d177e84dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a379d2d177e84dac=
6bd
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a070152e62b6894dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a070152e62b6894dac=
6bb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0717f2dbdfd842dac6cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0717f2dbdfd842dac=
6d0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a070e52e62b6894dac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a070e52e62b6894dac=
6c4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06fc52e62b6894dac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06fc52e62b6894dac=
6b3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06ee3994789c60dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06ee3994789c60dac=
6b8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a01603976ed931edac6b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a01603976ed931edac=
6b5
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a028e7f41e14fa9dac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a028e7f41e14fa9dac=
6d8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0166bf21220a53dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0166bf21220a53dac=
6b8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a02926c8f672b0ddac6d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a02926c8f672b0ddac=
6d3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0188bf21220a53dac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0188bf21220a53dac=
6d6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-cip         | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a029820211945fbdac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a029820211945fbdac=
6ce
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a016572d854bc65dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a016572d854bc65dac=
6c1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a027140fa450ab5dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a027140fa450ab5dac=
6bd
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0495c9e7af8397dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0495c9e7af8397dac=
6c0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a050dd759b0dd94dac6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a050dd759b0dd94dac=
6d1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04d24fbf64a26ddac6b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04d24fbf64a26ddac=
6b5
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09fa781223290ddac6be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09fa781223290ddac=
6bf
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04afde160e15b6dac6d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04afde160e15b6dac=
6d7
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09fc049083a9d2dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09fc049083a9d2dac=
6c1
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a050ad759b0dd94dac6c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a050ad759b0dd94dac=
6c5
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09f80f4e761189dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09f80f4e761189dac=
6c0
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04c0c4f2c31402dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04c0c4f2c31402dac=
6bb
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a099be64e0cb055dac6b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a099be64e0cb055dac=
6b6
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a06275571e2d1cbdac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a06275571e2d1cbdac=
6b4
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09869260ab2fa1dac6cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09869260ab2fa1dac=
6cd
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03bd121bb42978dac6b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03bd121bb42978dac=
6b9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a091fdee9879e5fdac6e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a091fdee9879e5fdac=
6e5
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a040b7e9467b071dac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a040b7e9467b071dac=
6d8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0960296939b2fedac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0960296939b2fedac=
6ce
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03b2e4dbef9379dac6c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03b2e4dbef9379dac=
6c6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a093ddee9879e5fdac705

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a093ddee9879e5fdac=
706
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03be121bb42978dac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03be121bb42978dac=
6bc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a090c11fd6aba42dac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a090c11fd6aba42dac=
6c4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a059d693558bb50dac6e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a059d693558bb50dac=
6e2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a090f1c8bb3f06edac6e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a090f1c8bb3f06edac=
6e5
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04d14fbf64a26ddac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04d14fbf64a26ddac=
6b2
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09d2e37abac026dac6be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09d2e37abac026dac=
6bf
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a048320f8f8e61adac6e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a048320f8f8e61adac=
6e4
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09d5b6f6bdef18dac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09d5b6f6bdef18dac=
6b3
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04cac4f2c31402dac6d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04cac4f2c31402dac=
6d3
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09b8263af07713dac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09b8263af07713dac=
6be
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04a7c9e7af8397dac6d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04a7c9e7af8397dac=
6d3
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a097677a97f8249dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a097677a97f8249dac=
6c3
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a062555f5967dc2dac710

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a062555f5967dc2dac=
711
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0984ca1bf0f0c6dac6cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0984ca1bf0f0c6dac=
6d0
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03bc206a6ca359dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03bc206a6ca359dac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a091edee9879e5fdac6d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a091edee9879e5fdac=
6d9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a041fb1c171a1f5dac6e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a041fb1c171a1f5dac=
6e2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a094830cc0aa5dfdac6ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a094830cc0aa5dfdac=
6cb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0955da933842a8dac71b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0955da933842a8dac=
71c
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03d10836fb21a7dac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03d10836fb21a7dac=
6c4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a091011fd6aba42dac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a091011fd6aba42dac=
6ca
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a059c693558bb50dac6db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a059c693558bb50dac=
6dc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a090ec985b3222ddac6e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a090ec985b3222ddac=
6e7
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0447bd73813d38dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0447bd73813d38dac=
6b2
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a22b0ea213c59dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a22b0ea213c59dac=
6b2
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a040fb1c171a1f5dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a040fb1c171a1f5dac=
6c3
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a00781223290ddac6c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a00781223290ddac=
6c5
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a048cc137748daadac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a048cc137748daadac=
6ce
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a0bf9415e3a72dac6cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a0bf9415e3a72dac=
6cc
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a045520f8f8e61adac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a045520f8f8e61adac=
6bb
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a099cfb03f689dbdac6b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a099cfb03f689dbdac=
6ba
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05d6eac4e87bbcdac6dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05d6eac4e87bbcdac=
6de
        new failure (last pass: next-20210409) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0987ca1bf0f0c6dac6e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0987ca1bf0f0c6dac=
6e1
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0444dcf8e6a861dac6d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0444dcf8e6a861dac=
6d4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0921dee9879e5fdac6f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0921dee9879e5fdac=
6f5
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a040c18e513f2e7dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a040c18e513f2e7dac=
6b8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a094c9f69017803dac6c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a094c9f69017803dac=
6c9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a043ea68c930f4cdac6c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a043ea68c930f4cdac=
6c6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a092d30cc0aa5dfdac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a092d30cc0aa5dfdac=
6b4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a042fb1c171a1f5dac6fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a042fb1c171a1f5dac=
6fd
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0907c985b3222ddac6e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0907c985b3222ddac=
6e1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05af26b4e5ab7bdac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05af26b4e5ab7bdac=
6bb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09121c8bb3f06edac6ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09121c8bb3f06edac=
6eb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0448dcf8e6a861dac6dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0448dcf8e6a861dac=
6dd
        new failure (last pass: next-20210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09d32c6187bb91dac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09d32c6187bb91dac=
6bc
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0473c9e7af8397dac6b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0473c9e7af8397dac=
6ba
        new failure (last pass: next-20210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09efdd89b96fd2dac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09efdd89b96fd2dac=
6b4
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a047fc137748daadac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a047fc137748daadac=
6ca
        new failure (last pass: next-20210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09f10f4e761189dac6b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09f10f4e761189dac=
6ba
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0456bd73813d38dac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0456bd73813d38dac=
6ce
        new failure (last pass: next-20210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09909fd6fba3c4dac725

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09909fd6fba3c4dac=
726
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05d8eac4e87bbcdac6e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05d8eac4e87bbcdac=
6e1
        new failure (last pass: next-20210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09859260ab2fa1dac6c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09859260ab2fa1dac=
6c8
        new failure (last pass: next-20210413) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0446a68c930f4cdac6d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0446a68c930f4cdac=
6d9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09205548bb8246dac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09205548bb8246dac=
6c2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0423b1c171a1f5dac6e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0423b1c171a1f5dac=
6e8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a09611aea2bc3dedac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a09611aea2bc3dedac=
6be
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a046920f8f8e61adac6d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a046920f8f8e61adac=
6d3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0916dee9879e5fdac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0916dee9879e5fdac=
6b3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0448bd73813d38dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0448bd73813d38dac=
6c0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0902c985b3222ddac6d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0902c985b3222ddac=
6d9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05c226b4e5ab7bdac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05c226b4e5ab7bdac=
6ca
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0911c985b3222ddac6eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0911c985b3222ddac=
6ec
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-baylibre    | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a08581db97c9141dac6ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a08581db97c9141dac=
6cf
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-broonie     | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0884642b809b11dac6fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0884642b809b11dac=
6fb
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-collabora   | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0847895f90cbf6dac6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0847895f90cbf6dac=
6d1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-linaro-lkft | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a086d7ff0e5afb0dac6d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a086d7ff0e5afb0dac=
6d4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-baylibre    | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05c2ccfc4193b1dac6c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05c2ccfc4193b1dac=
6c9
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-broonie     | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0563f15c16748bdac6df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0563f15c16748bdac=
6e0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-cip         | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05f402bb9668acdac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05f502bb9668acdac=
6d8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-collabora   | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0555477af4d6d0dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0555477af4d6d0dac=
6bd
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-linaro-lkft | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a065138ae2d15fddac6e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a065138ae2d15fddac=
6e2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-baylibre    | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03bb121bb42978dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03bb121bb42978dac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-broonie     | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03d30836fb21a7dac6c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03d30836fb21a7dac=
6c7
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-cip         | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03d81faf03e6b4dac6b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03d81faf03e6b4dac=
6b7
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-collabora   | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03b0cc755a1b70dac6db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03b0cc755a1b70dac=
6dc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-linaro-lkft | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a059ab93e76b7b5dac6d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a059ab93e76b7b5dac=
6d4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-baylibre    | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a08561db97c9141dac6c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a08561db97c9141dac=
6c6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-broonie     | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0880642b809b11dac6f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0880642b809b11dac=
6f6
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-cip         | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a08757ff0e5afb0dac6e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a08757ff0e5afb0dac=
6e3
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-collabora   | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a084f1db97c9141dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a084f1db97c9141dac=
6c0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-linaro-lkft | clang-10 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a086b0b3e6755afdac6cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a086b0b3e6755afdac=
6cc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-baylibre    | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05d5eac4e87bbcdac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05d5eac4e87bbcdac=
6d8
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-broonie     | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0573852d204dcedac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0573852d204dcedac=
6c2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-cip         | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a05fa02bb9668acdac6ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a05fa02bb9668acdac=
6f0
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-collabora   | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a054cf15c16748bdac6be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a054cf15c16748bdac=
6bf
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-linaro-lkft | clang-11 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a066211fa23a626dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/clang-11/lab-linaro-lkft/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a066211fa23a626dac=
6b2
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-baylibre    | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03b9e4dbef9379dac6ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03b9e4dbef9379dac=
6cf
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-broonie     | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03e3107dea9618dac6fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03e3107dea9618dac=
6fc
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-cip         | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03de107dea9618dac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03de107dea9618dac=
6c4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-collabora   | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a03c40836fb21a7dac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a03c40836fb21a7dac=
6b4
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-linaro-lkft | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0599b93e76b7b5dac6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/i386=
/i386_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0599b93e76b7b5dac=
6d1
        new failure (last pass: next-20210415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6079ffb716ff036a89dac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6079ffb716ff036a89dac=
6ce
        failing since 1 day (last pass: next-20210413, first fail: next-202=
10415) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora   | clang-10 | multi_v7_=
defconfig           | 29         =


  Details:     https://kernelci.org/test/plan/id/607a169bfae72907c4dac6b6

  Results:     40 PASS, 29 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/607a169bfae72907c4dac6be
        new failure (last pass: next-20210414)

    2021-04-16 22:58:02.355000+00:00  <8>[   39.472839] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-dev-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
07a169bfae72907c4dac6bf
        new failure (last pass: next-20210414)

    2021-04-16 22:58:03.370000+00:00  <8>[   40.491164] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-dev-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-driver-present: https://kernelci.org=
/test/case/id/607a169bfae72907c4dac6c0
        new failure (last pass: next-20210414)

    2021-04-16 22:58:04.391000+00:00  <8>[   41.508516] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-i2c-tunnel-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/607a169bfae72907c4dac6c1
        new failure (last pass: next-20210414)

    2021-04-16 22:58:05.411000+00:00  <8>[   42.527475] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-i2c-tunnel-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-driver-present: https://kernelci.org/test/=
case/id/607a169bfae72907c4dac6c2
        new failure (last pass: next-20210414)

    2021-04-16 22:58:06.429000+00:00  <8>[   43.545510] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
607a169bfae72907c4dac6c3
        new failure (last pass: next-20210414)

    2021-04-16 22:58:07.444000+00:00  <8>[   44.563757] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-present: https://kernelci.org/te=
st/case/id/607a169bfae72907c4dac6cd
        new failure (last pass: next-20210414)

    2021-04-16 22:58:08.609000+00:00  <8>[   45.725710] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-probed: https://kernelci.org/test/case/=
id/607a169bfae72907c4dac6ce
        new failure (last pass: next-20210414) =


  * baseline.bootrr.dwhdmi-rockchip-driver-audio-present: https://kernelci.=
org/test/case/id/607a169bfae72907c4dac6cf
        new failure (last pass: next-20210414)

    2021-04-16 22:58:10.639000+00:00  /lava-3538883/1/../bin/lava-test-case
    2021-04-16 22:58:10.645000+00:00  <8>[   47.762311] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-audio-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-cec-present: https://kernelci.or=
g/test/case/id/607a169bfae72907c4dac6d0
        new failure (last pass: next-20210414)

    2021-04-16 22:58:11.662000+00:00  <8>[   48.781474] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-cec-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-i2c-present: https://kernelci.or=
g/test/case/id/607a169bfae72907c4dac6d1
        new failure (last pass: next-20210414)

    2021-04-16 22:58:12.688000+00:00  <8>[   49.808164] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-i2c-present RESULT=3Dfail>   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/607a169bfae72907c4dac6d4
        new failure (last pass: next-20210414)

    2021-04-16 22:58:13.743000+00:00  <8>[   50.860841] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwmmc_rockchip-sdio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rk3288-crypto-driver-present: https://kernelci.org/test=
/case/id/607a169bfae72907c4dac6da
        new failure (last pass: next-20210414)

    2021-04-16 22:58:14.845000+00:00  <8>[   51.961954] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3288-crypto-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3288-crypto-probed: https://kernelci.org/test/case/id=
/607a169bfae72907c4dac6db
        new failure (last pass: next-20210414)

    2021-04-16 22:58:15.860000+00:00  <8>[   52.980457] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3288-crypto-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-driver-present: https://kernelci.org/test/c=
ase/id/607a169bfae72907c4dac6e5
        new failure (last pass: next-20210414)

    2021-04-16 22:58:17.034000+00:00  <8>[   54.151048] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-edp-probed: https://kernelci.org/test/case/=
id/607a169bfae72907c4dac6e6
        new failure (last pass: next-20210414) =


  * baseline.bootrr.rockchip-dp-phy-driver-present: https://kernelci.org/te=
st/case/id/607a169bfae72907c4dac6e7
        new failure (last pass: next-20210414)

    2021-04-16 22:58:19.066000+00:00  /lava-3538883/1/../bin/lava-test-case
    2021-04-16 22:58:19.067000+00:00  <8>[   56.187175] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-phy-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-phy-grf-probed: https://kernelci.org/test/c=
ase/id/607a169bfae72907c4dac6e8
        new failure (last pass: next-20210414)

    2021-04-16 22:58:20.089000+00:00  <8>[   57.205834] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-phy-grf-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockcip-i2s-driver-present: https://kernelci.org/test/c=
ase/id/607a169bfae72907c4dac6e9
        new failure (last pass: next-20210414)

    2021-04-16 22:58:21.107000+00:00  <8>[   58.223889] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockcip-i2s-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s-probed: https://kernelci.org/test/case/id/=
607a169bfae72907c4dac6ea
        new failure (last pass: next-20210414)

    2021-04-16 22:58:22.122000+00:00  <8>[   59.242418] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pwm-driver-present: https://kernelci.org/test/=
case/id/607a169bfae72907c4dac6ef
        new failure (last pass: next-20210414)

    2021-04-16 22:58:23.225000+00:00  <8>[   60.346589] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pwm0-probed: https://kernelci.org/test/case/id=
/607a169bfae72907c4dac6f0
        new failure (last pass: next-20210414)

    2021-04-16 22:58:24.264000+00:00  <8>[   61.386598] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pwm1-probed: https://kernelci.org/test/case/id=
/607a169bfae72907c4dac6f1
        new failure (last pass: next-20210414)

    2021-04-16 22:58:25.303000+00:00  <8>[   62.425047] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi-driver-present: https://kernelci.org/test/=
case/id/607a169bfae72907c4dac6f2
        new failure (last pass: next-20210414)

    2021-04-16 22:58:26.342000+00:00  <8>[   63.463450] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi0-probed: https://kernelci.org/test/case/id=
/607a169bfae72907c4dac6f3
        new failure (last pass: next-20210414)

    2021-04-16 22:58:27.380000+00:00  <8>[   64.502592] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi2-probed: https://kernelci.org/test/case/id=
/607a169bfae72907c4dac6f4
        new failure (last pass: next-20210414)

    2021-04-16 22:58:28.418000+00:00  <8>[   65.540732] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi2-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vop-driver-present: https://kernelci.org/test/=
case/id/607a169bfae72907c4dac6f9
        new failure (last pass: next-20210414)

    2021-04-16 22:58:29.544000+00:00  <8>[   66.666508] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vop-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vopb-probed: https://kernelci.org/test/case/id=
/607a169bfae72907c4dac6fa
        new failure (last pass: next-20210414)

    2021-04-16 22:58:30.576000+00:00  <8>[   67.698414] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vopb-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vopl-probed: https://kernelci.org/test/case/id=
/607a169bfae72907c4dac6fb
        new failure (last pass: next-20210414)

    2021-04-16 22:58:31.614000+00:00  <8>[   68.736686] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vopl-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 29         =


  Details:     https://kernelci.org/test/plan/id/607a016277437d3475dac6b2

  Results:     40 PASS, 29 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/607a016277437d3475dac6b6
        new failure (last pass: next-20210415)

    2021-04-16 21:27:29.348000+00:00  <8>[   41.609478] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-dev-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
07a016277437d3475dac6b7
        new failure (last pass: next-20210415)

    2021-04-16 21:27:30.388000+00:00  <8>[   42.649462] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-dev-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-driver-present: https://kernelci.org=
/test/case/id/607a016277437d3475dac6b8
        new failure (last pass: next-20210415)

    2021-04-16 21:27:31.428000+00:00  <8>[   43.689461] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-i2c-tunnel-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/607a016277437d3475dac6b9
        new failure (last pass: next-20210415)

    2021-04-16 21:27:32.477000+00:00  <8>[   44.738001] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-i2c-tunnel-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-driver-present: https://kernelci.org/test/=
case/id/607a016277437d3475dac6ba
        new failure (last pass: next-20210415)

    2021-04-16 21:27:33.509000+00:00  <8>[   45.769445] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
607a016277437d3475dac6bb
        new failure (last pass: next-20210415)

    2021-04-16 21:27:34.548000+00:00  <8>[   46.809504] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-present: https://kernelci.org/te=
st/case/id/607a016277437d3475dac6c5
        new failure (last pass: next-20210415)

    2021-04-16 21:27:35.869000+00:00  <8>[   48.129460] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-probed: https://kernelci.org/test/case/=
id/607a016277437d3475dac6c6
        new failure (last pass: next-20210415)

    2021-04-16 21:27:36.908000+00:00  <8>[   49.169469] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-audio-present: https://kernelci.=
org/test/case/id/607a016277437d3475dac6c7
        new failure (last pass: next-20210415)

    2021-04-16 21:27:37.949000+00:00  <8>[   50.209467] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-audio-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-cec-present: https://kernelci.or=
g/test/case/id/607a016277437d3475dac6c8
        new failure (last pass: next-20210415)

    2021-04-16 21:27:38.998000+00:00  <8>[   51.257971] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-cec-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-i2c-present: https://kernelci.or=
g/test/case/id/607a016277437d3475dac6c9
        new failure (last pass: next-20210415)

    2021-04-16 21:27:40.059000+00:00  <8>[   52.319431] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-i2c-present RESULT=3Dfail>   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/607a016277437d3475dac6cc
        new failure (last pass: next-20210415)

    2021-04-16 21:27:41.177000+00:00  <8>[   53.438009] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwmmc_rockchip-sdio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rk3288-crypto-driver-present: https://kernelci.org/test=
/case/id/607a016277437d3475dac6d2
        new failure (last pass: next-20210415)

    2021-04-16 21:27:42.379000+00:00  <8>[   54.639473] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3288-crypto-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3288-crypto-probed: https://kernelci.org/test/case/id=
/607a016277437d3475dac6d3
        new failure (last pass: next-20210415)

    2021-04-16 21:27:43.417000+00:00  <8>[   55.679456] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3288-crypto-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-driver-present: https://kernelci.org/test/c=
ase/id/607a016277437d3475dac6dd
        new failure (last pass: next-20210415)

    2021-04-16 21:27:44.789000+00:00  <8>[   57.049478] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-edp-probed: https://kernelci.org/test/case/=
id/607a016277437d3475dac6de
        new failure (last pass: next-20210415)

    2021-04-16 21:27:45.827000+00:00  <8>[   58.089494] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-edp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-phy-driver-present: https://kernelci.org/te=
st/case/id/607a016277437d3475dac6df
        new failure (last pass: next-20210415)

    2021-04-16 21:27:46.869000+00:00  <8>[   59.129464] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-phy-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-phy-grf-probed: https://kernelci.org/test/c=
ase/id/607a016277437d3475dac6e0
        new failure (last pass: next-20210415)

    2021-04-16 21:27:47.909000+00:00  <8>[   60.169432] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-phy-grf-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockcip-i2s-driver-present: https://kernelci.org/test/c=
ase/id/607a016277437d3475dac6e1
        new failure (last pass: next-20210415)

    2021-04-16 21:27:48.949000+00:00  <8>[   61.209457] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockcip-i2s-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s-probed: https://kernelci.org/test/case/id/=
607a016277437d3475dac6e2
        new failure (last pass: next-20210415)

    2021-04-16 21:27:49.984000+00:00     =


  * baseline.bootrr.rockchip-pwm-driver-present: https://kernelci.org/test/=
case/id/607a016377437d3475dac6e7
        new failure (last pass: next-20210415)

    2021-04-16 21:27:51.072000+00:00     =


  * baseline.bootrr.rockchip-pwm0-probed: https://kernelci.org/test/case/id=
/607a016377437d3475dac6e8
        new failure (last pass: next-20210415)

    2021-04-16 21:27:52.083000+00:00     =


  * baseline.bootrr.rockchip-pwm1-probed: https://kernelci.org/test/case/id=
/607a016377437d3475dac6e9
        new failure (last pass: next-20210415)

    2021-04-16 21:27:53.122000+00:00     =


  * baseline.bootrr.rockchip-spi-driver-present: https://kernelci.org/test/=
case/id/607a016377437d3475dac6ea
        new failure (last pass: next-20210415)

    2021-04-16 21:27:54.144000+00:00     =


  * baseline.bootrr.rockchip-spi0-probed: https://kernelci.org/test/case/id=
/607a016377437d3475dac6eb
        new failure (last pass: next-20210415)

    2021-04-16 21:27:55.156000+00:00     =


  * baseline.bootrr.rockchip-spi2-probed: https://kernelci.org/test/case/id=
/607a016377437d3475dac6ec
        new failure (last pass: next-20210415)

    2021-04-16 21:27:55.227000+00:00  <28>[   67.480464] udevd[86]: worker =
[94] /bus/cpu is taking a long time
    2021-04-16 21:27:55.227000+00:00  <28>[   67.487765] udevd[86]: worker =
[97] /bus/gpio is taking a long time
    2021-04-16 21:27:55.240000+00:00  <28>[   67.495070] udevd[86]: worker =
[89] /bus/bcma is taking a long time
    2021-04-16 21:27:55.241000+00:00  <28>[   67.502432] udevd[86]: worker =
[91] /bus/clockevents is taking a long time
    2021-04-16 21:27:55.251000+00:00  <28>[   67.510424] udevd[86]: worker =
[92] /bus/clocksource is taking a long time
    2021-04-16 21:27:55.265000+00:00  <28>[   67.518466] udevd[86]: worker =
[95] /bus/event_source is taking a long time
    2021-04-16 21:27:55.265000+00:00  <28>[   67.526554] udevd[86]: worker =
[96] /bus/genpd is taking a long time
    2021-04-16 21:27:55.277000+00:00  <28>[   67.534014] udevd[86]: worker =
[93] /bus/container is taking a long time
    2021-04-16 21:27:55.283000+00:00  <28>[   67.541814] udevd[86]: worker =
[90] /bus/cec is taking a long time
    2021-04-16 21:27:56.173000+00:00  /lava-3538560/1/../bin/lava-test-case=
<8>[   68.433244] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-spi2-probed=
 RESULT=3Dfail> =

    ... (1 line(s) more)  =


  * baseline.bootrr.rockchip-vop-driver-present: https://kernelci.org/test/=
case/id/607a016377437d3475dac6f1
        new failure (last pass: next-20210415)

    2021-04-16 21:27:57.260000+00:00     =


  * baseline.bootrr.rockchip-vopb-probed: https://kernelci.org/test/case/id=
/607a016377437d3475dac6f2
        new failure (last pass: next-20210415)

    2021-04-16 21:27:58.273000+00:00     =


  * baseline.bootrr.rockchip-vopl-probed: https://kernelci.org/test/case/id=
/607a016377437d3475dac6f3
        new failure (last pass: next-20210415)

    2021-04-16 21:27:59.289000+00:00     =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 29         =


  Details:     https://kernelci.org/test/plan/id/607a096e9fd6fba3c4dac6b8

  Results:     40 PASS, 29 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/607a096e9fd6fba3c4dac6bc
        new failure (last pass: next-20210415)

    2021-04-16 22:01:47.903000+00:00  <8>[   39.413535] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-dev-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
07a096e9fd6fba3c4dac6bd
        new failure (last pass: next-20210415)

    2021-04-16 22:01:48.920000+00:00  <8>[   40.431935] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-dev-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-driver-present: https://kernelci.org=
/test/case/id/607a096e9fd6fba3c4dac6be
        new failure (last pass: next-20210415)

    2021-04-16 22:01:49.942000+00:00  <8>[   41.449188] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-i2c-tunnel-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/607a096e9fd6fba3c4dac6bf
        new failure (last pass: next-20210415)

    2021-04-16 22:01:50.961000+00:00  <8>[   42.468105] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-i2c-tunnel-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-driver-present: https://kernelci.org/test/=
case/id/607a096e9fd6fba3c4dac6c0
        new failure (last pass: next-20210415)

    2021-04-16 22:01:51.979000+00:00  <8>[   43.486022] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
607a096e9fd6fba3c4dac6c1
        new failure (last pass: next-20210415)

    2021-04-16 22:01:52.993000+00:00  <8>[   44.504407] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-present: https://kernelci.org/te=
st/case/id/607a096e9fd6fba3c4dac6cb
        new failure (last pass: next-20210415)

    2021-04-16 22:01:54.158000+00:00  <8>[   45.665478] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-probed: https://kernelci.org/test/case/=
id/607a096e9fd6fba3c4dac6cc
        new failure (last pass: next-20210415) =


  * baseline.bootrr.dwhdmi-rockchip-driver-audio-present: https://kernelci.=
org/test/case/id/607a096e9fd6fba3c4dac6cd
        new failure (last pass: next-20210415)

    2021-04-16 22:01:56.189000+00:00  /lava-3538635/1/../bin/lava-test-case
    2021-04-16 22:01:56.195000+00:00  <8>[   47.701915] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-audio-present RESULT=3Dfail>   =


  * baseline.bootrr.dwhdmi-rockchip-driver-cec-present: https://kernelci.or=
g/test/case/id/607a096e9fd6fba3c4dac6ce
        new failure (last pass: next-20210415)

    2021-04-16 22:01:57.215000+00:00     =


  * baseline.bootrr.dwhdmi-rockchip-driver-i2c-present: https://kernelci.or=
g/test/case/id/607a096e9fd6fba3c4dac6cf
        new failure (last pass: next-20210415)

    2021-04-16 22:01:58.254000+00:00  =

    2021-04-16 22:01:58.255000+00:00  /lava-3538635/1/../bin/lava-test-case=
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/607a096e9fd6fba3c4dac6d2
        new failure (last pass: next-20210415)

    2021-04-16 22:01:59.305000+00:00  =

    2021-04-16 22:01:59.305000+00:00  /lava-3538635/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rk3288-crypto-driver-present: https://kernelci.org/test=
/case/id/607a096e9fd6fba3c4dac6d8
        new failure (last pass: next-20210415)

    2021-04-16 22:02:00.393000+00:00  <8>[   51.900306] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3288-crypto-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3288-crypto-probed: https://kernelci.org/test/case/id=
/607a096e9fd6fba3c4dac6d9
        new failure (last pass: next-20210415)

    2021-04-16 22:02:01.408000+00:00  <8>[   52.918707] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3288-crypto-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-driver-present: https://kernelci.org/test/c=
ase/id/607a096e9fd6fba3c4dac6e3
        new failure (last pass: next-20210415)

    2021-04-16 22:02:02.578000+00:00  <8>[   54.088513] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-edp-probed: https://kernelci.org/test/case/=
id/607a096e9fd6fba3c4dac6e4
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-dp-phy-driver-present: https://kernelci.org/te=
st/case/id/607a096e9fd6fba3c4dac6e5
        new failure (last pass: next-20210415)

    2021-04-16 22:02:04.617000+00:00  /lava-3538635/1/../bin/lava-test-case=
<8>[   56.124113] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-dp-phy-driv=
er-present RESULT=3Dfail>
    2021-04-16 22:02:04.617000+00:00     =


  * baseline.bootrr.rockchip-dp-phy-grf-probed: https://kernelci.org/test/c=
ase/id/607a096e9fd6fba3c4dac6e6
        new failure (last pass: next-20210415)

    2021-04-16 22:02:05.635000+00:00  <8>[   57.142791] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-phy-grf-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockcip-i2s-driver-present: https://kernelci.org/test/c=
ase/id/607a096e9fd6fba3c4dac6e7
        new failure (last pass: next-20210415)

    2021-04-16 22:02:06.653000+00:00  <8>[   58.160831] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockcip-i2s-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s-probed: https://kernelci.org/test/case/id/=
607a096e9fd6fba3c4dac6e8
        new failure (last pass: next-20210415)

    2021-04-16 22:02:07.667000+00:00  <8>[   59.179195] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pwm-driver-present: https://kernelci.org/test/=
case/id/607a096e9fd6fba3c4dac6ed
        new failure (last pass: next-20210415)

    2021-04-16 22:02:08.756000+00:00  <8>[   60.264581] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pwm0-probed: https://kernelci.org/test/case/id=
/607a096e9fd6fba3c4dac6ee
        new failure (last pass: next-20210415)

    2021-04-16 22:02:09.772000+00:00  <8>[   61.282968] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pwm0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pwm1-probed: https://kernelci.org/test/case/id=
/607a096e9fd6fba3c4dac6ef
        new failure (last pass: next-20210415)

    2021-04-16 22:02:10.805000+00:00  <8>[   62.318326] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pwm1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi-driver-present: https://kernelci.org/test/=
case/id/607a096e9fd6fba3c4dac6f0
        new failure (last pass: next-20210415)

    2021-04-16 22:02:11.846000+00:00  <8>[   63.357333] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi0-probed: https://kernelci.org/test/case/id=
/607a096e9fd6fba3c4dac6f1
        new failure (last pass: next-20210415)

    2021-04-16 22:02:12.884000+00:00  <8>[   64.396513] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi2-probed: https://kernelci.org/test/case/id=
/607a096e9fd6fba3c4dac6f2
        new failure (last pass: next-20210415)

    2021-04-16 22:02:13.922000+00:00  <8>[   65.435008] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi2-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vop-driver-present: https://kernelci.org/test/=
case/id/607a096e9fd6fba3c4dac6f7
        new failure (last pass: next-20210415)

    2021-04-16 22:02:15.037000+00:00  <8>[   66.548859] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vop-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vopb-probed: https://kernelci.org/test/case/id=
/607a096e9fd6fba3c4dac6f8
        new failure (last pass: next-20210415)

    2021-04-16 22:02:16.064000+00:00  <8>[   67.577889] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vopb-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vopl-probed: https://kernelci.org/test/case/id=
/607a096e9fd6fba3c4dac6f9
        new failure (last pass: next-20210415)

    2021-04-16 22:02:16.501000+00:00  <28>[   68.005405] udevd[113]: worker=
 [128] /bus/host1x is taking a long time
    2021-04-16 22:02:16.501000+00:00  <28>[   68.013365] udevd[113]: worker=
 [130] /bus/iio is taking a long time
    2021-04-16 22:02:16.514000+00:00  <28>[   68.021577] udevd[113]: worker=
 [126] /bus/gpio is taking a long time
    2021-04-16 22:02:16.526000+00:00  <28>[   68.029376] udevd[113]: worker=
 [117] /bus/cec is taking a long time
    2021-04-16 22:02:16.526000+00:00  <28>[   68.036819] udevd[113]: worker=
 [116] /bus/bcma is taking a long time
    2021-04-16 22:02:16.539000+00:00  <28>[   68.044315] udevd[113]: worker=
 [122] /bus/cpu is taking a long time
    2021-04-16 22:02:16.539000+00:00  <28>[   68.051738] udevd[113]: worker=
 [119] /bus/clocksource is taking a long time
    2021-04-16 22:02:16.551000+00:00  <28>[   68.059942] udevd[113]: worker=
 [115] /bus/amba is taking a long time
    2021-04-16 22:02:16.556000+00:00  <28>[   68.067450] udevd[113]: worker=
 [131] /bus/mdio_bus is taking a long time
    2021-04-16 22:02:17.076000+00:00  /lava-3538635/1/../bin/lava-test-case =

    ... (1 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 29         =


  Details:     https://kernelci.org/test/plan/id/607a14d1fc71f7680bdac6c2

  Results:     40 PASS, 29 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/607a14d1fc71f7680bdac6ca
        new failure (last pass: next-20210415)

    2021-04-16 22:50:22.170000+00:00  <8>[   39.429460] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-dev-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
07a14d1fc71f7680bdac6cb
        new failure (last pass: next-20210415)

    2021-04-16 22:50:23.184000+00:00     =


  * baseline.bootrr.cros-ec-i2c-tunnel-driver-present: https://kernelci.org=
/test/case/id/607a14d1fc71f7680bdac6cc
        new failure (last pass: next-20210415)

    2021-04-16 22:50:24.205000+00:00  <8>[   41.464384] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-i2c-tunnel-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/607a14d1fc71f7680bdac6cd
        new failure (last pass: next-20210415) =


  * baseline.bootrr.cros-ec-keyb-driver-present: https://kernelci.org/test/=
case/id/607a14d1fc71f7680bdac6ce
        new failure (last pass: next-20210415)

    2021-04-16 22:50:26.242000+00:00  /lava-3538791/1/../bin/lava-test-case=
<8>[   43.500897] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-driver-=
present RESULT=3Dfail>
    2021-04-16 22:50:26.243000+00:00     =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
607a14d1fc71f7680bdac6cf
        new failure (last pass: next-20210415)

    2021-04-16 22:50:27.255000+00:00     =


  * baseline.bootrr.dwhdmi-rockchip-driver-present: https://kernelci.org/te=
st/case/id/607a14d1fc71f7680bdac6d9
        new failure (last pass: next-20210415)

    2021-04-16 22:50:28.420000+00:00     =


  * baseline.bootrr.dwhdmi-rockchip-probed: https://kernelci.org/test/case/=
id/607a14d1fc71f7680bdac6da
        new failure (last pass: next-20210415) =


  * baseline.bootrr.dwhdmi-rockchip-driver-audio-present: https://kernelci.=
org/test/case/id/607a14d1fc71f7680bdac6db
        new failure (last pass: next-20210415)

    2021-04-16 22:50:30.455000+00:00  /lava-3538791/1/../bin/lava-test-case=
<8>[   47.714301] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwhdmi-rockchip-driv=
er-audio-present RESULT=3Dfail>
    2021-04-16 22:50:30.455000+00:00     =


  * baseline.bootrr.dwhdmi-rockchip-driver-cec-present: https://kernelci.or=
g/test/case/id/607a14d1fc71f7680bdac6dc
        new failure (last pass: next-20210415)

    2021-04-16 22:50:31.475000+00:00     =


  * baseline.bootrr.dwhdmi-rockchip-driver-i2c-present: https://kernelci.or=
g/test/case/id/607a14d1fc71f7680bdac6dd
        new failure (last pass: next-20210415)

    2021-04-16 22:50:32.510000+00:00  <8>[   49.759680] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-i2c-present RESULT=3Dfail>   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/607a14d1fc71f7680bdac6e0
        new failure (last pass: next-20210415)

    2021-04-16 22:50:33.563000+00:00  <8>[   50.811778] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwmmc_rockchip-sdio0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rk3288-crypto-driver-present: https://kernelci.org/test=
/case/id/607a14d1fc71f7680bdac6e6
        new failure (last pass: next-20210415)

    2021-04-16 22:50:34.652000+00:00     =


  * baseline.bootrr.rk3288-crypto-probed: https://kernelci.org/test/case/id=
/607a14d1fc71f7680bdac6e7
        new failure (last pass: next-20210415)

    2021-04-16 22:50:35.666000+00:00     =


  * baseline.bootrr.rockchip-dp-driver-present: https://kernelci.org/test/c=
ase/id/607a14d1fc71f7680bdac6f1
        new failure (last pass: next-20210415)

    2021-04-16 22:50:36.838000+00:00     =


  * baseline.bootrr.rockchip-dp-edp-probed: https://kernelci.org/test/case/=
id/607a14d1fc71f7680bdac6f2
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-dp-phy-driver-present: https://kernelci.org/te=
st/case/id/607a14d1fc71f7680bdac6f3
        new failure (last pass: next-20210415)

    2021-04-16 22:50:38.873000+00:00  /lava-3538791/1/../bin/lava-test-case=
<8>[   56.133157] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-dp-phy-driv=
er-present RESULT=3Dfail>
    2021-04-16 22:50:38.874000+00:00     =


  * baseline.bootrr.rockchip-dp-phy-grf-probed: https://kernelci.org/test/c=
ase/id/607a14d1fc71f7680bdac6f4
        new failure (last pass: next-20210415)

    2021-04-16 22:50:39.893000+00:00     =


  * baseline.bootrr.rockcip-i2s-driver-present: https://kernelci.org/test/c=
ase/id/607a14d1fc71f7680bdac6f5
        new failure (last pass: next-20210415)

    2021-04-16 22:50:40.905000+00:00  <8>[   58.169593] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockcip-i2s-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s-probed: https://kernelci.org/test/case/id/=
607a14d1fc71f7680bdac6f6
        new failure (last pass: next-20210415)

    2021-04-16 22:50:41.924000+00:00     =


  * baseline.bootrr.rockchip-pwm-driver-present: https://kernelci.org/test/=
case/id/607a14d1fc71f7680bdac6fb
        new failure (last pass: next-20210415)

    2021-04-16 22:50:43.012000+00:00     =


  * baseline.bootrr.rockchip-pwm0-probed: https://kernelci.org/test/case/id=
/607a14d1fc71f7680bdac6fc
        new failure (last pass: next-20210415)

    2021-04-16 22:50:44.027000+00:00     =


  * baseline.bootrr.rockchip-pwm1-probed: https://kernelci.org/test/case/id=
/607a14d1fc71f7680bdac6fd
        new failure (last pass: next-20210415)

    2021-04-16 22:50:45.044000+00:00     =


  * baseline.bootrr.rockchip-spi-driver-present: https://kernelci.org/test/=
case/id/607a14d1fc71f7680bdac6fe
        new failure (last pass: next-20210415)

    2021-04-16 22:50:46.080000+00:00  <8>[   63.344000] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi0-probed: https://kernelci.org/test/case/id=
/607a14d1fc71f7680bdac6ff
        new failure (last pass: next-20210415)

    2021-04-16 22:50:47.118000+00:00  <8>[   64.383571] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-spi2-probed: https://kernelci.org/test/case/id=
/607a14d1fc71f7680bdac700
        new failure (last pass: next-20210415)

    2021-04-16 22:50:48.156000+00:00  <8>[   65.421440] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-spi2-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vop-driver-present: https://kernelci.org/test/=
case/id/607a14d1fc71f7680bdac705
        new failure (last pass: next-20210415)

    2021-04-16 22:50:49.279000+00:00  <8>[   66.544482] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vop-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vopb-probed: https://kernelci.org/test/case/id=
/607a14d1fc71f7680bdac706
        new failure (last pass: next-20210415)

    2021-04-16 22:50:50.310000+00:00  <8>[   67.575739] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vopb-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vopl-probed: https://kernelci.org/test/case/id=
/607a14d1fc71f7680bdac707
        new failure (last pass: next-20210415)

    2021-04-16 22:50:51.352000+00:00  <8>[   68.618308] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vopl-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 30         =


  Details:     https://kernelci.org/test/plan/id/607a05a13de467f98ddac6ba

  Results:     60 PASS, 30 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-pwm-driver-present: https://kernelci.org/test/c=
ase/id/607a05a13de467f98ddac6c9
        new failure (last pass: next-20210412)

    2021-04-16 21:45:33.110000+00:00  /lava-3538692/1/../bin/lava-test-case
    2021-04-16 21:45:33.120000+00:00  <8>[   48.917738] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-pwm-probed: https://kernelci.org/test/case/id/6=
07a05a13de467f98ddac6ca
        new failure (last pass: next-20210412)

    2021-04-16 21:45:34.143000+00:00  <8>[   49.941175] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-pwm-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/607a05a13de467f98ddac6cd
        new failure (last pass: next-20210412) =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/607a05a13de467f98ddac6ce
        new failure (last pass: next-20210412)

    2021-04-16 21:45:36.230000+00:00  /lava-3538692/1/../bin/lava-test-case=
   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/607a05a13de467f98ddac6cf
        new failure (last pass: next-20210412)

    2021-04-16 21:45:37.254000+00:00  /lava-3538692/1/../bin/lava-test-case
    2021-04-16 21:45:37.264000+00:00  <8>[   53.061614] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/607a05a13de467f98ddac6d0
        new failure (last pass: next-20210412)

    2021-04-16 21:45:38.288000+00:00  <8>[   54.085131] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-driver-present: https://kernelci.org/t=
est/case/id/607a05a13de467f98ddac6d8
        new failure (last pass: next-20210412)

    2021-04-16 21:45:39.438000+00:00  /lava-3538692/1/../bin/lava-test-case=
   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/607a05a13de467f98ddac6d9
        new failure (last pass: next-20210412)

    2021-04-16 21:45:40.461000+00:00  /lava-3538692/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rk3399-gru-sound-driver-present: https://kernelci.org/t=
est/case/id/607a05a13de467f98ddac6da
        new failure (last pass: next-20210412)

    2021-04-16 21:45:41.483000+00:00  /lava-3538692/1/../bin/lava-test-case
    2021-04-16 21:45:41.494000+00:00  <8>[   57.291748] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-da7219-present: https://kernelc=
i.org/test/case/id/607a05a13de467f98ddac6db
        new failure (last pass: next-20210412)

    2021-04-16 21:45:42.518000+00:00  <8>[   58.315180] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-da7219-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-dp-present: https://kernelci.or=
g/test/case/id/607a05a13de467f98ddac6dc
        new failure (last pass: next-20210412)

    2021-04-16 21:45:43.542000+00:00  <8>[   59.339135] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-dp-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-max98357A-present: https://kern=
elci.org/test/case/id/607a05a13de467f98ddac6dd
        new failure (last pass: next-20210412)

    2021-04-16 21:45:44.566000+00:00  <8>[   60.362492] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-max98357A-present RESULT=3Dfail> =
  =


  * baseline.bootrr.rk3399-gru-sound-driver-rt5514-present: https://kernelc=
i.org/test/case/id/607a05a13de467f98ddac6de
        new failure (last pass: next-20210412)

    2021-04-16 21:45:45.590000+00:00  <8>[   61.386843] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-rt5514-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-driver-present: https://kernelci.org/test/c=
ase/id/607a05a13de467f98ddac6ea
        new failure (last pass: next-20210412) =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
07a05a13de467f98ddac6eb
        new failure (last pass: next-20210412)

    2021-04-16 21:45:47.835000+00:00  /lava-3538692/1/../bin/lava-test-case
    2021-04-16 21:45:47.845000+00:00  <8>[   63.643732] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-drm-driver-present: https://kernelci.org/test/=
case/id/607a05a13de467f98ddac6ec
        new failure (last pass: next-20210412) =


  * baseline.bootrr.rockchip-i2s-driver-present: https://kernelci.org/test/=
case/id/607a05a13de467f98ddac6f1
        new failure (last pass: next-20210412)

    2021-04-16 21:45:49.964000+00:00  <5>[   65.763553] random: crng init d=
one
    2021-04-16 21:45:49.973000+00:00  <8>[   65.768277] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s0-probed: https://kernelci.org/test/case/id=
/607a05a13de467f98ddac6f2
        new failure (last pass: next-20210412)

    2021-04-16 21:45:50.996000+00:00  <8>[   66.794555] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/607a05a13de467f98ddac6f3
        new failure (last pass: next-20210412)

    2021-04-16 21:45:52.018000+00:00  <8>[   67.816810] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-driver-present: https://kernelci.org/test=
/case/id/607a05a13de467f98ddac6f7
        new failure (last pass: next-20210412)

    2021-04-16 21:45:53.101000+00:00  <8>[   68.899134] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/607a05a13de467f98ddac6f8
        new failure (last pass: next-20210412)

    2021-04-16 21:45:54.124000+00:00  <8>[   69.922388] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-phy-driver-present: https://kernelci.org/=
test/case/id/607a05a13de467f98ddac6f9
        new failure (last pass: next-20210412)

    2021-04-16 21:45:55.147000+00:00  <8>[   70.944848] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-phy-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-phy-probed: https://kernelci.org/test/cas=
e/id/607a05a13de467f98ddac6fa
        new failure (last pass: next-20210412)

    2021-04-16 21:45:56.170000+00:00  <8>[   71.968505] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-phy-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-saradc-driver-present: https://kernelci.org/te=
st/case/id/607a05a13de467f98ddac702
        new failure (last pass: next-20210412)

    2021-04-16 21:45:57.321000+00:00  /lava-3538692/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-saradc-probed: https://kernelci.org/test/case/=
id/607a05a13de467f98ddac703
        new failure (last pass: next-20210412)

    2021-04-16 21:45:58.344000+00:00  /lava-3538692/1/../bin/lava-test-case
    2021-04-16 21:45:58.354000+00:00  <8>[   74.152272] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-saradc-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-thermal-driver-present: https://kernelci.org/t=
est/case/id/607a05a13de467f98ddac708
        new failure (last pass: next-20210412) =


  * baseline.bootrr.rockchip-thermal-probed: https://kernelci.org/test/case=
/id/607a05a13de467f98ddac709
        new failure (last pass: next-20210412)

    2021-04-16 21:46:00.454000+00:00  <28>[   76.254148] udevd[170]: worker=
 [183] /bus/gpio is taking a long time
    2021-04-16 21:46:00.461000+00:00  <28>[   76.261739] udevd[170]: worker=
 [184] /bus/hid is taking a long time
    2021-04-16 21:46:00.469000+00:00  <28>[   76.269156] udevd[170]: worker=
 [175] /bus/clocksource is taking a long time
    2021-04-16 21:46:00.481000+00:00  /lava-3538692/1/../bin/lava-test-case=
<28>[   76.277351] udevd[170]: worker [189] /bus/mmc is taking a long time
    2021-04-16 21:46:00.482000+00:00  =

    2021-04-16 21:46:00.490000+00:00  <28>[   76.288348] udevd[170]: worker=
 [174] /bus/clockevents is taking a long time   =


  * baseline.bootrr.rockchip-vop-driver-present: https://kernelci.org/test/=
case/id/607a05a13de467f98ddac710
        new failure (last pass: next-20210412)

    2021-04-16 21:46:01.673000+00:00  <8>[   77.471368] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vop-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vop0-probed: https://kernelci.org/test/case/id=
/607a05a13de467f98ddac711
        new failure (last pass: next-20210412)

    2021-04-16 21:46:02.696000+00:00  <8>[   78.494606] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vop0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vop1-probed: https://kernelci.org/test/case/id=
/607a05a13de467f98ddac712
        new failure (last pass: next-20210412) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 30         =


  Details:     https://kernelci.org/test/plan/id/607a03ce121bb42978dac6ce

  Results:     60 PASS, 30 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-pwm-driver-present: https://kernelci.org/test/c=
ase/id/607a03ce121bb42978dac6dd
        new failure (last pass: next-20210415)

    2021-04-16 21:37:48.094000+00:00  <8>[   49.053636] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-pwm-probed: https://kernelci.org/test/case/id/6=
07a03ce121bb42978dac6de
        new failure (last pass: next-20210415) =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/607a03ce121bb42978dac6e1
        new failure (last pass: next-20210415) =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/607a03ce121bb42978dac6e2
        new failure (last pass: next-20210415)

    2021-04-16 21:37:51.227000+00:00  /lava-3538673/1/../bin/lava-test-case=
   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/607a03ce121bb42978dac6e3
        new failure (last pass: next-20210415)

    2021-04-16 21:37:52.255000+00:00  /lava-3538673/1/../bin/lava-test-case
    2021-04-16 21:37:52.266000+00:00  <8>[   53.225174] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/607a03ce121bb42978dac6e4
        new failure (last pass: next-20210415)

    2021-04-16 21:37:53.293000+00:00  <8>[   54.252249] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-driver-present: https://kernelci.org/t=
est/case/id/607a03ce121bb42978dac6ec
        new failure (last pass: next-20210415)

    2021-04-16 21:37:54.477000+00:00  <8>[   55.435527] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dhdmi-audio-codec-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/607a03ce121bb42978dac6ed
        new failure (last pass: next-20210415)

    2021-04-16 21:37:55.503000+00:00  <8>[   56.462415] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dhdmi-audio-codec-probed RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-present: https://kernelci.org/t=
est/case/id/607a03ce121bb42978dac6ee
        new failure (last pass: next-20210415)

    2021-04-16 21:37:56.530000+00:00  <8>[   57.488351] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-da7219-present: https://kernelc=
i.org/test/case/id/607a03ce121bb42978dac6ef
        new failure (last pass: next-20210415)

    2021-04-16 21:37:57.557000+00:00  <8>[   58.515287] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-da7219-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-dp-present: https://kernelci.or=
g/test/case/id/607a03ce121bb42978dac6f0
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rk3399-gru-sound-driver-max98357A-present: https://kern=
elci.org/test/case/id/607a03ce121bb42978dac6f1
        new failure (last pass: next-20210415)

    2021-04-16 21:37:59.600000+00:00  /lava-3538673/1/../bin/lava-test-case
    2021-04-16 21:37:59.612000+00:00  <8>[   60.570656] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-max98357A-present RESULT=3Dfail> =
  =


  * baseline.bootrr.rk3399-gru-sound-driver-rt5514-present: https://kernelc=
i.org/test/case/id/607a03ce121bb42978dac6f2
        new failure (last pass: next-20210415)

    2021-04-16 21:38:00.627000+00:00  /lava-3538673/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-dp-driver-present: https://kernelci.org/test/c=
ase/id/607a03ce121bb42978dac6fe
        new failure (last pass: next-20210415)

    2021-04-16 21:38:01.895000+00:00  /lava-3538673/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
07a03ce121bb42978dac6ff
        new failure (last pass: next-20210415)

    2021-04-16 21:38:02.922000+00:00  /lava-3538673/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-drm-driver-present: https://kernelci.org/test/=
case/id/607a03ce121bb42978dac700
        new failure (last pass: next-20210415)

    2021-04-16 21:38:03.948000+00:00  /lava-3538673/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-i2s-driver-present: https://kernelci.org/test/=
case/id/607a03ce121bb42978dac705
        new failure (last pass: next-20210415)

    2021-04-16 21:38:05.076000+00:00  <8>[   66.035749] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s0-probed: https://kernelci.org/test/case/id=
/607a03ce121bb42978dac706
        new failure (last pass: next-20210415)

    2021-04-16 21:38:06.103000+00:00  <8>[   67.062635] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/607a03ce121bb42978dac707
        new failure (last pass: next-20210415)

    2021-04-16 21:38:07.129000+00:00  <8>[   68.088803] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-driver-present: https://kernelci.org/test=
/case/id/607a03ce121bb42978dac70b
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/607a03ce121bb42978dac70c
        new failure (last pass: next-20210415)

    2021-04-16 21:38:09.238000+00:00  /lava-3538673/1/../bin/lava-test-case
    2021-04-16 21:38:09.249000+00:00  <8>[   70.209751] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-phy-driver-present: https://kernelci.org/=
test/case/id/607a03ce121bb42978dac70d
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-pcie-phy-probed: https://kernelci.org/test/cas=
e/id/607a03ce121bb42978dac70e
        new failure (last pass: next-20210415)

    2021-04-16 21:38:11.292000+00:00  /lava-3538673/1/../bin/lava-test-case
    2021-04-16 21:38:11.304000+00:00  <8>[   72.263418] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-phy-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-saradc-driver-present: https://kernelci.org/te=
st/case/id/607a03ce121bb42978dac716
        new failure (last pass: next-20210415)

    2021-04-16 21:38:12.476000+00:00  /lava-3538673/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-saradc-probed: https://kernelci.org/test/case/=
id/607a03ce121bb42978dac717
        new failure (last pass: next-20210415)

    2021-04-16 21:38:13.503000+00:00  /lava-3538673/1/../bin/lava-test-case
    2021-04-16 21:38:13.514000+00:00  <8>[   74.474361] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-saradc-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-thermal-driver-present: https://kernelci.org/t=
est/case/id/607a03ce121bb42978dac71c
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-thermal-probed: https://kernelci.org/test/case=
/id/607a03ce121bb42978dac71d
        new failure (last pass: next-20210415)

    2021-04-16 21:38:15.376000+00:00  <28>[   76.336780] udevd[170]: worker=
 [174] /bus/clockevents is taking a long time
    2021-04-16 21:38:15.384000+00:00  <28>[   76.345096] udevd[170]: worker=
 [184] /bus/hid is taking a long time
    2021-04-16 21:38:15.391000+00:00  <28>[   76.352516] udevd[170]: worker=
 [191] /bus/node is taking a long time
    2021-04-16 21:38:15.399000+00:00  <28>[   76.360028] udevd[170]: worker=
 [176] /bus/container is taking a long time
    2021-04-16 21:38:15.407000+00:00  <28>[   76.368024] udevd[170]: worker=
 [181] /bus/fsl-mc is taking a long time
    2021-04-16 21:38:15.414000+00:00  <28>[   76.375725] udevd[170]: worker=
 [189] /bus/mmc is taking a long time
    2021-04-16 21:38:15.422000+00:00  <28>[   76.383138] udevd[170]: worker=
 [180] /bus/event_source is taking a long time
    2021-04-16 21:38:15.430000+00:00  <28>[   76.391423] udevd[170]: worker=
 [179] /bus/edac is taking a long time
    2021-04-16 21:38:15.438000+00:00  <28>[   76.398932] udevd[170]: worker=
 [187] /bus/mdio_bus is taking a long time
    2021-04-16 21:38:15.445000+00:00  <28>[   76.406831] udevd[170]: worker=
 [185] /bus/i2c is taking a long time =

    ... (1 line(s) more)  =


  * baseline.bootrr.rockchip-vop-driver-present: https://kernelci.org/test/=
case/id/607a03ce121bb42978dac724
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-vop0-probed: https://kernelci.org/test/case/id=
/607a03ce121bb42978dac725
        new failure (last pass: next-20210415)

    2021-04-16 21:38:17.836000+00:00  /lava-3538673/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-vop1-probed: https://kernelci.org/test/case/id=
/607a03ce121bb42978dac726
        new failure (last pass: next-20210415)

    2021-04-16 21:38:18.862000+00:00  /lava-3538673/1/../bin/lava-test-case
    2021-04-16 21:38:18.873000+00:00  <8>[   79.833230] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vop1-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 30         =


  Details:     https://kernelci.org/test/plan/id/607a0937df18e1a66fdac732

  Results:     60 PASS, 30 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-pwm-driver-present: https://kernelci.org/test/c=
ase/id/607a0937df18e1a66fdac741
        new failure (last pass: next-20210415)

    2021-04-16 22:00:51.771000+00:00  <8>[   48.921158] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-pwm-probed: https://kernelci.org/test/case/id/6=
07a0937df18e1a66fdac742
        new failure (last pass: next-20210415)

    2021-04-16 22:00:52.794000+00:00  <8>[   49.944768] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-pwm-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/607a0937df18e1a66fdac745
        new failure (last pass: next-20210415)

    2021-04-16 22:00:53.857000+00:00  <8>[   51.007482] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/607a0937df18e1a66fdac746
        new failure (last pass: next-20210415) =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/607a0937df18e1a66fdac747
        new failure (last pass: next-20210415)

    2021-04-16 22:00:55.908000+00:00  /lava-3538809/1/../bin/lava-test-case=
   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/607a0937df18e1a66fdac748
        new failure (last pass: next-20210415)

    2021-04-16 22:00:56.932000+00:00  /lava-3538809/1/../bin/lava-test-case
    2021-04-16 22:00:56.942000+00:00  <8>[   54.092449] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-driver-present: https://kernelci.org/t=
est/case/id/607a0937df18e1a66fdac750
        new failure (last pass: next-20210415)

    2021-04-16 22:00:58.107000+00:00  <8>[   55.256777] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dhdmi-audio-codec-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/607a0937df18e1a66fdac751
        new failure (last pass: next-20210415)

    2021-04-16 22:00:59.130000+00:00  <8>[   56.280784] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dhdmi-audio-codec-probed RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-present: https://kernelci.org/t=
est/case/id/607a0937df18e1a66fdac752
        new failure (last pass: next-20210415)

    2021-04-16 22:01:00.154000+00:00  <8>[   57.303746] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-da7219-present: https://kernelc=
i.org/test/case/id/607a0937df18e1a66fdac753
        new failure (last pass: next-20210415)

    2021-04-16 22:01:01.179000+00:00  <8>[   58.327578] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-da7219-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-dp-present: https://kernelci.or=
g/test/case/id/607a0937df18e1a66fdac754
        new failure (last pass: next-20210415)

    2021-04-16 22:01:02.192000+00:00  /lava-3538809/1/../bin/lava-test-case
    2021-04-16 22:01:02.203000+00:00  <8>[   59.352237] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-dp-present RESULT=3Dfail>   =


  * baseline.bootrr.rk3399-gru-sound-driver-max98357A-present: https://kern=
elci.org/test/case/id/607a0937df18e1a66fdac755
        new failure (last pass: next-20210415)

    2021-04-16 22:01:03.228000+00:00  <8>[   60.376496] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-max98357A-present RESULT=3Dfail> =
  =


  * baseline.bootrr.rk3399-gru-sound-driver-rt5514-present: https://kernelc=
i.org/test/case/id/607a0937df18e1a66fdac756
        new failure (last pass: next-20210415)

    2021-04-16 22:01:04.252000+00:00  <8>[   61.401178] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drk3399-gru-sound-driver-rt5514-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-driver-present: https://kernelci.org/test/c=
ase/id/607a0937df18e1a66fdac762
        new failure (last pass: next-20210415)

    2021-04-16 22:01:05.490000+00:00  <8>[   62.640062] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
07a0937df18e1a66fdac763
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-drm-driver-present: https://kernelci.org/test/=
case/id/607a0937df18e1a66fdac764
        new failure (last pass: next-20210415)

    2021-04-16 22:01:07.525000+00:00  /lava-3538809/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-i2s-driver-present: https://kernelci.org/test/=
case/id/607a0937df18e1a66fdac769
        new failure (last pass: next-20210415)

    2021-04-16 22:01:08.630000+00:00  /lava-3538809/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-i2s0-probed: https://kernelci.org/test/case/id=
/607a0937df18e1a66fdac76a
        new failure (last pass: next-20210415)

    2021-04-16 22:01:09.654000+00:00  /lava-3538809/1/../bin/lava-test-case
    2021-04-16 22:01:09.663000+00:00  <8>[   66.814630] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/607a0937df18e1a66fdac76b
        new failure (last pass: next-20210415)

    2021-04-16 22:01:10.686000+00:00  <8>[   67.837838] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-driver-present: https://kernelci.org/test=
/case/id/607a0937df18e1a66fdac76f
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/607a0937df18e1a66fdac770
        new failure (last pass: next-20210415)

    2021-04-16 22:01:12.786000+00:00  /lava-3538809/1/../bin/lava-test-case
    2021-04-16 22:01:12.795000+00:00  <8>[   69.945795] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-phy-driver-present: https://kernelci.org/=
test/case/id/607a0937df18e1a66fdac771
        new failure (last pass: next-20210415)

    2021-04-16 22:01:13.819000+00:00  <8>[   70.968613] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-phy-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-phy-probed: https://kernelci.org/test/cas=
e/id/607a0937df18e1a66fdac772
        new failure (last pass: next-20210415)

    2021-04-16 22:01:14.842000+00:00  <8>[   71.992762] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-phy-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-saradc-driver-present: https://kernelci.org/te=
st/case/id/607a0937df18e1a66fdac77a
        new failure (last pass: next-20210415)

    2021-04-16 22:01:16.008000+00:00  <8>[   73.157620] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-saradc-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-saradc-probed: https://kernelci.org/test/case/=
id/607a0937df18e1a66fdac77b
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-thermal-driver-present: https://kernelci.org/t=
est/case/id/607a0937df18e1a66fdac780
        new failure (last pass: next-20210415)

    2021-04-16 22:01:18.123000+00:00  /lava-3538809/1/../bin/lava-test-case
    2021-04-16 22:01:18.133000+00:00  <8>[   75.283713] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-thermal-probed: https://kernelci.org/test/case=
/id/607a0937df18e1a66fdac781
        new failure (last pass: next-20210415)

    2021-04-16 22:01:19.110000+00:00  <28>[   76.262574] udevd[171]: worker=
 [185] /bus/hid is taking a long time
    2021-04-16 22:01:19.118000+00:00  <28>[   76.269993] udevd[171]: worker=
 [177] /bus/container is taking a long time
    2021-04-16 22:01:19.126000+00:00  <28>[   76.277991] udevd[171]: worker=
 [187] /bus/iio is taking a long time
    2021-04-16 22:01:19.134000+00:00  <28>[   76.285408] udevd[171]: worker=
 [183] /bus/genpd is taking a long time
    2021-04-16 22:01:19.141000+00:00  <28>[   76.293013] udevd[171]: worker=
 [175] /bus/clockevents is taking a long time
    2021-04-16 22:01:19.149000+00:00  <28>[   76.301206] udevd[171]: worker=
 [173] /bus/amba is taking a long time
    2021-04-16 22:01:19.160000+00:00  /lava-3538809/1/../bin/lava-test-case=
<28>[   76.308722] udevd[171]: worker [179] /bus/edac is taking a long time
    2021-04-16 22:01:19.160000+00:00  =

    2021-04-16 22:01:19.168000+00:00  <28>[   76.319830] udevd[171]: worker=
 [174] /bus/auxiliary is taking a long time
    2021-04-16 22:01:19.177000+00:00  <8>[   76.324739] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-thermal-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vop-driver-present: https://kernelci.org/test/=
case/id/607a0937df18e1a66fdac788
        new failure (last pass: next-20210415)

    2021-04-16 22:01:20.334000+00:00  <8>[   77.484167] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-vop-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-vop0-probed: https://kernelci.org/test/case/id=
/607a0937df18e1a66fdac789
        new failure (last pass: next-20210415) =


  * baseline.bootrr.rockchip-vop1-probed: https://kernelci.org/test/case/id=
/607a0937df18e1a66fdac78a
        new failure (last pass: next-20210415)

    2021-04-16 22:01:22.370000+00:00  /lava-3538809/1/../bin/lava-test-case=
   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
stm32mp157c-lxa-mc1        | arm   | lab-pengutronix | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0b1b0d797989aadac6e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-stm32mp157c-lxa-mc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-stm32mp157c-lxa-mc1.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0b1b0d797989aadac=
6e9
        new failure (last pass: next-20210414) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a0a7ee78f9c0a78dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210405104510+1fdec=
59bffc1-1~exp1~20210405085125.161)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a0a7ee78f9c0a78dac=
6c1
        failing since 65 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607a04a1c137748daadac6da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210416/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607a04a1c137748daadac=
6db
        failing since 65 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
