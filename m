Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79EFEEA9CE
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2019 05:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfJaECf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 31 Oct 2019 00:02:35 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:42469 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfJaECf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2019 00:02:35 -0400
Received: by mail-wr1-f48.google.com with SMTP id a15so4645439wrf.9
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2019 21:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xg4XlgFLF6p/PphS0MI3YwafPGP66BhrOlxSnnJv0jA=;
        b=mggrmmees7UQNm3w+/pWalBjzPpmYAYJdfqhh+la4QH++1OsOixXWrIZ0+B8FPoloP
         R6BQTm6kQYJ79+awRtW9FRRqFhQbr8PiQC93+h/cUwUGwE88yMdIsMvqkwUatyUulOip
         OJHN+X3jArUiqib2X7kMCzx60TlfN3Kbsruv9ZUMyEpC3eeH+Dra7VJ9y8ZDwPPX3j5+
         TIpAbT42x7m2oME/EM1HIzGUKfT9QTEk2gLcNb7HtHk8ttW7sIjfxaWkKCDfd0UCnuLf
         eqkF0hmg9BGYCxInXl3/e7MXmyjuBMCXN9jb/twc4nAuh73hIpJyFxOd7md3y9PGcjij
         EHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xg4XlgFLF6p/PphS0MI3YwafPGP66BhrOlxSnnJv0jA=;
        b=QHzIG7DvcUt2R06Kym9rn73vnBB0RCtg/gUjd2x8c14Z6lMUU9qdUos6DeWvPigVCY
         DHAmoLJjcZ082/nJyOCxB+IqAkFqqem8/FBLgdDZcmAcgwRRpk2SSyEgg2VdjF9DKpoQ
         fNCQMYaHPHm4/EHs+AzhPQyVHxBTLP8z1AyGFoTfw+UtUQGj4er9VJBWCZcEJSsMRqj6
         yJ6JSJ0Z8MwtpNT7SVNCInpfJxdWoURAYJSLT9uqj1/iN3YJ9nofqKNGnKr8FpqSYiQk
         WsB8/6b71WHs2NkpKKUQXkPWlCm4PWHBfj7cyEeddSaAlVZpYC2UVQtIuCkDOUiLqLR+
         0xXg==
X-Gm-Message-State: APjAAAU7fPAgFmuAibhWKFIG/O5QOmbYPLEyf54O3/9li0iNUJlvB/aJ
        EofHo//bh1YIsFhyQeFfFisj6qRfmyVTZQ==
X-Google-Smtp-Source: APXvYqxlkuxlp/FbwvNpo2u+hOwMXf1JRHcJZlekRovCJwnR06nHOSRheVpvt9sWw7fCUeVlOJzBQw==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr3300944wrw.176.1572494552057;
        Wed, 30 Oct 2019 21:02:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f204sm2046954wmf.32.2019.10.30.21.02.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 21:02:31 -0700 (PDT)
Message-ID: <5dba5cd7.1c69fb81.86def.b8b9@mx.google.com>
Date:   Wed, 30 Oct 2019 21:02:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-rc5-364-gd705bb4f2860
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 249 boots: 2 failed,
 238 passed with 8 offline, 1 untried/unknown (v5.4-rc5-364-gd705bb4f2860)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 249 boots: 2 failed, 238 passed with 8 offline, 1 =
untried/unknown (v5.4-rc5-364-gd705bb4f2860)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc5-364-gd705bb4f2860/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc5-364-gd705bb4f2860/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc5-364-gd705bb4f2860
Git Commit: d705bb4f2860fa79facc63b694625c96bad63a22
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 26 SoC families, 27 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
