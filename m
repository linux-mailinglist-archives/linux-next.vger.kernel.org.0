Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6AFA5D33
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 22:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbfIBUqW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 16:46:22 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:53071 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbfIBUqW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 16:46:22 -0400
Received: by mail-wm1-f42.google.com with SMTP id t17so15815890wmi.2
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2019 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qGMazd3uNv4n1V2yR+D1lLzuBTXN98uKcRENY6uTC6Y=;
        b=B1pInJmc85ZKQfUV1ppIKYPxqdzswQJaNTBrmawCRuQ94ODI+mzSzpQodLLMyIQuPc
         xmkH1vY3Un+TuLTAOhOb3dunzgQtGERZML32ObjGgNMGM/QR2lL18j+eKfJ8Bd824lv8
         6RqNTl6z8V190+nfaLk2z992ITmdE0MJJODMbN3p9075BFhqcjUQwylPkPTkOMiXVGg9
         yHHbSC63rMByKXPtyVD4oR7vxSOSp251BWTdFe9Ejxl3elaZ1wurmNvBBRl51bG2R9f1
         ReY6uIYJCHFjfcE+Sb0Dax9LL5AIhktdHyDd+yAquN6xncRJeyuHqrVnL0lXO0PcY4RT
         Uudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qGMazd3uNv4n1V2yR+D1lLzuBTXN98uKcRENY6uTC6Y=;
        b=mqo111c6yVF6oSwTk/nDIoR6nqMBfHlY5OVEnTBN5Bowgjm9CFcpJ3+3QYjXye6ISf
         wUoJIOgKWJLZkRDRu3lLtn+vm7DM1mMgYhRmyJg6tQ85GFw/WUtL+Dq1sIa4646NFP0x
         5fydSmf1amrT+MIIF9zdYlpC2AOtFnc+DLB24yQIiOyKHMDGWX8MtSigk7g+D6Xit64L
         mD7tisneWplCn2rwRa5T5B/81XpQOldiPEnL9Qxe/0JbZeE+mgBiZyYxqBGMIhN12gt4
         HjsEKra2MAe8rIXWk0p+Mz6qtbAXfkBt9eApOL3xkYUdwvKVu43OTLV/LS6KRWzF0pSb
         /dbA==
X-Gm-Message-State: APjAAAVyzm0nfUiBxWYzEVg6x21LuIJzjpenUJNz1TQBu7jUzy5SczTD
        hJj+MZeqgq8/m4p9NzsjH5x3GIZIWMa3JA==
X-Google-Smtp-Source: APXvYqw8ambzbRoTcEaOuK1UQRJ9ACYRktE7ogbYhddZz74fgKKRMMrZ16Mc+m8qgnhzwCoU5q9TNg==
X-Received: by 2002:a1c:4e06:: with SMTP id g6mr35579787wmh.149.1567457179888;
        Mon, 02 Sep 2019 13:46:19 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t198sm24476365wmt.39.2019.09.02.13.46.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 13:46:18 -0700 (PDT)
Message-ID: <5d6d7f9a.1c69fb81.153f1.e409@mx.google.com>
Date:   Mon, 02 Sep 2019 13:46:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-459-gc6e2add224b4
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 301 boots: 7 failed,
 281 passed with 13 offline (v5.3-rc6-459-gc6e2add224b4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 301 boots: 7 failed, 281 passed with 13 offline (v=
5.3-rc6-459-gc6e2add224b4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc6-459-gc6e2add224b4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc6-459-gc6e2add224b4/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc6-459-gc6e2add224b4
Git Commit: c6e2add224b4a788f4045d245dcae49ef819dde4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 28 SoC families, 26 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

arm:
    vexpress_defconfig:
        gcc-8:
            qemu_arm-virt-gicv3: 5 failed labs

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
