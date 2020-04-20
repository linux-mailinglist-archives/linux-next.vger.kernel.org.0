Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B2D1B07E0
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 13:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgDTLnH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 07:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726699AbgDTLnF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 07:43:05 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2178BC061A0C
        for <linux-next@vger.kernel.org>; Mon, 20 Apr 2020 04:43:05 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t9so2340969pjw.0
        for <linux-next@vger.kernel.org>; Mon, 20 Apr 2020 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7lG0+5q7fSl5YyvtrrGGn2eYRZnu+k/6mS62+fSOkUQ=;
        b=S4VQpXmzzIEGEGDwmKCodz2uO/XQwlV4tFVI6FSJzaVlKAL6U1+QuhkuVTsvj0dxDU
         BBExbuQuDDeskJwJZ9Z17zIxh6NRFzpIQ5/V6KjRaJfUTp0GeEzMM/c+3yAceRbPbfZy
         LY59VQ7jfhqW4JkudFe8DarXxOm/wiUmfR3/cZAFbdSZtejn1HXqg6j1Lycgio3r7tfa
         n5zwrwuZ/zEl8cWrDarXlEwWfKwpaOzLffk3GFYw0HDlE1MwVfalIuJpdr5AHdhgiaIb
         h221xkvcMuL0znqkih9n5Zswwv1D43ev/hO3icdIeQRlUPyCAMwZD4rbSaQCX56NoKpc
         /7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7lG0+5q7fSl5YyvtrrGGn2eYRZnu+k/6mS62+fSOkUQ=;
        b=PynwYWEOw2Nfvu/7q0QVu/fLj5skievjjGs/YIvsw3GVEsaBYOHF4JjsuFgXYmBSqg
         CTA9D4d+Z26tNAzMtoDUt7kPcgCrniiOYYdfci5UBEJj3Nao08hWpmGgIa+ru/+k80JJ
         JFhcU6Hfo3zOV+k66hROOtbQRFazbPa4hBcWDyudkh2fEVcDTpHMGo7/+hO1VV7tTtbt
         n3WAYChZxG7+kvVGAO8voqeTTXIL3vnsWrXwpWErQdLmp4BFYN4SXtjtaFVdFR7rgE+j
         bzlLSkcwCk1gs7jcRWGrDkkZqukRgnWvZSITvSsTaK2UP5B9Wg4OGyOSnyde2cDEafIF
         1MdA==
X-Gm-Message-State: AGi0PuaYspfNAwGKCxHeKS8G6g9Gtbd136WXhI05/C8zCYmhzCbjiZYV
        tCZhioI4DnZ/uAGSeU6nEY1qLkOegKE=
X-Google-Smtp-Source: APiQypK5LdEDD74c+WQVl/Rzycu2elH5NzlOr/x3l2zmNS0ydyf/sLp4dRBGIKpHOZI3tgYe03L6Fg==
X-Received: by 2002:a17:90a:71c2:: with SMTP id m2mr21401729pjs.21.1587382984402;
        Mon, 20 Apr 2020 04:43:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7sm880081pfh.161.2020.04.20.04.43.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 04:43:03 -0700 (PDT)
Message-ID: <5e9d8ac7.1c69fb81.4504e.2383@mx.google.com>
Date:   Mon, 20 Apr 2020 04:43:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200420
Subject: next/master boot: 97 boots: 2 failed,
 91 passed with 4 offline (next-20200420)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 97 boots: 2 failed, 91 passed with 4 offline (next-202004=
20)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200420/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200420/

Tree: next
Branch: master
Git Describe: next-20200420
Git Commit: 6735c84f78e41749fd09e73cca70d3e0779397aa
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 52 unique boards, 18 SoC families, 18 builds out of 230

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 18 days (last pass: next-20200330 - =
first fail: next-20200401)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200417)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200417)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200417)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 23 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
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
