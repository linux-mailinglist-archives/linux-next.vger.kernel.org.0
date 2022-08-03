Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5200058890D
	for <lists+linux-next@lfdr.de>; Wed,  3 Aug 2022 11:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbiHCJHp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Aug 2022 05:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiHCJHp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Aug 2022 05:07:45 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC7AE08C
        for <linux-next@vger.kernel.org>; Wed,  3 Aug 2022 02:07:43 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id t22so8096167pjy.1
        for <linux-next@vger.kernel.org>; Wed, 03 Aug 2022 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zt8NEZFjrzxeMe/APqF7pwxXJQWZ2QTRcYJK2cOpRGk=;
        b=KjjqEf4OvmkEvNCHZmUBeDAdMBz8a9PTcQaK0z/f2jjZSqqizOe5k5/S/ZD0LbRmgh
         /SMSIqa1FmlopkwgvTkg4UHLyO2UCfNYt+RfxhKJIMCQRW+YqIHZx8xA7It3lDookAkH
         sfnNdaoejlWPcPRAwUlJ2uKkS06vByDzw+Jys6xcYkHZsgUq0xEOKptCgD+XOkNpMxwz
         eGBTYMNZE/5xTJ49D0w4iaoFlZCZLic8teCT9UOW6CnaM/2hPdXSh6lBqKV3nkJJJRWq
         L8yPVqSGyXKxqOqvWWV2vr/zYQSIIdggXJRN+xU7I8OIfw5BHdiTJzbjrkoBlcVdIcTK
         w5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zt8NEZFjrzxeMe/APqF7pwxXJQWZ2QTRcYJK2cOpRGk=;
        b=GVY7IrqzSdrUVQ60Qoi/s9qjaxXCWnqsKkW89w0V3SWyEx5VFXYppCaLeOA1N36XXQ
         UXFYm2GgSpS48uWSU9j/ofrCzFOr/lsoN+MjUaDVxpc7WVRdY4Js3ZSeNZIPaM0976qJ
         Id/icTkPKhcdd36eVKPeh5FQbKhMrsJboh6iHWKY+Z13OzMqWAkebJ9Y2HhqKaX+46cw
         jfSH4eKLpN5OyD38Z8PK+EOYG4qAZ3BSanX/+hXIkkeB4mwe1G/eJeBy2xpTOHojXz4Q
         UgD0GqYb+/QDpNpFmp1gWb9qJWO7I2N61ZpEFPUBXd++1cLF2+2YN2cAD7iVa6FRZcYF
         SgMw==
X-Gm-Message-State: ACgBeo2WBJqvAqBbOxzMhR/EVhDJThGFlsE6x45iAb5blypfEAT9bGu1
        GlMDZ8hcyLmCpCacWdyldJNLaQdMQ/AceX0mkYo=
X-Google-Smtp-Source: AA6agR57W8HMk4IFNTC3xe5KGyWEt4aZpwytqaqN3fjjshBRp3FFJIO1N6GaK8K7NER9EUes8uMfpA==
X-Received: by 2002:a17:90a:150:b0:1f3:1dc7:c9f0 with SMTP id z16-20020a17090a015000b001f31dc7c9f0mr3862477pje.237.1659517662654;
        Wed, 03 Aug 2022 02:07:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c25-20020aa79539000000b0052dfe83e19csm2262452pfp.16.2022.08.03.02.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 02:07:42 -0700 (PDT)
Message-ID: <62ea3ade.a70a0220.17ad.3d29@mx.google.com>
Date:   Wed, 03 Aug 2022 02:07:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-1483-gffa33bbcf63ea
Subject: next/pending-fixes baseline: 308 runs,
 7 regressions (v5.19-1483-gffa33bbcf63ea)
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

next/pending-fixes baseline: 308 runs, 7 regressions (v5.19-1483-gffa33bbcf=
63ea)

Regressions Summary
-------------------

platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
hp-x360-14-G1-sona | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...=
ebook+amdgpu | 1          =

imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig           | 1          =

imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =

imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

kontron-bl-imx8mm  | arm64  | lab-kontron     | gcc-10   | defconfig       =
             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-1483-gffa33bbcf63ea/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-1483-gffa33bbcf63ea
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ffa33bbcf63ea3754df64a2cd723b9f0ce3bbb85 =



Test Regressions
---------------- =



platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
hp-x360-14-G1-sona | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...=
ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/62ea0213dd6711095fdaf09c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ea0213dd6711095fdaf=
09d
        new failure (last pass: v5.19-rc8-159-ge79a32d56d08) =

 =



platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ea0abcf9b66a9fe1daf061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ea0abcf9b66a9fe1daf=
062
        failing since 14 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ea0cb0ed5abd07c8daf078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ea0cb0ed5abd07c8daf=
079
        failing since 64 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ea0ea44fd16c748cdaf070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ea0ea44fd16c748cdaf=
071
        failing since 38 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ea0f306f296e9e11daf089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ea0f306f296e9e11daf=
08a
        failing since 64 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
imx6ul-pico-hobbit | arm    | lab-pengutronix | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ea113881bcc2dc20daf089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ea113881bcc2dc20daf=
08a
        failing since 64 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch   | lab             | compiler | defconfig       =
             | regressions
-------------------+--------+-----------------+----------+-----------------=
-------------+------------
kontron-bl-imx8mm  | arm64  | lab-kontron     | gcc-10   | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/62ea04d797dbc0ed50daf06b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-bl-imx8m=
m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-1483-=
gffa33bbcf63ea/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-bl-imx8m=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ea04d797dbc0ed50daf=
06c
        new failure (last pass: v5.19-rc8-159-ge79a32d56d08) =

 =20
