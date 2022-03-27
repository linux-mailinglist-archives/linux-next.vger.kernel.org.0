Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABD24E8A82
	for <lists+linux-next@lfdr.de>; Mon, 28 Mar 2022 00:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbiC0Wdr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Mar 2022 18:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbiC0Wdq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Mar 2022 18:33:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB1727FC6
        for <linux-next@vger.kernel.org>; Sun, 27 Mar 2022 15:32:06 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bt26so21803472lfb.3
        for <linux-next@vger.kernel.org>; Sun, 27 Mar 2022 15:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yhspFAC09wnm+6Eh2TE7utcbggJMlqMOLI9aX60zVD8=;
        b=K7BQ2fnrxBITIiKXXqYXNEq1mjbFT/RDmtdUZ9GXVaKpGUTN+WKtKNSkpKXwCrAMJy
         78dGOmuOG6vNftRvFPk4qDr4TxLtFm+TI/tQHnTeYhC9GLGkhiiFgovdb3NR/8RzMXdX
         Nl283+wES+W+ntTy8aPqUED24Da2xl0PWQET8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yhspFAC09wnm+6Eh2TE7utcbggJMlqMOLI9aX60zVD8=;
        b=Mu0gmEIKMEkZWPT6Kn6yaSxXxS3ncLqJri6OJbG/yZgHty/P/m+5zk0xDhlXxPvUFN
         kDzp58W/ZkxdRkVa7AffzgFadwI7XyEldOB1u7s0tX4kcqtKXtgI/5ZpNFxsES7pYaV1
         3I2SyWH51piN0HckAVB5xzvKVwHnwcZJUc9iIZ66K64r8gM3pWH9xj5Wqx7yxBl75MPA
         faPtfbBVOpYJkbgPJNFzfquULJj/TyNq49w9Uv/EAI94TdYUazvNgjS9DAwwamZ3OiaJ
         cOyw4Y4wvnjB1pd5quE+kokfRs805T521NmwcxrDMBECZbguL+nKqEObcAdKNV7FD3u6
         yrwg==
X-Gm-Message-State: AOAM532bqbBEKgdqbqssDMq75as71QRJtZdiL649o5x38L5r74mIw3M8
        jsLIGwm7w16Rcd+so7eC0UPiYcAFt9Oah9/ibuI=
X-Google-Smtp-Source: ABdhPJyup9TNyo5wjsVtAVDAp+a12sQDvl3ZuGXE3qiiUyWNG5ZiHsTHCCg0HDKv5OTw0b3Gn9927w==
X-Received: by 2002:a19:3856:0:b0:448:2019:3e94 with SMTP id d22-20020a193856000000b0044820193e94mr16752134lfj.370.1648420324888;
        Sun, 27 Mar 2022 15:32:04 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id i16-20020a198c50000000b0044a2580a2d3sm1466051lfj.156.2022.03.27.15.32.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 15:32:03 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id h7so21829015lfl.2
        for <linux-next@vger.kernel.org>; Sun, 27 Mar 2022 15:32:03 -0700 (PDT)
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr17393349lfs.27.1648420323009; Sun, 27
 Mar 2022 15:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220328090111.26f8980f@canb.auug.org.au> <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
In-Reply-To: <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 27 Mar 2022 15:31:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiqZaY0oZ86fJtpZSfCJJ48xqC0jjRC4m6WWrnL7q5Leg@mail.gmail.com>
Message-ID: <CAHk-=wiqZaY0oZ86fJtpZSfCJJ48xqC0jjRC4m6WWrnL7q5Leg@mail.gmail.com>
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

-#endif /* CONFIG_LIVEPATCH */


On Sun, Mar 27, 2022 at 3:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I even *looked* at that code when merging, and convinced myself I had
> gotten the #ifdef/#endif chain right. Apparently I can't count.
>
> What a maroon I am.

Oh, and I see why I screwed up: I even did a "git diff" against the
original powerpc tree, but then I visually matched

  -#define klp_get_ftrace_location klp_get_ftrace_location
   ...
  -#endif /* CONFIG_LIVEPATCH */

as a #ifdef/#endif pair.

Now that I look at it knowing that I screwed up, I go "Duh!".

Time to take my meds,

              Linus
