Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB326156E65
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 05:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBJEKF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 23:10:05 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35147 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJEKE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Feb 2020 23:10:04 -0500
Received: by mail-wr1-f65.google.com with SMTP id w12so5770401wrt.2
        for <linux-next@vger.kernel.org>; Sun, 09 Feb 2020 20:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X3mduaPIXQK5yI03oexN1PMz0/vtIyhXpRYgByLWEso=;
        b=FBq1rTcP1Lx296RGVz+A3CSlELu6cNRcsC9ZfAS3f6tOqS8b1+j4d39DkxaIt90xWQ
         rqsmEf0nS2VbZNt7iayvjs6HJob6p7tJkhhyi+CP0IR7nE3VBY8WR+sClkQiO+Mvju5P
         6CyVg/E4tzCGE5UGZnG7sXCchdCZIw/lzG8aLDqZ2Gr2TykOzv/J0t3pYbQs0+rG5PKD
         VEPduH2e0L25CXROYAovEDPSFoDIsjkvYWgjwMOo4QdXkfxsYeDjmOpJjYdAvUqLgdhk
         4oZpSlYmfHgGkDbwtPCVXeMUEBENIQu6vqmBX+XZ9sHaXtqb4QqbC2eEtKsioZrZBp2G
         OekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X3mduaPIXQK5yI03oexN1PMz0/vtIyhXpRYgByLWEso=;
        b=ABuWTgtgVA37XSGcC9Ms5tlaEkM3bc7pgiGAeNjgqPxxab9HEXdhLLIEY6a4M5On/H
         GsWM7irm4hsjcBFjvL1OuNJgEtEp0e74hfubWWrRhu0S953u5FIpGb9l+Qbe0ZugPKwo
         EXLbdX3893RAbeNsKZlY6tgyxD6/eHj9MYTCyRVJYg4WQXCEAaRFH/rQzQK0zuspA7C0
         xmQkcRrzqR3jdzxVCoAAHPv+LmdNpiGAcMhU5cVg4oJzi//m7+M7/3gLzQNWLlv9T4ec
         Nh5bjZTLnUdLJcBCytwu+0x9vSmdOgFtLIYDOQ7Bs8/HA19akf3dUcAgPCnOqs8JsL5b
         j0Mw==
X-Gm-Message-State: APjAAAW1hv8Oq0j9neWWbEfPkIKn3cuQRyA3H3uTdJXMSXXg8BUKfCXu
        xmWSpHGb8TMJlT4w3mnFL3atCUnmA+4=
X-Google-Smtp-Source: APXvYqz1J9oJg8+l26g0tfzbzOI+uGPqsxX7ks+VR7B7751iCEWkSnrCg/wUzA6l++O3mBRWyriZow==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr15181987wrm.219.1581307801328;
        Sun, 09 Feb 2020 20:10:01 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 16sm13492731wmi.0.2020.02.09.20.10.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 20:10:00 -0800 (PST)
Message-ID: <5e40d798.1c69fb81.bc00f.9e1d@mx.google.com>
Date:   Sun, 09 Feb 2020 20:10:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.5-11478-g1433b2950fa9
Subject: next/pending-fixes boot: 185 boots: 8 failed,
 169 passed with 5 offline, 3 untried/unknown (v5.5-11478-g1433b2950fa9)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 185 boots: 8 failed, 169 passed with 5 offline, 3 =
untried/unknown (v5.5-11478-g1433b2950fa9)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-11478-g1433b2950fa9/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-11478-g1433b2950fa9/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-11478-g1433b2950fa9
Git Commit: 1433b2950fa9438a808313dba3f97668786e45ce
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 22 SoC families, 24 builds out of 168

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: v5.5-9913-g2eb0c73548f1)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.5-9913-g2eb0c73548f1)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: failing since 3 days (last pass: v5.5-9=
475-g7c2eb3712de1 - first fail: v5.5-9913-g2eb0c73548f1)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 3 days (last pass: v5.5-9475-g7c2eb3=
712de1 - first fail: v5.5-9670-g2c46fb8a6882)
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.5-9913-g2eb0c73548f1)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9913-g2eb0=
c73548f1)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9913-g2eb0=
c73548f1)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-9913-g2eb0c73548f1)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.5-9913-g2eb0c73548f1)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-9913-g2eb0=
c73548f1)
          meson-gxm-q200:
              lab-baylibre: failing since 3 days (last pass: v5.5-9670-g2c4=
6fb8a6882 - first fail: v5.5-9913-g2eb0c73548f1)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.5-9913-g2eb0c73548f1)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

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
