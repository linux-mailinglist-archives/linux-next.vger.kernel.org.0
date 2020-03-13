Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED991841B8
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 08:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCMHup (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 03:50:45 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55427 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMHup (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 03:50:45 -0400
Received: by mail-pj1-f65.google.com with SMTP id mj6so3593543pjb.5
        for <linux-next@vger.kernel.org>; Fri, 13 Mar 2020 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QG/QHAQebNOVYfwYFxATpWuWklAuXzaVexnab6RfLW0=;
        b=t2+o9XVX821Wl3J8SzldLds2xI6iRFJL0Rru/IRoo1ROGvvxG1J2EJTPmaxJbNrv34
         t2RloP7SNFg7pi/bWEsMifrzWTRqMyThswSMJtrP36hDzINAHUsv+pDvzGBI3Fi8k1p7
         XshmBToSDIXZhVS9bdB4c4OzXIHnfEhe7TcWg1mfZafuwQf1TTNi+uc6xF/LfrJ+PAiI
         EmdYrChJ497mRpcyFUtckaUlKpteTJeDC5q+X2BfyLHzOC9nshD/aJsU8vlMdewIsGco
         /PZCgOpRlW1HFjejH7UL2V99MLcZuusFIXGogAZi5UdnZ6cWUwnPoVvf2UM69Lf6O2oH
         mJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QG/QHAQebNOVYfwYFxATpWuWklAuXzaVexnab6RfLW0=;
        b=d8Aptc3JFxhl8K3gkpmxAjefqhQZhorqJp02QsvXCJreIeJpURU29AEXGXyoCjw/kH
         GZpZS4m1J3JRMI6hnW28MrGncjBTd36nBKah8zAT/CePZ16Tt46Zy0eU2XGTtZ2IbEfL
         QZll8iJBLWToxuG+nC5OMPoMTEXhA1d29qmRbQiO1PdxIwj9owaLFNirKPn3C5oYX4g7
         mmJu6MmQ8Uuw44UA1HFy034fXybqeKaPFvoXi54DXlwmn7+azEFMe9eLCNsMN/MTzkqU
         0YovN5v6cGxI/25Ks89CaCC4nsWfKHGoZI+03NFBvM3yK0m/Mq5Z0fG6kdp7eetPB0wA
         0xMQ==
X-Gm-Message-State: ANhLgQ2b1KKam5hKfK91I2GB3QBRHTkS/Mu5AgRthBWhlGeppLWCUipS
        xUjWCEQr8e6L8Oc0xtWAtYFguRZXd+w=
X-Google-Smtp-Source: ADFU+vvHCb+8sDv9OMLuU/3wgTa3qhjGxYJXbUHYhy/zlPbkK6+YmWpR4zWfl8DQLhUMlrvwIPKClg==
X-Received: by 2002:a17:90a:bf17:: with SMTP id c23mr7992023pjs.17.1584085844083;
        Fri, 13 Mar 2020 00:50:44 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x190sm58139825pfb.96.2020.03.13.00.50.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 00:50:43 -0700 (PDT)
Message-ID: <5e6b3b53.1c69fb81.b3b99.4e63@mx.google.com>
Date:   Fri, 13 Mar 2020 00:50:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc5-338-gb1d59e1cc3e8
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 199 boots: 4 failed,
 189 passed with 5 offline, 1 untried/unknown (v5.6-rc5-338-gb1d59e1cc3e8)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 199 boots: 4 failed, 189 passed with 5 offline, 1 =
untried/unknown (v5.6-rc5-338-gb1d59e1cc3e8)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc5-338-gb1d59e1cc3e8/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc5-338-gb1d59e1cc3e8/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc5-338-gb1d59e1cc3e8
Git Commit: b1d59e1cc3e8bfcc5549add81ffbeec6e2b01b50
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 98 unique boards, 23 SoC families, 27 builds out of 216

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-294-g8=
78792b73893)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc5-294-g878792b73=
893)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-294-g8=
78792b73893)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-294-g8=
78792b73893)
          meson-gxl-s905d-p230:
              lab-baylibre: failing since 1 day (last pass: v5.6-rc5-213-g6=
83f454b6b26 - first fail: v5.6-rc5-294-g878792b73893)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
