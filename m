Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA564C8FAA
	for <lists+linux-next@lfdr.de>; Tue,  1 Mar 2022 17:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbiCAQHG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Mar 2022 11:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235934AbiCAQHF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2022 11:07:05 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416C1A146A
        for <linux-next@vger.kernel.org>; Tue,  1 Mar 2022 08:06:24 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id y11so14645241pfa.6
        for <linux-next@vger.kernel.org>; Tue, 01 Mar 2022 08:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p9mACBcAoCoASL6izUdPhp7QM8GJjuFVFCF5PoRHzeo=;
        b=sokjAKquV2SHrqF+p3Tbr429FM+zpEkMcYomTm/LiMdWV2uZiQJOyRZhDEife2xy7m
         ebwlDKIPX+4GIBezuAmuM2B25ULdyOpqC9XSJ45ER2jyokZeM3vTJq59jjGaN3IKQnZa
         yIhC1KFhgRptDrsj2XtijI3WZOsXeqC1fP2g1xeo+G1TZWWhhdc8HZbQ9yjuOi6+XSEi
         EVfbtwXgzmt0VyUNdAZG1npMVcFlVUoCbHUQoo/6d7dA5HqKLjqGjnGzfJn2mldh0Q6Y
         dCh31cFclDGHEJ0aSpWW59bcfxXWDaF+gYahDwb/dWoCTmFtXNmpbqSuwQrPpicQzXe5
         dd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p9mACBcAoCoASL6izUdPhp7QM8GJjuFVFCF5PoRHzeo=;
        b=064lI1TJxo/ST/M/++lNOR+bHIWDS/na0jDfP6AaUkDA/L+5CxZmF9HB+KHKbMUp5u
         kuO86FgCuAZQ4jwhwnbSOwIcmSSHshYBNT0FqXE3aBPqrvpu4GaW0tomlAyL0279K9iI
         3Ms2N2K5oLb7R76SsgDrNfVU0T+nXJWfMMBXmRFgp5N/fJUxPpy+xX7+T4xlsSOejzNH
         2n33N9Bu4hH9PM+gzyWfXT0zgrCVHyJ6+wt/6P0ntT5n7Vvq/mvgfzRnClYVDfD4bPxl
         fEwgFxlGNktdg7DeZ6LKOpf9WzOS5KsOkAewz6VZ9PMRxffonOGLLp8R0ZjMWzglQEiH
         4FDA==
X-Gm-Message-State: AOAM533AJ5mhqrh5LkOmy+z6QxIt4myH8uwlFWotS7QudjiCO50c4XMI
        2U7Bp/2ondLwB6rvIC7f+GXCoCkF1zyyeUVNJBw=
X-Google-Smtp-Source: ABdhPJzJAuXzylbV8yOyrD91fB5S3gobuHVh80Ol0gZQ4Bj15kf6yeCj+GNYfYlbZvdtoLnhpT5Tbg==
X-Received: by 2002:a63:3587:0:b0:374:a41b:6d78 with SMTP id c129-20020a633587000000b00374a41b6d78mr22051115pga.138.1646150783578;
        Tue, 01 Mar 2022 08:06:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b187-20020a621bc4000000b004f3c8f3b560sm16166565pfb.129.2022.03.01.08.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:06:23 -0800 (PST)
Message-ID: <621e447f.1c69fb81.1ee1d.9e32@mx.google.com>
Date:   Tue, 01 Mar 2022 08:06:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220301
Subject: next/master baseline: 416 runs, 4 regressions (next-20220301)
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

next/master baseline: 416 runs, 4 regressions (next-20220301)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-10   | multi_v7_defco=
nfig+debug     | 1          =

meson-g12a-u200          | arm64 | lab-baylibre | gcc-10   | defconfig+debu=
g              | 1          =

meson8b-odroidc1         | arm   | lab-baylibre | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220301/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220301
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e6ada6df471f847da3b09b357e246c62335bc0bb =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/621e0c9e90640eb9d9c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220301/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220301/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621e0c9e90640eb9d9c62=
977
        new failure (last pass: next-20220225) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-10   | multi_v7_defco=
nfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/621e11138e9c3f2dc4c62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220301/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220301/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621e11138e9c3f2dc4c62=
978
        new failure (last pass: next-20220228) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-g12a-u200          | arm64 | lab-baylibre | gcc-10   | defconfig+debu=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/621e13e6bc23b0aa44c629e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220301/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220301/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621e13e6bc23b0aa44c62=
9e3
        failing since 0 day (last pass: next-20220217, first fail: next-202=
20228) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson8b-odroidc1         | arm   | lab-baylibre | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/621e10eb0c93ccd8bfc6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220301/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-meson8b-odro=
idc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220301/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-meson8b-odro=
idc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621e10eb0c93ccd8bfc62=
97b
        failing since 0 day (last pass: next-20220223, first fail: next-202=
20228) =

 =20
