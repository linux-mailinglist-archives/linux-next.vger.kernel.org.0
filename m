Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356414DDE84
	for <lists+linux-next@lfdr.de>; Fri, 18 Mar 2022 17:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238856AbiCRQTx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Mar 2022 12:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238858AbiCRQSM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Mar 2022 12:18:12 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63E82EF0F4
        for <linux-next@vger.kernel.org>; Fri, 18 Mar 2022 09:16:48 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id l8so9894281pfu.1
        for <linux-next@vger.kernel.org>; Fri, 18 Mar 2022 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wCNUR+Wh75hAKWNGcqtnsFLZGr8hXKSkN/Ugq9cW4sg=;
        b=M/z9i0z3Rs4ruHwj+qHh6mTf9r3rDAXz5nIdnVd9rvOAY9TCQtbRZuFQh1Y+lBithT
         NessuWX9aHdKGWmYPOEJ10xKg9umgbhee7ICBTTz/ov2R8ZFjlBVLcjWx/mPenHS+l8c
         VOpO21CN5To3m1nUK19gI/OaDH01823uIiu1SdcYnfCguQa6IU2KK92Ncv2u+9XjBA2g
         VwrkzqchR+lcESPWVnZki0p7ijGo7vC5+gF0qTL/hJG9d3BcpbidFv69VUZGFRxVB0OH
         BPlGxR8bhsWujNmN2iy6fwtCcY6Ln3Oa8k1ktPWCk2nDyPvxhszve70AiWmq7q4Cx4Pv
         g5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wCNUR+Wh75hAKWNGcqtnsFLZGr8hXKSkN/Ugq9cW4sg=;
        b=LsuCaJ+S8/ViM+vwChViyUirkwu+uE2QGKTmsdeztiawA2t2mYoAka/ZiNRaF5WF/l
         xd3tbwoojxs109+vC7kKnlv/b7agEWucfNs2K1aFMmhI9BBAMX3gTgTZx9jv/Hkb9rEa
         f4kxvscJbpkF1k2dvjBexoS8Iooah7eNNpCHW3wNNfBu30rX2Yrogasi/TohRZuTI8sK
         GLV6vxXBlgx11A/luXQVIgOb/KFLXcBrxKMSV8Oxse8zSiPij8UYBIYmf/oHgeb9goAs
         Cw5IohvGwaMzxZAy9zC0p9kP+fydW1cWyiaMf5tIMIz4Xcofb7/uDjhtkq0Yx8muwc04
         NpjQ==
X-Gm-Message-State: AOAM530FalIALf5bNuRbxylnxnyxF13nk/T8r7zAB547dF5oVTp74lHG
        W9k/Au4mw+jRTP+B0KIK0t3a5swpC4bdBp2v3pQ=
X-Google-Smtp-Source: ABdhPJx1matEdyLpETuZnnewc7bT2K+nx0A/M0cpQc+3b9TJ6Na9LK2mbULxUR468o6Enqv2UxLhfQ==
X-Received: by 2002:a63:b30d:0:b0:378:c5ee:afda with SMTP id i13-20020a63b30d000000b00378c5eeafdamr8419332pgf.385.1647620208146;
        Fri, 18 Mar 2022 09:16:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j14-20020a056a00174e00b004f66ce6367bsm11530195pfc.147.2022.03.18.09.16.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 09:16:47 -0700 (PDT)
Message-ID: <6234b06f.1c69fb81.b2cbd.f0aa@mx.google.com>
Date:   Fri, 18 Mar 2022 09:16:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.17-rc8-149-g382d8f4c46c1f
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 163 builds: 3 failed,
 160 passed (v5.17-rc8-149-g382d8f4c46c1f)
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

next/pending-fixes build: 163 builds: 3 failed, 160 passed (v5.17-rc8-149-g=
382d8f4c46c1f)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.17-rc8-149-g382d8f4c46c1f/

Tree: next
Branch: pending-fixes
Git Describe: v5.17-rc8-149-g382d8f4c46c1f
Git Commit: 382d8f4c46c1f7e0c3f46da4680fb6cdce7c2eab
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    ip28_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (gcc-10) FAIL

---
For more info write to <info@kernelci.org>
