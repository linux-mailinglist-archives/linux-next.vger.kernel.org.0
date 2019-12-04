Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF951122EC
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2019 07:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbfLDGch (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Dec 2019 01:32:37 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42313 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfLDGch (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Dec 2019 01:32:37 -0500
Received: by mail-wr1-f68.google.com with SMTP id a15so7033650wrf.9
        for <linux-next@vger.kernel.org>; Tue, 03 Dec 2019 22:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X8GB50Szuyd85J1LvzZsTNPJcDI0OdJi3CA2uXKX6K4=;
        b=1nh3jbqHzzjmHzTMLxz6NJ4DC8PAGfs3fb/7e9JZLJDvVho+3OngI81WdYkxk0kvZj
         I9SBUVLU9Y5Vml7wFHmtLHmQLkaolJgz0M8nyuemAzPfNILQZ2GXXuDs0cgl5C0zmOdE
         PIecpwg+wvSikjK5c8q5zyeF//lKbaR5kw2lYs2v2L3eArDdWhAkfze2IKjuVLaWPcKw
         mqCxbEaePnTz6p9LsxMwZd10GlQVCsYtUbGyPyqx4JxsHZAQSVF9PHREIObexfTz76BY
         IxNFXaNyGyTHk6WtwJbe2lyKQKnWb98szh9HWRiS/IRXOD6Jynan0TqKV4HQP03ipNfP
         bhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X8GB50Szuyd85J1LvzZsTNPJcDI0OdJi3CA2uXKX6K4=;
        b=Ghd5CJoZPyT1mHnWnfykFGk4a5lEJKDwMzYDX0BWqyayli+jfZeJumC5eCMDNa0KSr
         imDugch1iRyzPfi9TDtgPQZLU7kKh3DrD6t7OaWxzli+cXHisSNOT0r0HpuE6fqAcrZk
         y7g6LMwdAdlO5rUGjkHMQeRPtqOzYGqlyfyhi8DhUP0ECe60Xw2e8vguAeDr5hy9zWPf
         L/NZ0Dv3V7aIVg8gu+sRD/37lt3qbeh8V7m3fCZj0K5JBLsknu+YKgdvtPbqUYGuuE4h
         bRoiJX63T9vw3A4HSR0nDjVyc4LIig29EM0bsCIg3mYdudiEC9f2l/JkZFOaXFzAnDP0
         YTZw==
X-Gm-Message-State: APjAAAXwKvGfacCCUCRDOPhAVQqJJN3vQ3UM3A/cn3S9X/bdy1Cf1zhE
        JvIUBvKjTlp1TXoHxl58mpb3djgaoT/Itw==
X-Google-Smtp-Source: APXvYqy8ah+NpRa3MP4t42Db8HMoFb4w0x6p3ZNVjb4mSUwH9bw5KlI87OnniV6X0eXPJlhnC49x1g==
X-Received: by 2002:adf:a746:: with SMTP id e6mr2114260wrd.329.1575441155146;
        Tue, 03 Dec 2019 22:32:35 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z189sm5956340wmc.2.2019.12.03.22.32.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 22:32:34 -0800 (PST)
Message-ID: <5de75302.1c69fb81.522cd.ca37@mx.google.com>
Date:   Tue, 03 Dec 2019 22:32:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-11300-g134822e3bf48
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 192 boots: 3 failed,
 180 passed with 9 untried/unknown (v5.4-11300-g134822e3bf48)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 192 boots: 3 failed, 180 passed with 9 untried/unk=
nown (v5.4-11300-g134822e3bf48)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-11300-g134822e3bf48/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-11300-g134822e3bf48/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-11300-g134822e3bf48
Git Commit: 134822e3bf48e0a7a2487cef55389e3f6bb5fd85
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 65 unique boards, 18 SoC families, 25 builds out of 217

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: v5.4-10738-g642f47bd48d=
8)

    multi_v5_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: v5.4-10738-g642f47bd48d=
8)

    multi_v7_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.4-10738-g642f47bd48d=
8)

Boot Failures Detected:

arm:
    davinci_all_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
