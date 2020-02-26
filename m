Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2EA16F6D5
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 06:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgBZFLp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 00:11:45 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:39200 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgBZFLp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2020 00:11:45 -0500
Received: by mail-pj1-f68.google.com with SMTP id e9so764577pjr.4
        for <linux-next@vger.kernel.org>; Tue, 25 Feb 2020 21:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Kvvij1Ww9q4ocy4x859NlXUnf6eVlTgQrtW0kN+IOfI=;
        b=i9IKgKC+AkF3vCNl2MRfpx7PmDjExM8BLpK9WrIKYVFuzNBlaJvaBVoQit3ylaryUw
         U8kH5h8vKerDTsf3zWQ7LRtZxuqim6BMHrHCWs+veZStrNr1a4/Aykwag+8V/YW7diOZ
         mjjmJSHg5oS7nOetvaqnVWsaMruzo+R41+BboFWgHDovdccKJ/Ad4L3bruoiySxLaGmf
         t6K05eMzseMa3CWs1rv3cuPUULnrUzEVYJ/wijSmnfdBg3vMZMJaW1daY7E6iHLIJ0yt
         hj+mNAVc4C3NOcxrK8vWTTM0j9yQjjFOb9Lcn+B5HIWhuKOiGtWb9nrygz4pi/CkahBv
         4Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Kvvij1Ww9q4ocy4x859NlXUnf6eVlTgQrtW0kN+IOfI=;
        b=uYIEVZYC9WgbroNqX4pU97eVZ94ADoJ5SbuYCYRKG5gpUh/R1nziJKrjGphQ2MlK9r
         PGmJcB/yB5J5fQOp6RjK/TLJMAhJ6x2fvL2aGR2G8EWS5vTyvnFnnFdiJ5xG3hX+l7Oq
         Xv46YfQZ7u49wmOof4vfNswLOdjivWBqoHNAjQnKBggDUlZlhejbdNTvZvddNlpZdoSN
         OTa7Ff4O1kBptpFZw/iGSBXnpJ3eRqT2zT8uRl+oyQRw6wKDSLLy2SiYOQgow6+IhK/d
         mHC9qVgFbSDGtoIUvHPkaYw9cNwtiLz8dIDkh8m1ox9KtKdnlLb9DI+m2JOIoxba4HB3
         SGjQ==
X-Gm-Message-State: APjAAAU5VqhsxPMZhUVlwDqST9D02oEdCe/o3TevTXr73hoZkH7fkpp6
        HX59UCzyYApSCpKJrHyS1S5AVhb/kPo=
X-Google-Smtp-Source: APXvYqzL0jnEy502j/XrzmaPdrzyKepI5mwTfh/mfgBBvYPMSR4k3umRMY5F+db+hlWtfO7CjSmHJw==
X-Received: by 2002:a17:902:7c10:: with SMTP id x16mr855777pll.239.1582693903623;
        Tue, 25 Feb 2020 21:11:43 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d73sm911471pfd.109.2020.02.25.21.11.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 21:11:43 -0800 (PST)
Message-ID: <5e55fe0f.1c69fb81.34d13.3f5c@mx.google.com>
Date:   Tue, 25 Feb 2020 21:11:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc3-209-g2bda1ca06ff4
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 211 boots: 5 failed,
 205 passed with 1 untried/unknown (v5.6-rc3-209-g2bda1ca06ff4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 211 boots: 5 failed, 205 passed with 1 untried/unk=
nown (v5.6-rc3-209-g2bda1ca06ff4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc3-209-g2bda1ca06ff4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc3-209-g2bda1ca06ff4/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc3-209-g2bda1ca06ff4
Git Commit: 2bda1ca06ff44e6a93d4f9ecee872af670dfbe33
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 19 SoC families, 26 builds out of 216

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: v5.6-rc3-186-gfe83899e5=
f85)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 11 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.6-rc3-186-gfe83899e5f8=
5)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.6-rc3-186-gfe83899e5=
f85)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.6-rc3-186-gfe83899e5f8=
5)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
