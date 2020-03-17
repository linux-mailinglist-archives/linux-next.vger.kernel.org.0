Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 308EE187DCE
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 11:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgCQKHN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 06:07:13 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:45887 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgCQKHN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2020 06:07:13 -0400
Received: by mail-pg1-f181.google.com with SMTP id m15so11446217pgv.12
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2020 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lOrAvwtcWEP8Ylyf66qEQNn0HJFUQSVCZaSpJyTrLqQ=;
        b=zcGRbXdm9aJ5IbBzvCp92oMVNK2PkvNNJ12PV1SgVBqX2gu4shkFbO+zNjQFucwuTN
         Yc+ykk386hQNHPvYOGBLe7YR9RxO9PW9OZ7h63fK3PeCjcyZm4+nbDsHoJ7pLF+Z3mgD
         EVXItC4jyx50nhe8/rhdSaiBrcG+OC6wnBQhNC0uty0JITF0f6qEcPK4NAwIKJht8oVo
         FWFG8hN2Ui0vdKsYOrgZ2IBUgCR5CxjOh9r9FLFwrs0oawEo0BQfhsl2kt8xGnn81303
         ZKn7CY/sAG1LgPk6jPijRrh7T7JslcU2GtDYAywSQFoBEc6BYnj3F411tJLw5je1ONk5
         hAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lOrAvwtcWEP8Ylyf66qEQNn0HJFUQSVCZaSpJyTrLqQ=;
        b=m7FOKDzQnx6U3v3Mu/VaZuskgRX76AdDEFxNbCPGXnD0DgilobBFjdVN1r1LF0on/u
         pXOHZXFLAWKrHG9xxrBLhn9mTliePdypaTvTir2AduCqIjWqkBlqhw40QrnOnxU6ru6Q
         B3OAty5qBB1Knamuuy7KIFQ4BvJ57NPccq8YFgvqi9PDvKIUXfzgv4jrylIz7n33mGWb
         NmjoHY2xHhZLIlj58TMsSQ67B7GFObN7hyvwV0RrmZQgDRhw97Jzdpu7oTJd7yS/xP99
         xWhIqqFY7SQOWp/jEx/iXQahmjm4ByhrEikXnmSpvvOU7dC2a+74mficnMnRH6vTO9PZ
         ZoJQ==
X-Gm-Message-State: ANhLgQ1Gi5HhLYKuixHzO2Dyjt+llYXTLMep4xay3uMdNdtK/ke6DCLs
        heCcvAM9riYAWoA7nYH7jsoeaRQ3tzk=
X-Google-Smtp-Source: ADFU+vtp5fO6Hpl30orbZGgbVU5CP3H/54bTEzSvDqbxPvVm9qNx6HxSWXWAYlkzwNWiGjDCEmaWIw==
X-Received: by 2002:a63:e511:: with SMTP id r17mr4283870pgh.352.1584439629856;
        Tue, 17 Mar 2020 03:07:09 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q20sm2558713pfh.89.2020.03.17.03.07.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 03:07:09 -0700 (PDT)
Message-ID: <5e70a14d.1c69fb81.c3868.a02c@mx.google.com>
Date:   Tue, 17 Mar 2020 03:07:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc6-178-g95cd16255210
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 277 boots: 5 failed,
 255 passed with 9 offline, 8 untried/unknown (v5.6-rc6-178-g95cd16255210)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 277 boots: 5 failed, 255 passed with 9 offline, 8 =
untried/unknown (v5.6-rc6-178-g95cd16255210)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc6-178-g95cd16255210/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc6-178-g95cd16255210/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc6-178-g95cd16255210
Git Commit: 95cd1625521058ba7fe28b48c107a9a4f56a71e7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 104 unique boards, 22 SoC families, 30 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 31 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc5-468-g47d215bb=
9783)

    vexpress_defconfig:
        gcc-8:
          vexpress-v2p-ca15-tc1:
              lab-baylibre: failing since 1 day (last pass: v5.6-rc5-338-gb=
1d59e1cc3e8 - first fail: v5.6-rc5-468-g47d215bb9783)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-468-g4=
7d215bb9783)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-468-g4=
7d215bb9783)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-rc5-468-g47d215bb9=
783)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-468-g4=
7d215bb9783)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-rc5-468-g47d215bb9=
783)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.6-rc5-468-g47d215bb9=
783)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc5-468-g47d215bb9=
783)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm4708-smartrg-sr400ac: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
