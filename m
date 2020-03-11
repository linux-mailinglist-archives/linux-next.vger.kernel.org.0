Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EEB181AB8
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 15:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgCKOEn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 10:04:43 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:36654 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729716AbgCKOEm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2020 10:04:42 -0400
Received: by mail-pl1-f179.google.com with SMTP id g12so1164354plo.3
        for <linux-next@vger.kernel.org>; Wed, 11 Mar 2020 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2EHgZAEr4Nd8ZOKlMXD/6Sm4HfcwOXx/9rktQKB44rQ=;
        b=zgzPF1pTDexD/7CXSJ8vDAB5PWQ+V2sYJKrSHqjdErz1thp3QfxBtoOnHf9q1kV7Zp
         xFVP29Yj0HwwtjWOJNwIupanOCFuHqTDZ8Z1YgYLHeFLDt6vhZKUy+MixgNF/mKA964F
         SmnTZTwFskq/kcdBqMVbJ4c8kg2Juo1Zeujkd7eBpse0+Xs9KNscHCKzWTJpKScfBeqg
         iOki1ratWILlExf6qmOqaXggcdC5RosnuEdl8Arc5g3GK73TUW8M4clTBBc2NVMEIk6x
         Nwy816fOwgMpW5yW4PuvXpZLhivaiQqMQQf0/QRr6U7fkxFb6JZNovoayN3BPobOys/A
         medQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2EHgZAEr4Nd8ZOKlMXD/6Sm4HfcwOXx/9rktQKB44rQ=;
        b=j0BFqCADh7QgIoD2WFAW4yH+S8aDvHGeOeGeV3/Ezsbp5x/FCo7oNdB+OuzHe4Dy9B
         ifyW6jw5w/4nSgolGGWeH17KXQba1UjzCt8TqU0LNx7zgZ5nTYaZ6eyMnfBN1iekLRXx
         2wgb/sWJd5AOllQt0juEM+m0JW4DY+Qxy+S5UO3E2Yq4fzHbEIOr5SvGfxEphtXHlEJm
         tx7hO1ffwJDtixg+p3b9NoLM2RUuGJ96vGwwD0aDGb8pZC0EQ2/qsa0S6fbfsrrmEWJV
         kFKwHPlr0/rYo5oZCamhC9EUsBjSgBF/wVyJDFtocjU4S2/1aEO2ebqgdbTAZxtz2oS2
         +DIg==
X-Gm-Message-State: ANhLgQ38SudkJvKh60Ohf+bWcqp9MKaW/zXeO67SDdA+KpwYLoE60xgR
        G2mps5isBkL4QtsYHsSjlQrLLTbr19k=
X-Google-Smtp-Source: ADFU+vsL/sCuPOvLtQrU3uBEQa3HjVeHsks2a8Oi0Tftogi0JiKQKjlTJzlHYRh/3BRlCR35yOmruA==
X-Received: by 2002:a17:90b:352:: with SMTP id fh18mr3624432pjb.168.1583935481451;
        Wed, 11 Mar 2020 07:04:41 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d77sm39619355pfd.109.2020.03.11.07.04.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 07:04:40 -0700 (PDT)
Message-ID: <5e68eff8.1c69fb81.25703.bdb3@mx.google.com>
Date:   Wed, 11 Mar 2020 07:04:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200311
X-Kernelci-Report-Type: boot
Subject: next/master boot: 76 boots: 6 failed,
 68 passed with 2 offline (next-20200311)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 76 boots: 6 failed, 68 passed with 2 offline (next-202003=
11)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200311/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200311/

Tree: next
Branch: master
Git Describe: next-20200311
Git Commit: d44a64766795839eaa0f79a9e5365e8a794a1642
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 53 unique boards, 19 SoC families, 25 builds out of 329

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200306)

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 22 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20200310)

Boot Failures Detected:

arc:
    hsdk_defconfig:
        gcc-8:
            hsdk: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
