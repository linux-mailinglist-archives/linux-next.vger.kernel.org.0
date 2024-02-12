Return-Path: <linux-next+bounces-1121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED380850FD8
	for <lists+linux-next@lfdr.de>; Mon, 12 Feb 2024 10:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4D1D281E86
	for <lists+linux-next@lfdr.de>; Mon, 12 Feb 2024 09:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EF412B7E;
	Mon, 12 Feb 2024 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3UJ8dUjH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78B0179B0
	for <linux-next@vger.kernel.org>; Mon, 12 Feb 2024 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707730733; cv=none; b=Wg52eZ9oIjwPPIY1eLaRPw+FRYVzoAnbWkskvBs0LxqbpQLDS70qrTOTZT8KJYarXVsgOtrUhboBtAmidQ68K1hUzIGpj1my3RIbP7+DAscBOg1VibgiXOorMfZUwP+yymH/3oSst7I/BBYbsPXkhHzPaT2hp90ay+FwRvKXMIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707730733; c=relaxed/simple;
	bh=+6lYsil/nyfLIhdO2kEJ5ehbRx+oPX4XmeDXrrWzZSY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=W2STj417QIPJzCVACBRzWMtDR5CPFAG9X+2ImQI47zlHZ4VE/bw063zjZ74xU6C6LFmpe0RiBoOkLIEkxgJUXNyZ9dCfXQpXl+gNO2e+SNJV+D2znVAudK3oDvKabVhxH/G0lYpfTn/J7a0eMleyYJ5K6LTWG1DfYM2lyMFdTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3UJ8dUjH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d9b2400910so19279145ad.0
        for <linux-next@vger.kernel.org>; Mon, 12 Feb 2024 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707730730; x=1708335530; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XpxLV2zv1kaTqlaJWao6Qae2byHVBghnWHHKgUaLXdg=;
        b=3UJ8dUjH7W/jcqkhcr6Qz0+IqPbRmr59yTWJGD5LdYcc7ib3dC0JkKHj424g7WpqEb
         qffT4gJJfnO0IXuen+csmYIg8WFCcO4Ya1qoziKxP+6X25+TRsFVSZTGUC+0wx9i0NKF
         PP3gxWm6+5Kw1mgtkx5RQ5/txqoSZmR6maDh89ef/pWoDvhp8mZyUC/IDxK08S9CIeS4
         B3OaYUDpm1Y5NX5nnGrSVaEQ/I+GiGAdEQfiyU7zC7Y7cnJ6hv/U1PYOQb5Nrb+VP3Ns
         AKa7/5Q+yTb6TX3mBJm/jWCGJ0ulywGNjkTmhUYPkFO/hihwUopLXzIuvzMTsxLnIQFW
         XS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707730730; x=1708335530;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpxLV2zv1kaTqlaJWao6Qae2byHVBghnWHHKgUaLXdg=;
        b=Dut2OT3gnZ/I0MJOrXwOW+cZO7kEinNxlEmwqIALFauuXblDQdwb+P28+zLjC4ocYB
         fw/EgZsf1WMTngGWBRYdWqdFuXttlrCjv28kr41h9U4t8ab5u1OclrKHKqzrVM0AgtGu
         wo3kksUFy7z3C3AD4mLKopf6z+3zmQMUwq5Lt3rsJ6CtJEF+J2j+xr/lZjzkByTAVLx3
         4BdjpBqY133gPL7O38xrgnB3SfIKiikGsd4LK/ku2r/MYpmsC81Bp46zKL1J5dCaOXUP
         fByBBM+RNf4Yw4mGhwzYr+/wZSvuDSV5HmoMk+mdd8/X/PPkFmUfTDP70Zv6Xt6peUth
         Xivg==
X-Gm-Message-State: AOJu0YwHm6IXDTbn+oGJR4uS/rDQXEtQ79Y1CZsFCKvQuG6fXyZJytB6
	QYWKc6lUIYJvXmja5A6j1EanA+JNIr/QMUzx5q0hd4Mdm11dK2a9/abNKo5AUF8iobab6vGNMe4
	lmC8=
X-Google-Smtp-Source: AGHT+IEH6kbESU9NaDU4PelDeFEX61nrnckz7LiERoyoVFhptDpcDJ8IcvmngRp9WtdMLBQoXuxaNg==
X-Received: by 2002:a17:902:c409:b0:1da:2c01:fef3 with SMTP id k9-20020a170902c40900b001da2c01fef3mr4772155plk.5.1707730730589;
        Mon, 12 Feb 2024 01:38:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnxDOkov3FYeNxmV0ro7fpbTrrDDXRGfcyjfx5qRrrB8oemeCjPDiLJWWoKbnGhUEjINhn1kkjgnXqgztNAKPrZSfDHd97zjrSPHKxOIM1A5ZxUSP9NOPDKBr0vkTFW4R2Oy+FI05nDo6VIaZdgQV3OA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001d9469967e8sm5530230plh.122.2024.02.12.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 01:38:50 -0800 (PST)
Message-ID: <65c9e72a.170a0220.d8d2a.e152@mx.google.com>
Date: Mon, 12 Feb 2024 01:38:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.8-rc4-226-g965c587a265e7
Subject: next/pending-fixes baseline: 87 runs,
 9 regressions (v6.8-rc4-226-g965c587a265e7)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 87 runs, 9 regressions (v6.8-rc4-226-g965c587a=
265e7)

Regressions Summary
-------------------

platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-kbox-a-230-ls       | arm64 | lab-kontron | gcc-10   | defconfig | =
5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron | gcc-10   | defconfig | =
2          =

rk3399-roc-pc               | arm64 | lab-broonie | gcc-10   | defconfig | =
1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe  | gcc-10   | defconfig | =
1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc4-226-g965c587a265e7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc4-226-g965c587a265e7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      965c587a265e73e91ea5eda6f9b30ea59389cf65 =



Test Regressions
---------------- =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-kbox-a-230-ls       | arm64 | lab-kontron | gcc-10   | defconfig | =
5          =


  Details:     https://kernelci.org/test/plan/id/65c9b593ef8f2319b08e1e99

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9b593ef8f2319b08e1e9c
        failing since 24 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-12T06:06:53.103375  / # #
    2024-02-12T06:06:53.205602  export SHELL=3D/bin/sh
    2024-02-12T06:06:53.205940  #
    2024-02-12T06:06:53.307071  / # export SHELL=3D/bin/sh. /lava-428576/en=
vironment
    2024-02-12T06:06:53.307873  =

    2024-02-12T06:06:53.409166  / # . /lava-428576/environment/lava-428576/=
bin/lava-test-runner /lava-428576/1
    2024-02-12T06:06:53.410427  =

    2024-02-12T06:06:53.450366  / # /lava-428576/bin/lava-test-runner /lava=
-428576/1
    2024-02-12T06:06:53.473226  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-12T06:06:53.473660  + <8>[   20.664728] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 428576_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c9b593ef8f2319b08e1ea0
        failing since 24 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-12T06:06:55.578021  /lava-428576/1/../bin/lava-test-case
    2024-02-12T06:06:55.578451  <8>[   22.771829] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-12T06:06:55.578867  /lava-428576/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c9b593ef8f2319b08e1ea2
        failing since 24 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-12T06:06:56.638041  /lava-428576/1/../bin/lava-test-case
    2024-02-12T06:06:56.638569  <8>[   23.811241] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c9b593ef8f2319b08e1ea7
        failing since 24 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-12T06:06:57.714504  /lava-428576/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c9b593ef8f2319b08e1ea8
        failing since 24 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-12T06:06:57.717607  <8>[   24.924289] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-12T06:06:58.776541  /lava-428576/1/../bin/lava-test-case
    2024-02-12T06:06:58.777004  <8>[   25.945659] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-12T06:06:58.777351  /lava-428576/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-sl28-var3-ads2      | arm64 | lab-kontron | gcc-10   | defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/65c9b592daea223abb8e1e98

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9b592daea223abb8e1e9b
        failing since 24 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-12T06:06:54.823230  / # #
    2024-02-12T06:06:54.925448  export SHELL=3D/bin/sh
    2024-02-12T06:06:54.926233  #
    2024-02-12T06:06:55.027774  / # export SHELL=3D/bin/sh. /lava-428573/en=
vironment
    2024-02-12T06:06:55.028491  =

    2024-02-12T06:06:55.129940  / # . /lava-428573/environment/lava-428573/=
bin/lava-test-runner /lava-428573/1
    2024-02-12T06:06:55.131168  =

    2024-02-12T06:06:55.151074  / # /lava-428573/bin/lava-test-runner /lava=
-428573/1
    2024-02-12T06:06:55.203938  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-12T06:06:55.204367  + <8>[   20.964498] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 428573_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c9b592daea223abb8e1eae
        failing since 24 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-12T06:06:57.637941  /lava-428573/1/../bin/lava-test-case
    2024-02-12T06:06:57.638436  <8>[   23.386224] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-12T06:06:57.638710  /lava-428573/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
rk3399-roc-pc               | arm64 | lab-broonie | gcc-10   | defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/65c9b77f240e9970118e1ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9b77f240e9970118e1=
ed0
        failing since 12 days (last pass: v6.7-12142-g865a3df089bf, first f=
ail: v6.8-rc2-275-g21abc01c4bcb5) =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe  | gcc-10   | defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/65c9b69738fea3e9c48e1e95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-22=
6-g965c587a265e7/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9b69738fea3e9c48e1=
e96
        failing since 4 days (last pass: v6.8-rc3-184-g749067d43da7a, first=
 fail: v6.8-rc3-284-g567dd3d8c2ec) =

 =20

