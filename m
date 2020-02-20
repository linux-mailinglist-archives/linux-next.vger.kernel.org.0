Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECA5165690
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 06:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgBTFLj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 00:11:39 -0500
Received: from mail-pj1-f50.google.com ([209.85.216.50]:37029 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgBTFLj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Feb 2020 00:11:39 -0500
Received: by mail-pj1-f50.google.com with SMTP id m13so369083pjb.2
        for <linux-next@vger.kernel.org>; Wed, 19 Feb 2020 21:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XeNBw+tlmSP/TB0rvXXGsTm+iUwZTIBeLRCchDfHEUM=;
        b=YxDueSch4PCYbUZQkze4ZLd5IrzWaOmHxTFBklIOdGvoeLSqMgchr7XR/f/zs5jNsn
         i4CLGua0AtGNHI6SAMDP8XzXURDqyM/rUtcmRGdi6fGFdfmSH75DMI05z/rkzHq7Qyrv
         TiuxTGgxp2neGMLFzBKRflck33d9HgJtn8PFfzbcVCIgDcgigP7dgo0DudPd9KbnD8hV
         jU0N3e10z76fVl8UP6cyYeu5i5f4n7UIRKx2RhSqOPDPPwplVYqA9Uco0yNFdPbFqdY8
         VnvKK5aV761rDhn5Ang70xSO5irWxC3iZFQqXDVjOa+lUOqvDf5c1PTRUvUVCz7RaEfh
         051g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XeNBw+tlmSP/TB0rvXXGsTm+iUwZTIBeLRCchDfHEUM=;
        b=D73MUXKpFboXFexOfDETefHFcm0vhV/rraOFYHpqy/PMbTRrwF+It2kmb4n/vQ4x99
         IgshBWRFVYvngIpBylWCJM1WZ2utJ8rzB61zAg/VVCBsGOQ6DfvbjXcjcZ34HobAb/Le
         tAlWKWwI0gXbODl3rUXLp0rX6OdRLoLNRO+vnoToO89MpsLlRQncf43cUCCGG+GvwQtH
         ukyjW/yZgNb0XuITvJCUgVhPApjR4hiRPcB1jQgQTTdiDQ5rljBOO+3NRiypDpjh3NsQ
         aD5CFeyR2cU2eHxrd/zU60l1W5H9kWNyva8rn4JVcbrAFxW+4EkJVSJ+YQjDG69ofBfO
         03fQ==
X-Gm-Message-State: APjAAAWrjmY/ZeXQ+tpW8uZEImVCTyDgNB8fdYlgVRjY046PWD01HJlI
        N24Dc3QESFLzyayA+LBE3WaHidL/oXw=
X-Google-Smtp-Source: APXvYqxPZKe/Sfk5khFBSE4zcILn/A6KYMIwaWP1MM/8Rc1rYsBsny8HQ3JcSJl4bVuBsjYN83g9RQ==
X-Received: by 2002:a17:902:b682:: with SMTP id c2mr29664198pls.127.1582175498023;
        Wed, 19 Feb 2020 21:11:38 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b133sm1489389pga.43.2020.02.19.21.11.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 21:11:37 -0800 (PST)
Message-ID: <5e4e1509.1c69fb81.feee6.5e07@mx.google.com>
Date:   Wed, 19 Feb 2020 21:11:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc2-356-g476afa8736ca
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 112 boots: 4 failed,
 108 passed (v5.6-rc2-356-g476afa8736ca)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 112 boots: 4 failed, 108 passed (v5.6-rc2-356-g476=
afa8736ca)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc2-356-g476afa8736ca/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc2-356-g476afa8736ca/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc2-356-g476afa8736ca
Git Commit: 476afa8736ca0bf87a17e0bf5a7e7b145f90744a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 61 unique boards, 15 SoC families, 17 builds out of 165

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc1-311-ge58961fba=
99f)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc1-311-ge58961fba=
99f)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: failing since 13 days (last pass: v5.5-9670-g2c=
46fb8a6882 - first fail: v5.5-9913-g2eb0c73548f1)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

---
For more info write to <info@kernelci.org>
