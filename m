Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF2F215829
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 15:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgGFNSA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 09:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbgGFNSA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 09:18:00 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE312C061794
        for <linux-next@vger.kernel.org>; Mon,  6 Jul 2020 06:17:59 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id d4so18368404pgk.4
        for <linux-next@vger.kernel.org>; Mon, 06 Jul 2020 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=31apjYe3IclDeEDnWlHQv3GbJ5P77bfhz70klXmspPE=;
        b=BWubZ4BTqroQF60ttE0AVhPvVKmU3759K5O3b5c1uapDi4nXgF4XbjYUmnuMpR9uKC
         IHWjFSGJgHN+c3nek1NJP+quoA7FfSVLauVPQfQI3mHIMLI0fQ7B7htKdtbNKbQcDNmG
         vUOfEvWs5m6QklhRAyeYOsLgm+GhBPB85V7VibQGWNVBNY/qtuk/cDwAaHMh0oq9z6+o
         Y6ostbNhASIJyyqOa7OmNsgBxLw8S8fdmAJjffhREL40i7vRNou8cs7yRf4K/cDV83il
         ToRk5Sc+dve7WBibNdxt+ETnp3jmUmJBq1gBK0nxWXGj8SgLpf9nBzttqrKfLJrLtyIY
         T+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=31apjYe3IclDeEDnWlHQv3GbJ5P77bfhz70klXmspPE=;
        b=oKXsoA6zwZzEUCo33dxX/ZSeDgLFkf2+e/BLZIIWoptmcEofcECSEpbwmdnG9tev4K
         ahrUZ5bTiFW/AyguYFi9iTiIfEgQKvt1SyJ5Y8vMk3gqcPCQwtgkRlXoi46uAH9zcVQr
         p04ctULdcGNSydxif3FLQb9D3y5gLHCdDvwZMq5Lt0VW9D2PvhND7wht/LFaVNioW1sq
         1Sl2KvtpHjeR6KqzUL3JRDn/QxNmNfkP3s/GWKTC4qbbGmFTTnfQT9SE02qC2jtZElnX
         nfweH2tSi09TsWSccoQWMO2QOtw4ePHivrtqLs38bfIGM/ljYuyl40SLy1TUyoUr3+oR
         kGzw==
X-Gm-Message-State: AOAM530QHnZ63KHP+SzX9lpFB1pfwM67piyty882FQCsIBHIL7YMy8z/
        whW/RRh8Qb1DIqSYUQ0Xreq6JXzlJ7Q=
X-Google-Smtp-Source: ABdhPJz0CTqBD3xSZLNOieQxNZOXT26SgGZHSouGlzuqZ7HRNHHBKgdCpTzESJ0XxMzKN83e9BZhIg==
X-Received: by 2002:a63:f903:: with SMTP id h3mr41632374pgi.437.1594041478629;
        Mon, 06 Jul 2020 06:17:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b8sm3332919pjm.31.2020.07.06.06.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:17:57 -0700 (PDT)
Message-ID: <5f032485.1c69fb81.c7255.7ace@mx.google.com>
Date:   Mon, 06 Jul 2020 06:17:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200706
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 193 runs, 33 regressions (next-20200706)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 193 runs, 33 regressions (next-20200706)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =

imx53-qsrb               | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =

imx53-qsrb               | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

imx53-qsrb               | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

imx6q-sabrelite          | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

imx6q-sabrelite          | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

imx6q-sabrelite          | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig           | 3/5    =

imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =

imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

qemu_arm64-virt-gicv2    | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2    | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 0/1    =

qemu_arm64-virt-gicv2    | arm64 | lab-cip         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2    | arm64 | lab-cip         | gcc-8    | defconfig  =
                  | 0/1    =

qemu_arm64-virt-gicv2    | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2    | arm64 | lab-collabora   | gcc-8    | defconfig  =
                  | 0/1    =

qemu_arm64-virt-gicv3    | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3    | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 0/1    =

qemu_arm64-virt-gicv3    | arm64 | lab-cip         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3    | arm64 | lab-cip         | gcc-8    | defconfig  =
                  | 0/1    =

qemu_arm64-virt-gicv3    | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3    | arm64 | lab-collabora   | gcc-8    | defconfig  =
                  | 0/1    =

sun50i-a64-bananapi-m64  | arm64 | lab-clabbe      | gcc-8    | defconfig  =
                  | 0/1    =

vexpress-v2p-ca15-tc1    | arm   | lab-baylibre    | gcc-8    | vexpress_de=
fconfig           | 3/5    =

vexpress-v2p-ca15-tc1    | arm   | lab-cip         | gcc-8    | vexpress_de=
fconfig           | 3/5    =

vexpress-v2p-ca15-tc1    | arm   | lab-collabora   | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200706/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200706
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5680d14d59bddc8bcbc5badf00dbbd4374858497 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f02ea3d08a809d09985bb8b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f02ea3d08a809d0=
9985bb8e
      new failure (last pass: next-20200703)
      1 lines =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx53-qsrb               | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02f1ba19ba868aeb85bb1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02f1ba19ba868aeb85b=
b1d
      new failure (last pass: next-20200702) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx53-qsrb               | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02edeb06f0072b1285bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx53-qsrb=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx53-qsrb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02edeb06f0072b1285b=
b19
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx53-qsrb               | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02ef355c51b2c46485bb33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02ef355c51b2c46485b=
b34
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02f192df30ff4a5285bb1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02f192df30ff4a5285b=
b1c
      new failure (last pass: next-20200702) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02edc749313b5e3185bb82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6dl-rio=
tboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6dl-rio=
tboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02edc749313b5e3185b=
b83
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02ef0cb93bf5f68c85bb21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02ef0cb93bf5f68c85b=
b22
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6q-sabrelite          | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02edc638fced7c0785bb1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-sabreli=
te.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-sabreli=
te.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02edc638fced7c0785b=
b1e
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6q-sabrelite          | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02f03d806c071c5485bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02f03d806c071c5485b=
b19
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6q-sabrelite          | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02edce7c064a83d485bb19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-imx6q-sabrel=
ite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-imx6q-sabrel=
ite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02edce7c064a83d485b=
b1a
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02f08177259c0c9985bb1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02f08177259c0c9985b=
b1d
      new failure (last pass: next-20200702) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02ee2406f0072b1285bb2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02ee2406f0072b1285b=
b30
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f02eecf6577f5319985bb2f

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f02eecf6577f53=
19985bb33
      new failure (last pass: next-20200703)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f02=
eecf6577f5319985bb34
      new failure (last pass: next-20200703)
      44 lines =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02f1cfe637624f4385bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02f1cfe637624f4385b=
b19
      new failure (last pass: next-20200702) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02edea874fd699f085bb27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02edea874fd699f085b=
b28
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02f08db957b2ebd785bb19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02f08db957b2ebd785b=
b1a
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv2    | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02e9bee58d2413b685bb2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02e9bee58d2413b685b=
b30
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv2    | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02ead2a6319a9d0285bb30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02ead2a6319a9d0285b=
b31
      new failure (last pass: next-20200630) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv2    | arm64 | lab-cip         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02e9e6630d3d877985bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02e9e6630d3d877985b=
b21
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv2    | arm64 | lab-cip         | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02eac34e1149922685bb3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02eac34e1149922685b=
b3d
      new failure (last pass: next-20200630) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv2    | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02e9db630d3d877985bb1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02e9db630d3d877985b=
b1e
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv2    | arm64 | lab-collabora   | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02eabb6cc629b6d885bb40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02eabb6cc629b6d885b=
b41
      new failure (last pass: next-20200630) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv3    | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02e9c3e58d2413b685bb32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02e9c3e58d2413b685b=
b33
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv3    | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02eaa86cc629b6d885bb2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02eaa86cc629b6d885b=
b30
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv3    | arm64 | lab-cip         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02e9c68c988de12685bb4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02e9c68c988de12685b=
b4b
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv3    | arm64 | lab-cip         | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02eaa76cc629b6d885bb2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02eaa76cc629b6d885b=
b2d
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv3    | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02e9d90f1a864b8085bb31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02e9d90f1a864b8085b=
b32
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
qemu_arm64-virt-gicv3    | arm64 | lab-collabora   | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02eab36cc629b6d885bb3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02eab36cc629b6d885b=
b3c
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64  | arm64 | lab-clabbe      | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f02ebcec35e2bc06f85bb27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f02ebcec35e2bc06f85b=
b28
      new failure (last pass: next-20200703) =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
vexpress-v2p-ca15-tc1    | arm   | lab-baylibre    | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f02e9a28c988de12685bb2c

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f02e9a28c988de1=
2685bb2f
      failing since 30 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
vexpress-v2p-ca15-tc1    | arm   | lab-cip         | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f02e9a3e58d2413b685bb1d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f02e9a3e58d2413=
b685bb20
      failing since 30 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                 | arch  | lab             | compiler | defconfig  =
                  | results
-------------------------+-------+-----------------+----------+------------=
------------------+--------
vexpress-v2p-ca15-tc1    | arm   | lab-collabora   | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f02e9a9e58d2413b685bb26

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200706/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200706/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f02e9a9e58d2413=
b685bb29
      failing since 30 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
