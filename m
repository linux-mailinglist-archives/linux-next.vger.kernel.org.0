Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17230A0A07
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 20:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfH1Sz4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 14:55:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44993 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfH1Sz4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2019 14:55:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id j11so818223wrp.11
        for <linux-next@vger.kernel.org>; Wed, 28 Aug 2019 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NxwJ6/Ajcud/9Ka7+afEwusikU/tZ+uaipxy4shSAEY=;
        b=Rvq/aec9nCWiiDywZxrsBuTXqADTqBLl152GGjpnwRp2NVABdybDJ4fUl+vKEg3/o9
         l6lWfc9Eh+QnbFS2Au6EgXtdPHKsOgz2jyeDEihetqgazYcdYOt6f4lbcJ3FWn246beJ
         3mXq1rhmcFWX0XeVx1RVLNFukYAl9VZb5yAjJLUg8tpo28jRBaN2K1T+f0IZqw2EvAn8
         QWYuYC1YhSrIptszMVhBB2hP3XRI9le+624vxhx1e8jhVfZWWgiSz51S59OuK8a8Hz+Y
         jYq2SJmdYdXr9h0KYVEwg+k6UMoEoKLlOHJcWXApVvqgt4o3USW6IkGsQTLWB31xjdVz
         O8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NxwJ6/Ajcud/9Ka7+afEwusikU/tZ+uaipxy4shSAEY=;
        b=iecdQ1hfWQwKVyr4UIzXHx/8KD6/+UPMLt6MIeszDZZ3iqs5ObcVdhO/g/XphlYZxt
         MJXHRjGLkTsVOUglTwLdUSIzu0AQ5SvH3ylH2evpt5PtJuT4bSpFSIwDBmpRzB5lwt4P
         cUgPc1kDtLxPeufd7RHDES6jFBoGhyrgwmqTdekRnV7r9NI7uLDw1w4+5QyQ7K/fbM7L
         2co7flBTsQZiqjVlj4k16y2uGaMGo8264jR7bUKlW6Eou0BHz/YzBJhJJrfmzVA+df1/
         Pb4uFuGBOrVhzPSLQfipzhNBtqms28olCYPmG8fHPoq105wQr8acKRtbUUTZRdapSQNG
         p1lw==
X-Gm-Message-State: APjAAAVUT/U2+IdZfn423XpHs8I7pjguVUBNUqCNgz3U/9QafyTUYwnS
        8mJjuu96SIJ4/w32fFzRTslaUiCseX55zA==
X-Google-Smtp-Source: APXvYqyPkqbqKg2xG9GS2LofBD8566TNJMeLTKtfoLTFt6HrmTT2HU/ydAPsQGg5rmlt2+ppXlvhvQ==
X-Received: by 2002:adf:bb0a:: with SMTP id r10mr6558697wrg.13.1567018553767;
        Wed, 28 Aug 2019 11:55:53 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e6sm8039wrw.35.2019.08.28.11.55.52
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 11:55:53 -0700 (PDT)
Message-ID: <5d66ce39.1c69fb81.80af6.00ae@mx.google.com>
Date:   Wed, 28 Aug 2019 11:55:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-266-gebd24bbbf581
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 241 boots: 6 failed,
 221 passed with 12 offline, 1 untried/unknown,
 1 conflict (v5.3-rc6-266-gebd24bbbf581)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 241 boots: 6 failed, 221 passed with 12 offline, 1=
 untried/unknown, 1 conflict (v5.3-rc6-266-gebd24bbbf581)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc6-266-gebd24bbbf581/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc6-266-gebd24bbbf581/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc6-266-gebd24bbbf581
Git Commit: ebd24bbbf581f70d34d42965b828b242bbb8d63a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 26 SoC families, 20 builds out of 222

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun5i-a13-olinuxino-micro:
              lab-baylibre: new failure (last pass: v5.3-rc6-214-g30064e30c=
cb4)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: v5.3-rc6-214-g30064e30=
ccb4)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 1 day (last pass: v5.3-rc5-221-g5=
995e3fbeb96 - first fail: v5.3-rc6-214-g30064e30ccb4)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc6-214-g30064e30c=
cb4)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
