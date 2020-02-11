Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF6B15924E
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 15:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbgBKOwv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 09:52:51 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:45327 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729812AbgBKOwv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2020 09:52:51 -0500
Received: by mail-wr1-f47.google.com with SMTP id g3so11639370wrs.12
        for <linux-next@vger.kernel.org>; Tue, 11 Feb 2020 06:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VShlKIPNQZhXneqahYf2xyuBydWukGoERnbAUPfUILs=;
        b=VXWyewaae8pd3ByWJYmrEtzb4xg7clVRIBQ7ZaSvqtCbeb/kWR7vUGSe1ZcS5ggt8G
         rsy/XTVI4fejJTxdkX3mi41er9/+8DHP+jLb1yRyPAAYvQL4v5DM7sHI4ncetxJNQoMS
         v/Y6SVWMVPHn6l1boKMvXikooPgtugFnnThSC1BOC0ssFAoMnxEatc/rbQNq0raGf8Vd
         yw1oEml81qGmxmDK7AsKVAnHK0zk1aAlmsgkptCfD12kBJzBRu5u+2L6I5loCI4frg/d
         4ydttPnwyes0jvfW0zIB25g0Zwaf/D0UtXg/yMRvh3+r3BQ1FXSO7JvaC3jw5hMZ7pr4
         LLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VShlKIPNQZhXneqahYf2xyuBydWukGoERnbAUPfUILs=;
        b=NOcc4tLrwRbT4bnv5z/6E2cbSPk38e5eW379Upu90GnluobMBXaZIjkSmOrXxwXwB5
         /kO5y/b7MWsFNhSNuAqzsCe2JBi/DoKwK1mu0IHU43vE8mgo7zFLmGSQvv3ub9WEFA65
         vsq2NybNMBoXAqowOSgXPfquSKSlkhEW3y0ce//4fdbqndCm6UbIi0rvjCAZd6hlGIv0
         J5n3KJ2UqyrcAwuupqlcp6dw2roBTaGsBycou43ShwR7/g9GC50mROWaexDGzfJNTvWB
         GOOdJcw3lIXX/LveCndukHhjJ4SP1F0cvReTuLczgNOjyjlarHP8BIxMtfHIgSUFQ4Vn
         //uQ==
X-Gm-Message-State: APjAAAVwy43ubQ0a86SmZBaK0k5S+WqkE+3IjTEExyAwq/Tx4hcaGCTt
        zVWhYPFt9uGoC62BiDtX2gurPwBQOzj7gQ==
X-Google-Smtp-Source: APXvYqz1TvYCBOkXNF86mVYqNG+y/rmuuRc6DscsleMfpHgZtZk5kr32GBYpRk0qVik+ppEUoD6u2A==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr8666126wro.209.1581432769004;
        Tue, 11 Feb 2020 06:52:49 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 25sm3922497wmi.32.2020.02.11.06.52.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 06:52:48 -0800 (PST)
Message-ID: <5e42bfc0.1c69fb81.f1942.22af@mx.google.com>
Date:   Tue, 11 Feb 2020 06:52:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc1-120-ge3ed5d1c150d
Subject: next/pending-fixes boot: 146 boots: 8 failed,
 132 passed with 6 offline (v5.6-rc1-120-ge3ed5d1c150d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 146 boots: 8 failed, 132 passed with 6 offline (v5=
.6-rc1-120-ge3ed5d1c150d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc1-120-ge3ed5d1c150d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc1-120-ge3ed5d1c150d/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc1-120-ge3ed5d1c150d
Git Commit: e3ed5d1c150dcb4f5d2f1d7ba4f1d4c0accc0076
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 23 SoC families, 23 builds out of 180

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: failing since 4 days (last pass: v5.5-9=
475-g7c2eb3712de1 - first fail: v5.5-9913-g2eb0c73548f1)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 5 days (last pass: v5.5-9475-g7c2eb3=
712de1 - first fail: v5.5-9670-g2c46fb8a6882)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-11478-g143=
3b2950fa9)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-11478-g143=
3b2950fa9)
          meson-g12a-u200:
              lab-baylibre: new failure (last pass: v5.5-11478-g1433b2950fa=
9)
          meson-gxm-q200:
              lab-baylibre: failing since 4 days (last pass: v5.5-9670-g2c4=
6fb8a6882 - first fail: v5.5-9913-g2eb0c73548f1)
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 1 day (last pass: v5.5-9913-g2eb0=
c73548f1 - first fail: v5.5-11478-g1433b2950fa9)

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
            sun4i-a10-cubieboard: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-gxm-q200: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
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

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
