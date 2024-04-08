Return-Path: <linux-next+bounces-1832-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E589B67A
	for <lists+linux-next@lfdr.de>; Mon,  8 Apr 2024 05:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D471C20F4E
	for <lists+linux-next@lfdr.de>; Mon,  8 Apr 2024 03:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C32D46A4;
	Mon,  8 Apr 2024 03:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lBGcBOor"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CB1FC8
	for <linux-next@vger.kernel.org>; Mon,  8 Apr 2024 03:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712547416; cv=none; b=evXlRP6Ecj3GHSgTy2pOJ9RqAXmn5dIidPx9gNQqzm+I10e1zTMQ/JliZfNOseSE33wC+Fbhcb0Rr1g/9/lpGO6riQ4ISEJVjxJlJRDAM5LtavOmlWpeqOfd3UFg+8pHqJWn05LI3HkzvuT0r++sjwiUUQAsTjsArI9etl4xa/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712547416; c=relaxed/simple;
	bh=T8SivWLRydW+ZfDTEUCYBNn7UMYU3+O0MUjlfTLv8Ko=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=sog+3bKjG6zZ4Q3GRDI0PqohFNfKhoPTcnjhXnrJdpp23hw1ha9X5FaQupgXS2HOP4OI04H3gS6LfBN1SBCDG4pkT1saYsl4HnBSbr+oQOBVqLoFZVJDNkgzYwN9DI4i30Eiu6U/Kr8MkT33HcH0dEpEOKaf9Q9rn51YuKGP24o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=lBGcBOor; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so2318481a12.3
        for <linux-next@vger.kernel.org>; Sun, 07 Apr 2024 20:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712547413; x=1713152213; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oA+NIJg0myyiW03oWvvz/4+VCETCVFM5opiigBweWH0=;
        b=lBGcBOorRRekzdWtm2q6klVPyKFKiLhS1uHoBnnV1bEiw7LMhUf/G6to0Y4FlO4w5T
         9LMEvpU25INk+gprWe6i8+LE/7lgck1rQY94qgssukiEmyCxSf0PySxAqejPDv/dBh8u
         90JJFdP20l169xbctokNU4i0BU5l3Xc8hLNZ0XjPVBAWTsl3BU3ekRb7AUFNp1n01G0S
         ce/3RCQqSpKvEmpgipCTuXMKTaYx6mMrq7p7jM8zthd3olCvA/LbIA4lSDOmmu+XBOWp
         nMu7fknO7gxs0zHK8j91v4wAZyElY6DAnAWxS4iglxkucMYVp+ifGXBHzXUIUbInz5gW
         tOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712547413; x=1713152213;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oA+NIJg0myyiW03oWvvz/4+VCETCVFM5opiigBweWH0=;
        b=Ps76DAelWP6nNM7R5xX10gJh40YFQbkhsdWh/dIYEGU0HfTJRXDZ/EAgeZvwmAJ+JW
         kj4NnJshmnNJ78xn+xGnEczWm6XsyTwRZ/7vIZ8YM/jeaSJR68yUaLp7vBE6wZfZOm92
         nKWZr+L2NvXnce81DCMJ2br9MJDcUnLhZ9KVNKu36KSVcbAOVps2yyNhCvIzL8Yx0TnU
         Nor5USZEWAPee3WIDFi5OwwdJ0HV+EePpariGZ9DkS4o5bSeFGzPBPvcGCGDuR68o6e4
         lb9IKpwyHzxE1dRCCNuDYuCBFEJ189HHjBfXjdPyoi1v6XLlc8O+fkeiUniJvo891Vn1
         kJjQ==
X-Gm-Message-State: AOJu0YxjDJd6HxUm7QEvXagsCv1vec6cFrNkGSkh+snAR0x7UEsnYPo8
	C3ae1yNVckwBh902A68niMiRuyOdWMGTIXA7PLsnp8DjQyoIaZz+4LlIaODJwLYqqN37g755i2K
	+
X-Google-Smtp-Source: AGHT+IEgA8meuMSQI9cVJp342wfaypzDA65oEC6YOnBysqblihxYw5bUxt/aeVSh+rFLhIBABznPIg==
X-Received: by 2002:a05:6a20:841b:b0:1a3:afdc:fe5 with SMTP id c27-20020a056a20841b00b001a3afdc0fe5mr7196144pzd.42.1712547413399;
        Sun, 07 Apr 2024 20:36:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id gd16-20020a17090b0fd000b002a508487a96sm1294476pjb.28.2024.04.07.20.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 20:36:52 -0700 (PDT)
Message-ID: <66136654.170a0220.7bc6f.2813@mx.google.com>
Date: Sun, 07 Apr 2024 20:36:52 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc3-150-ga334017808414
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 82 runs,
 1 regressions (v6.9-rc3-150-ga334017808414)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 82 runs, 1 regressions (v6.9-rc3-150-ga3340178=
08414)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc3-150-ga334017808414/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc3-150-ga334017808414
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a334017808414b07009579c33f12e53873d2b0d6 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/661338cecb20b340bd4c42f2

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc3-15=
0-ga334017808414/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc3-15=
0-ga334017808414/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/661338cecb20b340=
bd4c42f7
        new failure (last pass: v6.9-rc2-404-g24e5164b281b)
        1 lines

    2024-04-08T00:22:17.606879  / # =

    2024-04-08T00:22:17.615485  =

    2024-04-08T00:22:17.720679  / # #
    2024-04-08T00:22:17.727742  #
    2024-04-08T00:22:17.829870  / # export SHELL=3D/bin/sh
    2024-04-08T00:22:17.839437  export SHELL=3D/bin/sh
    2024-04-08T00:22:17.940700  / # . /lava-1117431/environment
    2024-04-08T00:22:17.951646  . /lava-1117431/environment
    2024-04-08T00:22:18.053431  / # /lava-1117431/bin/lava-test-runner /lav=
a-1117431/0
    2024-04-08T00:22:18.063631  /lava-1117431/bin/lava-test-runner /lava-11=
17431/0 =

    ... (9 line(s) more)  =

 =20

