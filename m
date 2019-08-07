Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2237884F5B
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 17:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbfHGPCb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 11:02:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55434 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGPCb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 11:02:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id f72so363209wmf.5
        for <linux-next@vger.kernel.org>; Wed, 07 Aug 2019 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/1bue4V86tCtFS5q79K8r8VvIPCBjSzyslB+s5MHpOQ=;
        b=LsZHaJNpbb8E6utpRB1zrMy59Qw7uHPHWcqEUvA4DOs62jQ3Ree1uUFv9SnN5+DUn6
         jn8Gx89joox91Qc4pzGMK2f5deh36nhf1lDH4n0wpE0YxPEvTu9k8aB2mCbqdxt8akit
         zR66vrff7/QJLnF823GOBHQOi1Aqxz522Zmy3KPVp6wEcK4I77xPnY5EZHHrnEvqoox8
         13mXN8jajf+qsaBUKFJBgWD1MSHaMp9YkEMLXrX8GcMT4shK52AcEyMBdid61b1MPyd1
         1jvbJXDJSl2dCgN/Xh2yc+a0mCEUZQpoNocaz1F1iGxqgk0T5R4I+1F8e8M/siqDTbcv
         yyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/1bue4V86tCtFS5q79K8r8VvIPCBjSzyslB+s5MHpOQ=;
        b=OHqOjzWB2wy4jgPqq0fcovFD97wkE92B7W21WjebbhAXCH4UcTkdBBvKfM0X1T4HUW
         f7zL4ID9vN/LPtoZ34SkUYQlhtYeYUZQMv4YzwGNcrqobSoC1uVfxfSfR0JTVyi5QRvE
         0rZM7bk2HnENzXgl5a5Jy02WsXn15FBDPtzNCUP69XHc3meCynzu6uPOuRsJKV9eenff
         SNBryx4nyuWf42raybpJUJmIUxCOU+q8UaZlC8zQIza4mUy2JFRUH0uA0I1qIs4NlpCh
         Bqm0Ckvdoys2b6+GN/HP20YlnpCWNBoVrltECHk8QHL4knqUHBPz/hrZ118W/MH+0SOj
         8nNA==
X-Gm-Message-State: APjAAAUUPGCMtGmIsKB5tJeK8T7AzsljdGTcBYoLaVsOdinXYGiSrQ34
        wg7uVfX5UvI+Vr5rVgFjIOa1/l4pzBxwuw==
X-Google-Smtp-Source: APXvYqwkq9QUuaS0QtijTafGjrG+PLzcZgeQntz1kioq8Jew28/0KBIlSYW0UvNje7xSF3XxdfMdLg==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr386378wmh.55.1565190148903;
        Wed, 07 Aug 2019 08:02:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c3sm93405919wrx.19.2019.08.07.08.02.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 08:02:28 -0700 (PDT)
Message-ID: <5d4ae804.1c69fb81.6eec6.7e6b@mx.google.com>
Date:   Wed, 07 Aug 2019 08:02:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190807
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 149 boots: 3 failed, 134 passed with 9 offline,
 1 untried/unknown, 2 conflicts (next-20190807)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 149 boots: 3 failed, 134 passed with 9 offline, 1 untried=
/unknown, 2 conflicts (next-20190807)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190807/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190807/

Tree: next
Branch: master
Git Describe: next-20190807
Git Commit: 3880be629e26f6c407593602398c6651860d5fae
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 60 unique boards, 24 SoC families, 20 builds out of 230

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
