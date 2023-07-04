Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0DC074679B
	for <lists+linux-next@lfdr.de>; Tue,  4 Jul 2023 04:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjGDCdI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Jul 2023 22:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjGDCdI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Jul 2023 22:33:08 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D32188
        for <linux-next@vger.kernel.org>; Mon,  3 Jul 2023 19:33:05 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51d9850ef09so5992029a12.0
        for <linux-next@vger.kernel.org>; Mon, 03 Jul 2023 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688437984; x=1691029984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/g1LFilyMjEN9oSdO7pcWGB8N30CmWPCGMG/F57Fefc=;
        b=CnVtgNS4d61RLiNc3sXv5mZ8PARA66gZpujXoYc/JBbAVbl8szlbIDpV4gxwYBy+5B
         wCyYaYMTjuks8xGYJQ2J4/2o2thG5c6tpsb7w7HntXgS3rbcxejj5befe8chZv6lCuEf
         62e1NucG4+uFSzm1epsQ5fwE0x0lzDztpX/oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437984; x=1691029984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/g1LFilyMjEN9oSdO7pcWGB8N30CmWPCGMG/F57Fefc=;
        b=V3DiuD+t4Ldwtu0yBK0IfrSExmQ49i574ORYu0KNSJGbbEimK3R0pPLM+5hZIE/+Om
         8x/M0AFjE0dgONvX2W/s7NbNj+l2FIWfKMyftnOfAfoXKam+6+1f7J282AyzSCsXryVi
         y8Pnlm1M/uTd+wF5ErA8wzKW3lUi1+uh3Z/A/JcerZgTYLgyEgnGApz8xYso+jgLzN0p
         RcXcP3HEYH2fW7UkwKTaJrf1GDn/uZqdUSMZwG8BPG4cwLZ7W5JqZ6CUlTgNOXcgeUi1
         BLjuZwW7R1KxshFCpyE03uYDpbBrExESYlArFXYXqlhF6CkVmbXcNikM5SbBRDaiwfcS
         IWpw==
X-Gm-Message-State: ABy/qLZiYSQjGY0FLv9ArAD4U9E8eHF2qqWQiWDAE3FnIJAuArlTUkaD
        Yzdzqx0O5geeMH1wLGVFanNx6hr9pItqo8CZg72M64cL
X-Google-Smtp-Source: APBJJlGkD54WYO+0UY2uTw5jRoPHEHryaC1BEekYiwUziKwf3eU3uxALqnzB/FwSwW51sjgN9DyGxA==
X-Received: by 2002:aa7:da56:0:b0:51d:df5e:5674 with SMTP id w22-20020aa7da56000000b0051ddf5e5674mr8941968eds.1.1688437983954;
        Mon, 03 Jul 2023 19:33:03 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id p18-20020aa7d312000000b0051a2d2f82fdsm11375862edq.6.2023.07.03.19.33.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 19:33:03 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51d80d81d6eso6008754a12.1
        for <linux-next@vger.kernel.org>; Mon, 03 Jul 2023 19:33:03 -0700 (PDT)
X-Received: by 2002:aa7:d589:0:b0:515:3103:631e with SMTP id
 r9-20020aa7d589000000b005153103631emr8871457edq.25.1688437982971; Mon, 03 Jul
 2023 19:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230704122342.4a1e2945@canb.auug.org.au>
In-Reply-To: <20230704122342.4a1e2945@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jul 2023 19:32:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjo5PRUU++ApafaBLr2ojK-R-D_vvQ65fnhXO3Lu7xpgw@mail.gmail.com>
Message-ID: <CAHk-=wjo5PRUU++ApafaBLr2ojK-R-D_vvQ65fnhXO3Lu7xpgw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 3 Jul 2023 at 19:23, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the origin tree, today's linux-next build (arm64 defconfig)
> failed like this:
>
> arch/arm64/mm/fault.c: In function 'do_page_fault':

Yup, SeongJae Park sent me the same report, and it just made it to
top-of-tree as commit 24be4d0b46bb ("arch/arm64/mm/fault: Fix
undeclared variable error in do_page_fault()")

This was actually an architecture I test myself, but I think UP ends
up turning off CONFIG_PER_VMA_LOCK.

I do wonder how much point there is to have a non-SMP build of
architectures like x86-64 and arm64 at all...

But I guess people still run them in qemu.

             Linus
