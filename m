Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6681C4E8A7C
	for <lists+linux-next@lfdr.de>; Mon, 28 Mar 2022 00:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbiC0WZ0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Mar 2022 18:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235982AbiC0WZY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Mar 2022 18:25:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2634EF53
        for <linux-next@vger.kernel.org>; Sun, 27 Mar 2022 15:23:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p15so21785596lfk.8
        for <linux-next@vger.kernel.org>; Sun, 27 Mar 2022 15:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qdphx0B9HnveSZQ4eZgylUI7GQmjcDDsYT6PZjX3jZk=;
        b=QNN1i2WIBH6Hu63QF8GMULZ+aSMQa/oLj2pbk2VgTMnx1yqkwNXGLDJmqXjZxs2Hz0
         ZmkqXhrpXmFDBHDx4HraU1BJNogt311CP4JUKQrr5J/e2bEEJ7ZY8MIlpuwZvBDHN1mM
         zlwtVtd3jxs/gxCz/r2kOEc3G9s5FcpJNIcJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qdphx0B9HnveSZQ4eZgylUI7GQmjcDDsYT6PZjX3jZk=;
        b=uFrSDxkNc6KTu2zu3ABhGsplwxXushWCz4NARKLKh1ukWiWpbgJR1Lye3LEB0Q5btR
         8KT+Xsz5ZK9tZAjnDTTEqbwZqrrfw09A6lS4EEE5Tm05OliT+sUbmMkUQKw0FC2AULkv
         WowIqCT8oBkZwrlC3r7dnOWUKGiY7VQMV+nhrjtAH8NZwaC8Z0cJ4BoQf4hBIoZBnFmG
         SPe1r0eORI87ybMvrVe2aKiDX/Usj2RI5Ie4MEpFmVMEGyaYVM1zs10PnXs1b3/Lv7gQ
         Csdwh5M1AyNuHA9kLwk5iZ9wrNB87XufWi/cX6r8z8Oai3q7Fb8J+ipAexyzb2ERC2w4
         XOIA==
X-Gm-Message-State: AOAM532BqgA2sL9tdnt+yawk1Vd8gWJI5TBPjHhJgD7+21A9niVgD9p7
        1vDO3pcz43k6hLzM86PwN4molxXJ9GdqasCrg88=
X-Google-Smtp-Source: ABdhPJzG+nPrgRgP/E2LbH426QbM3OYSu3/DXxfQvs8meLlUjM4XbhyPHkr/fMW9vyl3BD1ECOvEBQ==
X-Received: by 2002:a19:4f1c:0:b0:44a:2983:aa56 with SMTP id d28-20020a194f1c000000b0044a2983aa56mr17672200lfb.156.1648419822567;
        Sun, 27 Mar 2022 15:23:42 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id d24-20020a193858000000b0044a6c26e613sm1164277lfj.65.2022.03.27.15.23.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 15:23:41 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id s25so16894477lji.5
        for <linux-next@vger.kernel.org>; Sun, 27 Mar 2022 15:23:40 -0700 (PDT)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr17214178lji.152.1648419820604; Sun, 27
 Mar 2022 15:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220328090111.26f8980f@canb.auug.org.au>
In-Reply-To: <20220328090111.26f8980f@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 27 Mar 2022 15:23:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
Message-ID: <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
Subject: Re: linux-next: build failure in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Mar 27, 2022 at 3:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Building LInus' tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

Gaah.

I even *looked* at that code when merging, and convinced myself I had
gotten the #ifdef/#endif chain right. Apparently I can't count.

What a maroon I am.

Will apply that patch asap.

Thanks,
                Linus
