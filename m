Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B01180124
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 16:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgCJPGE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 11:06:04 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:36775 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgCJPGD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 11:06:03 -0400
Received: by mail-pg1-f173.google.com with SMTP id c7so697168pgw.3
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xZrONkrYPpI841BZd6erSC1fke62KKghVSvsW09baKI=;
        b=G3bRJ3yz/eQyFp6cTeO+AGn/MPd/enNdkxMo2WUOfJuSNy8dpZf4Ngi/nvYIU7xNUY
         bqNpk3a4S3JAgqT7uz9zNttcxxF2Z0CoAnVuJfThvpfIegn5DbamzNvCquH5uz5rLPnt
         onZ0ZrgTRqUPK2T7TWVC8bWIdbmG8VfFELaofMmo8AzSuEcgqxqccf5ZNAhv789wZa1D
         dP4TvUxI1Y2534r3crlsAQzLq6wo05IfOyxmNUd3/L+h0HF6ka0RWkTMiOIuacDgTEhe
         HPrvtUIkJWxEKH59YN7JYPncCXUnTb35QKALfGmoumDDri5aQ9NurJO/QsAMXzNtRW98
         Deow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xZrONkrYPpI841BZd6erSC1fke62KKghVSvsW09baKI=;
        b=Z2IEJfQvBvX6YqKUfGNjvbAvc15ngPXXEmK/wlssjxjWngwbO6+9Ry4GLQIxXwZaO6
         JMAxm7lMO5T/V4VL1/6E2yyxBWw3y2lF+f+RzqUP9aetn+03FN69wVCjWuwGEPoAlFzQ
         WpKX1qKSdeef5lJUZqPD0fczH+vZ+SEtL8cdiyHcfnO+Y/DQzggr7VYfzYowS8yHeOOh
         7rjS6BwaOO24bJKes75hSBPou9cWBBV4HOtGyxkPbxsM7v++TvzXlIYMGdcPNAA1G+RH
         2u2T5Wf7hKMUWFpfPn6/lRhV+mxTLV8Ku4bvvJjL1Vkmv0/SAp/IslGoKEVj/mBC/w1v
         riyw==
X-Gm-Message-State: ANhLgQ3PqGCkzQTr7C2RJwn5b21y2iNbsr0ZrjzVPsAgb7uCAUW2IvVS
        ynkyAa94C9zWNZL6xrL8czg6VBO/XDU=
X-Google-Smtp-Source: ADFU+vvmEtDItxpdAasizshgvemMcms8J9NRpRdAhBn1LJdyhhf8ISFUgJ0BrE7Q/RsWD+38ukAnow==
X-Received: by 2002:a62:14d7:: with SMTP id 206mr5739021pfu.43.1583852762147;
        Tue, 10 Mar 2020 08:06:02 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r10sm43706282pgv.25.2020.03.10.08.06.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:06:01 -0700 (PDT)
Message-ID: <5e67acd9.1c69fb81.89d00.769e@mx.google.com>
Date:   Tue, 10 Mar 2020 08:06:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200310
X-Kernelci-Report-Type: boot
Subject: next/master boot: 78 boots: 4 failed,
 72 passed with 2 offline (next-20200310)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 78 boots: 4 failed, 72 passed with 2 offline (next-202003=
10)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200310/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200310/

Tree: next
Branch: master
Git Describe: next-20200310
Git Commit: 134546626849cd6852d6d4bf8f207b5fbc54261b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 54 unique boards, 18 SoC families, 24 builds out of 329

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 21 days (last pass: next-20200214=
 - first fail: next-20200217)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
