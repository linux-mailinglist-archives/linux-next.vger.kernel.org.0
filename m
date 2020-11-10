Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B0A2ACC1F
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 04:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbgKJDus (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 22:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgKJDus (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 22:50:48 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48747C0613CF
        for <linux-next@vger.kernel.org>; Mon,  9 Nov 2020 19:50:48 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id q10so10181292pfn.0
        for <linux-next@vger.kernel.org>; Mon, 09 Nov 2020 19:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sc+1nKK1lKLxQoXPS24yJZXfh8ubUjAlQzPWZYdeSw8=;
        b=YnBIGd+mkD18PJ07JCXdh6uVJ4eaxCvpM9F42tGbA630kIBkweVx0TppTGuVbreo08
         02HQ/AQLTsMTUiKNJqMpTIR3rxtE8zSJJGAAAFLhNVxzBgkNUN4risVvwyVKWkIpmTGD
         B0z+mEERlCwb5ihb5yoomIlbs75OXobOUs+1MslmPxjTOenXRqVFDaC5PxURJDTasAw4
         3TcPZAwEP8lW+WAqvyharRRKCE0McQf03f4VByUpwXE+970Nt9hH8dQlimfvbFkQvd8V
         UP/S8diR8lnAkNRKS1XjvTE4zf3WwLDUMzrnUKmdxbDraEm3CSL01OWpRWs1A9qpIAOn
         2wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sc+1nKK1lKLxQoXPS24yJZXfh8ubUjAlQzPWZYdeSw8=;
        b=olMzp1vbzUm3h2wjHNOUIEsCENOkHeIdBNdDfW6mj+Dwbv58EIUpSMffintkfKTLF4
         J6xUq+iyaSpVCSm0wS1eXiNdsI+spluBFm14pC9IWAB5g3I1He+w89C8C+SZ74sHhj0L
         dvVhQ76TCiIVVoOedk6X9+XaRtyIqVx4ZIlyIT9o18q0W5w4wzh3g0/UuGrePYPAe63H
         QHwIbKlNRwsLhy8icL+tO8bJQMFuwIww3MUhI9Df9GcstVF7VD5ttTdIu+0Yz65oLSkf
         b7f3hznKRkTHQKx+/XDmHe3YgjTih/irIBOw7BAkgivOsdQo+ev2WIR6B1b1uI6g+8GP
         uR+Q==
X-Gm-Message-State: AOAM532jFGmDDQpUNYBVz6YmCMCAgymkBFroN9+18IqzlhBhs66TwtsI
        KWwPtHJioGYn5A5P3pVk3pIac5uzMkz1Xg==
X-Google-Smtp-Source: ABdhPJyhzoSfOv5zXoIlvLjSdCPKUIC6pr5ygPJPkB7hwNYfTrG+yGLr95hHNldG+KRy+rTH8/0EgA==
X-Received: by 2002:a17:90a:1992:: with SMTP id 18mr2863785pji.67.1604980247173;
        Mon, 09 Nov 2020 19:50:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q6sm11374329pfu.23.2020.11.09.19.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 19:50:46 -0800 (PST)
Message-ID: <5faa0e16.1c69fb81.abf8.97e9@mx.google.com>
Date:   Mon, 09 Nov 2020 19:50:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.10-rc3-245-gcb165dbb5aeb
Subject: next/pending-fixes baseline: 314 runs,
 5 regressions (v5.10-rc3-245-gcb165dbb5aeb)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 314 runs, 5 regressions (v5.10-rc3-245-gcb165d=
bb5aeb)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 2          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc3-245-gcb165dbb5aeb/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc3-245-gcb165dbb5aeb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cb165dbb5aeb97153d348ea3f26b04805e8aa22e =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa9d90685caffb0f4db88ea

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fa9d90685caffb0=
f4db88ed
        new failure (last pass: v5.10-rc2-660-g8b54310a22d78)
        2 lines

    2020-11-10 00:02:07.258000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-10 00:02:07.258000+00:00  (user:khilman) is already connected
    2020-11-10 00:02:23.059000+00:00  =00
    2020-11-10 00:02:23.059000+00:00  =

    2020-11-10 00:02:23.075000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-10 00:02:23.076000+00:00  =

    2020-11-10 00:02:23.076000+00:00  DRAM:  948 MiB
    2020-11-10 00:02:23.090000+00:00  RPI 3 Model B (0xa02082)
    2020-11-10 00:02:23.180000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-10 00:02:23.212000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (383 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa9d91565810a534fdb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa9d91565810a534fdb8=
854
        failing since 15 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fa9db1e7c8262569edb8860

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fa9db1e7c82625=
69edb8864
        failing since 0 day (last pass: v5.10-rc2-457-g3952050a63fb, first =
fail: v5.10-rc2-660-g8b54310a22d78)
        4 lines

    2020-11-10 00:12:42.318000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000313
    2020-11-10 00:12:42.318000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-11-10 00:12:42.319000+00:00  kern  :alert : [00000313] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fa9db1e7c82625=
69edb8865
        failing since 0 day (last pass: v5.10-rc2-457-g3952050a63fb, first =
fail: v5.10-rc2-660-g8b54310a22d78)
        47 lines

    2020-11-10 00:12:42.361000+00:00  kern  :emerg : Process kworker/3:1 (p=
id: 54, stack limit =3D 0x(ptrval))
    2020-11-10 00:12:42.362000+00:00  kern  :emerg : Stack: (0xc244fd58 to =
0xc2450000)
    2020-11-10 00:12:42.363000+00:00  kern  :emerg : fd40:                 =
                                      c369a9b0 c369a9b4
    2020-11-10 00:12:42.364000+00:00  kern  :emerg : fd60: c369a800 c369a81=
4 c1448ce8 c09ba0e4 c244e000 ef86ce60 c2001e40 c369a800
    2020-11-10 00:12:42.364000+00:00  kern  :emerg : fd80: 000002f3 c09bb4a=
4 c1448ce8 c2001d80 c3a72080 ef86ce40 c09c7834 c1448ce8
    2020-11-10 00:12:42.403000+00:00  kern  :emerg : fda0: c19c7640 9db0f39=
8 c19c765c c3a73d80 c325be80 c369a800 c369a814 c1448ce8
    2020-11-10 00:12:42.404000+00:00  kern  :emerg : fdc0: c19c7640 0000000=
c c19c765c c09c7804 c1446a10 00000000 c369a80c c369a800
    2020-11-10 00:12:42.404000+00:00  kern  :emerg : fde0: fffffdfb c22e0c1=
0 c3ad8040 c099d744 c369a800 bf026000 fffffdfb bf022138
    2020-11-10 00:12:42.405000+00:00  kern  :emerg : fe00: c3a736c0 c357310=
8 00000120 c234c7c0 c3ad8040 c09f70a0 c3a736c0 c3a736c0
    2020-11-10 00:12:42.405000+00:00  kern  :emerg : fe20: 00000040 c3a736c=
0 c3ad8040 00000000 c19c7654 bf049084 bf04a014 0000001e =

    ... (36 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa9dace2e993b68a0db885d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-2=
45-gcb165dbb5aeb/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa9dace2e993b68a0db8=
85e
        failing since 5 days (last pass: v5.10-rc2-346-g3261d524354a, first=
 fail: v5.10-rc2-396-ga212a20610dd8) =

 =20
