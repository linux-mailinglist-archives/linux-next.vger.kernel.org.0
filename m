Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138F8621F6A
	for <lists+linux-next@lfdr.de>; Tue,  8 Nov 2022 23:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiKHWlO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Nov 2022 17:41:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKHWlN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2022 17:41:13 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760D060356
        for <linux-next@vger.kernel.org>; Tue,  8 Nov 2022 14:41:12 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i3so15040350pfc.11
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2022 14:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lP3TqeFjc7ueHUIOTawcwmM7w1bFMSONIgQpgvbdeUI=;
        b=hJ3WgtBwy0X7VYQbK7SN11ETBuGQlsch0UsEJrLzxN20p1YrBlbpQ180PAaQweOpMt
         ZYBBEbHlm3TH75gHDVBephM3g+hAbxcQYCwmIklD+WGJmt1ffl3SNsZMsFEzWEE7n5fJ
         s13hOg9YyUN+pVekjWlfcN5XdleFtrfqpZw897tDrzxZAs9EOxRQlq4410n7huj0Zds2
         dzZhNzI2JGUuxWUoTE8yMRQ7ApadDl8RudzQomqwYuh1dB71i/zGtSsltjOqglxi11Gm
         eo/BvEPRLjsa2VsXbzvrV8SNagWhNN8j1Z1DNQwCj+6S6Ao4LB2QV3DNNhfO3wOXR6uf
         WdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP3TqeFjc7ueHUIOTawcwmM7w1bFMSONIgQpgvbdeUI=;
        b=1lkSN4IT8rYOccUXR15FtGaLQ8JXLYa4z8xiyBR195SNM1gtWdjeZ0DUNRCrgaia5K
         8IxAqwl3Du0sj2n9Mmrmk7hHQe6LzQNmUoGEjAqc6OYCSs+1pfbmJZ55aXkGAJkDAhaz
         wrVP7aVc6YkU++w3rnd3Qjcj+ef3VPkzRIn3Z8yXUEXx9y+0rc35X0zF/VzqoLdRt/dv
         3hrEAfgCtHvTn6rsPc4nIGUefmdG0a7aiEyz+QOgIaa4LRqrjPUzLUo8n8Nl3V50JlPj
         BMIBO7BieZiJzArGxecC69djQ9c7wOu5OinIPTrLjnWEk9dXYbYg4jhNx6FJ1/b6DGOE
         /9qg==
X-Gm-Message-State: ACrzQf3Iusjv8MODAOnAzbXnx6nPla5YmDvLGp4LT5t5isx6UD4I6vAr
        O2Abgod/4NSnYXHKwx6A836sH0x9YimD3BL0
X-Google-Smtp-Source: AMsMyM6eYphbi3yBI/H9+CW4DzYbDBqrcbn13MaQFkr07IHniQmEEdMtJYQSELEkNw14o3F/s+x7TQ==
X-Received: by 2002:a05:6a00:cc9:b0:56c:b47:a73e with SMTP id b9-20020a056a000cc900b0056c0b47a73emr57318840pfv.19.1667947271794;
        Tue, 08 Nov 2022 14:41:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b00186fd3951f7sm7437515plh.211.2022.11.08.14.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:41:11 -0800 (PST)
Message-ID: <636adb07.170a0220.1ff95.c9f4@mx.google.com>
Date:   Tue, 08 Nov 2022 14:41:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20221108
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 10 runs, 5 regressions (next-20221108)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 10 runs, 5 regressions (next-20221108)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221108/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221108
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b6fc3fddade7a194bd141a49f2689e50f796ef46 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/636aa824156f673ccbe7db63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636aa824156f673ccbe7d=
b64
        new failure (last pass: next-20221107) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/636aa5df068d22c3bae7db8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636aa5df068d22c3bae7d=
b8b
        new failure (last pass: next-20221107) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/636aa80e1c787909b2e7db71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636aa80e1c787909b2e7d=
b72
        failing since 117 days (last pass: next-20220705, first fail: next-=
20220714) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/636aaaa498ed719105e7db51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636aaaa498ed719105e7d=
b52
        new failure (last pass: next-20221107) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/636aa5a3a22ad434c9e7db6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221108/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636aa5a3a22ad434c9e7d=
b6c
        new failure (last pass: next-20221107) =

 =20
