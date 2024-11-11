Return-Path: <linux-next+bounces-4741-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580589C40D5
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 15:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 744C7B21DB8
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 14:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3A6156678;
	Mon, 11 Nov 2024 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zlOjoOYl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273A19F47E
	for <linux-next@vger.kernel.org>; Mon, 11 Nov 2024 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731335167; cv=none; b=nDMovBVyiukFTUYlWfEy5HSZQweldiBq0KQjqkyh/HSuCMQcbE5Yl7vLvaaF/ziw4/xJcYLp09AbS688DZguUyCTIyqrSNV0WGh1Phtux57+N/NfRTD9oBEEu7+9VDc6wHZuaoa9Q8vb4WUhvS7YxyTPmhlsTwVrbbVXaB3YP9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731335167; c=relaxed/simple;
	bh=RZLSstUQA9EO7gDukihHVslWxAZwJmXFvKVm7WFUtUI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=NX7qtBY1x079iyJhV24MGjGZRaRs7RyhBIaG+5/EY9bvLDwAsbWE4UtCcfsEfe6CCSeXcdVVEoArSwSEEu0sBItBy8CesW71pFqTn+8b3ZsF4wolaEnjqg3G4JmbwetG5MiFSsTtw9CJbUoqjEYgNLgfGwo5X9b5+u9dwkpJ2Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zlOjoOYl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso4170623b3a.2
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2024 06:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731335163; x=1731939963; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9tbIdbnk3YZA1AcYyk0UgNRbp2RZ4RyYOfFQWPytfTM=;
        b=zlOjoOYl6ERMkTXh1GY+vGHPRX6g4jXQginACXpKfHSQmrzmScxBS6MG1dHQAwNnq1
         X5mH35nqpz1SqFcqsW+PLSiWINUrVbVasC1w4oZFawba8LZgg2gqo3v2Vrc8Tvvtoti9
         t3M7lIiNKhFCKVqjGQfRqG2BN63lQiSJRg3P5I0Pqu4imliQmkgODGsBTMkrqTzcq048
         pgeWHiP7VkO4i4ImyeYoSh2FaeK1WgaM0mrvAu6eYjwTcO5ISeje4gkmldgAeSMdsvQp
         D0eEDkydHsXheqCLL9hdu491QdQ7qp97QZVDNU3eq3FHJNm+KyJtEzfiPDtqYwDTRaeW
         PfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731335163; x=1731939963;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tbIdbnk3YZA1AcYyk0UgNRbp2RZ4RyYOfFQWPytfTM=;
        b=O1zlsIwhRASdtfl4Xw/+B6DCIpfEPyg4ZxZ74mlZ/gRclELfqcvWsQfmZr3gdrvrs7
         NQltLaUXTRrQ54gHJk6I8B9pTfOoKJVwGmBuSHvRdlm1siYUJo8ECezZhbLMGA6/w0zz
         lLxYeX62e4mYpajSMBsAFBj1VpnkmwoXvTodXSMgw9Z08fMBzZ2E/VNI7SZkV81VJmfO
         pRCwaIECuEr5gQYydWe8hWXu60tMV6WOWVzAQcZIddgxgxgmpBIYdWCybWwjkpVLwjnh
         0tNrOnA2Pi6UK0iF48UEBcsTOuTmtiWtQrgKlSZk8uR9Dn7/Bmy1+P+c93J+W19qWt8w
         mMiA==
X-Gm-Message-State: AOJu0Yx//JVoHnQnEWV/7L6W57wrdbvZaWDm01EPTThLHL5UWFrAW3J0
	hVbbWfOpRAve6HKphsfSU63NQRvffOQcGyECn4VznKI88iCzRhBqfNc0VmOz7QMqclRiuvUxFws
	4
X-Google-Smtp-Source: AGHT+IE17sNXWS2sVAyIPHs6KsQTshwZPZ5fSpxU15FlRikPjUbrH/VBXJ/6KCQ5O2qzEmxmHG76tg==
X-Received: by 2002:a05:6a00:114f:b0:71e:768b:700a with SMTP id d2e1a72fcca58-72413368f1dmr18100788b3a.23.1731335162850;
        Mon, 11 Nov 2024 06:26:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a7c76sm9253633b3a.48.2024.11.11.06.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 06:26:02 -0800 (PST)
Message-ID: <673213fa.050a0220.2b639e.3eac@mx.google.com>
Date: Mon, 11 Nov 2024 06:26:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241111
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 167 runs, 36 regressions (next-20241111)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 167 runs, 36 regressions (next-20241111)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-12   | defconfig+=
kselftest          | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-12   | defconfig+=
kselftest          | 1          =

meson-g12a-u200              | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | gcc-12   | defconfig+=
kselftest          | 1          =

r8a774c0-ek874               | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =

r8a774c0-ek874               | arm64 | lab-cip      | gcc-12   | defconfig+=
kselftest          | 1          =

r8a774c0-ek874               | arm64 | lab-cip      | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe   | clang-17 | multi_v7_d=
efconfig           | 1          =

zynqmp-zcu102                | arm64 | lab-cip      | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241111/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241111
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6d59cab07b8d74d0f0422b750038123334f6ecc2 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dabaf05f16bb72c8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dabaf05f16bb72c86=
85b
        failing since 24 days (last pass: next-20241003, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6731db750eccd05eb4c868d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731db750eccd05eb4c86=
8d2
        failing since 31 days (last pass: next-20241008, first fail: next-2=
0241011) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dac64d81b21ba8c86898

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dac64d81b21ba8c86=
899
        failing since 24 days (last pass: next-20241003, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6731db15355c0383c2c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731db15355c0383c2c86=
85e
        failing since 13 days (last pass: next-20241022, first fail: next-2=
0241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dc912f82908b5bc8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dc912f82908b5bc86=
85e
        failing since 13 days (last pass: next-20241022, first fail: next-2=
0241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e1f712c96c13bcc868e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e1f712c96c13bcc86=
8e3
        failing since 16 days (last pass: next-20241022, first fail: next-2=
0241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e374187ceb44fac86868

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e374187ceb44fac86=
869
        failing since 75 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6731db0146c62af519c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731db0146c62af519c86=
85e
        failing since 13 days (last pass: next-20241022, first fail: next-2=
0241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6731ddbeec7d18ce69c86876

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731ddbeec7d18ce69c86=
877
        failing since 13 days (last pass: next-20241022, first fail: next-2=
0241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e1f6f5e0d07e20c86865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e1f6f5e0d07e20c86=
866
        failing since 16 days (last pass: next-20241022, first fail: next-2=
0241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e3725310d73e98c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e3725310d73e98c86=
863
        failing since 75 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dac54d81b21ba8c86895

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dac54d81b21ba8c86=
896
        failing since 24 days (last pass: next-20241003, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dafd355c0383c2c86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dafd355c0383c2c86=
85a
        failing since 24 days (last pass: next-20241003, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731da21585904a32bc8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731da21585904a32bc86=
860
        failing since 39 days (last pass: next-20241001, first fail: next-2=
0241003) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dabe4d81b21ba8c8688e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dabe4d81b21ba8c86=
88f
        failing since 13 days (last pass: next-20241003, first fail: next-2=
0241029) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6731db6306012e6751c8686f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731db6306012e6751c86=
870
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e2ba1002be9da1c8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e2ba1002be9da1c86=
86d
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241018) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e3e62d903db8aec8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e3e62d903db8aec86=
86e
        failing since 24 days (last pass: next-20241015, first fail: next-2=
0241018) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dac077eca55261c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dac077eca55261c86=
865
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e3205310d73e98c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e3205310d73e98c86=
859
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241018) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e3835310d73e98c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e3835310d73e98c86=
86a
        failing since 49 days (last pass: next-20240829, first fail: next-2=
0240923) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6731da98f8b7b62d1cc8687e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731da98f8b7b62d1cc86=
87f
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e241e9c5081136c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e241e9c5081136c86=
861
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241018) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e3819e3e5317cac8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e3819e3e5317cac86=
85b
        failing since 24 days (last pass: next-20241015, first fail: next-2=
0241018) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6731da0c585904a32bc86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731da0c585904a32bc86=
857
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e31f187ceb44fac86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e31f187ceb44fac86=
857
        failing since 24 days (last pass: next-20241016, first fail: next-2=
0241018) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dd4e86f7e71654c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dd4e86f7e71654c86=
861
        failing since 25 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6731deb42ef9c1ca11c86889

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731deb42ef9c1ca11c86=
88a
        failing since 11 days (last pass: next-20241025, first fail: next-2=
0241031) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dacc77eca55261c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dacc77eca55261c86=
86a
        new failure (last pass: next-20241104) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774c0-ek874               | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6731df052e8bdd69d7c8695e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731df052e8bdd69d7c86=
95f
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774c0-ek874               | arm64 | lab-cip      | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dd8a8f43417124c86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dd8a8f43417124c86=
85a
        new failure (last pass: next-20241104) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774c0-ek874               | arm64 | lab-cip      | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6731e3796ec41ac57fc868b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731e3796ec41ac57fc86=
8b3
        new failure (last pass: next-20241106) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dabb77eca55261c8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dabb77eca55261c86=
85f
        failing since 39 days (last pass: next-20241001, first fail: next-2=
0241003) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dabc53b54503acc8686a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dabc53b54503acc86=
86b
        failing since 39 days (last pass: next-20241001, first fail: next-2=
0241003) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe   | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6731daef730a5555b5c86863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731daef730a5555b5c86=
864
        failing since 34 days (last pass: next-20240726, first fail: next-2=
0241008) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
zynqmp-zcu102                | arm64 | lab-cip      | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6731dab11fbb3dbc66c8686e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241111/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6731dab11fbb3dbc66c86=
86f
        failing since 24 days (last pass: next-20241003, first fail: next-2=
0241017) =

 =20

