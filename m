Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E81E94C83DD
	for <lists+linux-next@lfdr.de>; Tue,  1 Mar 2022 07:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbiCAGTC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Mar 2022 01:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbiCAGTB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2022 01:19:01 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401633FD8F
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 22:18:21 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id z15so13269082pfe.7
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 22:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iQ2CEeCtCBfVyoQowjsH+J4sxCPVcDgfkFgI7XHu7po=;
        b=srs6T8OuKApPUqRMxrioKG2q/bFb864X6Bmj1BlZSJWNMcJyssBZ/L8Nxm7472RgZ1
         EOTsoAXHrlcvVjxHcOtokb5AWD36AEkccgrjI6j031t8fhApOQJzex1/Dlvfd1LqvMDX
         YRjJTtYaD5Fn5sCwYaqVZ6RK8QxX0vqkqkDJ9NpjzvNFUb/A7XB3GUc3NRWAXh7FLQ4y
         6cyprRKLxMV6/LdiV3wwVVGq/7QsVzH4mTmqyRLxt6gHxxjsP0xoIZR1H8ZL9Ik//PLL
         YESpEOgtM4ymWzH4tul/ZJhUyXnLgxpXdyC6oKa08K58prCCGDrZduByhkfr8BKj8ZIr
         DAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iQ2CEeCtCBfVyoQowjsH+J4sxCPVcDgfkFgI7XHu7po=;
        b=1+m8iTfujyj2tb5bHZvKqnwoMzai0MUv/rffVVzUTCgZLTKuXtQSYABale6SwpkHUj
         bjOeu3y+fXIRkVb0r0A8VodvEttG0U5c1nz+qE6wZtc0hpLxCZFZk6Ik9JHouvEMNM6b
         InPC3UnDg1YQNenywbpSSbRZW0r1ad6XGn71UY6jb0DVzfZM7JbekDeAE07qYx+9aEif
         HXfKzWndcrqGPa8r75OjwxPLPDxCBP3QuFqScexyHN+CQrSoOfDvesf7iIW+uJYr1rWX
         f7LI+w9Zi/oS3W8XonfqiyUg32be/VeGit44D2XSioZKwcGyc1NFVnrnoGrWzC8PSaTL
         K6RQ==
X-Gm-Message-State: AOAM533nnjW+SlpjVJzxfDhqp13SdmrafQnT1uGFX0OgAYsrUji1/LmY
        8DYjSLiIWJa2omAyX0kc/wnVnSPX5M/jT8BliGo=
X-Google-Smtp-Source: ABdhPJwTvzHSsMf/JCaM4Uhg3YbUm/eGTfE+BfXWML07jr0aWQ1E8vD5cWTSxb5mAENuwe0XmiWolw==
X-Received: by 2002:a63:4d8:0:b0:373:cf6d:40e3 with SMTP id 207-20020a6304d8000000b00373cf6d40e3mr20525001pge.590.1646115500560;
        Mon, 28 Feb 2022 22:18:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q10-20020a056a00084a00b004f26d3f5d8fsm15622352pfk.25.2022.02.28.22.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:18:20 -0800 (PST)
Message-ID: <621dbaac.1c69fb81.f06af.8352@mx.google.com>
Date:   Mon, 28 Feb 2022 22:18:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220228
Subject: next/master baseline: 501 runs, 7 regressions (next-20220228)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 501 runs, 7 regressions (next-20220228)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora | clang-14 | defconfi=
g                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson8b-odroidc1             | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+ima         | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220228/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220228
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6705cd745adbbeac6b13002c7a30060f7b2568a5 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora | clang-14 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/621d86691b8b2aeceac62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig/clang-14/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig/clang-14/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d86691b8b2aeceac62=
975
        new failure (last pass: next-20220223) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/621d80e631eafe48d7c629f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d80e631eafe48d7c62=
9fa
        new failure (last pass: next-20220217) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621d82873f6b7822f3c62a7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d82873f6b7822f3c62=
a7c
        new failure (last pass: next-20220215) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621d84b31aa9755827c629af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d84b31aa9755827c62=
9b0
        new failure (last pass: next-20220215) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621d82b42a214aa05ac62970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220228/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d82b42a214aa05ac62=
971
        new failure (last pass: next-20220224) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson8b-odroidc1             | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/621d824e9f12149778c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220228/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-meson8b-odro=
idc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220228/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-meson8b-odro=
idc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d824e9f12149778c62=
96d
        new failure (last pass: next-20220223) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/621d83236f4e492cb5c62997

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220228/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220228/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3=
826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621d83236f4e492cb5c62=
998
        new failure (last pass: next-20220224) =

 =20
