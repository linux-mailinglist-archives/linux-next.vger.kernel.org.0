Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209FB165701
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 06:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgBTFiA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 00:38:00 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46452 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgBTFiA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Feb 2020 00:38:00 -0500
Received: by mail-pl1-f196.google.com with SMTP id y8so1072011pll.13
        for <linux-next@vger.kernel.org>; Wed, 19 Feb 2020 21:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=v4cqI9pMirBrylyL9+hXSdZ91Cf5joKDJpU7ebrVDXA=;
        b=VPeaHC0XX9iTrfBFxlAk8QWWGomeRHZtFd3j1rF+6tXFoew/sLQge7S6QdAAgtM3O7
         ncXCtFV88xfOeaf9lV8mGSksdLcOabt2NxnUMu2MQTF93x/zBgUEeIB6x8DS1jVXDScQ
         UGoOCfemyBEnzdcgLG1VzmkqOjFhaGfdo4Q4G1kGQYJL4kv6VsgP3FFV5rXDhMFl4Eg7
         /X0Z9ZCpzHgC1/2LHARtMYjbwVejY31zXk67acJOvesuVZ6+AraOjT1CKwWz/DhUsIC7
         m/VNOG5720a/R9i66aJvOUNN4O8Tso1ohTBK7WsbkkPXFDh2TZiT8owlPmXIIieYqrb1
         tEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=v4cqI9pMirBrylyL9+hXSdZ91Cf5joKDJpU7ebrVDXA=;
        b=cx+JCL9f0TfNHyCTLoLH44O/9BsvvcUVfbDLBHLxXPNRUswjf6rONzMWtU2zy60aRm
         DLOsn1vkxwNFT26qBNOxN7g+bwkH20UBlIPmu48G9GwAnDFG11ti0OcoSR5Sa0NyXXun
         xJG3QtL3mq/avIq1nvOOARpmoZCjH/VP2BSgcHMdsXrYH4qNBgsjtN19uL+dy4bi+jNF
         jnGmpOylB4s5MmL9wAjjT8EqUcOjjnfzYUSr9yxztH8U0hzkPm5EzMhlCeZQzfH+FbRH
         VimfEp4DDs0LAt14ZOpGheK+PXMrJK+lCA29OYxSWK9gbVrQ1IauFJ/QgcdE3V3fserO
         20Bg==
X-Gm-Message-State: APjAAAX8zEtQYFY+jURrZn/y6Rvyh5AHJU9KEk9yQfkwsfVq/RZta5vk
        k1HzufkAvFUe5ho2+1sad7pAcw5l+SM=
X-Google-Smtp-Source: APXvYqwEfWvhlA0FRm+D7vAESq1fNZ0gPoIO+1vRpmyBcAK5GK0LMuwa6D90XrlyssCSWOyxQcTuHw==
X-Received: by 2002:a17:90a:d789:: with SMTP id z9mr1618557pju.5.1582177079020;
        Wed, 19 Feb 2020 21:37:59 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r3sm1571365pfg.145.2020.02.19.21.37.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 21:37:58 -0800 (PST)
Message-ID: <5e4e1b36.1c69fb81.a45a2.5f23@mx.google.com>
Date:   Wed, 19 Feb 2020 21:37:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200219
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 98 boots: 14 failed,
 83 passed with 1 untried/unknown (next-20200219)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 98 boots: 14 failed, 83 passed with 1 untried/unknown (ne=
xt-20200219)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200219/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200219/

Tree: next
Branch: master
Git Describe: next-20200219
Git Commit: 1d7f85df0f9c0456520ae86dc597bca87980d253
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 52 unique boards, 9 SoC families, 13 builds out of 149

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20200217)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 5 days (last pass: next-20200212 - =
first fail: next-20200214)
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 5 days (last pass: next-20200212 - =
first fail: next-20200214)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 5 days (last pass: next-20200211 - =
first fail: next-20200214)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 5 days (last pass: next-20200207 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 5 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 5 days (last pass: next-20200212 - =
first fail: next-20200214)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200214)
          sun50i-h6-pine-h64:
              lab-clabbe: new failure (last pass: next-20200214)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          rk3399-puma-haikou:
              lab-theobroma-systems: failing since 2 days (last pass: next-=
20200213 - first fail: next-20200217)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
