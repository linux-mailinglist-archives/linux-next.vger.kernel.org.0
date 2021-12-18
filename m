Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49553479B7F
	for <lists+linux-next@lfdr.de>; Sat, 18 Dec 2021 16:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhLRPAk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Dec 2021 10:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbhLRPAk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 18 Dec 2021 10:00:40 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672C1C061574
        for <linux-next@vger.kernel.org>; Sat, 18 Dec 2021 07:00:40 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id e17so4370459plh.8
        for <linux-next@vger.kernel.org>; Sat, 18 Dec 2021 07:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zYmK1XQZ2G1rDoPDn2R4+HBpMpJbqvAF2EKjdmQ8/NY=;
        b=v/60FBNKUyFsd8DXglWf29VyuXCwkDvhq3W38BkYF8e5/3r25z3qKGTx0kCOQL3QDf
         aS4V0H7rZqXxAwrMGJHrRl7YQi+29dJMrKPyOhjoW/RgnO+1Lzqkcnk9mATsr03N5C+P
         mbHhSNyl/pNs3n4O+LrpKaCSaUGaGL2KFWei6DnxUKUSrOsxlqjdEFWujuOQXRIDTaeU
         vWQh7diG5PItRUZ70+vE26oD5dAETCNzNHooc7C7zQ7VF8yZrgDOrINs1Pbzd81QnLQ8
         W4aQ9cuzhx8IfiNx2E6UBtMIntppSK/zRJi0/nr1xc7rBL8iiezzw1+YizB6vplhIpO5
         +SbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zYmK1XQZ2G1rDoPDn2R4+HBpMpJbqvAF2EKjdmQ8/NY=;
        b=HhjWo6NlHptXSou84AVehWDZOleqXltYpMaBJ8GPzn164TYbmX+imjoh0xiBln+uW3
         sO+OwKQB8U58XEQBqLq1Ca7Saj7HZpTq/uIHs/oXDwO0hPj0nEwTCw014uEKcq9NagsR
         0yYp0A/MX0wpNMw8GKdXA6ke6216aUm/9+2DkEFiJPGC14UJ2O6fXwuuWKzp8W30b89N
         9DzVmSze5ZTHWBmmqeJnYmu0FN1S4l17qySjPrxPWQTvprpLAcoIz194q0kVi+xXJ9aC
         P7Kl6iWtoSv6s0Boqhon8NZYix5F+wgBIbnxycKx6vWKSKSA9o14B37vNawkgQL4f9bq
         8qXQ==
X-Gm-Message-State: AOAM5317ZyLRjVNOGg6ns5E1Pq0LDOEtX1FINhpLZyLsKwldIBAG43fR
        ueioZed3A2G6Q7h+916hbVdTyehaJHzGXrbV
X-Google-Smtp-Source: ABdhPJy/yk7fCAOntB50ZZp/QmPXPl516rcZK8e3mcWQOF3bbxOJTSJHQfRov91dsiWvof8s1ka6pQ==
X-Received: by 2002:a17:902:6b05:b0:148:a2e8:2c31 with SMTP id o5-20020a1709026b0500b00148a2e82c31mr7950258plk.128.1639839639528;
        Sat, 18 Dec 2021 07:00:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s8sm12401538pfe.196.2021.12.18.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 07:00:39 -0800 (PST)
Message-ID: <61bdf797.1c69fb81.4bcd4.23c7@mx.google.com>
Date:   Sat, 18 Dec 2021 07:00:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-294-g65d84bcc1bef
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 587 runs,
 3 regressions (v5.16-rc5-294-g65d84bcc1bef)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 587 runs, 3 regressions (v5.16-rc5-294-g65d84b=
cc1bef)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+im=
a                | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc5-294-g65d84bcc1bef/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc5-294-g65d84bcc1bef
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      65d84bcc1befc2f270cc2ac9de0364da029ae3ef =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/61bdc0e4411e520d8c39715b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
94-g65d84bcc1bef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
94-g65d84bcc1bef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bdc0e4411e520d8c397=
15c
        new failure (last pass: v5.16-rc5-257-g713f2fcb90ea) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61bdbe2590909ecdb03971bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
94-g65d84bcc1bef/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora=
/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
94-g65d84bcc1bef/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora=
/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bdbe2590909ecdb0397=
1be
        new failure (last pass: v5.16-rc5-177-g6cfce3d8f89a) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61bdbfc9c02a668f7b397122

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
94-g65d84bcc1bef/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minn=
owboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
94-g65d84bcc1bef/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minn=
owboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bdbfc9c02a668f7b397=
123
        new failure (last pass: v5.16-rc5-257-g713f2fcb90ea) =

 =20
