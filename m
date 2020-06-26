Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D76A20B7BF
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 20:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgFZSBv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 14:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgFZSBu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 14:01:50 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90833C03E979
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 11:01:50 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id b5so4947656pfp.9
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BK8VHVswTcUHQ+FOML4axXYbvaj6ukHbd7ro42tL+gQ=;
        b=HrKvCrzbq4ItGCBOB9DkA0GDet9C2XkuzvU1ZCjAOtJgpQ3HHiuxzbGEXPcUgMY+Yf
         FMINX2pRrnfNh5SGuFPJ/fdRlP1BGVuZEGMZ8bB8bvZT6dtY8DenpQ4h7pMhgo+h69nn
         y7i0KuE+oRSsXr9X4RxOc48zn5AZ4vq9ncdthlHuFNzlCjlAMNHys8efnm0OBI/TVm1h
         lLyCBPaU4QSPji9CnRgRYava6nCUE6del4xN4TUg4IrDnjfHd8lIB5GvPWea0TJhXyb2
         VIkCnG/RRfXGjxoUs0YcSJnne3Q2EPpwkVpy73ZosQFyMyGOnSB2uqS65sigaarrnBEM
         4+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BK8VHVswTcUHQ+FOML4axXYbvaj6ukHbd7ro42tL+gQ=;
        b=haoqgUlJzCoAZZAtKC6HP/tFXHgKib1k6biggyzAufiIa4sPyBJ9aNrcQzaHJh6U4s
         IgWhbC7RDRqDAjUDVpJCjKLnbGwgoq/Jdo+w2jdyPUKKq9E/tyLgRloiIEDDtesNLzO0
         jsDSyfxj65AUXPvG4uF/DCYZohG2pKqmVQmWsKtZkbJ2csZl0DAKAZkxd6Wwj5ULqOgY
         re6SMx9vWPRXdYpBvu/ibIVFpFkhtDmu/lXhZqz60AiLvirlA77M9RHp3E0KHSaE4aHZ
         Z7yRoKoUi+qoii8jU9/OZ93FEML2ttpW3TvulcGimOYVWwTzzxTbL7hFle6wAo0ivCxx
         VKcg==
X-Gm-Message-State: AOAM530Ng1aLtWh/zei6GwFomPXfajfe1H3omjUSTKsubPP2ShSHN/74
        G4jm5u0BomdsSZp4Lneq5p5AxK57w5A=
X-Google-Smtp-Source: ABdhPJydQ6BsDeadHYMw9VmbjzpAJoBO53O/4BQOjBz1D7dtlouJD6D8OL+nU2COj/2olMrj2mfuIA==
X-Received: by 2002:a62:1481:: with SMTP id 123mr3824008pfu.92.1593194509592;
        Fri, 26 Jun 2020 11:01:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fv7sm8336077pjb.22.2020.06.26.11.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 11:01:49 -0700 (PDT)
Message-ID: <5ef6380d.1c69fb81.deb8f.3a47@mx.google.com>
Date:   Fri, 26 Jun 2020 11:01:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200626
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 68 runs, 2 regressions (next-20200626)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 68 runs, 2 regressions (next-20200626)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
  | results
----------------------+------+---------------+----------+------------------=
--+--------
vexpress-v2p-ca15-tc1 | arm  | lab-cip       | gcc-8    | vexpress_defconfi=
g | 3/5    =

vexpress-v2p-ca15-tc1 | arm  | lab-collabora | gcc-8    | vexpress_defconfi=
g | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200626/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200626
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      36e3135df4d426612fc77db26a312c2531108603 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
  | results
----------------------+------+---------------+----------+------------------=
--+--------
vexpress-v2p-ca15-tc1 | arm  | lab-cip       | gcc-8    | vexpress_defconfi=
g | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef5fdf12220df838a85bb1f

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200626/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200626/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef5fdf12220df83=
8a85bb22
      failing since 11 days (last pass: next-20200603, first fail: next-202=
00615)
      2 lines =



platform              | arch | lab           | compiler | defconfig        =
  | results
----------------------+------+---------------+----------+------------------=
--+--------
vexpress-v2p-ca15-tc1 | arm  | lab-collabora | gcc-8    | vexpress_defconfi=
g | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef5fe0840a23c98df85bb1b

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200626/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200626/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef5fe0840a23c98=
df85bb1e
      failing since 11 days (last pass: next-20200603, first fail: next-202=
00615)
      2 lines =20
