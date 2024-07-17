Return-Path: <linux-next+bounces-3057-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CE933E3D
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 16:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FD94B21106
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 14:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C3017F36E;
	Wed, 17 Jul 2024 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2oVO6jWM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118311802CA
	for <linux-next@vger.kernel.org>; Wed, 17 Jul 2024 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721225713; cv=none; b=EEEPOVNkdRfI2xSuCePdN1w3nJzcjWqeyuqXXVY8aCs9KWRKY2JWM7y8z/Ry7jS/JTMMUIXOCHaZ0b388URK1cVdvzAB3sNfOtSUCRmGwIPBtwl/GAx2/ud69eYhoKxYbgigy9YoeiAeXWv8il3WaJKq0XqtUOKkNXVl3UJDmuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721225713; c=relaxed/simple;
	bh=JPxbJ2ahO/Sg0cwYa2vhKrSnBJ05nGs3J83/xccVDV8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hVmkZg7J/VO4EzmNH/F3OaKCcP6icZlkXZddQEOwLjOzl1NmhY7QkSfPOAVaC/+4zhUMpFe+rDVB07cTm6IUrppA+54dsX4n1yp7fkuXak2/16+pUEmUCRkOoTelXVs6rt/F21miwfH8dJac2saconRvq0cfv+5/wNTbRbin5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2oVO6jWM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70b2a0542c2so6293276b3a.3
        for <linux-next@vger.kernel.org>; Wed, 17 Jul 2024 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721225709; x=1721830509; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GLSXAojsOuBGqM/nwEgGrYNMl/rksnCwqa0kDGQPff8=;
        b=2oVO6jWMDhDlyVA+L0wEbpcojx849FMl69Tw+Otx0ziSR67mNJlkBWYZul1q9IVMiT
         bpZlH/rFCEw/Qi/Agn9yKkvKDTD0AyDBCmsFy6mh03C2/QuM92N/9pmWFMmy3YOS9+zm
         gOgnwclgl9ugwLFnULdQuNPCWUIuh3RBVGNQA2oZoOlm3C/+PFg4kPMRvx7igVmTaHQ6
         u3FMbTmlO32B/B81OlhwlTdUErTHAEYOch8YGHHMx3Dv315521InvhCxpEkTOoy9n4y1
         xv2zC5o6lQihhxdBuvob3u8sDURuSqwBR2t0Tx9hLChgw/DZmchpdytNzAmep1E6yxy0
         ItBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721225709; x=1721830509;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLSXAojsOuBGqM/nwEgGrYNMl/rksnCwqa0kDGQPff8=;
        b=bQyljIgbhzbzzMaG8drqtb7Gp0cSgTG0IN+2dnkx8zPEmJMpdCSbfV+23GT5t9k9dR
         FeAWd7q+CQDj9kXsEzSZ98CRmGQTREnBXUd14HM7xrQ/wRlzT8i8jvKO30hMR7nQZFQk
         7VEYriM9EWOzs0zPinnKR2WPjm5wGiCwgig3hYlWVLQiGjr7n/UnZ+hfXz//y6h/kqBm
         gltp9xcRiBtlle2gfC3ugtoTqsDQ4WiJ6qWlLW0KKJlKIDBAmgi5nwaLSzblBJAFxmPQ
         qIl8Z55VNQEQt2xmjzwuAr4fRCJZu2OgutwmNAEshtrm/4NyndDBKgcNgJy/T4xzp9pw
         ODSQ==
X-Gm-Message-State: AOJu0YxKdnYU3sx1wsOCb57ijyatSubp7LEFRdI/T+bxjiz5aHYuJ4zW
	/TqTlHa4HwknGOx3J+qN3WAltbwqjtq8W7RUVGvZPi3+XjMNhzam204nhfUf0VsbfHHThhDMAxF
	X
X-Google-Smtp-Source: AGHT+IGUO8LOTGdVvBiDYnLWbTI+n9ETKT1NZhYsdOJmlMuk9E9d1SEoJT+Oh8WfFXk1vdIERQ/znA==
X-Received: by 2002:a05:6a20:a10f:b0:1c2:9487:ee90 with SMTP id adf61e73a8af0-1c3fdd6b4aamr2447395637.44.1721225708836;
        Wed, 17 Jul 2024 07:15:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc58e7e61dsm871015ad.63.2024.07.17.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 07:15:08 -0700 (PDT)
Message-ID: <6697d1ec.170a0220.7ffb2.162c@mx.google.com>
Date: Wed, 17 Jul 2024 07:15:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240717
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 321 runs, 3 regressions (next-20240717)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 321 runs, 3 regressions (next-20240717)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
beaglebone-black        | arm   | lab-cip       | gcc-12   | multi_v7_defco=
nfig         | 1          =

mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =

r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-12   | shmobile_defco=
nfig         | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240717/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240717
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      797012914d2d031430268fe512af0ccd7d8e46ef =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
beaglebone-black        | arm   | lab-cip       | gcc-12   | multi_v7_defco=
nfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/6697a24ddc5116095d7e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240717/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240717/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6697a24ddc511609=
5d7e7072
        new failure (last pass: next-20240716)
        1 lines

    2024-07-17T10:51:38.324407  / # =

    2024-07-17T10:51:38.333062  =

    2024-07-17T10:51:38.438218  / # #
    2024-07-17T10:51:38.445059  #
    2024-07-17T10:51:38.590934  / # export SHELL=3D/bin/sh
    2024-07-17T10:51:38.604889  export SHELL=3D/bin/sh
    2024-07-17T10:51:38.706608  / # . /lava-1167574/environment
    2024-07-17T10:51:38.716955  . /lava-1167574/environment
    2024-07-17T10:51:38.818897  / # /lava-1167574/bin/lava-test-runner /lav=
a-1167574/0
    2024-07-17T10:51:38.828634  /lava-1167574/bin/lava-test-runner /lava-11=
67574/0 =

    ... (9 line(s) more)  =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6697996b87df808d657e71ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240717/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240717/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6697996b87df808d657e7=
1ed
        failing since 5 days (last pass: next-20240711, first fail: next-20=
240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-12   | shmobile_defco=
nfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/6697998551c687785b7e70c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240717/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240717/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6697998551c687785b7e7=
0c6
        failing since 0 day (last pass: next-20240712, first fail: next-202=
40716) =

 =20

