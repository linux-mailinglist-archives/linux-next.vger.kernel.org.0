Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E14015481F
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2020 16:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgBFPbp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 10:31:45 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52865 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgBFPbp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Feb 2020 10:31:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so452618wmc.2
        for <linux-next@vger.kernel.org>; Thu, 06 Feb 2020 07:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bWiSBWKH9SUP7VNGhZxJ/yeGEUroXH58rQwlm9ZelO8=;
        b=KUORJGd7hpboYk2xR7v/K3yQF7MpCIQkxVms7hxWrp1qbjh803WS+fSPpb2hrqZ6Ra
         9mqSe1DwqSoT61zhabnPxSOQSpitAKJ/JB1u41aQ05TfJF0g9pvXvY76A8yQGrU5TcxN
         v0iMMJhR9YixLF8o7aDE0dvCSssItcJTObA7mFWon5N0vvbN/xe+txGMJWVYJ3kJNzYk
         uaX49tlvhrBHxQcpevrgykFd1wB7DfJlfDgrOdpKRihWIxosSQ8Pfel5f8oUTQbpuLoZ
         M2UgOHdFpYI5NFs9ME2DX44LNY8VtmQjV8k07CsuRi6EQxIXGwEFVZgsVQwhsRud95HZ
         VH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bWiSBWKH9SUP7VNGhZxJ/yeGEUroXH58rQwlm9ZelO8=;
        b=G+69fkyuqgj4Il1g7F02avAtHkGwW40LZtLwNiqfB9Sbbbghc4ettrCUU8SxIZIqd/
         SA7Ao3sButMafFBTGf58nGZM63n1loy7cQ9xodygi04SZ/mHLukncad+gQekPppO2UUg
         uNhSO4Yk3ndl/IqyQ40vSpQpJOSIGu48WVMKHOP/jI+Uw54QKwSjheeOqv3pn8agWhCI
         MG2BvGMDjtofcj4UAgOAncCsH6N5i2/t17a4v83SVbD5Uk/DooNRdXYqqqjpvg1VurIz
         YIost1/4MK6Y6MlPFCWjIpNC3S+3hOAKOIZ27mj7Y2rQXJwunHeiSsR6p6O7XssZsXw+
         1ePw==
X-Gm-Message-State: APjAAAXXjKYFKKOZR8qFexXcdomqvxsnmAbYi0A+CmcAgn9292/WezNN
        IUUh8dR5ewjVyIlUiOU4qF2JutIT1GFZkQ==
X-Google-Smtp-Source: APXvYqzBq6PLllb+tiGN6ilJQyVy2HJ8jKgmADpLMgP3EKk8AXCq9h/FtHvH54wrjcbo8sAWoA2QDA==
X-Received: by 2002:a05:600c:34b:: with SMTP id u11mr5102148wmd.69.1581003102840;
        Thu, 06 Feb 2020 07:31:42 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t1sm4204745wma.43.2020.02.06.07.31.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 07:31:42 -0800 (PST)
Message-ID: <5e3c315e.1c69fb81.a9a37.2734@mx.google.com>
Date:   Thu, 06 Feb 2020 07:31:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200206
X-Kernelci-Report-Type: boot
Subject: next/master boot: 108 boots: 4 failed,
 101 passed with 3 offline (next-20200206)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 108 boots: 4 failed, 101 passed with 3 offline (next-2020=
0206)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200206/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200206/

Tree: next
Branch: master
Git Describe: next-20200206
Git Commit: a0c61bf1c773bfe510d125606253857f02c58797
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 56 unique boards, 11 SoC families, 7 builds out of 34

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 6 days (last pass: next-20200130 - f=
irst fail: next-20200131)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200205)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200205)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200205)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200205)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

Offline Platforms:

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
