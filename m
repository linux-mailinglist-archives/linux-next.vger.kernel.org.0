Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48F1418F699
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 15:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgCWOMy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 10:12:54 -0400
Received: from mail-pj1-f41.google.com ([209.85.216.41]:39045 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728378AbgCWOMy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2020 10:12:54 -0400
Received: by mail-pj1-f41.google.com with SMTP id ck23so6139835pjb.4
        for <linux-next@vger.kernel.org>; Mon, 23 Mar 2020 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=l0LCaYw/ab9BoMQ3c+KRsBOBhS0ePv1YruGQLiOxPuM=;
        b=Dw+UKEXSEEfhPQpfz30Jn84K7VsRTKvvn7KL60YiUjMO447ZdOliQHywEi2y6udw0n
         K564EpUNfHoN4+rlkwpC92OyFMuW/kCiHJwZBjalCOZrPxIiX93BsOR5yes79OV29V4g
         YINySB5WQmbRbxKXVZi/eOvIGhQVO7D9FC+inQ96nfvE92qqImO8KJjKl4BvKLzE3gmG
         V1zkisrXSC5bakBt84hC7BIco5mwJLGtphtqhJtanx2STJi7G6ImCDedesPHBHn20yue
         MVkX3f/jNO12N5u+0+zFauHEFy9LpKnZbN/nW0jD8XsrqSXG3TskvwntAeXg47MpZCYb
         EHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=l0LCaYw/ab9BoMQ3c+KRsBOBhS0ePv1YruGQLiOxPuM=;
        b=E2T/M2tk/b+JQxxv1MSPMlDBsWdmopHN5hQ2WjvNa6ZHFwvtmplz2/gTL6y/jnwn++
         ydYsrYhTA6FcziaCjTMQlYm4RZj07EeL7Ozzc6gFE9YpUi6c5apYp0L/X2cIesrcIkOd
         EkJuBjH6Gb3RDLewq0HRViHQAi2TN/OmseRDVohKakDz1nYRF//PaSvFDzeoEA22Y7JX
         RQ+GmQmSCzOGTYQPPVMWz4QhX9KvAD5rMRezO+kRFHeb3Afq8fMcoR6SVCiSl/lFeVVq
         tXNJk17fqmIkEzGFa30Bxnilpc3qFu+mO+vGbFGOeJS2P0Rt51xDJi6UdcKnR5QnklOJ
         uSgw==
X-Gm-Message-State: ANhLgQ1q4E7HLtpRlFwVdcTjli9/knL1ruCSj9QjNjV/iwFAg1n8C5rs
        sgyxGdeaZpMpAl2RELpGAV/0sXEkqmI=
X-Google-Smtp-Source: ADFU+vtr7PHq0OQ1IkC9oNsS5y5XgGSfMbKJY4l46iQ7YCeJvoZa+7h3oq0UsrhQcLTw6h2ixhw8Dg==
X-Received: by 2002:a17:902:562:: with SMTP id 89mr22544121plf.58.1584972772858;
        Mon, 23 Mar 2020 07:12:52 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9sm12552960pgs.89.2020.03.23.07.12.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 07:12:52 -0700 (PDT)
Message-ID: <5e78c3e4.1c69fb81.7bca3.e7d1@mx.google.com>
Date:   Mon, 23 Mar 2020 07:12:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200323
X-Kernelci-Report-Type: boot
Subject: next/master boot: 275 boots: 5 failed, 258 passed with 5 offline,
 7 untried/unknown (next-20200323)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 275 boots: 5 failed, 258 passed with 5 offline, 7 untried=
/unknown (next-20200323)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200323/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200323/

Tree: next
Branch: master
Git Describe: next-20200323
Git Commit: 5149100c3aebe5e640d6ff68e0b5e5a7eb8638e0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 103 unique boards, 23 SoC families, 29 builds out of 329

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 2 days (last pass: next-20200319=
 - first fail: next-20200320)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 34 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20200320)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200320)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200320)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200320)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200320)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200320)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200320)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6q-wandboard: 1 offline lab

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
