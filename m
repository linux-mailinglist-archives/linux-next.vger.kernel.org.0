Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E942A10F834
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 07:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfLCG7g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 01:59:36 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38073 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbfLCG7g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Dec 2019 01:59:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so2155020wmi.3
        for <linux-next@vger.kernel.org>; Mon, 02 Dec 2019 22:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qS5WLTTMnCKFwjZcEWYIXh9QWpsJXc0V7Epo5is353E=;
        b=sQce/xiKvpb81csyO5DgOYE2sscTIGdV3ZXXX5uPdY/fVxtn4lCEqar2+W2Yn8nVlS
         ivXPrQxZqHLdWuHR6qcuRD9cgSNzTE2nFks8NSSLa5DwPZiu20nTNNwDq6MzZ5hcVR5C
         vBp5xPcOwfAN/K+5WmSCSEwbfpQS1uy2EyeEbICMIMDXG+eT8lp/nqgZsDtouHhGs2Et
         5M1wlsbqOtqNMXF/TNGd7SfUKwE/wsCIo1J4BM0hZg2Zi2lxLAKs5kDPxH67uKcJQqxh
         ufnihVXckQ3jv9C8Lb2rMYg4wCNzA3OefV0SILNnOpqBZDEzAesQO/3/tMhXqd3TLpmG
         47Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qS5WLTTMnCKFwjZcEWYIXh9QWpsJXc0V7Epo5is353E=;
        b=caX9ZttKmT7LKtitrj5jmq6CbIhIVfd0DuA5pu8bN9++iRnIMPeGJZcPytJV73qnPM
         V6bX7vbtPe024OQxRuXqmzyrwjK0doSbKxk06YJeHcJl5EXXNx5tz/dHNT1dNI+vPe2L
         PrAAap1PhuE6/BHstdwLWJZg35GCcaCxP7Mg+0mxg3N2Jav01Zw+HyEF9pFLPjlP3zmA
         Er//vzzL/2fwWEFpkJvY3xZwS5jencokoc8sD3erenJOUpcIFEg7L1IfFiKVxEqlD9Mp
         6/PnPIVAGZ/Afkh41yptedwUM7bGvgdMgtF33hdqpQNJ9mzW9Z4WCKMhiw1gdN4YKIrL
         I8xg==
X-Gm-Message-State: APjAAAUshUzVUkP24mytlVB6Hrw8/xsCYiFNsKMhIW68AfTGi8voUnAE
        u2dtS9nrkJcf9AOLcJfa4BnbjlKgPQajvw==
X-Google-Smtp-Source: APXvYqyOrZpgZK/gwdxz/677aEc2SooFKSRR4ZWvvLyXv9+US8NiACj1IK5kHWTQYkXXisoLObDcOw==
X-Received: by 2002:a7b:c632:: with SMTP id p18mr24063902wmk.175.1575356373712;
        Mon, 02 Dec 2019 22:59:33 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v8sm528498wrw.2.2019.12.02.22.59.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 22:59:32 -0800 (PST)
Message-ID: <5de607d4.1c69fb81.d09fd.2e95@mx.google.com>
Date:   Mon, 02 Dec 2019 22:59:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-10738-g642f47bd48d8
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 277 boots: 4 failed,
 263 passed with 6 offline, 3 untried/unknown,
 1 conflict (v5.4-10738-g642f47bd48d8)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 277 boots: 4 failed, 263 passed with 6 offline, 3 =
untried/unknown, 1 conflict (v5.4-10738-g642f47bd48d8)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-10738-g642f47bd48d8/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-10738-g642f47bd48d8/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-10738-g642f47bd48d8
Git Commit: 642f47bd48d81aee3556985044904374e8726227
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 25 SoC families, 30 builds out of 217

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

x86_64:
    x86_64_defconfig+kvm_guest:
        gcc-8:
            minnowboard-turbot-E3826: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
