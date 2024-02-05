Return-Path: <linux-next+bounces-993-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5798849657
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 10:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465711F21508
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 09:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7FC12B8A;
	Mon,  5 Feb 2024 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="N+g6OIwT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0B12B69
	for <linux-next@vger.kernel.org>; Mon,  5 Feb 2024 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707124981; cv=none; b=gfkDsNWI7dUnmI36MWpOBiBQwQlH4josq9m5pabiwsz0TR7mV/STq8BUxCIWGKhbADi8TxJbCaA9H57KGLU+2509QdEq1SyxiCfwTuQfQT7YTQYJyk5RsPtEnjHgy7DJpDU4yg8qkcwZ4E7tgl2jkYiIm+ZI80KSlBwUpWPr8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707124981; c=relaxed/simple;
	bh=m7qVIERaNp7VkdyvbddX5Q3ustUVpbA6lmoihJNnKSk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=kLw4Kwt/Dl6N2skMFBHZa7S7u7/g5/kmVxFTuwrxqXIdSeSezVYeW+AegCGQA7EfxLrROYOEnavDGzdgm7aIxWpC+MmsYBU2rym5OPAxxHJdq7uWeinWrT2ciRu2acaWMvv4tvPL91C630dBxQmhLiXvnncBBlsNcijRQwPb7ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=N+g6OIwT; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e1270e8cd3so1942843a34.1
        for <linux-next@vger.kernel.org>; Mon, 05 Feb 2024 01:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707124978; x=1707729778; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dcAJXA/x2WoRgeJUTITQWQi7uovp6TnL866WNVl5LFQ=;
        b=N+g6OIwTAml/h3GNfRBKUOp4v4yhUH28xIDZN9nOU05O1EwFHX1bYkMl0CS0xzh/R4
         B8qgy++VhkSg5Q+OMVqfRvTvndNDMoPozMR+uACIIAdVO6RAik9tnvNzyuO36s3TrcTY
         6EkjKrl5B7oq+8uotjIe1ljXIZBuzvni112dYpLMvp40EhU35eZQbHVnQmPuzasaYZMA
         bd2tUROMFi2mlsn5cqy8YnQtqP8WNsX6We6aJRq2/XzTFaMmzGWUVWWZZvu3VH7hJTeu
         7iw+jFamTDuuHEryv4Ltmd+sak4bDosiZ0iSdL4nPo1ArnIlv8ovSv/HgYODvB4iyOY/
         aiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707124978; x=1707729778;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcAJXA/x2WoRgeJUTITQWQi7uovp6TnL866WNVl5LFQ=;
        b=YWmVmndaV7OvFJ/Q+K0SyJ+ThpeoiHWDi+1D2u30ICluDnEou0OZxoRCkcMQaBbYWY
         8cHgJi5THjiombK19alTiq78SFloT2FtWmkAQ8iWk+SQXbkrpJSQl4tiz9AWndu9o9xD
         0KeFeebVjpSVeza5Oh6AHLEGG/UOd0iw8GPGAAvRCjhj1Mttg3ZADOwARq4z2/ko2dxo
         37Hgfi4hfhvx31PSH72/qhhVUU/wAlCUVq53g9KwcSOc9sW0/aJzrvGHWq25t2dnRy9A
         cR2eQLZCdCTn4i9VrucFUYJ+uq0mfgz1xzV5DFZRBgXWCAjR8Mu8I87kGvGMq79kkbNi
         zbaQ==
X-Gm-Message-State: AOJu0Ywj0Fm2oUtL5c0UDf2HLg7yCCzZD3Nltl40X7VJAlrZsVgKmaCh
	G9Oz4kHRCdzEP837YUX0A/f89kFLzzS4U9MHSdZXSX/gwQA4r57MajzGPtFzZmfE/N2Hw2RoyGm
	2
X-Google-Smtp-Source: AGHT+IHIcxzD00tystCPZUJAK3s3a4RMEPsDnjQXIpnG9bffEsKN7uHYGpVB02pEf4KC6MokHrni5g==
X-Received: by 2002:a05:6358:260b:b0:176:5b4f:492b with SMTP id l11-20020a056358260b00b001765b4f492bmr9422037rwc.12.1707124978096;
        Mon, 05 Feb 2024 01:22:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXDAiSyRByo4lOUJHRUjyT65YDD/7cgCk3WS4k6DAaDnk9ZHqq+eCm6AFmCH61u+EQyUi/jIw8E6wUYMfBA9964+K2k+XNuEYy99xt9G2CD64vbWdQBJdbjdeuZ1rIJaduO5TxJxU0B1y3Mrij1Vw+4/g==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l37-20020a635725000000b005d66caee3d0sm6436641pgb.22.2024.02.05.01.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:22:57 -0800 (PST)
Message-ID: <65c0a8f1.630a0220.3143b.4566@mx.google.com>
Date: Mon, 05 Feb 2024 01:22:57 -0800 (PST)
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
X-Kernelci-Kernel: next-20240205
X-Kernelci-Report-Type: test
Subject: next/master baseline: 12 runs, 2 regressions (next-20240205)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 12 runs, 2 regressions (next-20240205)

Regressions Summary
-------------------

platform                     | arch | lab          | compiler | defconfig  =
     | regressions
-----------------------------+------+--------------+----------+------------=
-----+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre | gcc-10   | sunxi_defco=
nfig | 1          =

sun8i-h2-plus-orangepi-r1    | arm  | lab-baylibre | gcc-10   | sunxi_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240205/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240205
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      23e11d0318521e8693459b0e4d23aec614b3b68b =



Test Regressions
---------------- =



platform                     | arch | lab          | compiler | defconfig  =
     | regressions
-----------------------------+------+--------------+----------+------------=
-----+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre | gcc-10   | sunxi_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c07717358d6b811700a065

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240205/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240205/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c07717358d6b811700a06e
        failing since 55 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-05T05:49:49.215429  + set +x
    2024-02-05T05:49:49.217749  <8>[   10.044158] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3920310_1.5.2.4.1>
    2024-02-05T05:49:49.321863  / # #
    2024-02-05T05:49:49.422921  export SHELL=3D/bin/sh
    2024-02-05T05:49:49.423252  #
    2024-02-05T05:49:49.523998  / # export SHELL=3D/bin/sh. /lava-3920310/e=
nvironment
    2024-02-05T05:49:49.524367  =

    2024-02-05T05:49:49.625163  / # . /lava-3920310/environment/lava-392031=
0/bin/lava-test-runner /lava-3920310/1
    2024-02-05T05:49:49.625771  =

    2024-02-05T05:49:49.632460  / # /lava-3920310/bin/lava-test-runner /lav=
a-3920310/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch | lab          | compiler | defconfig  =
     | regressions
-----------------------------+------+--------------+----------+------------=
-----+------------
sun8i-h2-plus-orangepi-r1    | arm  | lab-baylibre | gcc-10   | sunxi_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65c07703358d6b811700a045

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240205/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240205/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c07703358d6b811700a04e
        failing since 52 days (last pass: next-20231213, first fail: next-2=
0231214)

    2024-02-05T05:49:40.606781  / # #
    2024-02-05T05:49:40.707957  export SHELL=3D/bin/sh
    2024-02-05T05:49:40.708335  #
    2024-02-05T05:49:40.809135  / # export SHELL=3D/bin/sh. /lava-3920311/e=
nvironment
    2024-02-05T05:49:40.809496  =

    2024-02-05T05:49:40.910304  / # . /lava-3920311/environment/lava-392031=
1/bin/lava-test-runner /lava-3920311/1
    2024-02-05T05:49:40.910897  =

    2024-02-05T05:49:40.952919  / # /lava-3920311/bin/lava-test-runner /lav=
a-3920311/1
    2024-02-05T05:49:41.041005  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-05T05:49:41.044211  + cd /lava-3920311/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

