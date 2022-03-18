Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D531B4DDEBC
	for <lists+linux-next@lfdr.de>; Fri, 18 Mar 2022 17:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbiCRQXj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Mar 2022 12:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239134AbiCRQXQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Mar 2022 12:23:16 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DA6137F6C
        for <linux-next@vger.kernel.org>; Fri, 18 Mar 2022 09:19:35 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n7-20020a17090aab8700b001c6aa871860so2615639pjq.2
        for <linux-next@vger.kernel.org>; Fri, 18 Mar 2022 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wIyr3tfM4bHWTTMjqYpwMqQSPdZYUx72CzPTDgmkS4Q=;
        b=hABRXW4IfDXMb7JKuEqwpInc+9bU/S9/pyTpGhtDr1QtPHu5v9Fx+8DpNh5A51XBp2
         eRIHXcycRllQ5GOGo0Vqsf0FnKM8kRZsRDYbB7/Ttz/hGANV5FDevmYFqNjUh70O9Osz
         9GvZP6wOtO4gtuV6z+y4Se8hUzyY+o5AMIPJK2sMABXReRK+pDy3YTdJGxudE/MV/bJl
         JUSsSukQ0aDMY/sQj1d1DDwevAB7qYH8mQdm5zyvTgPVxTRkhFNp84l/vmZmdzEarzXb
         gjhpiKouhFdqcLdGcF/UmNXj2nr9/Z41hbMJlAPGjfK16wuxntRz4Lj+dcypAl8qB08A
         JZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wIyr3tfM4bHWTTMjqYpwMqQSPdZYUx72CzPTDgmkS4Q=;
        b=rIqZ4VBxxjVQXWpwccLysa8xgw/9T465isjPQknNlxYmf4qhbbg5Ih9TAVSNfn+cjc
         Q6oLdJV1rD0L5KxN0CybB7zCnjskDi/LrosZh6TUEQ28Z1u+n0T6PFT2cDvGpDHH5D3J
         YxUJ04EJntRRnTfzcBaFYiyeUz1irzRbea/ei4lntrtW+IVm5KEqZzi0na59LM4GPLvf
         kqbkXBiWHuDp8cTwuM3y5a/KfS5K+3LwDoIp4gr+2C7rVl+8KwFrWGvcpPsY1/kFX948
         /6NenkcFU/R+/o0/u7k8n4JSNchChtAAlnqTQw+tE8desoVTnS7g2smTzNi1Oceelh0y
         dzsw==
X-Gm-Message-State: AOAM530ecAzH481mpUbAWaS4XYbee5YsgjQtb/iEKh5qnPpvlbwuQdYv
        W083LwcS3APgzH2a+m5JFCL0RHMXgQWhAm+7QBM=
X-Google-Smtp-Source: ABdhPJwvzpTJT/i5HguGA1LlzPLikuvBVfKHhre/O906PR4I/w7up4SfcAyX0o7h4G+zZPKwHJrwTg==
X-Received: by 2002:a17:90a:1117:b0:1c6:2430:d1c7 with SMTP id d23-20020a17090a111700b001c62430d1c7mr22708673pja.45.1647620369495;
        Fri, 18 Mar 2022 09:19:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d5-20020a636805000000b003822c1305b6sm1842603pgc.23.2022.03.18.09.19.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 09:19:29 -0700 (PDT)
Message-ID: <6234b111.1c69fb81.610af.5991@mx.google.com>
Date:   Fri, 18 Mar 2022 09:19:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220318
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 223 builds: 11 failed, 212 passed (next-20220318)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 223 builds: 11 failed, 212 passed (next-20220318)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220318/

Tree: next
Branch: master
Git Describe: next-20220318
Git Commit: 6d72dda014a4753974eb08950089ddf71fec4f60
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

---
For more info write to <info@kernelci.org>
