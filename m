Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD64711E00D
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2019 09:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbfLMI7w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Dec 2019 03:59:52 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:45586 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfLMI7w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Dec 2019 03:59:52 -0500
Received: by mail-wr1-f54.google.com with SMTP id j42so5716057wrj.12
        for <linux-next@vger.kernel.org>; Fri, 13 Dec 2019 00:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Th+9IfPLl2pKF+sY0jTUPOJ+7ILsyueyEMcb0Lu7Te4=;
        b=qtD77WMvwBTtRpWCrxpndDcaFA8u6QXHeCweEteuMza4lzA98pB/0xJePdAo5J2A3G
         pZj5oP5u7/VjFd7uVcSvPclDi24OXwww2E2dloz31T5YO2a+l7+E3gF9Y/UyQd7GbtAp
         fGreNVVtX8FtpHs33JtYeDi/D+6FLU7qI5BwrLeDQn4cI5UkZjmBmk6lBcrDpfA7slDk
         uOz8FkXy+zbLmhre69hYr3pObIaWW3matOFZKgzK4cZdG4pnEx3d5iO93HYcnNtjKcQK
         q7hJlRbJ63QKnhWZTrPe1npZOvspGWN2hFJgfCS5GNLQKZ8SX6T/BusNZRYVEyCCV9SX
         xyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Th+9IfPLl2pKF+sY0jTUPOJ+7ILsyueyEMcb0Lu7Te4=;
        b=TKuifJn1HQlAuMt/1XCuc309CsWSxpw5qslop6wDBpEzIiamAwKyhyazbzmmJ3YDYq
         TqrXOahV4PF5Jis2q6gr2ZgRi1AQSdinx+y2KYwqeN8wp6wEZj1BSkYHH4KTTzKp7fBz
         SJhSgY7jk4a6QsPkrE5NQHPoPWgoKlacMAdSMZ4UzCAr2Nsv6uaxogS8Xmaad8BfTlC9
         mFDmoWV5bkfSD/o2QFuLc0GZDPFNEBZgpKCcxkEAX5ul3V3j3Bid09GSqvRRl1A7EEQ5
         CXqw0GqaQTJMDNa/QHK2KnDiCQMMuAUFsc3ACu/GNmAFOBg5bS7Qecb//hShX9WNfgGe
         U+7A==
X-Gm-Message-State: APjAAAUwyLVi0qziJRBUc6DqkLcCPa1dl9Q5EjvWUE45Vh+7O/JVJHYQ
        oPZ2vAbiuR6d6U1HRl4tWZpCC7NR3pHVWQ==
X-Google-Smtp-Source: APXvYqzZnNGqPSD3vArs3SakmjqhX6VWFn0ALBmonNglG9T+LJ+BbKMI6by58fyNuFtwOnHrIsVimQ==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr7558336wrt.267.1576227589265;
        Fri, 13 Dec 2019 00:59:49 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x7sm9090630wrq.41.2019.12.13.00.59.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 00:59:48 -0800 (PST)
Message-ID: <5df35304.1c69fb81.4a21b.e325@mx.google.com>
Date:   Fri, 13 Dec 2019 00:59:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191213
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 209 boots: 8 failed,
 200 passed with 1 untried/unknown (next-20191213)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 209 boots: 8 failed, 200 passed with 1 untried/unknown (n=
ext-20191213)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191213/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191213/

Tree: next
Branch: master
Git Describe: next-20191213
Git Commit: 32b8acf85223448973ca0bf0ee8149a01410f3a0
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 70 unique boards, 19 SoC families, 25 builds out of 214

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20191211)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20191211)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20191212)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20191212)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: next-20191212)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20191212)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: next-20191212)

Boot Failures Detected:

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

---
For more info write to <info@kernelci.org>
