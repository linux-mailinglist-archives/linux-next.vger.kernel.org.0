Return-Path: <linux-next+bounces-1363-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E1867801
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 15:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18AA1F2DA43
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 14:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8646A129A63;
	Mon, 26 Feb 2024 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ijwgi9tp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3860860
	for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956957; cv=none; b=AL+bLveEcuaBRfQhyehbgxAB7aCMx9UQDHHIUpZvsdwdjhLHVz2rXpdJ4b2JGQ0AO7Lsz6Tjc2M78JG+hr/vrNlRMZo/1XJ6aFJ7pVUwAEfi/k5uE56FCT/edZH74CiGMO3IDljUQaLEsAO+hNyB91AVLGg/Z8GA4M565rVy1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956957; c=relaxed/simple;
	bh=o2uuhfCm5mt6ngGqV5q2uH+ZZNHjYDJsVHjoszcyCwU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=c51NFhhMqo0CAXIUUNP69136KmopkJTHScdJu6hc4bGqy0k3mVugfJ2PjPDsGrWB54M4YIDC6f3Fw8Kqcfo8BGzVX6xPaoCz8A0SjrsOdaZiHkUQKfqGWwH7wA50rNdUobT9NP4DcMAogvq5geeOqg1+kaE/fFYP6EQCaqm2INE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ijwgi9tp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc29f1956cso19889465ad.0
        for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708956953; x=1709561753; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RAwgcKid5oMvkZsyd9nbLsp4FLAQfmNHtLzdquNelcE=;
        b=Ijwgi9tpwRm+Sa3uJuJb1e7y1kzn3CNEl4XkkUgha70ZA4+24ExPcBuCChx0yGZe05
         9fjI/KTotGZfSuwiioDCUMS/ZHgsUMV5phCW6BxIFG21hASrRkl9ocZaApqClW++sR+G
         5ZFlqB6PViMmm5Fh8gDkx75+WB9yYzABbE1APnMmDRRtzNVMQpmQMK2zEasotpZrDGRS
         S3CeYu6q166UEgFhhuyC9SyB/GqXLlxeTPgQ+W8MhiMUuQP/mO0sdOmiSh7nSXzPb4Od
         j38v5McEVBEAFDbGtnmBalUtnO+aqboTd7lJO71fjssoVXar6wq1dV5a5+z5K+bpHxiG
         LHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956953; x=1709561753;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAwgcKid5oMvkZsyd9nbLsp4FLAQfmNHtLzdquNelcE=;
        b=f89myyAsWbY6MyHhknr/aRf/XME2kTBzvpd5qssp3CIk2R1qXsXfOreX41J44bzKA5
         zUvxVD3D2WdvEAQCerY3s81wyuqX3Xjgi3WAo/TUBXhPy1wNQPGv0K0tfHbRArURWV5a
         SScSNfk+ISjmR6KQyDMMYyZanEKnhuZiY6kUs4zrwimSB+2YnBgwj2A9W37CQhvsjGso
         bBs0grGfWI5FgUGbw2bzvEQ2gttCIYRFvir2oNht79N52McWbgimgO4i1ri9i7CxmayH
         aLymyp0ghN+EJx51a103YkYOEk+Hcv4+2306FAtaJYXGO9aL3/3WDuKymUULVQIoJqHY
         Uk3Q==
X-Gm-Message-State: AOJu0YyWWv0Pnbl7Owld3TpBKNke1BTrdrDHMAFT6ezN640+oVS9PIMq
	51CC/H7HOvr36iTocJoIs6qhiaF/+J3FvfyFn5zVv2T2RpQ7xDX/YYtE74/vrJCImAmnFo8I7jP
	r
X-Google-Smtp-Source: AGHT+IFQkDI9kfgZC9bt6E/V6VPODUeMtnxlPCNRW+E/trab1/Y9xUGga+/WiO82salISXyeLtjL+g==
X-Received: by 2002:a17:902:9a4c:b0:1db:d184:c458 with SMTP id x12-20020a1709029a4c00b001dbd184c458mr6270691plv.44.1708956952162;
        Mon, 26 Feb 2024 06:15:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kh4-20020a170903064400b001dc82ed5519sm3995655plb.245.2024.02.26.06.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:15:51 -0800 (PST)
Message-ID: <65dc9d17.170a0220.a4777.a718@mx.google.com>
Date: Mon, 26 Feb 2024 06:15:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20240226
X-Kernelci-Report-Type: test
Subject: next/master baseline: 294 runs, 32 regressions (next-20240226)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 294 runs, 32 regressions (next-20240226)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240226/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240226
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8552c902efe7ef670b6961fb8885b67961aeb629 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc642970c5ef466463703b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc642970c5ef4664637=
03c
        new failure (last pass: next-20231107) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc691e4712b6355363703e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc691e4712b63553637=
03f
        new failure (last pass: next-20231106) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc641570c5ef4664637022

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc641570c5ef4664637=
023
        new failure (last pass: next-20231107) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc692010a2b57d5c63701d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C523NA-A20=
057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C523NA-A20=
057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc692010a2b57d5c637=
01e
        new failure (last pass: next-20231106) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc6554f94e8ea38863701e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc6554f94e8ea388637=
01f
        failing since 266 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc65f422ecd6d51b637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc65f422ecd6d51b637=
013
        failing since 334 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc642c70c5ef4664637041

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc642c70c5ef4664637=
042
        new failure (last pass: next-20231107) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc69214712b63553637044

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc69214712b63553637=
045
        new failure (last pass: next-20231106) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc695b6a412f3248637017

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc695b6a412f3248637=
018
        failing since 685 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65dc60b760b1cbc069637038

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc60b760b1cbc06963703f
        failing since 73 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-02-26T09:57:56.254936  <8>[   20.209466] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 435321_1.5.2.4.1>
    2024-02-26T09:57:56.359810  / # #
    2024-02-26T09:57:56.461639  export SHELL=3D/bin/sh
    2024-02-26T09:57:56.462398  #
    2024-02-26T09:57:56.563867  / # export SHELL=3D/bin/sh. /lava-435321/en=
vironment
    2024-02-26T09:57:56.564577  =

    2024-02-26T09:57:56.665805  / # . /lava-435321/environment/lava-435321/=
bin/lava-test-runner /lava-435321/1
    2024-02-26T09:57:56.667106  =

    2024-02-26T09:57:56.685456  / # /lava-435321/bin/lava-test-runner /lava=
-435321/1
    2024-02-26T09:57:56.730365  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65dc60b760b1cbc069637043
        failing since 73 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-02-26T09:57:58.836166  /lava-435321/1/../bin/lava-test-case
    2024-02-26T09:57:58.836595  <8>[   22.775197] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-26T09:57:58.837029  /lava-435321/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
dc60b760b1cbc069637045
        failing since 73 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-02-26T09:57:59.893796  /lava-435321/1/../bin/lava-test-case
    2024-02-26T09:57:59.894291  <8>[   23.813878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dc60b760b1cbc06963704a
        failing since 73 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-02-26T09:58:00.969965  /lava-435321/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65dc60b760b1cbc06963704b
        failing since 73 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-02-26T09:58:00.973296  <8>[   24.925566] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-26T09:58:02.033051  /lava-435321/1/../bin/lava-test-case
    2024-02-26T09:58:02.033457  <8>[   25.947608] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-26T09:58:02.033706  /lava-435321/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65dc60ba60b1cbc06963709f

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc60ba60b1cbc0696370a6
        failing since 73 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-02-26T09:57:57.909321  / # #
    2024-02-26T09:57:58.011550  export SHELL=3D/bin/sh
    2024-02-26T09:57:58.012308  #
    2024-02-26T09:57:58.113824  / # export SHELL=3D/bin/sh. /lava-435322/en=
vironment
    2024-02-26T09:57:58.114637  =

    2024-02-26T09:57:58.216235  / # . /lava-435322/environment/lava-435322/=
bin/lava-test-runner /lava-435322/1
    2024-02-26T09:57:58.217445  =

    2024-02-26T09:57:58.236640  / # /lava-435322/bin/lava-test-runner /lava=
-435322/1
    2024-02-26T09:57:58.292523  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-26T09:57:58.292954  + <8>[   20.772995] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 435322_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dc60ba60b1cbc0696370b9
        failing since 73 days (last pass: next-20231208, first fail: next-2=
0231214)

    2024-02-26T09:58:00.711056  /lava-435322/1/../bin/lava-test-case
    2024-02-26T09:58:00.711518  <8>[   23.180463] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-26T09:58:00.711829  /lava-435322/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc5e0ed0866e192c63705a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc5e0ed0866e192c637=
05b
        new failure (last pass: next-20240223) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc632d717c841511637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc632d717c841511637=
013
        new failure (last pass: next-20240124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc5ba5b6e27f063a63701e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc5ba5b6e27f063a637=
01f
        failing since 12 days (last pass: next-20240212, first fail: next-2=
0240213) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc6a546d43c67b15637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc6a546d43c67b15637=
016
        failing since 461 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc67566ee382abae637025

  Results:     65 PASS, 5 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
65dc67576ee382abae637062
        new failure (last pass: next-20240223)

    2024-02-26T10:33:10.536722  /lava-12864640/1/../bin/lava-test-case<8>[ =
  23.307199] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-driver-prese=
nt RESULT=3Dpass>

    2024-02-26T10:33:10.536779  =


    2024-02-26T10:33:11.551397  /lava-12864640/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc69502e89c34f7e637028

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc69502e89c34f7e637=
029
        failing since 461 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc61bd7370619bdb63708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc61bd7370619bdb637=
08d
        new failure (last pass: next-20240124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc60ba593d4b215863705f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc60ba593d4b2158637064
        failing since 139 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fi=
rst fail: next-20231010)

    2024-02-26T09:57:54.813293  <8>[   18.764096] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 460737_1.5.2.4.1>
    2024-02-26T09:57:54.918221  / # #
    2024-02-26T09:57:55.019885  export SHELL=3D/bin/sh
    2024-02-26T09:57:55.020470  #
    2024-02-26T09:57:55.121444  / # export SHELL=3D/bin/sh. /lava-460737/en=
vironment
    2024-02-26T09:57:55.122001  =

    2024-02-26T09:57:55.223035  / # . /lava-460737/environment/lava-460737/=
bin/lava-test-runner /lava-460737/1
    2024-02-26T09:57:55.223894  =

    2024-02-26T09:57:55.228608  / # /lava-460737/bin/lava-test-runner /lava=
-460737/1
    2024-02-26T09:57:55.312748  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc60b7593d4b2158637046

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc60b7593d4b215863704b
        failing since 139 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fi=
rst fail: next-20231010)

    2024-02-26T10:05:42.149325  / # #

    2024-02-26T10:05:42.251105  export SHELL=3D/bin/sh

    2024-02-26T10:05:42.251346  #

    2024-02-26T10:05:42.351928  / # export SHELL=3D/bin/sh. /lava-12864155/=
environment

    2024-02-26T10:05:42.352629  =


    2024-02-26T10:05:42.453810  / # . /lava-12864155/environment/lava-12864=
155/bin/lava-test-runner /lava-12864155/1

    2024-02-26T10:05:42.454914  =


    2024-02-26T10:05:42.457383  / # /lava-12864155/bin/lava-test-runner /la=
va-12864155/1

    2024-02-26T10:05:42.542475  + export 'TESTRUN_ID=3D1_bootrr'

    2024-02-26T10:05:42.542931  + cd /lava-1286415<8>[   19.543684] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 12864155_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc61ce591b173b7f637025

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc61ce591b173b7f63702a
        failing since 270 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-26T10:02:27.543026  + set +x<8>[   14.305960] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3940310_1.5.2.4.1>
    2024-02-26T10:02:27.546890  =

    2024-02-26T10:02:27.652157  / # #
    2024-02-26T10:02:27.755228  export SHELL=3D/bin/sh
    2024-02-26T10:02:27.756338  #
    2024-02-26T10:02:27.857808  / # export SHELL=3D/bin/sh. /lava-3940310/e=
nvironment
    2024-02-26T10:02:27.858695  =

    2024-02-26T10:02:27.960336  / # . /lava-3940310/environment/lava-394031=
0/bin/lava-test-runner /lava-3940310/1
    2024-02-26T10:02:27.961076  =

    2024-02-26T10:02:27.975019  / # /lava-3940310/bin/lava-test-runner /lav=
a-3940310/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc64d7c3f13cbc4463702f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc64d7c3f13cbc44637034
        failing since 264 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-26T10:15:29.859230  <8>[   13.358460] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3940333_1.5.2.4.1>
    2024-02-26T10:15:29.962639  / # #
    2024-02-26T10:15:30.063905  export SHELL=3D/bin/sh
    2024-02-26T10:15:30.064809  #
    2024-02-26T10:15:30.166347  / # export SHELL=3D/bin/sh. /lava-3940333/e=
nvironment
    2024-02-26T10:15:30.167239  =

    2024-02-26T10:15:30.268910  / # . /lava-3940333/environment/lava-394033=
3/bin/lava-test-runner /lava-3940333/1
    2024-02-26T10:15:30.270303  =

    2024-02-26T10:15:30.291755  / # /lava-3940333/bin/lava-test-runner /lav=
a-3940333/1
    2024-02-26T10:15:30.402506  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc6755bf9906c222637014

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc6755bf9906c222637019
        failing since 270 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-26T10:25:58.923585  / # #
    2024-02-26T10:25:59.026660  export SHELL=3D/bin/sh
    2024-02-26T10:25:59.027758  #
    2024-02-26T10:25:59.129573  / # export SHELL=3D/bin/sh. /lava-3940372/e=
nvironment
    2024-02-26T10:25:59.130989  =

    2024-02-26T10:25:59.232931  / # . /lava-3940372/environment/lava-394037=
2/bin/lava-test-runner /lava-3940372/1
    2024-02-26T10:25:59.234667  =

    2024-02-26T10:25:59.247127  / # /lava-3940372/bin/lava-test-runner /lav=
a-3940372/1
    2024-02-26T10:25:59.355141  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-26T10:25:59.356397  + cd /lava-3940372/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc61aa258a6d14db637033

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc61aa258a6d14db637038
        failing since 270 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-26T10:02:00.688554  + set +x
    2024-02-26T10:02:00.690335  [   20.033044] <LAVA_SIGNAL_ENDRUN 0_dmesg =
460740_1.5.2.4.1>
    2024-02-26T10:02:00.799065  / # #
    2024-02-26T10:02:00.900621  export SHELL=3D/bin/sh
    2024-02-26T10:02:00.901150  #
    2024-02-26T10:02:01.002127  / # export SHELL=3D/bin/sh. /lava-460740/en=
vironment
    2024-02-26T10:02:01.002641  =

    2024-02-26T10:02:01.103661  / # . /lava-460740/environment/lava-460740/=
bin/lava-test-runner /lava-460740/1
    2024-02-26T10:02:01.104541  =

    2024-02-26T10:02:01.107579  / # /lava-460740/bin/lava-test-runner /lava=
-460740/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc64b73cf12e9a58637058

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc64b73cf12e9a5863705d
        failing since 264 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-26T10:14:57.037926  + set +x
    2024-02-26T10:14:57.039754  [   18.968785] <LAVA_SIGNAL_ENDRUN 0_dmesg =
460748_1.5.2.4.1>
    2024-02-26T10:14:57.148589  / # #
    2024-02-26T10:14:57.250284  export SHELL=3D/bin/sh
    2024-02-26T10:14:57.250845  #
    2024-02-26T10:14:57.351846  / # export SHELL=3D/bin/sh. /lava-460748/en=
vironment
    2024-02-26T10:14:57.352429  =

    2024-02-26T10:14:57.453448  / # . /lava-460748/environment/lava-460748/=
bin/lava-test-runner /lava-460748/1
    2024-02-26T10:14:57.454339  =

    2024-02-26T10:14:57.457384  / # /lava-460748/bin/lava-test-runner /lava=
-460748/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc6754b973aea5e5637017

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc6754b973aea5e563701c
        failing since 270 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-26T10:25:41.883940  + set +x
    2024-02-26T10:25:41.885688  [   23.071632] <LAVA_SIGNAL_ENDRUN 0_dmesg =
460757_1.5.2.4.1>
    2024-02-26T10:25:41.993794  / # #
    2024-02-26T10:25:42.095498  export SHELL=3D/bin/sh
    2024-02-26T10:25:42.096069  #
    2024-02-26T10:25:42.197074  / # export SHELL=3D/bin/sh. /lava-460757/en=
vironment
    2024-02-26T10:25:42.197600  =

    2024-02-26T10:25:42.298634  / # . /lava-460757/environment/lava-460757/=
bin/lava-test-runner /lava-460757/1
    2024-02-26T10:25:42.299569  =

    2024-02-26T10:25:42.302179  / # /lava-460757/bin/lava-test-runner /lava=
-460757/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc61be591b173b7f637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240226/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc61be591b173b7f637=
013
        new failure (last pass: next-20240124) =

 =20

