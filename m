Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E6775BF0C
	for <lists+linux-next@lfdr.de>; Fri, 21 Jul 2023 08:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjGUGm1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jul 2023 02:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGUGm1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jul 2023 02:42:27 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14195113
        for <linux-next@vger.kernel.org>; Thu, 20 Jul 2023 23:42:26 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-262d33fa37cso856846a91.3
        for <linux-next@vger.kernel.org>; Thu, 20 Jul 2023 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689921745; x=1690526545;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GbD51nBl6tNep+yJPVDMY64rWFEEEUH9lJ5e5oEUubs=;
        b=bJ2x41TR+mopNKkntTihubCzY4vPZ6cSEhWswaxUwJ7sQQ2reVzBuk0imANwgHZmDQ
         FxgghdKtEOiKefOGtbA8wdL+tlQrH16s5CrUrtikTJ8fvcDEiCWeuDZbUOJsbzv1Lr/5
         gKhu0Q97HRWi4vE//nem3AskyEWetx0eIZIw290wDutxJdizFi4VcL/yp4dxwzej3ZaC
         a90fUmvEJJ4fjsXdb6A6IAy3qv6AaV50orayNZBnMpleauG+yEU7f3cEGKO3XDAYU82T
         4qQgRDvCPIU7STBnwMwjTqDaugiQZJ5uECzMwMWPfkXSqO+TPssIGmb8kGrvTxbx07Eo
         MS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689921745; x=1690526545;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbD51nBl6tNep+yJPVDMY64rWFEEEUH9lJ5e5oEUubs=;
        b=iowi4sc1eJ0vpmr7wn0SU7Rsv/EdKWh1KTgw1D73h4SBOkaTMIAIPIdiGD1/S43zz8
         pJAyQUYZWznHIFIL1EXxmLwxb4AxFXuaTTiTaCc+hX5BCFxeUcaor9lXymq2suAQNaSb
         7z6yYGkdd9erUrkdltZ29M/oB4vKZ3o3G9k4IVliwixhQq2G2AdTRDs9U9mE7aiD8sAY
         eTowZVaBfNYcF7CtdTeKoJzrK/l7UnBCgdZOjA40g5/+gAc/QYGurmPKjyfFI6Ic2fmj
         dhXAEZuqXk0lnr2/rmfgfCAgfAx59Wv5t1O2J8b7koQJDUjGJsC0GyPu4N8TERMPYDsZ
         L8lA==
X-Gm-Message-State: ABy/qLYapuS2Oq7qPEamQ44BEquowWK5/GdruHBQjHGMkur5NfBJJD9e
        bmsDLnDkvesc3R34jG3dgwR0+nTZ8KAZgs8da+hyqA==
X-Google-Smtp-Source: APBJJlGfbCuRtXhtZ3ZbRNRWtcFwDk7+nfoKCabqjQz1x/XUl/k5X+q6KTCFELtY6wOkcawN21TvjQ==
X-Received: by 2002:a17:90a:a04:b0:25e:7fdd:f39c with SMTP id o4-20020a17090a0a0400b0025e7fddf39cmr644401pjo.16.1689921745136;
        Thu, 20 Jul 2023 23:42:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a1a4600b00262eb0d141esm2048988pjl.28.2023.07.20.23.42.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:42:24 -0700 (PDT)
Message-ID: <64ba28d0.170a0220.ed1c6.401a@mx.google.com>
Date:   Thu, 20 Jul 2023 23:42:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc2-438-g6d86025a2bff
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 1 build: 0 failed,
 1 passed (v6.5-rc2-438-g6d86025a2bff)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 1 build: 0 failed, 1 passed (v6.5-rc2-438-g6d8602=
5a2bff)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc2-438-g6d86025a2bff/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc2-438-g6d86025a2bff
Git Commit: 6d86025a2bff1a8ae2ec0527ec82a99cec902e17
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 1 unique architecture

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
