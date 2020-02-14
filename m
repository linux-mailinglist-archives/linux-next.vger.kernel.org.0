Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B24CB15D7EC
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2020 14:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgBNNFw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Feb 2020 08:05:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39150 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgBNNFv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Feb 2020 08:05:51 -0500
Received: by mail-wm1-f66.google.com with SMTP id c84so10551619wme.4
        for <linux-next@vger.kernel.org>; Fri, 14 Feb 2020 05:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NWalH1NliVJUAspDpT9Vuf+4Z5rNjgPsP6lF6wxY+2Q=;
        b=NhEi8wf2qVOoTLU5XfrrSLKz4ByA90Tx9cBeKAuGRmC8D72Fda9qj23L4mvQcYNeQb
         thOlEJVHsKzInDoXMmOudnV3rt8m52JV9LpfKQx0yQDFua/7nURlTu8MlqzrXhoNFUuP
         IWb4ZsXA1BV6F042pY5gM4d4mws6pjGSnotZNiQQ0Ve7WFGtVQh49Tc4c2UuDuFh474O
         NSvgSWMotZMVQ+RQCthNX4hu1CRq9u0vtFb3rRwMk2Fq+v5rZnwmCiJBkesF9ZQV0SXa
         s7E1lXdHBBZtbhtAoUND1S3YVskvaxHVB9K5PPaymj9X6deBjWR4HmFcR195P8Es/ib4
         7afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NWalH1NliVJUAspDpT9Vuf+4Z5rNjgPsP6lF6wxY+2Q=;
        b=EeS1FLD7BM94Lq/T99SZGuoyV/8QIKIM6iCQ6IKbIgICNgMvVmdCAtg6m7TAy1t7i/
         2SC0/RLo7SaGy9sCznexpH6V8kUe8aqOweN867BWOc82rnvUvPGBvwmR8H5QyjhJrCDT
         SJqJ0sBBBqiYah1oO3UC37AHoShImquwa3DShBZhUYEqjG466ydIV8lO6cmBTBOCCQAY
         SbOX9Hr4ZCi1zFTV90kYfPY9Liym96ZjD2KAEweXdLmv6qNizIYLCMokYUn7b7bBmtoZ
         bKMMNeXmXsm5lN8kVEdUUr7zvDtEZF1pC5O0SY7rIzhOMbBbZ0WheRr4T4Ek/XbAyNoe
         mNXw==
X-Gm-Message-State: APjAAAX5abGvduJkKfe566MYd8lEEefq3xygFjM6rovw12HdoBkoioq8
        0OyqBwCqalBCYszVURP8o4rf5EMLky28LQ==
X-Google-Smtp-Source: APXvYqwgmwHCAC8euVuIwE7j2XPUXEogkoHXYZ9UMu0HqaxoSD1uRLG9+WNi9YHemvC0Ll0TAcyyew==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr4760653wmc.4.1581685548456;
        Fri, 14 Feb 2020 05:05:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c9sm6903834wrq.44.2020.02.14.05.05.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 05:05:48 -0800 (PST)
Message-ID: <5e469b2c.1c69fb81.285a6.dc03@mx.google.com>
Date:   Fri, 14 Feb 2020 05:05:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc1-311-ge58961fba99f
Subject: next/pending-fixes boot: 161 boots: 7 failed,
 146 passed with 7 offline, 1 untried/unknown (v5.6-rc1-311-ge58961fba99f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 161 boots: 7 failed, 146 passed with 7 offline, 1 =
untried/unknown (v5.6-rc1-311-ge58961fba99f)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc1-311-ge58961fba99f/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc1-311-ge58961fba99f/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc1-311-ge58961fba99f
Git Commit: e58961fba99f440dd0c6488db0a81b016f5677f4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 98 unique boards, 23 SoC families, 25 builds out of 154

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: v5.5-8839-g56c8845edd3=
9)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.5-9913-g2eb0c73548f1)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-279-g2=
e409d6664fd)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 8 days (last pass: v5.5-9475-g7c2eb3=
712de1 - first fail: v5.5-9670-g2c46fb8a6882)
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.6-rc1-279-g2e409d6664fd)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-279-g2=
e409d6664fd)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc1-279-g2e409d666=
4fd)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-279-g2=
e409d6664fd)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-154-g2=
c2a150a97e7)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
