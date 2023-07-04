Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46517746933
	for <lists+linux-next@lfdr.de>; Tue,  4 Jul 2023 07:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjGDFvv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Jul 2023 01:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjGDFvu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jul 2023 01:51:50 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A92EEE
        for <linux-next@vger.kernel.org>; Mon,  3 Jul 2023 22:51:50 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-c4dfe2a95fbso2953801276.3
        for <linux-next@vger.kernel.org>; Mon, 03 Jul 2023 22:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688449909; x=1691041909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kUUSBDvAXiriwH2fwZSZUcMmiZpbEiss/V7AT02Sms=;
        b=C6mg/QpK6vptufBGH8tPSUiVLoXkFwc/MPMAyWDkfssKdZFlQbO8x/y70Uj7Fj5V18
         JG9Wtdw0jphb7nhXSRDiTFo9Tdm146xvhc9tHA/bbAn+qqGiNSuhmIW/K/Y2DiPRu9I1
         871sryTsfHEIpD0SjHQKsKM4pHPqt2f5QRfrMFfOAGw8LcwhLJWi+Q5Q3mNivAFGtvlo
         km1o6kSGLajiIgmiiAyPGRH2ThmnI0HeOQ6KyLNY88dt7j73UoHjAF93Sd33jJHYUT9N
         O5wg82fq3Cw/RmfM84v0sipDd0vZKlR9jQiqbmVzwb+VcPP4/PEPEcevWjCeCQQdk9Hf
         p4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688449909; x=1691041909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kUUSBDvAXiriwH2fwZSZUcMmiZpbEiss/V7AT02Sms=;
        b=ashj5//IfQWZR/J7seeVjl0FmUynnbNBlK43zVARBipxPMbDGc35W0qS1LkvqOZx6C
         A12osnTR20FkVb3uSm7YyW9B45nXB19iPrwE96RfI937CnMenYG4tWqwlkCT9G7FMT2t
         id5bwDL9BDl2Vz+pZQ8UDMK39RcZ//U0tTQq6MlkiuoxpJcd6kI88qPlx14aAC7sTHXT
         AXNdVy5gE+QwEc1ZSU1ZlXcv4QsN4pkLTfUJVwDvvocfsi1gFcD6qGn0Au0Lqp+gflza
         dPvSLUDoBV3I6ilMxRi1O5hrY+ng6nNFpVgF72dbk7O/X0FpaVZE+lHZ3FxmGzuwoStF
         ysvg==
X-Gm-Message-State: ABy/qLbs9KQJR3PnJcDUR5p4oYvCCtKlHouPv4+cV+OhOsGerawftjLN
        wq9jjTsOauh3GeuPFdy6XreOSeAxIFOmZQF+ko7nKfv2cIfHmVvRgqI8Ng==
X-Google-Smtp-Source: APBJJlE6Do7H26TlRp1EyafexGyqgbZZp9tYbF4qTk94ZJX2tu9mM7CHQovUaVvgsKoA+mj+WJgr6I58a0N5SPlQW9w=
X-Received: by 2002:a25:7350:0:b0:c4c:ec2c:3c95 with SMTP id
 o77-20020a257350000000b00c4cec2c3c95mr6279644ybc.4.1688449909110; Mon, 03 Jul
 2023 22:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230704122342.4a1e2945@canb.auug.org.au> <CAHk-=wjo5PRUU++ApafaBLr2ojK-R-D_vvQ65fnhXO3Lu7xpgw@mail.gmail.com>
In-Reply-To: <CAHk-=wjo5PRUU++ApafaBLr2ojK-R-D_vvQ65fnhXO3Lu7xpgw@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 4 Jul 2023 05:51:38 +0000
Message-ID: <CAJuCfpERFC3T2jJk9Eima0h22RbeWjwbfemmQcPZKqDxYZ7Htg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 4, 2023 at 2:33=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 3 Jul 2023 at 19:23, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
> >
> > After merging the origin tree, today's linux-next build (arm64 defconfi=
g)
> > failed like this:
> >
> > arch/arm64/mm/fault.c: In function 'do_page_fault':
>
> Yup, SeongJae Park sent me the same report, and it just made it to
> top-of-tree as commit 24be4d0b46bb ("arch/arm64/mm/fault: Fix
> undeclared variable error in do_page_fault()")

Thanks for fixing that! I hope to turn CONFIG_PER_VMA_LOCK back on soon.

>
> This was actually an architecture I test myself, but I think UP ends
> up turning off CONFIG_PER_VMA_LOCK.

Yes, CONFIG_PER_VMA_LOCK depends on SMP.

>
> I do wonder how much point there is to have a non-SMP build of
> architectures like x86-64 and arm64 at all...
>
> But I guess people still run them in qemu.
>
>              Linus
