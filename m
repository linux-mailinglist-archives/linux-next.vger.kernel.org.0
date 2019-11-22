Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03E3107182
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2019 12:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbfKVLgw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Nov 2019 06:36:52 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:52854 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbfKVLgv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Nov 2019 06:36:51 -0500
Received: by mail-wm1-f43.google.com with SMTP id l1so7098483wme.2
        for <linux-next@vger.kernel.org>; Fri, 22 Nov 2019 03:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dKSDEhTcUNhGO2njd83/PiR9AQwuEijFfZA/ZO5hQn4=;
        b=hddggXjqQmFBIAvipFf8KoKvLCj15TMwbDpIPYQI0WTcsiHkOqd/FepULMfi1oZfkr
         Ysr46IBrNiDbeJ1Nrjt7rjANV7+ShdxzszNWdbU3TbFaBM9OiN0s34ivOcPAhjeAhpAm
         mfV2YfxDPExc4IVMBm//H1ThDw9w+utSri3LHB4hzQQATxZp0MQUMvmypRfgozNco//v
         ViCms4J2csf17KIx8AhVCtrKGO6u4tMK6Q/YV1fslr1j/gdkG7ifg6Ibsuq+82BXZgsT
         /VE8aAmlosS/tpAHEp2xFhTCaUmI+XiynWFJlz2ZdwFJJml+JXK6gY2A72bf/ToMDFGv
         Pfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dKSDEhTcUNhGO2njd83/PiR9AQwuEijFfZA/ZO5hQn4=;
        b=ID0LPPJ1olevGe+0m8Q5Gi2423bTriKJA25twq6mFRErnmZl/PG8LuhKPmTcYiMpB9
         UJTnVtptY99WKDEuoaMOKb+fK/hC5kKJMvI1kBqcjxZAFVUIDaXeR68otdr05dWABTmp
         MH7JsYMNVWXlFKPDvNG8uyDDEFnJ2pkRdmE4T0KhHyKGo0N4kICiR3Qq/c8o+YHC1rTi
         +UuEdq03eH9njpF2UuUPDW+HgfW6U+t2zRnKHBrhiPz68OA9NhDotHFffhDK+45ZQGri
         guMdcu6Ei30M1XdakP6foDl7RLqAMHBEZQVdwg90l+3dd+0av7Os6jw8fhc+/K5+1tMe
         R0aA==
X-Gm-Message-State: APjAAAW1lR1r+uxrp5MEEAq+BtyV2tcQOu2rXN2YVBPgBGuFTvWhPZfQ
        dOAX/LAX6H3Uy0ala44hGgw48cuGcl+ZLA==
X-Google-Smtp-Source: APXvYqwlDXCND66fy0qz/5AmPDxkcKplGepTn8p4S0P7EiUzydq6eb4WiRVR3nLoGf2WsXW2yXLnJQ==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr16497762wmc.55.1574422609297;
        Fri, 22 Nov 2019 03:36:49 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j7sm7802444wro.54.2019.11.22.03.36.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 03:36:48 -0800 (PST)
Message-ID: <5dd7c850.1c69fb81.be067.60b6@mx.google.com>
Date:   Fri, 22 Nov 2019 03:36:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191122
Subject: next/master boot: 269 boots: 5 failed, 256 passed with 6 offline,
 1 untried/unknown, 1 conflict (next-20191122)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 269 boots: 5 failed, 256 passed with 6 offline, 1 untried=
/unknown, 1 conflict (next-20191122)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191122/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191122/

Tree: next
Branch: master
Git Describe: next-20191122
Git Commit: b9d3d01405061bb42358fe53f824e894a1922ced
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 27 SoC families, 28 builds out of 217

Boot Regressions Detected:

arm:

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20191114)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20191121)
          rk3399-gru-kevin:
              lab-collabora: new failure (last pass: next-20191121)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20191121)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: new failure (last pass: next-20191121)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
