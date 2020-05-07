Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2191C82DE
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 08:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbgEGGwo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 02:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGGwn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 02:52:43 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B947AC061A10
        for <linux-next@vger.kernel.org>; Wed,  6 May 2020 23:52:43 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z1so2538925pfn.3
        for <linux-next@vger.kernel.org>; Wed, 06 May 2020 23:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GPDm3oBnn2lTlhc1Ey+MjS7Eco1JwOIGFfDO+8/c1tg=;
        b=tEsQFg38kxGLZ+OkP+Igfr+8DiGCVqRIffXJsPxCAECRhdjzg/8TDMg06J9VESMsRA
         qF3bdLeWOwamDAD6Q39lHaIisDdjKqMu0Gnv7yDBnk86XWwOVzqRN+T4j2Ajz31O3ZpK
         wMw0n2OhW9oXcXuTfB8LzXqcAVMy5isuyiXnZ5pZ5NqMyCh16I1HuSq/gaxIvQ7TyRTE
         4gdVZxaHf4UDnZ6wcoURJra9pvIQ8YHMsdD6TLwuHkWTci/GBgtpAIj7uIzkB78jShsf
         ta/8nWCooH2/B4hRA3OY+bp6xGypk6XEUYgZukNbMfXw5r+UaK1aYWamnyW5PtFqMiVu
         +cBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GPDm3oBnn2lTlhc1Ey+MjS7Eco1JwOIGFfDO+8/c1tg=;
        b=KP+KBJVBwjIpZRzCjSSxcFJC2tWkgMv9gVvi3Z3DXY0tbOugLH2ZMzJ9xNoPu2qDez
         ZzPEIhnoqiMztplXhepGC0Wn3XIKCZtXDLyuvGz/M4LJ4UkNRVY/4dx1mZIAZnArZTvH
         9i8FQF/dSTwI26Ria/6XCkBiYyZA4PM57MaZWoxExdsuEUGYNhWxGhn1Lju1DqmvrrsB
         NAl516+aslNPnPSWiyrtB46DCe4Nt0RcPs3Sw1sK69A1SfqqfdWiGlOtmT4RlltyHO9I
         0dqCHwiGldDCWTPsaBpAz06BeFY3yDj+2mWCXQhuKG+1E/rdaEpvIs0QRceKQ7DllrZC
         2+0w==
X-Gm-Message-State: AGi0PubRanCOXNeJmlDZGseFz6x4qxEstLDNJAxzpXjzCHLLC8pNlMxd
        a+Ngz+3tiH9hkfL8bkPRXIFKMq4MwT4=
X-Google-Smtp-Source: APiQypJsGDFWXVUmEabrfKU+QEfvrRSQ2AvHKahz7nA4u/zmQurwXo1jHf8ny4YKZOgdVNwr5K0zug==
X-Received: by 2002:a62:1985:: with SMTP id 127mr11384540pfz.175.1588834362760;
        Wed, 06 May 2020 23:52:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j23sm6406202pjz.13.2020.05.06.23.52.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 23:52:41 -0700 (PDT)
Message-ID: <5eb3b039.1c69fb81.41cfb.6e89@mx.google.com>
Date:   Wed, 06 May 2020 23:52:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc4-364-ga267cf4704df
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 199 boots: 4 failed,
 188 passed with 5 offline, 2 untried/unknown (v5.7-rc4-364-ga267cf4704df)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 199 boots: 4 failed, 188 passed with 5 offline, 2 =
untried/unknown (v5.7-rc4-364-ga267cf4704df)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc4-364-ga267cf4704df/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc4-364-ga267cf4704df/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc4-364-ga267cf4704df
Git Commit: a267cf4704df4f90ac579721dbb4010bdb1598b7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 23 SoC families, 30 builds out of 217

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          sm8150-mtp:
              lab-bjorn: failing since 6 days (last pass: v5.7-rc3-194-g163=
1e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-h5-nanopi-neo-plus2:
              lab-clabbe: new failure (last pass: v5.7-rc4-280-g8474014cf12=
d)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 26 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

arm:
    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
