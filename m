Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C5A70C3B4
	for <lists+linux-next@lfdr.de>; Mon, 22 May 2023 18:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjEVQr2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 May 2023 12:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjEVQr0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 May 2023 12:47:26 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21ACE9
        for <linux-next@vger.kernel.org>; Mon, 22 May 2023 09:47:25 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75affb4d0f9so100608585a.2
        for <linux-next@vger.kernel.org>; Mon, 22 May 2023 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684774045; x=1687366045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtYZcbQKacTkkwOnNbr0k7FvVbVL4fzfTWwOXkqVav4=;
        b=DmcJi/OcG35j8NGwwuXsQr3VopobdJqXFO0zhgiKpZ9nx+yyMBmR1ZR2MKnPQmt/jt
         y5E19p81y/cmOUbQizusn5nlIzG59cql6X/zy3xzjYBje52Y1g3iUZW2ZYYW3+WtNXDZ
         PrrxKi0bNM7kF9RQVTMnjZhTWb+91sj25c+Qwc3u4kIA7SoVNq4O0+bhUjaZElcLdUW5
         z/nJexHU62dZ4vEz6PspVFHKvP247ivyMTffdVisJEBmlITsUGsy007nBK2cxALN27ia
         PuGkWJ3q9w+2QDuisPKOw+g9VfuwhKYUyrJlNLd+XeBqqKxo4+fk64qU50JqYw4zsjzb
         ffOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774045; x=1687366045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtYZcbQKacTkkwOnNbr0k7FvVbVL4fzfTWwOXkqVav4=;
        b=E3Wfjol1yAwpbLtSgCSym9LJ4kVl3fb72fkieVS88nLHLo9n88tN/qC9S6jFKIGwI+
         iE9UCsHFjPJh3KkfSk7uWrTgnuRPBhdbJ7kynmaDsv4W8y8H3rbXH3v0D1td7UWiimhY
         yClvcYrYUCMLd818GniDW8sLqZO3z3YINXKjFIEHEYO6QGwm6JqLCs02rmaTACW9t19p
         uQKeejATz6NtiYzEJBi1tUN2qtarj/0Y1r3ElQHeaMmLeWscyRUiAECo5MqgNnCiuG7z
         j/9Y+eV04C+U9sP2FH9kLwN9c5XxlsH4y/c3z3Y679sG8e7jMv8AOQfZtGylXeZ8t2ky
         /bfg==
X-Gm-Message-State: AC+VfDyoKfxRNN9y1omnwTkJuaWDCVQ4Zquna2psNsCDQ8TGsNF91EjR
        ny1uemCkDw4gioegWgkgXNOVZFeHrxddCFViZMzZgbO3VWBd0T4gOygKdw==
X-Google-Smtp-Source: ACHHUZ6W5buVDy/kIOeIyMoEFAvmSJ/P7EkykMBmkr+MDoVlESJiSwTnjP7ULqt2dw5RubCBiuQorIcPzsV0ggE+Fsk=
X-Received: by 2002:a05:620a:b96:b0:75b:23a0:e7c9 with SMTP id
 k22-20020a05620a0b9600b0075b23a0e7c9mr1336547qkh.42.1684774044909; Mon, 22
 May 2023 09:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230522171557.32027acf@canb.auug.org.au> <ZGuYeDA9jDlxzfZN@google.com>
 <CADnq5_OoGDVWX5UwV_hQQBfPorBuE2jJymMA-hW+Y3+7ni0f5g@mail.gmail.com>
In-Reply-To: <CADnq5_OoGDVWX5UwV_hQQBfPorBuE2jJymMA-hW+Y3+7ni0f5g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 May 2023 09:47:14 -0700
Message-ID: <CAKwvOdk6cO9L2Km+gBFNGkhdnODMAnizwA-PctJ=FcKTu=XFxw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
        Linus Torvalds <torvalds@linux-foundation.org>
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

On Mon, May 22, 2023 at 9:36=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Mon, May 22, 2023 at 12:29=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Mon, May 22, 2023 at 05:15:57PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the amdgpu tree, today's linux-next build (arm allmodco=
nfig
> > > clang-17) failed like this:
> > >
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:146:54: error: format specif=
ies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka '=
unsigned int') [-Werror,-Wformat]
> > >
> > > Caused by commit
> > >
> > >   d020a29b6b58 ("drm/amdgpu: Allocate GART table in RAM for AMD APU")
> > >
> > > Reported by the kernelci.org bot.
> >
> > Alex,
> > This is the third report of linux-next being broken for clang due to th=
e
> > AMDGPU tree.
> > 1. https://lore.kernel.org/lkml/20230522171557.32027acf@canb.auug.org.a=
u/
> > 2. https://lore.kernel.org/lkml/20230522171145.38a8bd4d@canb.auug.org.a=
u/
> > 3. https://lore.kernel.org/lkml/20230522170031.5fb87a64@canb.auug.org.a=
u/
> >
> > Our CI is red as a result.
> > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs=
/5045716034/jobs/9053211936
> >
> > When will AMD start testing their kernels with Clang?
>
> We have clang as part of our CI system and have had it for a while.
> I'm not sure why it didn't catch these.  Our CI clang builds are
> currently passing.

Can you verify that the driver configs are enabled for those builds?

Looking through my CI reports, it looks like allmodconfig/allyesconfig
is red from this tree for ARCH=3Dx86_64 and ARCH=3Darm64.
Examples:
x86_64: https://github.com/ClangBuiltLinux/continuous-integration2/actions/=
runs/5045594636/jobs/9052932014
arm64: https://github.com/ClangBuiltLinux/continuous-integration2/actions/r=
uns/5045594636/jobs/9052930995

>
> Alex
>
> >
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >
> > Thanks for reporting these, Stephen.



--=20
Thanks,
~Nick Desaulniers
