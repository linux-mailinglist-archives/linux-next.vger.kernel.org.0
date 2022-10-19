Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B0B603A65
	for <lists+linux-next@lfdr.de>; Wed, 19 Oct 2022 09:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJSHOL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Oct 2022 03:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJSHOL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Oct 2022 03:14:11 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB29F75FCB
        for <linux-next@vger.kernel.org>; Wed, 19 Oct 2022 00:14:09 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id l1so16068299pld.13
        for <linux-next@vger.kernel.org>; Wed, 19 Oct 2022 00:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CCI54v0Rf8ATjdy0PWOnOz4uJnbZUgYVC9Clhp5Yr/E=;
        b=q73BnQeyUF09KaIxVj7lOHU12nTNiuJBArVE11fIzdYRC+i1cxP1BlAK59O5bANoAW
         ivbak3Ns/PDSqm5kJRhYrxJLRfTkz6QSeT6wWwua3bj4NnS+ndCSwIJotjm0souKpJ0V
         rrB3pGAgE5t+8zdwm5W1yKmRxTMwdFQNDA01GkP8G6Qz6n7JB9wSAyrPo+RbTe2Bhlsz
         zurFabLvRpTe7J9MqqOREAVl50t3J2Z6nLTEvsxaU0H6VSCfaVNqZWqRb4xgAnuerB6u
         DIZ0npqHKUyk2JW7dKUr3YFmGjmwUEeT9wLEXEQqjRJ/yQ2DUO28lKaGv9z2caLGnBMZ
         odfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCI54v0Rf8ATjdy0PWOnOz4uJnbZUgYVC9Clhp5Yr/E=;
        b=NoYe8fJ5AHTt6778SZK/enLem2s2V3Y4hMSYm3tcEdkzhDLTkc+AT5IGAym3wRnX/6
         JriqifBFikSxuHWJFFxt6/1kA9TyE8mapt3idALpryo1yZzNoIZ/JE7nEZPgLsGJOHnl
         9FxXNUqph6EL7eHyuV9RHMtBXbcwHgOaUAJIHNbZPJQ71i0+NlwYPjSuFV0kQv1s6Ura
         VOFXBn5gFbnUJxab/+idDCZr7GuHiHFzCVfFVKNHhu2bFLCTK9SdoI9ae89cL02y9epk
         evlhKV4FtM/j+wzBAI30MHfe+yRtVQODX5u/2wxverYXz3g+myC/8wScUfJB8xSvFZoN
         +bHA==
X-Gm-Message-State: ACrzQf1MpGMojcZIcARXqUK9FWvboFg7Q1atgR+wLl3wkBqlKbGy1/ee
        1ZSqIK3dLfuq9D+ROHj7FqJwFCqyDp7zlSEw
X-Google-Smtp-Source: AMsMyM6K0wjjeJJlL+OHmQuRjz2U8GmOrxtN5iN4oOE2x/jNdfhz44e3vuBu5IOYXFaKH2alSvxZ6g==
X-Received: by 2002:a17:902:d88a:b0:17f:713b:c753 with SMTP id b10-20020a170902d88a00b0017f713bc753mr6696935plz.37.1666163649127;
        Wed, 19 Oct 2022 00:14:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902f14900b001780a528540sm9884878plb.93.2022.10.19.00.14.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 00:14:08 -0700 (PDT)
Message-ID: <634fa3c0.170a0220.db73b.2d8d@mx.google.com>
Date:   Wed, 19 Oct 2022 00:14:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221019
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 221 builds: 19 failed, 202 passed (next-20221019)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 221 builds: 19 failed, 202 passed (next-20221019)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221019/

Tree: next
Branch: master
Git Describe: next-20221019
Git Commit: a72b55bc981b62f7186600d06d1824f1d0612b27
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (clang-16) FAIL
    multi_v5_defconfig: (clang-16) FAIL
    allmodconfig: (gcc-10) FAIL
    imx_v4_v5_defconfig: (gcc-10) FAIL
    multi_v4t_defconfig: (gcc-10) FAIL
    multi_v5_defconfig: (gcc-10) FAIL
    mxs_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-16) FAIL
    i386_defconfig+kselftest: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-16) FAIL
    defconfig+CONFIG_EFI=3Dn: (clang-16) FAIL
    defconfig: (gcc-10) FAIL
    defconfig+debug: (gcc-10) FAIL
    defconfig+kselftest: (gcc-10) FAIL
    rv32_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-16) FAIL

---
For more info write to <info@kernelci.org>
