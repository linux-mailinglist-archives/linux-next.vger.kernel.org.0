Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C74BE95C
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 02:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387446AbfIZAJg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Sep 2019 20:09:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42742 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733141AbfIZAJg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Sep 2019 20:09:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so302753wrw.9
        for <linux-next@vger.kernel.org>; Wed, 25 Sep 2019 17:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YguGIL3j0kzDXRvgWkjVafX1Y2+fUTh1vXb0AUi4kYg=;
        b=WcPaqA6DaqlvmJu5sheGjy33uyCmTZ1k6QGFyTFnN0q1jmNdSEL8mXQSC4gapK90Cn
         efg936RBUQEIn7yPhqSV6vuPpMITvDf/oQDTzH2SYOATq8O98qJqwI1dfL/TC8NWfV4A
         wYU8xjykV2S8iFbTIT0f50rgUjy7PGHepDY2YF145F6MT05c1zWD9X8G1I6dwbT2drx2
         h8UgA0ZQNGeDEvPAWFNSTwLCHxESYf9GWG7/n2Kp7HMMOhKXwtwzdxyOCh8XrB5BmU25
         9PQVRpRkxXlT9A7BOgmu8AyFfPjxVwILzP1ht1S590xmTZKRxCwYejGuGRbd7JeGJ17G
         VhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YguGIL3j0kzDXRvgWkjVafX1Y2+fUTh1vXb0AUi4kYg=;
        b=HO05YrCbKnBerA+LqJv/Byd0JQTXT5U+cQTjE9KxXxDu4VGHVfPhafMA/Do1bYfzCb
         nmrK+OWafwiWSfcsCPxPLUzf2DchnPrQ35D50ufYUJKP/nHGt6d5sMQoIRFSL6NPbQb0
         BQyQfU/4d2BGKlatAMAdU5ZMWtHvV/TuGdohtVhLWG8YZuNv7xh3I7pKNjvrV6v2tyPh
         6UqEyOi3B8rA61B8ZaSksmdi+kyRraps7ab7WlqjDoXEq4oeqFiZ3tQ0lHZMEuQpy8A4
         s+uvpG9RHxtkFTUJH67LLXRrDFivf2pEQs9EanNMclGd7QHhqMv2A7ydW/PQ9Rj1c2vM
         ++2g==
X-Gm-Message-State: APjAAAX59bXncDKSinJ1BL6Y2K18jZLIp418KUeZApYpnlraALkFf02J
        ZRi3amQpBU6h9hAQ4Ev4LTZSj30qK3rddg==
X-Google-Smtp-Source: APXvYqwZHeEeC1JHIT+xZipnzZ0QcnA5JEtsa75HtfPVnZEJ3YVFBoTDTQL0d6n5wLZPfXcynw7hNw==
X-Received: by 2002:a5d:6306:: with SMTP id i6mr638777wru.323.1569456573099;
        Wed, 25 Sep 2019 17:09:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k24sm8388464wmi.1.2019.09.25.17.09.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 17:09:32 -0700 (PDT)
Message-ID: <5d8c01bc.1c69fb81.f693c.7053@mx.google.com>
Date:   Wed, 25 Sep 2019 17:09:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-12544-gec3b4fcb56c6
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 259 boots: 8 failed,
 237 passed with 13 offline, 1 untried/unknown (v5.3-12544-gec3b4fcb56c6)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 259 boots: 8 failed, 237 passed with 13 offline, 1=
 untried/unknown (v5.3-12544-gec3b4fcb56c6)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-12544-gec3b4fcb56c6/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-12544-gec3b4fcb56c6/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-12544-gec3b4fcb56c6
Git Commit: ec3b4fcb56c6cbd4d7e6efd5cd99708fd3569d7b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 27 SoC families, 26 builds out of 214

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
