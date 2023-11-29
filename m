Return-Path: <linux-next+bounces-125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B87FD863
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 14:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21AB01C209A9
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E4320310;
	Wed, 29 Nov 2023 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1nMOjW+3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355A0DD
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 05:41:10 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cfd04a6e49so7208635ad.0
        for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 05:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701265269; x=1701870069; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m24Zx3HSoR8X/m4MD/IEzh+XHQBu5zld2cKy9MQbcKI=;
        b=1nMOjW+3k3yuHSAh3lDBWSTn8JsJJW0CzD+Y8/1KQypnHAQ7PEX0r726EC8oHoETOI
         WT7wuke9vGgHRMuM/Z0DXwSE6jk6ltMU6RAyrEy094nXvS3pFlwVwgl5QakL/vOt8CVg
         NoHBSG9kmwcAlBvedRrQDWZqqq8r6dzOCpD+qqLZ+g7JTbqbnWsO5VhyqHSMvFbhLXig
         XW1sSTnOOdYFv2iSdu91f0g3JisKTY09TbgrHO+CCwuxmSGWbD6nvnOmhJIc89sKUvMR
         4nQnNTuhwTbn6+QZ8faVgeNOHHrhgctunmLljwOqstobvCaevsbvNKR0XqCPQ3zyZmok
         JrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265269; x=1701870069;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m24Zx3HSoR8X/m4MD/IEzh+XHQBu5zld2cKy9MQbcKI=;
        b=tgysh3SfTL4ECyQMp5tnZSrpjszmVzucqB50LxWqqTaVWWlUd9rUSFVz5IhpwEP+oa
         9FZFXqXs3+68ovJehmv8ieijW6nsYY5CX0if0MPyxRzRzl91cj8btU0nPbjymRD/ja9d
         pZcCLYCmOu9k586U4FhUHr7DG/+fgXjeP6Cj8gdvLWRLcFQr+cXmGD8vO/Tg/8VV5qAg
         LipBVDk8SQ/HWF5F59Qzt4zYLsPH1D2RfBfJmkX46LTEkI3xfx4TzN8/HSZMSt8TZmQu
         X255wiYpwpUtxFJ1vv8g+zFNLRTpDl0sBMLDCNazdABRSQoXWlKsr13UrjRFUE0rLUlz
         AC9Q==
X-Gm-Message-State: AOJu0YzIM/7JyBfttaQrGIrUGNekuAN+LuHr9Ec6JDH/ToK2Dcrw8eX8
	nMll9XHVHrSld+M6jFZ6W6EonQr1j6WQQE/shEc=
X-Google-Smtp-Source: AGHT+IHZ7Hdx8Mb4rONXCaUWVE1vl/C4zI9pCNIcXxwVNxjndLCBEQoCNtQaiDbHT2DKHhYtMBsg1A==
X-Received: by 2002:a17:902:c40d:b0:1cf:59ad:9637 with SMTP id k13-20020a170902c40d00b001cf59ad9637mr33131901plk.22.1701265269262;
        Wed, 29 Nov 2023 05:41:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w2-20020a63fb42000000b005b6c1972c99sm11271666pgj.7.2023.11.29.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:41:08 -0800 (PST)
Message-ID: <65673f74.630a0220.d3eaf.bcf8@mx.google.com>
Date: Wed, 29 Nov 2023 05:41:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc3-265-g1618cb8f57417
Subject: next/pending-fixes baseline: 92 runs,
 3 regressions (v6.7-rc3-265-g1618cb8f57417)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 92 runs, 3 regressions (v6.7-rc3-265-g1618cb8f=
57417)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig | 2      =
    =

rk3399-rock-pi-4b  | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc3-265-g1618cb8f57417/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc3-265-g1618cb8f57417
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1618cb8f574175a196b0e8926c62efc45760e856 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig | 2      =
    =


  Details:     https://kernelci.org/test/plan/id/65670c6d7928b5962f7e4aac

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-26=
5-g1618cb8f57417/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-26=
5-g1618cb8f57417/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65670c6d7928b5962f7e4ab3
        new failure (last pass: v6.7-rc3-220-gaeca85031d1b)

    2023-11-29T10:03:14.473762  / # #
    2023-11-29T10:03:14.575979  export SHELL=3D/bin/sh
    2023-11-29T10:03:14.576683  #
    2023-11-29T10:03:14.678072  / # export SHELL=3D/bin/sh. /lava-399535/en=
vironment
    2023-11-29T10:03:14.678813  =

    2023-11-29T10:03:14.780391  / # . /lava-399535/environment/lava-399535/=
bin/lava-test-runner /lava-399535/1
    2023-11-29T10:03:14.781546  =

    2023-11-29T10:03:14.785979  / # /lava-399535/bin/lava-test-runner /lava=
-399535/1
    2023-11-29T10:03:14.826259  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-29T10:03:14.851538  + cd /lava-399535/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/656=
70c6d7928b5962f7e4ac3
        new failure (last pass: v6.7-rc3-220-gaeca85031d1b)

    2023-11-29T10:03:17.239046  /lava-399535/1/../bin/lava-test-case
    2023-11-29T10:03:17.239469  <8>[   18.438987] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-11-29T10:03:17.239847  /lava-399535/1/../bin/lava-test-case   =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
rk3399-rock-pi-4b  | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65670d5333ecdfd4bb7e4ae9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-26=
5-g1618cb8f57417/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc3-26=
5-g1618cb8f57417/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65670d5333ecdfd4bb7e4=
aea
        new failure (last pass: v6.7-rc3-220-gaeca85031d1b) =

 =20

