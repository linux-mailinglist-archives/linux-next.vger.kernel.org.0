Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADC76069F4
	for <lists+linux-next@lfdr.de>; Thu, 20 Oct 2022 23:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJTVBh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Oct 2022 17:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiJTVBg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Oct 2022 17:01:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23436220F9A
        for <linux-next@vger.kernel.org>; Thu, 20 Oct 2022 14:01:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 99016B8291E
        for <linux-next@vger.kernel.org>; Thu, 20 Oct 2022 21:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF8AC433D6
        for <linux-next@vger.kernel.org>; Thu, 20 Oct 2022 21:01:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XhSoLhCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1666299687;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=yECODzUyGjhkbwRaudAZlZ8YrWe/uEoEu0OMeAjrYsQ=;
        b=XhSoLhCZYHesOP6zNo2G7oyHaLECya7ZRUha5lygVKm/5rowzoNR43px0Fi+nDb0rajf7q
        8etMpve8hKNbnrpD0t0hbf6548H+ipanGizCCjJfsXRQgV7Xp3KLqh1q1tloxTvI0JwcCc
        r5pdceSax8jZwb1h+4xuIMFnSTgxpuU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5a62aca (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-next@vger.kernel.org>;
        Thu, 20 Oct 2022 21:01:27 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id p4so896297uao.0
        for <linux-next@vger.kernel.org>; Thu, 20 Oct 2022 14:01:27 -0700 (PDT)
X-Gm-Message-State: ACrzQf3X3oriQ9lX75wxbcOrnCJo3ERhs9lCGxT9SgmeRqSz7tzr6aHq
        DzKPWqRrI0NzBuZYfGIhoWQeWGLsjlLB0JiPI+E=
X-Google-Smtp-Source: AMsMyM7z1uKt6+xpDq34CUjylz9+siEEcNubj/lBSvzNqfGhpW4dTAQdi6cBrcsXIARweeQr4mWxBKNYwQU0/mPVRmc=
X-Received: by 2002:a05:6102:7c9:b0:3a7:6261:935 with SMTP id
 y9-20020a05610207c900b003a762610935mr8895919vsg.73.1666299686398; Thu, 20 Oct
 2022 14:01:26 -0700 (PDT)
MIME-Version: 1.0
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 20 Oct 2022 15:01:14 -0600
X-Gmail-Original-Message-ID: <CAHmME9r4PTAOKJDHbVTDnrTA5vNy9Y-9pLCAxSUZJVpkihbXWA@mail.gmail.com>
Message-ID: <CAHmME9r4PTAOKJDHbVTDnrTA5vNy9Y-9pLCAxSUZJVpkihbXWA@mail.gmail.com>
Subject: request to add branch/tag to linux-next
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I'm working on some potentially disruptive changes that could really
benefit from being in -next. Linus suggested I accumulate these
changes in a separate branch for that. Currently that's here:

https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git branch
unsigned-char

I'm not sure how automated your setup is. Would it make sense to add
that branch explicitly, or to add a "for-next" branch/tag, which you
can grab if it exists and skip if it's gone?

Jason
