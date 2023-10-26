Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530CF7D7FE6
	for <lists+linux-next@lfdr.de>; Thu, 26 Oct 2023 11:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjJZJnz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Oct 2023 05:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjJZJny (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Oct 2023 05:43:54 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5815D193
        for <linux-next@vger.kernel.org>; Thu, 26 Oct 2023 02:43:52 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6b3c2607d9bso630972b3a.1
        for <linux-next@vger.kernel.org>; Thu, 26 Oct 2023 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698313431; x=1698918231; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lfwLqpH15lhHiZD1DVbFqBAXOKsp1jECGp/RW5ttKGI=;
        b=U2adAfbkedNRLE4TgiB2Mtb4UxdZRbxGpenECCRMc9cZseZ+/q70pSwr/9TVzmc3JJ
         9ORnS5LaC90HD3GnIPjmgT1qf4suCVQEoncds1j5quHMJUEwcgQjXw+4esBHXTYCZV0y
         nyp87CQheK8Tx92Kp6ULM2E5cb0kXdXJJpgqEUQOLGRQyiNep28xfY0OJrEmQIHlbsEz
         RPbpKgUW0+EcQSLBHusnzsaNov5bYCynC9QYC6ms1Dbzl1Ld9xAEgL3RiljwaGZN0t3/
         sgbtoycvmA/LlbybhMvFCW4B8U/BSovDAPvv8s901kX5Vye38drqz3u62hC0i6yYNR5A
         j9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698313431; x=1698918231;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfwLqpH15lhHiZD1DVbFqBAXOKsp1jECGp/RW5ttKGI=;
        b=m7KyYAWkezUbb49rPBevxYuCpPaaW0jd95hc3iQ1/oJBaVv1rslYIWOyq/lgYtIYlG
         1nG/eAQUxLy8Sy1VClENmsc48Cpr2zBBN4RubMR/s8UydYZyWuDnOMt/5zD4Lf6Y8Ft2
         h2mueXPWWE49Hq+zRQeWdd9vNs5vQSCDSpHV17x7Ybm4pS9Qs2KrcVrfWfE7lLAVJwla
         ThKcjl//ePQKjQsE7YVQm6d5L+mZSF0Uoiq+koibXrUtgBDN0L1jd7cwYcK6oA+7hz3N
         we/L0KcR3TKfXb+VQVAvdw/wCtiR7vWtxir23vQuOxnhvLBDuEHEkFWplY+MSiwlm51T
         NXiw==
X-Gm-Message-State: AOJu0YwNmA2d4jG4dWySasJMAUPgkeIGP68qYByjw7XDp7bxTXTymjYw
        5Za/s5XJL9xlRWb0Lhrlq0LbI1dfI0xcT6as2+M=
X-Google-Smtp-Source: AGHT+IHUs4iR8nQTAnMW2jYUc8IJBWEihbc+uzlNSFuBaM9pYz36NmqHHU97NjtvL1cLXTePvYPBAA==
X-Received: by 2002:a05:6a00:813:b0:68e:3eab:9e18 with SMTP id m19-20020a056a00081300b0068e3eab9e18mr17596324pfk.12.1698313431181;
        Thu, 26 Oct 2023 02:43:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m188-20020a6258c5000000b006bdd1ce6915sm11256618pfb.193.2023.10.26.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 02:43:50 -0700 (PDT)
Message-ID: <653a34d6.620a0220.1b018.673c@mx.google.com>
Date:   Thu, 26 Oct 2023 02:43:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231026
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 311 runs, 2 regressions (next-20231026)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 311 runs, 2 regressions (next-20231026)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
                    | 1          =

mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231026/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231026
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2ef7141596eed0b4b45ef18b3626f428a6b0a822 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/653a024a93b953603befcf4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231026/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231026/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653a024a93b953603befc=
f4e
        new failure (last pass: next-20231025) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6539f62f7e9b5553ceefcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//next/master/next-20231026/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231026/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6539f62f7e9b5553ceefc=
ef4
        new failure (last pass: next-20231023) =

 =20
