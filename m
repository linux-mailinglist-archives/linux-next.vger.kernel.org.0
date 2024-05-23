Return-Path: <linux-next+bounces-2389-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA68CCCA6
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 09:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202ED283CC4
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 07:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966F842070;
	Thu, 23 May 2024 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pvpZDPW+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6C3BB30
	for <linux-next@vger.kernel.org>; Thu, 23 May 2024 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716447696; cv=none; b=DdcP0NXDsMrWDXJsRzm8zdxs7UVsrpr/tmtR2/ZMWqTeHvM18Cw07X436RanztfBfAgMTl6KqWZTXKwnrR2wc3wksEQt6wKzujOuLZ5s9wei8d8eaRVBTnp+uUIt2Txn0Gqx8CBFcU4aSTCtlLZa2ANvkY07AoUWyTbQfAQBnIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716447696; c=relaxed/simple;
	bh=Xs+6vDdUb/tFKAcv9z6qsjns9jQ9NMsbBnqwl4BWsJs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=S3xA/6ekgLXGJ/W6FxoFLH33qJmmQQ176EF292bkGQDb2aYMgKDhBEj55D3SEE3llkCEJ8e2y+KzYUT94mwrqypwZmw/AMkcoP/u/y24Z3WXMWaziwYjYHDCFj7sivEDaNIxge0z/+kajw/qgxwwclo9z+fVGWsK+9vdqtSDSDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pvpZDPW+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f4dcc3eeb3so1662330b3a.0
        for <linux-next@vger.kernel.org>; Thu, 23 May 2024 00:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716447689; x=1717052489; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MBHfdI1nI6XoCaluQSSoGDHWGtvAfn28Z58ygCsepn0=;
        b=pvpZDPW+IndpEwc+0eVj2YhLCw2+0iTcKQ35otYcama+nXoNGXbxytOhTkbNm4Gu+7
         fxpi0h+kVrWdjPBCaiuCltiKSstvXXRmzpzGMYO6Qdbfm9P7yR2tdF7PoMkNRDcF/OWf
         Rc3w3nLWZSj1riiqx/mJ/KC1q24tRyL0Zhg3VAns81LRITdr5DqgcHR4L3u5EZynMdtY
         +wdfx1NXAvsQGoGgxr7I9uqS+Blc4HGy5Im/sL84BCmnCVlv31VruJXn9L4Rfupqc9U0
         r0oF55h4l9XCW4RrXV5rZyxkRLoyr86Bs1mmogTH/Yo9l9Zzk2hMWtU5V3P4iAnphM0R
         9QQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716447689; x=1717052489;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBHfdI1nI6XoCaluQSSoGDHWGtvAfn28Z58ygCsepn0=;
        b=JSO0hnLwqCB5sPrOqqrbfa3cPzoJ1IjGz7mGg0lxyQGX65ZSrlzM/CcyFjmkY4198A
         tFES4Z7KN5DSSda3VxFMtoNdLJTkI20qxwq7kkHWQmFQcxgNrzBLsG99CGUeSmLwu2OS
         +M6VrBRopYigM1PK/pTQosymS/ahZhT3vnkNiX4A6smBSCBL+tipJMmqpstBJXhLmL/r
         +bOmTr6a85Zu01qhByl+Qy9Ah4XqxuHm82ZRBMxYLuWTkmnThFKAiobH2M3dYZgiR/de
         ycoTQ0QxWN5nhc52VulXBe7UyA8uyQB09VyhBNcCOX/BzmZFUCxxzpbAS7IKz5UILp67
         ijag==
X-Gm-Message-State: AOJu0Yz1cvzAq1cmo47JHuTQR9udbIC7Z1O8xgu+b2EhPLW2YnlFVKQW
	I1ygoaF8vyUdg36EcOH6xzqaGnlzyoFCCt5TG7CPYG579S0zTiO2QhnGUPIygC4DU2fTXwTrLPu
	hx3I=
X-Google-Smtp-Source: AGHT+IGw3dime9m7lbOXWHiex6tFTYagZCzBC0iVOdRsD6i1/oDYHK90G1R7P6AIqZFdSjpxqEJR3w==
X-Received: by 2002:a05:6a20:968a:b0:1af:a469:75aa with SMTP id adf61e73a8af0-1b1f8b44beemr3867253637.46.1716447689446;
        Thu, 23 May 2024 00:01:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f6768b64absm14109085b3a.11.2024.05.23.00.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:01:29 -0700 (PDT)
Message-ID: <664ee9c9.050a0220.1cf24.53a0@mx.google.com>
Date: Thu, 23 May 2024 00:01:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.9-12014-g1b94b2f9194be
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 69 runs,
 3 regressions (v6.9-12014-g1b94b2f9194be)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 69 runs, 3 regressions (v6.9-12014-g1b94b2f919=
4be)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform    | arch  | lab          | compiler | defconfig          | regres=
sions
------------+-------+--------------+----------+--------------------+-------=
-----
jetson-tk1  | arm   | lab-baylibre | gcc-10   | multi_v7_defconfig | 1     =
     =

k3-j721e-sk | arm64 | lab-baylibre | gcc-10   | defconfig          | 2     =
     =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-12014-g1b94b2f9194be/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-12014-g1b94b2f9194be
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1b94b2f9194bec2236627ebd8a860e76b4a38801 =



Test Regressions
---------------- =



platform    | arch  | lab          | compiler | defconfig          | regres=
sions
------------+-------+--------------+----------+--------------------+-------=
-----
jetson-tk1  | arm   | lab-baylibre | gcc-10   | multi_v7_defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/664eb85bb9ce90da824c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-12014-=
g1b94b2f9194be/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-12014-=
g1b94b2f9194be/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664eb85bb9ce90da824c4=
2eb
        failing since 58 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =



platform    | arch  | lab          | compiler | defconfig          | regres=
sions
------------+-------+--------------+----------+--------------------+-------=
-----
k3-j721e-sk | arm64 | lab-baylibre | gcc-10   | defconfig          | 2     =
     =


  Details:     https://kernelci.org/test/plan/id/664eb9897e41f839614c42f1

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-12014-=
g1b94b2f9194be/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-12014-=
g1b94b2f9194be/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/664eb9897e41f83=
9614c42f4
        new failure (last pass: v6.9-11085-g4a09d8e8118e)
        6 lines

    2024-05-23T03:35:19.180173  kern  :alert : Mem abort info:
    2024-05-23T03:35:19.200210  kern  :alert :   ESR =3D 0x0000000096000006
    2024-05-23T03:35:19.200638  kern  :alert :   EC =3D 0x25<8>[   21.88035=
0] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D6>
    2024-05-23T03:35:19.200781  : DABT (current EL), IL =3D 32 bits   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/664eb9897e41f83=
9614c42f5
        new failure (last pass: v6.9-11085-g4a09d8e8118e)
        39 lines

    2024-05-23T03:35:19.178831  kern  :alert : Unable to handle kernel pagi=
ng request at virtual<8>[   21.858970] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D39>
    2024-05-23T03:35:19.179151   address ffffffffc20a6988   =

 =20

