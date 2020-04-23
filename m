Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACDE1B5CBB
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 15:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgDWNkp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 09:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726361AbgDWNko (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 09:40:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1D6C08E934
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 06:40:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h69so2899396pgc.8
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cDCKDXVE8i3Sd52hcVQCDf94cNPllrNNRK+Pl6m9+WY=;
        b=Vz23DXj8l8SkjwHt8pdoYYOP7SUNL78pevVxaxg1UTkOMExsKFjRtHrwGC2Jp02bBt
         hXNZODlgngIUGSQDAlOFsxDqPiXYiWDp69sDVDGhvvVJ5+dtKL5hF4p6xd0/AbASkIuP
         OhW2uzaB5L451KhratIsqUyHMpvEsRvKFRiMmr9mQd4kgAgF4j/gxisMcgB1g3GJIqE5
         T+TH68Uei0qzEPIuYYlolnZX4LMU1rJPVZk3C1/sPJMWijqPzmKDZnM1gdsBSEbjOYM7
         gRNc/7QtVDUO/k4md+4/VnYrDuKO+CefzxLLakqIyO2BwSCITYKgAeZXvnYPVvyoH6w+
         upfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cDCKDXVE8i3Sd52hcVQCDf94cNPllrNNRK+Pl6m9+WY=;
        b=DBfNpic7ZVR0xvYfVrYF/GCIP0ob1TSjMOGIKGL4XSlNKYfXzR6FCX+2oPYKob3Q61
         B5k4RlzS6blxonMfCOxmxkyZ04nuioPJ/j9JzPv2msZUnsQ6Tj0qAKWrgdoymClurj4B
         IMmsT3InCmtZrsgw1qJKr2VjSNFpbq45PZZGW81W2fnSueb86Xw4OOGJKp9vbknsVfCE
         8K77qoNsT+HonVnyboWhBUsWblhURcA2CPyZ3vP2Q4rfhMfs0gEI7qGsCHIgQAo2sQFN
         4FtdxMlB5fkdeVHa9MRBAOmBcrt71aGySbuOvJ1d9k4r6fiWy+hVvMVec4kf2lVdxRx0
         VrCA==
X-Gm-Message-State: AGi0Pub6KHaYJvuWMR0fSccezYmAcu7l5XmxaUzV3E/tEkoJ0DvL+Zlq
        8OOFuTr77WM3lKv5mXqnKJmVDuYSDOw=
X-Google-Smtp-Source: APiQypK5hl2uzKVUdgKTFMGTq0Sf2Ub7JVqL55RF3yb+ItUNeNev7KN3a61Mo6uGwLMlCxO8Y7MhGA==
X-Received: by 2002:a63:b447:: with SMTP id n7mr3924689pgu.278.1587649243786;
        Thu, 23 Apr 2020 06:40:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h193sm2661246pfe.30.2020.04.23.06.40.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 06:40:43 -0700 (PDT)
Message-ID: <5ea19adb.1c69fb81.9b524.a451@mx.google.com>
Date:   Thu, 23 Apr 2020 06:40:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200422
Subject: next/master boot: 95 boots: 2 failed,
 90 passed with 3 untried/unknown (next-20200422)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 95 boots: 2 failed, 90 passed with 3 untried/unknown (nex=
t-20200422)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200422/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200422/

Tree: next
Branch: master
Git Describe: next-20200422
Git Commit: a5840f9618a90ecbe1617f7632482563c0ee307e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 38 unique boards, 10 SoC families, 23 builds out of 231

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200421)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-clabbe: new failure (last pass: next-20200421)

x86_64:

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: failing since 1 day (last pass: next-20200417 =
- first fail: next-20200421)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
