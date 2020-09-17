Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E4E26D37F
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 08:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgIQGQ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 02:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgIQGQz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 02:16:55 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C678C06174A
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 23:16:53 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id k15so538600pfc.12
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 23:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MG+D/jehnuOrBkUXRxqyDpPm4vbsmMr+UHfiUzadRkc=;
        b=quEDCvf6WmTDiidTB1VYx3aJgJUZA3zWjE0jPyyWjXknPhnStXQDNvIxYpi3ynOEQS
         l30Y9BvYC0IXYtlBnOE5rJRFP1gTdMAjcNQTWfnATs4UlqRZxIPw1ac8P5LfUKGhA/rD
         w63RAc4XPzPejD6FoaJJ+v4yK6gXs2JpsKpJbrPPHZ+JxjryOf23zRh7Yg33LmqL6VBZ
         9pAOcSGYnL48G0yMC61BFFjeRf128SY5oluMipj6X6qM8HQ12m0JeFq+0wkQPNNpeIcC
         6aKzcaZFVPyA1wUa69dka8C8u+/IFF3FlLvvLOgukpMnNH6E9RCi6Mcn2E3HIR2Dv9aZ
         mufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MG+D/jehnuOrBkUXRxqyDpPm4vbsmMr+UHfiUzadRkc=;
        b=kQMlzzHq3dFsi51LHVTHzUCLrMY0KGZv/uylJMK46c6XeSi9QFK466V6PURC6T26GH
         WxL6ydEUZdgCxHeebcR5O5s3s+fBCZjHm5uCIgkENPQRIlMQZ0zDwFEHzuVTQqIugQ/Z
         ZMJgmFCDh7Ic7bEm1sID0StiZOueD9AVqtCkvb3kGVAFsDS8ecirALl4VGyosk7Rn0lU
         Zx+XDbgSAYMM9Z3xGud4S57mSV28q4go5sjCqIq3t581kkOXNP/iYvaLEiqkyqhK0dOM
         jNqXed3dBkvX0mBsmw+FIfkJN/VKGCFH3Qf1yrox7wMEPt2BKT+4uYtKLPLkX1PIn7N7
         k82Q==
X-Gm-Message-State: AOAM533olXfh5yuBXk9DMb1d6A5zYFi8+DN3X+A7wlvYgR1ufKq3Bf1B
        UFHBR5HG+Ya6oH+3OfD/POlglFb00BVVMw==
X-Google-Smtp-Source: ABdhPJx+/qA4zg99KvXiHiSbGsztcgZzQr3qvRj3vF3OWxMxt11ot6/iqc9Mmag4W6unjmmR76c4kQ==
X-Received: by 2002:a65:624e:: with SMTP id q14mr21853918pgv.307.1600323411494;
        Wed, 16 Sep 2020 23:16:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 124sm19362891pfd.132.2020.09.16.23.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 23:16:50 -0700 (PDT)
Message-ID: <5f62ff52.1c69fb81.200cb.1a57@mx.google.com>
Date:   Wed, 16 Sep 2020 23:16:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.9-rc5-318-g177467af003a
Subject: next/pending-fixes baseline: 343 runs,
 6 regressions (v5.9-rc5-318-g177467af003a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 343 runs, 6 regressions (v5.9-rc5-318-g177467a=
f003a)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

bcm2837-rpi-3-b-32    | arm  | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 2/4    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc5-318-g177467af003a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc5-318-g177467af003a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      177467af003aaefe9d0d9ded64014748b066f1da =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f62c3568a5f78e5d7bf9dd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f62c3578a5f78e5d7bf9=
dd6
      failing since 134 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b-32    | arm  | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f62c2e21a97c5f89bbf9dfe

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f62c2e21a97c5f=
89bbf9e03
      new failure (last pass: v5.9-rc5-253-g8562c805780e)
      4 lines

    2020-09-17 01:58:46.901000  kern  :alert : pgd =3D e1db5312
    2020-09-17 01:58:46.902000  kern  :alert : [ef887d40] *pgd=3D2a463811, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f62c2e21a97=
c5f89bbf9e04
      new failure (last pass: v5.9-rc5-253-g8562c805780e)
      29 lines

    2020-09-17 01:58:46.907000  kern  :emerg : Process udevd (pid: 97, stac=
k limit =3D 0xfb7980df)
    2020-09-17 01:58:46.908000  kern  :emerg : Stack: (0xc418be28 to 0xc418=
c000)
    2020-09-17 01:58:46.943000  kern  :emerg : be20:                   c418=
be54 6a254378 c418be4c c418be40 c0242a68 b6e75125
    2020-09-17 01:58:46.943000  kern  :emerg : be40: 00000177 ef8826b4 bf0d=
24e4 bf0d7000 ef886c04 c090394c ef88677c bf0d230c
    2020-09-17 01:58:46.945000  kern  :emerg : be60: 00000000 00000000 c418=
be94 c418be78 c0244190 c0244040 0000ac7c 00000000
    2020-09-17 01:58:46.945000  kern  :emerg : be80: c418bf24 c4255540 c418=
bedc c418be98 c024a21c c024a0b8 c418bec4 c0e04248
    2020-09-17 01:58:46.946000  kern  :emerg : bea0: 0000ac7c 00000000 c418=
becc 6a254378 c025f9cc c4255540 c418bf24 c4255540
    2020-09-17 01:58:46.986000  kern  :emerg : bec0: c418bf28 c0100264 c418=
a000 0000017b c418bf0c c418bee0 c024a43c 6a254378
    2020-09-17 01:58:46.987000  kern  :emerg : bee0: 7fffffff 0000000f c0e0=
4248 00000000 b6e75125 c0100264 c418a000 0000017b
    2020-09-17 01:58:46.988000  kern  :emerg : bf00: c418bfa4 c418bf10 c018=
1ca4 c017f9e4 7fffffff 00000000 00000004 c418bf24
    ... (18 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f62da86c94a9f471cbf9dba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f62da86c94a9f471cbf9=
dbb
      failing since 43 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f62c7e5e6872ca0aabf9de7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f62c7e5e6872ca=
0aabf9ded
      failing since 42 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-17 02:20:15.922000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-17 02:20:15.927000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-17 02:20:15.933000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-17 02:20:15.939000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-17 02:20:15.945000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-17 02:20:15.951000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-17 02:20:15.956000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-17 02:20:15.962000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-17 02:20:15.968000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-17 02:20:15.974000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f62c75cd6cf4d5cf6bf9dc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-31=
8-g177467af003a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f62c75cd6cf4d5cf6bf9=
dc7
      failing since 42 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
