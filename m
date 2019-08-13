Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E9B8BD7C
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 17:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfHMPpA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 11:45:00 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:34935 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727284AbfHMPpA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2019 11:45:00 -0400
Received: by mail-wm1-f44.google.com with SMTP id l2so1877750wmg.0
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KSkuU3Gm/7RblM7hFSgP4MS9b99YCcT0Hw1BKb2bOyw=;
        b=Fc0mJt3/HwT9RXEA7ktnJsrfpGYiHQyaJ2PkH3Q4goHlBlHTH5+IFSw+ivVOraacnZ
         lHogycMOodxYXDa9hCTQGRcyw6U96zocXBwBx1cXYSHOdIr74Sen9mlb2+BuubUu/dqV
         aas9dYWaKVac4GqIZQKhmhVxrwmXQFyCjdh06yO8XBwWNfe/ha8wnQo8CExI97I3WF7I
         schXvyVgpZPD55V27D53r0EphofCS/1y0p04hO544pd5Ul951hv+BEVJjj6pfDoF2RUi
         IL1qKB1vNw+Pvadm4JEDoyi1URbjVLIEhBYPbiA3vWMLF4mL6dLjNBSwRfkZGTr9+VX5
         VzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KSkuU3Gm/7RblM7hFSgP4MS9b99YCcT0Hw1BKb2bOyw=;
        b=me6Lq0MpzAEid9sR2PQL7FdbxGa/9i3QnXr7kBiLzieQ4CpDN7gnQsPy50u+0AxwPZ
         8HBxV31WktSyElFIeDtvK6DFc1N9J457edzsqfI0/BOBQK9wXGu5LLJ5urKnBZ3XggAu
         kE9wOuhYK2/h+cutt6CkMHi2SbOPQjVdXrZ9X5QM8N+/1giDyoxCAFk51AkKr3xLI838
         tJ01L4WpzOkfXCoQtMsibmoi5f/tVQwTi19+F2CvA8DAXDFzpcfJoM37MJKpI5oURKhi
         Hf+QSLqOlC59iog5EX6vGG4j/XNO1XFadTI87QYdBfmiKcEVF8d8ZZF64LKdPWRoe7pp
         T+OA==
X-Gm-Message-State: APjAAAV2uPNm2y+n0rU94LQKu/yfJ6tBKVAEoDduW68pWSDXhiVHy/tk
        L8lD/rQ5UNSoycMH7PmyM4qidaupeHGQTw==
X-Google-Smtp-Source: APXvYqx/EPom2Mj8KO+Mc6jl9e6qwF5EeqPAtjm1MumwQiS5X2HmyI51gBWV7Wfji1WEiyYWVXIHDA==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr4043379wmi.154.1565711098378;
        Tue, 13 Aug 2019 08:44:58 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o11sm1661561wmh.46.2019.08.13.08.44.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 08:44:57 -0700 (PDT)
Message-ID: <5d52daf9.1c69fb81.9a3a1.8cdc@mx.google.com>
Date:   Tue, 13 Aug 2019 08:44:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-185-g260510fdbaa7
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 229 boots: 6 failed,
 207 passed with 16 offline (v5.3-rc4-185-g260510fdbaa7)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 229 boots: 6 failed, 207 passed with 16 offline (v=
5.3-rc4-185-g260510fdbaa7)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc4-185-g260510fdbaa7/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc4-185-g260510fdbaa7/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc4-185-g260510fdbaa7
Git Commit: 260510fdbaa735cc23ae7fd8c2cf6be8982a5e94
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 27 SoC families, 21 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxbb-nanopi-k2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

Offline Platforms:

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
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab

---
For more info write to <info@kernelci.org>
