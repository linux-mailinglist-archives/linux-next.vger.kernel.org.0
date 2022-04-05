Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05B74F27E2
	for <lists+linux-next@lfdr.de>; Tue,  5 Apr 2022 10:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbiDEIJ0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Apr 2022 04:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbiDEIIw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Apr 2022 04:08:52 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D011D6C1C1
        for <linux-next@vger.kernel.org>; Tue,  5 Apr 2022 01:02:22 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id t19so9835624qtc.4
        for <linux-next@vger.kernel.org>; Tue, 05 Apr 2022 01:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=DVToskIosok67mSCWEbbFPrYb9U8sDgFYK1ET8Ir6hw=;
        b=OIzTCG6YakLgVJk/qBlCEBqzZNm2Vtp8p2zTDC3BimZ5KZZMDOmZbCI+rCRl0MR0yI
         JRP6tYdiZcaqqtq2djR/hKyLYugIYZhEtDSNFh5oRjjiTSyHCeRS9Tf9J2U2i/fE9a9T
         3y8AgA1D7eCou/ND3z/dYIsAj6wX6sUn1uTgsEJWS9v+HzquwKdfz6n0qBGWzilxX0y3
         Q9t1N/QSZ055GiZj4vpnOdLxSZWvVEnCABgpDxcEqmXG4Zf7AYLZL8k5X3ZZKqR3OAaq
         uGhb4OcJ9ShZYkeAXIBlKH8yo3xJTgjN1Te2An+uGuPF9sd+EcTsz6oq4ZNC/aBXAo84
         MkjQ==
X-Gm-Message-State: AOAM533hwlFjYbliGlQXWnES57D2WS8hYNuISFRq+bvgtQrH/p41fn1G
        vEcJMAWSQGZXa/eW8TJPtBSyLdodPN52PA==
X-Google-Smtp-Source: ABdhPJxWYRAVEGFZl8oMdniZ77nhhQFI8gD/KY2SOWX6QGtmfLXsipV4PUeMBgRf14v6P2GXev2yRw==
X-Received: by 2002:a05:620a:d50:b0:67e:e2b:a552 with SMTP id o16-20020a05620a0d5000b0067e0e2ba552mr1275347qkl.401.1649145740953;
        Tue, 05 Apr 2022 01:02:20 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a22b000b0067b7b158985sm7318473qkh.128.2022.04.05.01.02.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 01:02:20 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2eb46d33db9so73642897b3.12
        for <linux-next@vger.kernel.org>; Tue, 05 Apr 2022 01:02:20 -0700 (PDT)
X-Received: by 2002:a81:3d81:0:b0:2eb:8069:5132 with SMTP id
 k123-20020a813d81000000b002eb80695132mr1606661ywa.438.1649145739747; Tue, 05
 Apr 2022 01:02:19 -0700 (PDT)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Apr 2022 10:02:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKPqvUzS7xY7L76U9KT78ZQkcOpRXzW0JcZHnve_Y4DA@mail.gmail.com>
Message-ID: <CAMuHMdWKPqvUzS7xY7L76U9KT78ZQkcOpRXzW0JcZHnve_Y4DA@mail.gmail.com>
Subject: Duplicate "select GENERIC_IRQ_MULTI_HANDLER"
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Russell,

It looks like you mismerged arch/arm/Kconfig in

    commit 012d2fb6c8c90adac502c0bb9abd3e815f6047ca (arm/for-next)
    Merge: a8cf7cf8d78a83e5 234a0f202a09a614
    Author: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
    Date:   Fri Apr 1 12:59:27 2022 +0100

        Merge branch 'devel-stable' into for-next

        # Conflicts:
        #       arch/arm/Kconfig
        #       arch/arm/Kconfig.debug
        #       arch/arm/boot/compressed/Makefile
        #       arch/arm/include/asm/switch_to.h
        #       arch/arm/kernel/traps.c

Due to this, there are two "select GENERIC_IRQ_MULTI_HANDLER" in
arch/arm/Kconfig, one on the main ARM symbol, and a superfluous one
on the ARCH_S3C24XX symbol.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
