Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC44435644
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 01:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhJTXGX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 19:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJTXGW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 19:06:22 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11C1C06161C
        for <linux-next@vger.kernel.org>; Wed, 20 Oct 2021 16:04:07 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 75so23875397pga.3
        for <linux-next@vger.kernel.org>; Wed, 20 Oct 2021 16:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5u91WPR28CSKWTpnDra//0YccaUuMvkZTd2sl2OM/Nw=;
        b=Koon7N5mVYhFAsDkVv4Lnm/i0Gg75f4P0ohoNPzFHxFVfiBerq/o1cPJiyha9/ny1n
         j92+e8uHyGvvzgtTK6s4gIhgd66lK17UFPgPqWF+BcU9Fh+ydgPLLMQcppDpRrEwtmkC
         F3VvKSLApBHRXe86B+YbDJWllGbSgejDxcXUyWzWuGTwiN7KQt3hnyo+0XCPfYMlYLPB
         cj/J/EpdbE0NAm8kjjKXKYK369Px/PVLPVDTkcoGIq3p1hinDzIBcrPTTpV6SjANWV9b
         FNXFEL8A0s69PA/GWAgRmXQrffNXg2zbv97qS1l50TS7cRy32JiK5S9bGJUI4QcjAVEE
         oasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5u91WPR28CSKWTpnDra//0YccaUuMvkZTd2sl2OM/Nw=;
        b=C8s8LAEgp1zN2AdlUS7Glc4yzgzhshtD3khzkuluDGrOPlbf1NLE84ksNp+K0ErwdE
         I8PhnHL/3etbgBUTcROJc5LfmbW1isvctHRn8pz4qmULxm6Q2qRLmWeAjVSkJEr64vdo
         HZ2LsPhsUjVO7zxmk6G9YfP/usBjVK3Dl94+8WYmy6TvbSR/oQvPjB27njll6lAXdwHv
         ahchZpF7Znp0LGAn2B77XBXMsAWv7yiPjIW2VnOiPle0kNTce1UtbN9gyb48Rg8JlSs0
         z2SKPVIKfgBRBYXfhOTqR03TvQJX0filRPUIiK35vIuz6V442nQVBKKsjCu3JocvcSeN
         KXmg==
X-Gm-Message-State: AOAM532jYILQCXUlg0ItsnKLy1oRZxRll6arnDcIdBUjdBOzh6PeImZb
        QA1oYS4KikKuw9OHT7wzWMmSFOpw0TdMthsPqes=
X-Google-Smtp-Source: ABdhPJyyK9PiCoKFf3nPIhEd/VvlSjXFRNupfnVw72hebo2BTiyaMlcdIOWDLOi2NLk19JZCr1pq6A==
X-Received: by 2002:a05:6a00:1706:b0:44d:a354:b273 with SMTP id h6-20020a056a00170600b0044da354b273mr1651404pfc.72.1634771047085;
        Wed, 20 Oct 2021 16:04:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 11sm3545605pfl.41.2021.10.20.16.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 16:04:06 -0700 (PDT)
Message-ID: <6170a066.1c69fb81.8b308.a8a4@mx.google.com>
Date:   Wed, 20 Oct 2021 16:04:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211020
X-Kernelci-Report-Type: test
Subject: next/master baseline: 536 runs, 2 regressions (next-20211020)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 536 runs, 2 regressions (next-20211020)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211020/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211020
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      51dba6e335ff9d1f6f50b5cacced8598956e1437 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/617063f8a646aa639a3359bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211020/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211020/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617063f8a646aa639a335=
9be
        new failure (last pass: next-20211019) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61706688a5b4be87473358e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211020/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211020/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61706688a5b4be8747335=
8ea
        new failure (last pass: next-20211019) =

 =20
