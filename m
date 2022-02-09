Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D298B4AEA67
	for <lists+linux-next@lfdr.de>; Wed,  9 Feb 2022 07:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbiBIGbY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Feb 2022 01:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236149AbiBIG3v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Feb 2022 01:29:51 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111D3C1036BF
        for <linux-next@vger.kernel.org>; Tue,  8 Feb 2022 22:29:55 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id i21so1102111pfd.13
        for <linux-next@vger.kernel.org>; Tue, 08 Feb 2022 22:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t7Pso+3QoXGsogMS6hV0WyTdsXPn3Pz6smVFNsJ53Sw=;
        b=ubjgnRmTZ0inIpF3/O6VzFd7K00TROM+n22aelh5Nf0LJjcI99bKJ/vo7g1ARvDf5w
         ZTs9cIoyUU3o8PWJUN2osoRb/BagpyybtiFFTRjtavuGn9AtdJ1RDbRw5TNJtZtsY8Bv
         BqRFGB7xedfXKuuQD9peiThYLQ0teafMQjQICH+11h31mbPXF8mA5oe/jm086f61/HFB
         qB1y74FdXcYdS4PRxTATKn0hc2axJ1bZYOU8eiK8abUbi6oEZ+KCS9gAjXYdzdWKWgps
         toztfYGv2ZEllj81m5C/tDnndHwzTxPPBb0hWvptS3xf+lci9vdOGrzOArJPaZYec34M
         pjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t7Pso+3QoXGsogMS6hV0WyTdsXPn3Pz6smVFNsJ53Sw=;
        b=54Gi0lcPi7UKVovLPr2lJydJ/4fHLNhG5RMCLOjfK86XnaFiqRGQO/ttXgan1Gmb0H
         lcJjwd45dU7SDTsDUwQC6Qf/SoHusXSVGZ9migOWIQxbqmPCbP8JFkHEj+wEFiMUh2XY
         iiRiL6BP0VN6LAV2QJgraDpCz7B43tGvELoVaTh2AvkfI8uvCGM06mjnbisf7Ez3ChdU
         FlzBzu35Ktx1eOSAYMaGKGOXoD1yY6JKRAItYt+N6vuhCvQF3Tq66IU5JJY0YT+ObOkf
         6af1xtqRTQDPodWgAOX1KW4Ui+LNPV/HlFHKFYW9ST06sMLP3xUfUuFl1Bklo6h8gj+Y
         ebNw==
X-Gm-Message-State: AOAM532hRvO6guVE3cWJPtuwTSmrLZzuL6oBYHTSE6WZVFBOUT0QG2Fd
        r/mXw4WVwTvRSPOqn2dORSEv/66IGbbnMFG4
X-Google-Smtp-Source: ABdhPJzrnrYMUKPV1BTj9coOLXm5ExEmHDZsf9arukJ78T80SGA3mRRXsYmGiwXG5+P0FMDSvRwOZA==
X-Received: by 2002:a63:4650:: with SMTP id v16mr762728pgk.155.1644388194431;
        Tue, 08 Feb 2022 22:29:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e17sm1266255pfv.84.2022.02.08.22.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 22:29:54 -0800 (PST)
Message-ID: <62035f62.1c69fb81.5a93f.3b19@mx.google.com>
Date:   Tue, 08 Feb 2022 22:29:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc3-310-g301c67a59c13
Subject: next/pending-fixes baseline: 345 runs,
 2 regressions (v5.17-rc3-310-g301c67a59c13)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 345 runs, 2 regressions (v5.17-rc3-310-g301c67=
a59c13)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
           | regressions
-------------------------+--------+---------------+----------+-------------=
-----------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig  | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc3-310-g301c67a59c13/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc3-310-g301c67a59c13
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      301c67a59c13b10302bd6f6f4daf5866bce25fbc =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
           | regressions
-------------------------+--------+---------------+----------+-------------=
-----------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/620325e2977529aae6c629d9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
10-g301c67a59c13/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
10-g301c67a59c13/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620325e2977529a=
ae6c629dd
        failing since 16 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-09T02:24:28.699837  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-09T02:24:28.700113  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-09T02:24:28.700295  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
           | regressions
-------------------------+--------+---------------+----------+-------------=
-----------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/620327c8970fc40c09c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
10-g301c67a59c13/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
10-g301c67a59c13/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620327c8970fc40c09c62=
980
        failing since 0 day (last pass: v5.17-rc3-197-g418dccbc3ba5, first =
fail: v5.17-rc3-225-g8b6f2853101d) =

 =20
