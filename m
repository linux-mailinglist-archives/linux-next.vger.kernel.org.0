Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6A14C29F9
	for <lists+linux-next@lfdr.de>; Thu, 24 Feb 2022 11:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbiBXK5F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Feb 2022 05:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiBXK5D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2022 05:57:03 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A9227C22D
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 02:56:28 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 12so1455466pgd.0
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 02:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FBG1JO3MaD3eqx3J2ItCCTQeFrgCiW72hTymBvvHQp4=;
        b=g8doNj4cgJyVNNEDBZfboiXuYVZVo8EoYyg2uLJubvWqP9Bi1xTR+2eHZhBN42sU9W
         OBaFkT2xGB8+PYWizF41KhxJ/wKfvXtzHe87CwCkj1DKBs2pTlq4ybkHjZ7HnJXJo8IO
         zNh7Dx76FuS22Z9UwvV6DDjKTopGyQXXcqab4ADb72H2Ux9pz9GS0L7vk0Wmp4TA6bFC
         M6WH48TROwx1S80ZneaokFaj051jQXiRvyD33Vg3ba2bN13blWb1xfMi6TqEr9D0Offd
         gW7mRoZM9qgt8MPSj6Ir90FG/nF/4cehTsmDWTM/O0AjWSsXGoM7n4+mBSB9T4TCx06E
         RZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FBG1JO3MaD3eqx3J2ItCCTQeFrgCiW72hTymBvvHQp4=;
        b=RRFFlmks/lm4Tb063pUnhmg1ItVwjmjfXgonUnPN2Bflqza012rRe0wGcEHXAeYRs9
         TCI6CyTqI4NSfoVAJF3O497pShvZI+t1CQaF0L7/puX/nWbLA+pBYLFwH/G6os9+lsOv
         9BGqLG1iOU1sU9irRHyzq4iADB2G9rIravlmKGL8GaU1ws6MskuIBXPql7mKb1Jsua3m
         DHFaersJALaiPv3GDrMMM9Y1JE5e2z64Xrb2a1p7L4Isi0IKkZtkO5AWF85HIvZqLKMZ
         pQvAVZnzZLxkN+M9bl2FXU82d2mi/vsVsfohetiGpsz0cQ2flXQY4RGsPWyE2ANQ+Wj+
         XENg==
X-Gm-Message-State: AOAM533yM50i4Ka7SjvHpFSzG0NV3IXr/BIMErKvCK1aQBkqer5drLXq
        QYY5QNAg6g70ZR8qOpABfB9s5B8Q9ZZNg3+X41o=
X-Google-Smtp-Source: ABdhPJydbQCgQn6dpqotSWeHTKb+Iw0ZI66E2wXZjFBofMy+gb53rJ5YSRnpeh3iGBb6tQ4c4yQRtQ==
X-Received: by 2002:a05:6a00:1706:b0:4df:7fe0:841a with SMTP id h6-20020a056a00170600b004df7fe0841amr2371422pfc.64.1645700188059;
        Thu, 24 Feb 2022 02:56:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s7sm2844784pfb.197.2022.02.24.02.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 02:56:27 -0800 (PST)
Message-ID: <6217645b.1c69fb81.23ef4.7380@mx.google.com>
Date:   Thu, 24 Feb 2022 02:56:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc5-244-gd77a1b37f796
Subject: next/pending-fixes baseline: 216 runs,
 2 regressions (v5.17-rc5-244-gd77a1b37f796)
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

next/pending-fixes baseline: 216 runs, 2 regressions (v5.17-rc5-244-gd77a1b=
37f796)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
da850-lcdk          | arm   | lab-baylibre | gcc-10   | davinci_all_defconf=
ig        | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc5-244-gd77a1b37f796/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc5-244-gd77a1b37f796
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d77a1b37f7969d466615068820f08e9f4d66283d =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
da850-lcdk          | arm   | lab-baylibre | gcc-10   | davinci_all_defconf=
ig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62172769f054df5946c6298c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-2=
44-gd77a1b37f796/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-2=
44-gd77a1b37f796/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62172769f054df5=
946c62990
        failing since 31 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-24T06:36:03.416842  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-24T06:36:03.417075  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-24T06:36:03.417251  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-24T06:36:03.461786  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621741824aee15e7d2c6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-2=
44-gd77a1b37f796/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-2=
44-gd77a1b37f796/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621741824aee15e7d2c62=
96b
        new failure (last pass: v5.17-rc5-215-ge61abe3bd006) =

 =20
