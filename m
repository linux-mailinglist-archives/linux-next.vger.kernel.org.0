Return-Path: <linux-next+bounces-4079-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64098EC26
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 11:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0776284F6B
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 09:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB893145B24;
	Thu,  3 Oct 2024 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UvQYKQcE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2761779CC
	for <linux-next@vger.kernel.org>; Thu,  3 Oct 2024 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727947081; cv=none; b=U+260c0nbgEi+FYyL0Kzqolnj3rg5P7rdpvD8picPubvlevUUPFeFBeYtIItiKF2snwZWNvloiUxlc8wPsd/SFbn+n5ph9A98yJxIbzB1NK+nBHa/XpqvhvDrH4W12q+h96os5WQhYRdw75Ukorg9zwd1sblKS4YBqHz4TPXzng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727947081; c=relaxed/simple;
	bh=8ZwfLopkSqFW6KYETpKrAUpU/714UOTl4RVeXLQ0RlU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=d8F/u9uAVPNVqVx1OshbgQZBPYRDm1aJDfgyTeS2ADBWyfUDdCbjgcBw5QKMW3gEyOgVcgALqg/Rl1Kp71AdepMagKUAhkTKvk6xN/OrZw7Z2q60ynIQPDtGEWn+UJuYejmHfQB9tRHkNBm85ZcOxZP/l5mR0TrFKgKQtS4fBGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=UvQYKQcE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20aff65aa37so5094415ad.1
        for <linux-next@vger.kernel.org>; Thu, 03 Oct 2024 02:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727947078; x=1728551878; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v6t/UQImYtv7cFPv/7OAq3UERG5Jh7tvsvXdvZhUXEQ=;
        b=UvQYKQcEbUMntmWoWK3kzl5MdpLszXoiufAstfwn9T3yt9NdZsZt6VPLWs8P4eNfbk
         xRvVhGovAanZKOqnTRKd6uo/Yq9t1AAXqlvtKPin9UnWl3wfSYPjxSoqmsxy389P5rJ9
         dem20GLqjMJl3VUXLOFe5uJGDerzNB1+xFvY1GJz9GL5DiMIE0jGasGAS2Fvy1Nn2JXC
         56vIwd+/krmC9sE2cWnexSmoLxczm3uo9WM2+ITwiEajodUtlVBELB64UPbLuFjn71BY
         LWf/e7MhxjAPGYDIPcWP6y8szLd2oMIVwouhohMdXZDB+hVxyLDgOFtp3CswCe4O+oAY
         D9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727947078; x=1728551878;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6t/UQImYtv7cFPv/7OAq3UERG5Jh7tvsvXdvZhUXEQ=;
        b=QOo6iiu/7vxQC8oGoX4l092CVjYSKRQyH+7ps2FJWibQvZ395Vr1xhprUOxPvi/f0V
         VwKZ6k4oczP4ochIo58V+kVpdsrZVp8Wxakaj3+Bhgf7IpDNilED4lmKTY15TmmwvRtH
         bIj9qw3y0S+yYJiLvmWs3RSIgWcEsBV5p8ZzG8MujT1ily4e5HT9hw3xkwL1ENVp7tbI
         ffUphMQhbj4GhiMl2u7cUBjrU5BLYgKziRVGRpEwCpwWAexVgqBt/nIItfROjQLRXnzw
         Jxd2B51bsYA/jyCUDkA/e0AR6jm7ZjRIk92HmDzU1n9fzUDsb5913IXJbLY4zbrg60cB
         ilvw==
X-Gm-Message-State: AOJu0YxXZT4eeJQoUWmuhY1goD/tjBK9UjxmoTbEHO54CWr/+RAK4Sh6
	mtxt2c3n9EnaMIrFCyrTqP4Y7sFTivDKwakCRVhrTn/KAyba8m6f2w9N63vO6a8lINTORXovbBG
	w
X-Google-Smtp-Source: AGHT+IG6TWnEwDLzqjdP1JXkUuib2jURVEwazhdiEa32SAKi/Wr1mbNY8Z8KWwK0sbhdB7DttIvB3A==
X-Received: by 2002:a17:903:1105:b0:20b:b455:eb72 with SMTP id d9443c01a7336-20bc59f0768mr87187185ad.8.1727947077806;
        Thu, 03 Oct 2024 02:17:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beead8dfasm5624255ad.52.2024.10.03.02.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 02:17:57 -0700 (PDT)
Message-ID: <66fe6145.170a0220.2f24cb.1158@mx.google.com>
Date: Thu, 03 Oct 2024 02:17:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241003
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 224 runs, 21 regressions (next-20241003)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 224 runs, 21 regressions (next-20241003)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | tegra_defc=
onfig              | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | sunxi_defc=
onfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241003/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241003
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c02d24a5af66a9806922391493205a344749f2c4 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe327e73e22e2079c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe327e73e22e2079c86=
856
        failing since 43 days (last pass: next-20240716, first fail: next-2=
0240820) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe25dd5c4bc8dad4c86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe25dd5c4bc8dad4c86=
867
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe2628fd7af94ac7c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe2628fd7af94ac7c86=
85e
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | tegra_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe2662282ce95df1c86873

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
tegra_defconfig/gcc-12/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
tegra_defconfig/gcc-12/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe2662282ce95df1c86=
874
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe2fadf82c46db72c8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe2fadf82c46db72c86=
85c
        failing since 36 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe2fae5ef79cc46ac8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe2fae5ef79cc46ac86=
85c
        failing since 36 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe28a9454fdac070c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe28a9454fdac070c86=
861
        new failure (last pass: next-20241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe295a84dc4d3711c8686b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe295a84dc4d3711c86=
86c
        new failure (last pass: next-20241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe2be0d7c8b93289c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe2be0d7c8b93289c86=
860
        failing since 1 day (last pass: next-20240930, first fail: next-202=
41001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe29bf434319c8c5c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe29bf434319c8c5c86=
86a
        new failure (last pass: next-20241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe342574d02e1421c86996

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe342574d02e1421c86=
997
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe360558ac5a7c15c8686b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe360558ac5a7c15c86=
86c
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe375954501a76d7c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe375954501a76d7c86=
856
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe4664da5ec54714c868e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe4664da5ec54714c86=
8e3
        new failure (last pass: next-20241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe47012c8754d0d5c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe47012c8754d0d5c86=
856
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe48f79bd0171553c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe48f79bd0171553c86=
856
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe334608e1a2424ac86863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe334608e1a2424ac86=
864
        new failure (last pass: next-20240829) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe26eebd9c38a9dec86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe26eebd9c38a9dec86=
857
        new failure (last pass: next-20241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe28460930fead4cc8687d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe28460930fead4cc86=
87e
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe2f253432afbea2c8688b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
multi_v7_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe2f253432afbea2c86=
88c
        new failure (last pass: next-20241002) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/66fe25748fda9dc47ec8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241003/arm/=
sunxi_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241003/arm/=
sunxi_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fe25748fda9dc47ec86=
85e
        new failure (last pass: next-20241002) =

 =20

