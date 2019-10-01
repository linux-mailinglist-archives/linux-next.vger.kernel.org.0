Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917A5C2E84
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2019 10:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfJAIBM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Oct 2019 04:01:12 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:52107 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJAIBL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Oct 2019 04:01:11 -0400
Received: by mail-wm1-f47.google.com with SMTP id 7so2173953wme.1
        for <linux-next@vger.kernel.org>; Tue, 01 Oct 2019 01:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WNxZN58Wkjxvgx+6hLHukkVTudwzeY5rurCI3Kc3ww4=;
        b=VcStpchiUZ/LNJRuholInMPfNhuhUe/yKsn3A5BoJoeIBIEC3CTnSYbkAlbbTWJr0U
         NafDdzwtN7x8hl3oQKLwdoLr4tBmrE+v9Px+stc7bD/PSOQR/4MdNr9csD0fachZN8LU
         ZbvMvYvu0P3MOSadlpUlF/Ai39tRZ1l7gFjttagMRpKB+buWB5AOBHyw8k1zrRbV3jdl
         VC3ABpW9IBdZZN/wr5wEkUcmOHxjPcTWgQNgkrdLgadP6Mw2i5cQY7oD0SkIijjVrZA7
         b7mhLesXxBwS1N0DAqMyEK1MGAF/2P8JHmJ23Ga6+pdOf+WyASYDZ4e0ycFB4mpHAP1a
         cmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WNxZN58Wkjxvgx+6hLHukkVTudwzeY5rurCI3Kc3ww4=;
        b=DrRSqNZysUc+TwCQDh+84xFD9QSZUhKNBG4LDvWUuHNOPuMektL+YMnqo00OBlCDpd
         9qFbfXEXbMSYtd/Ouxvqk3E0QE6usbToJnj0U2uKTHiClTR4SOF0FKQjVaoozJ29K37/
         F0P7PNxS0N4jCzFxo57QrQhQAMQ5fQe7TJBoTCzX0ZQ7ECLi67CDhOUc/B6C9hwJyTPs
         t7sxQ9igS9LMrJBHkoJXRD9OqndAcGi9h7XeFav06duz3Vb6xnQlUa3DG1Tk1uNck5Ak
         /SlvnbIOypcG5JEE79QPWWVw1OknnkKuVjooBZCNn8q5mEiyvzfk+HrM+/VwnyWFDvAL
         3NVw==
X-Gm-Message-State: APjAAAWQw89qNrMgjiRwPSNpRHBNnEVnMstsmWFhFKsdCF+wsoV6KHAW
        peF2Ct/MGcIh5DA/pN/xZvgbvqZGg18KWg==
X-Google-Smtp-Source: APXvYqyTTHtP8p2ay6uNJe9hQhdO9trCkaxtAvT1nPty6vyqw0y7Dd3u46uj0qA/p6Y/ksNc+j2bGg==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr2646955wmo.114.1569916867666;
        Tue, 01 Oct 2019 01:01:07 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s12sm33845237wra.82.2019.10.01.01.01.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 01:01:06 -0700 (PDT)
Message-ID: <5d9307c2.1c69fb81.659f1.c2b8@mx.google.com>
Date:   Tue, 01 Oct 2019 01:01:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191001
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 250 boots: 12 failed, 238 passed (next-20191001)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 250 boots: 12 failed, 238 passed (next-20191001)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191001/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191001/

Tree: next
Branch: master
Git Describe: next-20191001
Git Commit: afb37288faaa88577b2b4d3b484bdcc85f311ea5
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 55 unique boards, 17 SoC families, 22 builds out of 218

Boot Regressions Detected:

arm64:

    defconfig+kselftest:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20190930)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190930)

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig:
        clang-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
