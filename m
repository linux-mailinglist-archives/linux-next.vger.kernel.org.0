Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D863FCB39D
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 05:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387654AbfJDD6W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Oct 2019 23:58:22 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:39569 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387504AbfJDD6V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Oct 2019 23:58:21 -0400
Received: by mail-wm1-f48.google.com with SMTP id v17so4283407wml.4
        for <linux-next@vger.kernel.org>; Thu, 03 Oct 2019 20:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TK7UCRaLqHDAkti6DcGirPqWLMok6oNjNsEIVkPUeCE=;
        b=lF5Rdbo3W8I9RJ0wSvzKs8esk9dM5hUg7C33i6Xs5gagnZfcQ8m3u/buvwgCB7v2bi
         EDAnGYzEkfWVYhWhPDE6+3+niR500oK+3zfxjkaMl1qphuWFftf7dx94aP0or6cPNnSG
         sMhEnkSjtxSaPfQYwUolk0fl7bVfirjI4OpB+dMI8QGm8DrfW0DMs1fVr52UMWhRnOYF
         uTsUuWBF0PF6BbP1yum6ZgPAW9uqY7jvtWpRk4ENybvfH9l5J1mqFbBwgJhhoowGYCZG
         aoP26IqhF181EJQ71D8KqguQHcHLiYFc9M83wqygk2axGYJkLIrRCbm9AWbyPHX5bL3E
         vQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TK7UCRaLqHDAkti6DcGirPqWLMok6oNjNsEIVkPUeCE=;
        b=r+Zze1ORkcdGJuXmreH6Tvm7dc43ixK1VPWcBqfTxUq6pLYB15lopNDLzJrora8/Pa
         mj1Q6RTcWECSIBaRgPFw2isdiEw9soaAy2vCZBiJH9twcMyN9Y/krmqE5jmpPfAZbSc7
         LiPhYVoZ/8UBkhwaSZ6lYLFaqfkhnmETH1b8uvF/kBIzpe0kClbQf+iGrMwUn6nDBLtt
         AM2GV9BUWZLRyLWqrLVC3X3mCAtepAEehRuRfNJcAKmXABOWTV9YClFnbdD3CuPSHnNz
         DEPcF3MAJy/Y1aPXpS3103uGOEl+N3r+zew6n7ctpugrSKdacLWyNXNvnyyeHLM+yoKS
         Cg0Q==
X-Gm-Message-State: APjAAAXJXVWFGSdhdENWH+IqbM3EHVrPyXeof4vRK8EACKJrPlMfNDrC
        /v5fblJef7yBmIogl4WjXBmkzB8lPNEzig==
X-Google-Smtp-Source: APXvYqyu2sD0+QrJlVuNJI6hSxXJxWDK+yUO8aMN0ilX1QaypYz4pO4MWmsotlJUcZjuwv6HacLDjw==
X-Received: by 2002:a1c:7dd1:: with SMTP id y200mr8743720wmc.59.1570161499684;
        Thu, 03 Oct 2019 20:58:19 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n1sm8404485wrg.67.2019.10.03.20.58.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 20:58:19 -0700 (PDT)
Message-ID: <5d96c35b.1c69fb81.ecd34.8527@mx.google.com>
Date:   Thu, 03 Oct 2019 20:58:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191003
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 304 boots: 13 failed, 277 passed with 12 offline,
 2 untried/unknown (next-20191003)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 304 boots: 13 failed, 277 passed with 12 offline, 2 untri=
ed/unknown (next-20191003)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191003/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191003/

Tree: next
Branch: master
Git Describe: next-20191003
Git Commit: 2521ffab5375209bd0df42b675fd84ad785647e9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 27 SoC families, 25 builds out of 218

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
