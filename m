Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3531A1265
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 19:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDGREB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 13:04:01 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:46387 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGREB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2020 13:04:01 -0400
Received: by mail-pf1-f175.google.com with SMTP id q3so1064397pff.13
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2020 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eqD2LaVgN1MCSRTq8pvY3HPMN270vXi1WysictBPQO4=;
        b=jJffwdHwpaTQ/8lBe0NINyeOZOnixkORrqsd7dRPA7hxZyEx5EcNJBf/RNXMrqQ5x8
         kQRIfLKTfjXVjInD7u4P6sobvxG8bS9eusG8dxBdYlKWe6HQhmuFA9bmD25qSm7aW2XZ
         qPfrj2WMlzHt0H4FtNL74+JJCpeAjJyfu1NjmypsGVZ7gv7Z4lNNXtQSSIzhdH2sx0gq
         Xho+q36JpjDZAGNKcdl4tsUL+oHbvZAjs/UEbNELsDMznlLfAMBxi5MGVfEhN16yh1I+
         Ayvo25ePprLPs4W5LtEp6OJkXz6N7U/I/aQoH3Dto7z+qbqgYEbGDdGp9BQb/XFKCMCJ
         grwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eqD2LaVgN1MCSRTq8pvY3HPMN270vXi1WysictBPQO4=;
        b=tSbPfxAFYpDDY/AOSAwbA/W0CSoegUgDcydIUHL3qZkkgK4dPE1UglvSSvhOzyQgzD
         HQToYDAvf/EjWrSb1CI/0n9nxHe16fQLZwQqJLsNKg+0K2Uzm+obLVWSP3iIGUnn2SWG
         Vc5XDDcxuz/Rj/Tg46ACVVnFfnGhjh8hyVCnGpF9Q/Vku3C3yG+3RAiUJZwTHSYsMMaf
         JdZvbjjPZZ5J7irIGwewBeh++V6L1N+mNuylbOZXSabjXNpT7XpVTZ1duH0XLCx4CTwx
         3f7gRd6Xz3xdn9j9OAxpSXX3NiUAB41ZqGkJ2qeefw5i1MOoY11it4F6qATCRdwScys0
         4fkQ==
X-Gm-Message-State: AGi0PuZetjrHaIJJlI3ABob1SZkWY9CbwMNwFEJQnhiSgqsrVidtzRSQ
        qXlNGBiD0XAslqFXkX6h/GXmP/xfWYI=
X-Google-Smtp-Source: APiQypIN6IvdhxoI0OW9WaaDEFkjQOFJniM5OIHyiEl/g5L0aHhjFkIZQ1i+zS4xx5rmzmG+66P/EQ==
X-Received: by 2002:a63:8948:: with SMTP id v69mr2947628pgd.318.1586279039718;
        Tue, 07 Apr 2020 10:03:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q123sm14669363pfb.54.2020.04.07.10.03.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 10:03:59 -0700 (PDT)
Message-ID: <5e8cb27f.1c69fb81.3cc7e.503b@mx.google.com>
Date:   Tue, 07 Apr 2020 10:03:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200407
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 277 boots: 4 failed, 267 passed with 1 offline,
 5 untried/unknown (next-20200407)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 277 boots: 4 failed, 267 passed with 1 offline, 5 untried=
/unknown (next-20200407)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200407/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200407/

Tree: next
Branch: master
Git Describe: next-20200407
Git Commit: 5fab54423a0a88c4333e802155eeee944e82195b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 103 unique boards, 25 SoC families, 30 builds out of 228

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 49 days (last pass: next-20200214=
 - first fail: next-20200217)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 11 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            stih410-b2120: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
