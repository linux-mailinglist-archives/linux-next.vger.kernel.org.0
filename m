Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A60E35E5
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2019 16:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732092AbfJXOq6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Oct 2019 10:46:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39251 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731758AbfJXOq5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Oct 2019 10:46:57 -0400
Received: by mail-wr1-f68.google.com with SMTP id a11so10327049wra.6
        for <linux-next@vger.kernel.org>; Thu, 24 Oct 2019 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gtVyPF1zIm0blZzNuVGK9/pp7JEw+Qod2WZxHqttqm8=;
        b=acnmi2r9wKD05FlF5fJQzJ0DZcASAZ35FthP07AuSEz+gsJ8AKLGZiNIJGclgWWLTI
         uWZJCINsWP2vlWfAiNKmHTZeVkM49T+M53QAVFMH9fmZoJisv62FXgRzN8NhgrOfZo9v
         6OJETQGkOnzbB7/eoxVUaRYUdI0PDkQ2YyNViWpBTCu/ptoV5UCFg8OeGRd8dOKCZUA6
         FTU7rNMRe5LJFHHF53/sPCHnb72fEr1DiL304fRdRhKGNqQK8Sis5p205vwU5HLM+ZHg
         ttnUHtxaWyTyTzb66HiggVg22SBQzvWnFZQMi3q2zOW1PMUyAnKYX9oRU8r0OHsDhsC7
         Zyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gtVyPF1zIm0blZzNuVGK9/pp7JEw+Qod2WZxHqttqm8=;
        b=QalPBkwWgAOKVegzIKWgLANCu98SnRzJ/4p4mAITO0BwgJguuivHPxcgqhtg1Tb9OR
         LXaDe2s3vVCtPLdHsskL63hXiGeBxq/jNRvWDxqkO4VJaxdWg+8WgY3Cek44Xy8UuJGh
         11I5QpBtooz/s93xPcZ+/vaXGxqxjFfCUretRvnErQWnq3HPzCVb0/CFMsckEmRrcf38
         a0FFH9TB2Xtz4cQSwkBtGxfmTE8Yxb34QwXLgeKmYBI+5o3p+A8caiTus6Oj2GpXoEVs
         nlTBQDq/R0b9tPsqAmwmdEWcDid3gyZm6dE47PAOkOhQD0I+atG54Ff1Sz2YGBHM0JpP
         JZxQ==
X-Gm-Message-State: APjAAAUsOWup1jT83qM+AqyeX2Q1l1rcRojhkiB/MebY+XnPXxpxReJU
        PJIjFpBDNsdhPH/OHOrXysfu/IyrWR9sRg==
X-Google-Smtp-Source: APXvYqxgS5Xxo8uGOugvbX01XL8WvfHoqC9MiMy5M+jMOh6xibUSRK/qxjxrK7Hq8JXNj9+qfhNiAQ==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr4163507wrp.38.1571928416051;
        Thu, 24 Oct 2019 07:46:56 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x8sm25510794wrr.43.2019.10.24.07.46.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 07:46:55 -0700 (PDT)
Message-ID: <5db1b95f.1c69fb81.92dd0.3276@mx.google.com>
Date:   Thu, 24 Oct 2019 07:46:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191024
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 228 boots: 8 failed, 211 passed with 8 offline,
 1 untried/unknown (next-20191024)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 228 boots: 8 failed, 211 passed with 8 offline, 1 untried=
/unknown (next-20191024)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191024/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191024/

Tree: next
Branch: master
Git Describe: next-20191024
Git Commit: 12d61c6996999e6562cbbed5f270d572248a11c5
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 79 unique boards, 24 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm64:

    defconfig+kselftest:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20191023)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20191023)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

arm64:
    defconfig+kselftest:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
