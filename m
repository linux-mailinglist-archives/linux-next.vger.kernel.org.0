Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE696246E5
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiKJQ2J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiKJQ2H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:28:07 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC20C20192
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:28:06 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id c8so1696930qvn.10
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kuMsrbLUmog/QAtVIJZSMyqz+FTsZ2TyFos+cIoeQ3k=;
        b=VrqiBhVxlcX7KWpRrX8nGVzkC+YvMcgEiuckH1Ek0EjReuw/rieIzH772CS6Ow3GGY
         Q50A3D385IrbukPZsR6rHW9kVNm1IwXkjiayR3wJNreVHTbo3d/4sPBc1usdvmn+fREJ
         gALeRfrNRllJ5vPRN7jK6S0oOlaGWgv/tAxm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuMsrbLUmog/QAtVIJZSMyqz+FTsZ2TyFos+cIoeQ3k=;
        b=ECDc3HsQpJNVSKk8q8doEtWBPa0SnkID6HeM7STD6yOnv5C3AOHxpwe/O13mNxCxo1
         qmtIzyLB3N32AK9hoXwBxP+MBzOczBgWhaYWhFdOE5ParpUCXM4M6j3cQJu9eHngEcer
         cR70seXIgdtO+D/YafHfzgGiYT34hrPYuZfhK4yXqF5R+EEaSXStQopxo11oum46tgOJ
         ONGd7a6W8MeYdSoPS5a64hVLjZzynQ4p0a6Esr4FpUGMpplAq5Z3rq2GDs27oo0yo4YD
         0bym9HlzqkCmupd/eXu8SF8xkF0gDafbbtrEV1UbGuFk6nJfgyiRP3/K39ovGQqzd/97
         Ir7Q==
X-Gm-Message-State: ACrzQf2XSAdi2JfMr858qyyYoz7U8iWYsYNOSBMAuN7Twk8X+Jdr4uOS
        1hKPdwsTORulTYXevoN3kJwWQfAj6l+Fsw==
X-Google-Smtp-Source: AMsMyM63L/wHEgshFbOfexEPtkxibp0o6VPeo5zA+WgAu7x5/KsSSS1NAXeuwrRkK9+DnvUImG41Qg==
X-Received: by 2002:a05:6214:ca6:b0:4bb:6ec1:abd8 with SMTP id s6-20020a0562140ca600b004bb6ec1abd8mr59749355qvs.62.1668097685595;
        Thu, 10 Nov 2022 08:28:05 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id bi14-20020a05620a318e00b006b929a56a2bsm13112667qkb.3.2022.11.10.08.28.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 08:28:04 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id j2so2899200ybb.6
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:28:04 -0800 (PST)
X-Received: by 2002:a25:b09:0:b0:6dd:5a9b:8062 with SMTP id
 9-20020a250b09000000b006dd5a9b8062mr1712198ybl.362.1668097684120; Thu, 10 Nov
 2022 08:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20221110183352.08cc2303@canb.auug.org.au>
In-Reply-To: <20221110183352.08cc2303@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 10 Nov 2022 08:27:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiyYSrBiOKJEV3phOBDT7EMgdXCnDUrp57E8HGNT4SFdA@mail.gmail.com>
Message-ID: <CAHk-=wiyYSrBiOKJEV3phOBDT7EMgdXCnDUrp57E8HGNT4SFdA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 9, 2022 at 11:33 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
>
> include/linux/mm_types.h:268: error: Cannot parse struct or union!

Good on you. You check the docs warnings, I've given up on them
because there's so many and it takes so long.

I tried to document the 'struct encoded_page' the same way 'struct
folio' was documented, but clearly the docs parsing hates it. Let's
remove the '/**' marker and just make it a regular comment.

The same goes for the 'release_pages()' thing,

                   Linus
