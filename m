Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DFCDFED1
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 09:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbfJVH5x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 03:57:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35815 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJVH5x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2019 03:57:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id 14so8493043wmu.0
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2019 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uk6DljN34bMvdNioM3nHnKTb74wrYg32afKOLcp8k9g=;
        b=QYfui4dRQXv3wG6zSvfu+1lBlvuVH7fZ15ES8/KcNDSGPtN/m1aEvS3sDEXulIOgqv
         4iwk6zw5TM0dMtsFCSMoy1BgJOQwVpgEfPgOG3a9kbTb6LBvGlMIfDkavlWGh15SZ+lG
         EkLw8wXZR481SJEDxSRZ/1KNSzVFQsLiW1Ai303jIqChMKZeuL3O4vpa1O8A9j6DzZYe
         +jsMaBW+4mFNVvukd/+mAklOEuifRMusux2bcupAJluYexJU4VsItkZdtvZhWbw8sFLZ
         ueuC7hdr2pOoTitMLW1ak36vDTbnLXa5dXU3yMVvlvVJaISWbUurBMRIl+85F1HHbTtL
         aFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uk6DljN34bMvdNioM3nHnKTb74wrYg32afKOLcp8k9g=;
        b=chBLPlChGjye6enWueUhe6qNNB144VkLModS4ZIAZ2lpEXqfBE8ovG/7lmW0evDR4b
         0SwbyACUT+h+TNswPckHeUu0s9Bt4BPP2+5ayChkz8dOqK8NGJVVRjuJRPR07C+3j7Zv
         BgonFIIYB1pOnr/nTc1Q4Othl7HVDRFu1ES/X5dQrWrz/NfE0p3jelz/dslzEN+W4FfK
         dJG0LFNb8WaAuFM/fqugytO1JaijnVuqNeIhu6RxfbecLzHBStNsmWNfoyC1HiF+Dtf9
         kZQzFhz8KWcQfJGQKfckqYpgXfnBYnSAbU2dkj+wVpM8yhX+BlckdghgQEtHefkZ+HRb
         96Kw==
X-Gm-Message-State: APjAAAU3H2291VV3sWk6N/ygw25mcrWxUmqLJNHs2sLdnPga8aLLbd7U
        tfVvDhbTaAbRKBZT/v9C7L7eMhlezP/UGw==
X-Google-Smtp-Source: APXvYqwfJ3xg+TtY/zaPfxxiQvWXsDMwr+NqcootoyZwflLj024DEVNxUu0se9empXG6nZvscZ58Ow==
X-Received: by 2002:a05:600c:23cc:: with SMTP id p12mr1680934wmb.163.1571731071282;
        Tue, 22 Oct 2019 00:57:51 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n1sm20470943wrg.67.2019.10.22.00.57.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 00:57:50 -0700 (PDT)
Message-ID: <5daeb67e.1c69fb81.95db3.6c37@mx.google.com>
Date:   Tue, 22 Oct 2019 00:57:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-262-gfd132c8ce23e
Subject: next/pending-fixes boot: 133 boots: 11 failed,
 114 passed with 7 offline, 1 untried/unknown (v5.4-rc4-262-gfd132c8ce23e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 133 boots: 11 failed, 114 passed with 7 offline, 1=
 untried/unknown (v5.4-rc4-262-gfd132c8ce23e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc4-262-gfd132c8ce23e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc4-262-gfd132c8ce23e/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc4-262-gfd132c8ce23e
Git Commit: fd132c8ce23e3ad02f83ee3c3c9fd19ac8acdbd1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 58 unique boards, 21 SoC families, 20 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
