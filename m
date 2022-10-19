Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8C6603A63
	for <lists+linux-next@lfdr.de>; Wed, 19 Oct 2022 09:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiJSHNP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Oct 2022 03:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJSHNO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Oct 2022 03:13:14 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E24F75FCB
        for <linux-next@vger.kernel.org>; Wed, 19 Oct 2022 00:13:13 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d10so16406712pfh.6
        for <linux-next@vger.kernel.org>; Wed, 19 Oct 2022 00:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IMFCF7xWI+TufSSvTiz3jtyKR9ZN6uALt3vLgCntR84=;
        b=0vzPIb1ugwscdxnoSLr37xL47jnRZoOhxJWZ+aaTCso0qt44Dy11MQ7L4135RvkWhe
         jmA0kEm6KxJC2rFgakeaSKkNwRbt5Icqc4ZW1b5DZsLLbj4XwflYhXxity6xpLRgdEm6
         xhntX+gPspknOHgkzc3P4BRqFIiv6yTNoz6or10hRhCCRug4UIHvob5vvbdSrs082sSA
         HtfTuBzlANJk9kvScZ3dS8q0o06yJwpXuD+LvfvaltajshNQNcD4veKQweZjP1t0aIY0
         Van/iM0/t9PTqAcwe8N9ArYrSGF8ARvZR4WwlHoME5ox3VLBgCPTZLJIzQNtU2KmcJNt
         clPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMFCF7xWI+TufSSvTiz3jtyKR9ZN6uALt3vLgCntR84=;
        b=y858vaZUdhg1uXxacSm14XGPJvz0v639tNqUGAJP2gtzyp1ppZR42Hzw2hEgGBW7vq
         fGSS4DBthg1x5tfemnQYIC0XiJnQViqgWVpjGnTDuUHeFg1DD+VEb08/S33Y7IAeJlxK
         qWjy0qf/sSwVeBnlKlHbuG3nvATuTYXt+IMSgIRwwQZKOKxyrNN88aOo3/HSPLGpr3J6
         fEshlfZWjTdn0+yLmPWIA8VyCBvakF4kA6ZWCrDlRvf7+g7Wlkc1lje70s46swBNqjte
         rhw4VveS+AmnUHRULmeWZHrCTPwK/Rz2DE4aaAy60fk/RTEW1KqDGFlVQtFDNud9t5Ut
         eojQ==
X-Gm-Message-State: ACrzQf1P0ymEdJG5OZo9vugmdzQGYfn1YXzt/JOTHC33XxcwBgfCE9mC
        OEfI75OcDnn0WQjGZYSdPCvZ1HUWULCWx/6g
X-Google-Smtp-Source: AMsMyM6EoFzx823wSgONEgkTSLlZY+c4nGt5ILqF6UqWr2/sw/BLTlWcRUqRv3xbox9Xvv/okm7GiQ==
X-Received: by 2002:a63:ff1b:0:b0:43c:e4ee:e5e0 with SMTP id k27-20020a63ff1b000000b0043ce4eee5e0mr5798758pgi.540.1666163592864;
        Wed, 19 Oct 2022 00:13:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r11-20020a170902be0b00b00179e1f08634sm9808268pls.222.2022.10.19.00.13.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 00:13:12 -0700 (PDT)
Message-ID: <634fa388.170a0220.757a9.28e2@mx.google.com>
Date:   Wed, 19 Oct 2022 00:13:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.1-rc1-192-gdfe701541ba9
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 204 builds: 6 failed,
 198 passed (v6.1-rc1-192-gdfe701541ba9)
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

next/pending-fixes build: 204 builds: 6 failed, 198 passed (v6.1-rc1-192-gd=
fe701541ba9)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.1-rc1-192-gdfe701541ba9/

Tree: next
Branch: pending-fixes
Git Describe: v6.1-rc1-192-gdfe701541ba9
Git Commit: dfe701541ba92be904b8cb7a70f7700363593430
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

riscv:
    defconfig: (gcc-10) FAIL
    defconfig+debug: (gcc-10) FAIL
    defconfig+kselftest: (gcc-10) FAIL
    rv32_defconfig: (gcc-10) FAIL

---
For more info write to <info@kernelci.org>
