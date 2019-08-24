Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC7D9BA12
	for <lists+linux-next@lfdr.de>; Sat, 24 Aug 2019 03:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfHXB27 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Aug 2019 21:28:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55718 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfHXB27 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Aug 2019 21:28:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id f72so10387513wmf.5
        for <linux-next@vger.kernel.org>; Fri, 23 Aug 2019 18:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OmxigMTP5DeHRRgbfmmJxZ1EFk1sJujSUCNqpZEvivk=;
        b=VBl6ago170ao2ciucsEd8P+lESvlZDuOqLJ+SBNc0cRa/p/pSShFyfCI538lNJR7tx
         srMcrZ7ncaoBJcIYYKZSULNfo88Nv9o45LUXiZ1+vp5d7Vyiwv9nQiCJ2gWsdzgko7wI
         aox5v1fkGCqx20MSPC7HZzyg5QNazDYm5L6G4L5JjwkN+c6NqmPqmsVq8d30gOP/d24a
         kfc1SWLfnt/PsLwRqdhaaoxxhPGb9Euegwv7hkk0N2h+kN73lr95h8hD9IWCvEtEayrE
         HtRKB08C2qbS5BQdibBUuT3pKj15gZ7DFRGL7X38ILsGIb244TfF8HmE9U3+n36eGy/W
         1YDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OmxigMTP5DeHRRgbfmmJxZ1EFk1sJujSUCNqpZEvivk=;
        b=Qm6r5QGoHkXIqpevmRgUutIWbK37/PCBfRbnTvoLOUNc0lm/mkwKhUqek/NPiOrPoZ
         1At28qRHgjDIm66B8FZGpoe0T8IFZR7cbvt3BDI7HB4jeNuJo1klpgReLhMpKToShHMx
         BOkGS3nBw5DD7ZTtpFv8/B82vV0e20jMpfuXu0V6Bg/VajJh9b55UDrADwLHAlTfgmBr
         ooPpFO2OTP4AtrjjG/Y2HWCTcdazqhtMuVwYk7isI1IrkpSL1pTsjnNhcgLgJOPRoAO2
         a/IN4TjNosRj5CVgYTIJUJmKnBTjIhovnTtv42Ue48DsDs6OWNpbosIxdEgUGwI8gipY
         oDLg==
X-Gm-Message-State: APjAAAUm9axkETjUlZP4PEnrVFJeZABfFeB5DMSRlLAEmIuoCy41tSSt
        hpkTjadPwsCYmU67JGto7ivAilQuilEJbQ==
X-Google-Smtp-Source: APXvYqx/+YZgXspTrG+4dGFjD8KFniPwl6sQYj4zAARNqbjXosgK7IwUpEYsYPHGBUVUXDWMjNoutw==
X-Received: by 2002:a1c:c188:: with SMTP id r130mr2702367wmf.73.1566610137729;
        Fri, 23 Aug 2019 18:28:57 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c15sm16013167wrb.80.2019.08.23.18.28.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 18:28:57 -0700 (PDT)
Message-ID: <5d6092d9.1c69fb81.b7f85.6eec@mx.google.com>
Date:   Fri, 23 Aug 2019 18:28:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc5-377-g88ec806247b2
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 237 boots: 3 failed,
 218 passed with 13 offline, 3 untried/unknown (v5.3-rc5-377-g88ec806247b2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 237 boots: 3 failed, 218 passed with 13 offline, 3=
 untried/unknown (v5.3-rc5-377-g88ec806247b2)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc5-377-g88ec806247b2/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc5-377-g88ec806247b2/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc5-377-g88ec806247b2
Git Commit: 88ec806247b2458f6860caf7f212f85c8c7a7c5b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 27 SoC families, 22 builds out of 222

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.3-rc4-220-g1999f09bb=
019)

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.3-rc5-318-g5c8c607cc=
e6d)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.3-rc5-318-g5c8c607cc=
e6d)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

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

---
For more info write to <info@kernelci.org>
