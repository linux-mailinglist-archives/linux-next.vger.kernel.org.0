Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF8C8E8AD2
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 15:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389092AbfJ2Oda (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 10:33:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38584 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388871AbfJ2Oda (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 10:33:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id 22so2667678wms.3
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8ELlLMv7jvNTJsOF3uzw0KRm7di3gvvVvPJfpAbDddg=;
        b=bquuvZ0tR5THxita1rjmdqauQBvRW6HZwiRuBja7lqLzJh1dsEPM0FExIYMaRtmgaI
         unURRkhbv8shosjVtbLTLa9uoCXMOk0XJBQysEVWRfH8XfMeGM7uWg3vOyMTdVzO5k9c
         w5lpz1I3J2VYNOZgN/V1PP615ytdIeNSJuSxQ2TF423Q8kyek/pkOGBeB1TtOfoJWnDa
         V1MyDzgMzr3hJCeQzojWXT6/OVk+ND1B1Vi3yFbjBUO7oEULsHTvi94JQxbXaZFFXlmb
         Byw3/32Cbuji4Why32EUkIzDKfq9mum+ok4pX1z2lOY+5HGtqHuSB6x0ilSbZ2oU0MzR
         imiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8ELlLMv7jvNTJsOF3uzw0KRm7di3gvvVvPJfpAbDddg=;
        b=LqZp4BaRNvK/Xd9fx0TCd+q5gdWVYYfhWJUJC8Zt68o3QsfS0IvS/oPpA4LH2DOsK/
         pCUL/s1l8VBNZrwjVdMOj472rnGUERWjHWgvCGVGX6rjyOdaZALY6kkYR/We5wizEI5B
         YRDY4FdYVhNRAvnQBGOFCqHhkuBsipdhLyRazhffCRbkMReTmx8YXXC2UM6od2rbTVWP
         aUrN4xaG333LW6DcUdWB+P+TFD4ANiY93eabWMr1qIycAPQrGhziYWwx+qywtLfynUKE
         KrnP27rE/38Yb16tHPdFWTEASmeQozIFnCU+yStKbF9FpD9suYUx2u4/eFQ39qXofHFV
         WAbg==
X-Gm-Message-State: APjAAAVMNvJjCVnLPhHClUb1SxcYJTODFF9hV1DU2oQOlYcu8STZu9xI
        iRQPdSpI4IEqSFzKwf+v+VF226dF557+hw==
X-Google-Smtp-Source: APXvYqwy163hyqTOGZHYOBTFsOwqhJfsERcSDYMNFMWxziE0DrCChTLSGlY0RNofQT6uGT/puJfooQ==
X-Received: by 2002:a1c:1a4b:: with SMTP id a72mr4422336wma.17.1572359608336;
        Tue, 29 Oct 2019 07:33:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s21sm20618324wrb.31.2019.10.29.07.33.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 07:33:27 -0700 (PDT)
Message-ID: <5db84db7.1c69fb81.953ec.9a1e@mx.google.com>
Date:   Tue, 29 Oct 2019 07:33:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191029
X-Kernelci-Report-Type: boot
Subject: next/master boot: 242 boots: 8 failed, 226 passed with 7 offline,
 1 conflict (next-20191029)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 242 boots: 8 failed, 226 passed with 7 offline, 1 conflic=
t (next-20191029)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191029/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191029/

Tree: next
Branch: master
Git Describe: next-20191029
Git Commit: c57cf3833c66cd86c9bdee7112fc992377143f74
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 26 SoC families, 24 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

    defconfig:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
