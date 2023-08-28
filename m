Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334BE78B670
	for <lists+linux-next@lfdr.de>; Mon, 28 Aug 2023 19:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbjH1R3d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Aug 2023 13:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbjH1R3D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Aug 2023 13:29:03 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D4C11A
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 10:28:58 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7a2c1ae77b3so498824241.2
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693243737; x=1693848537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ROVqh1j31/yDGoQGEjD+ZgYxpbyP+vRNz9MgEfFrbg=;
        b=dVyIJcluND5u7f/Z7guGu6XMhsqMokcZcJKcAeZ1Zst6e0U7coWVrIuTnDa4bj63+u
         MoTtcjp2J98tkyFqszvPZCjt5kA3Gt7RYWvHGp/vZ1WTtwgmZAIBqz8fx7D/3AFf6fZr
         i0QDTBgZQOQgbr8KyqBnJAbmJT1E0ftAnxKkAS8Kxxe0d4zGpRzmjY+1ZFOMDJ8M5oLy
         39BhK45TqHCs8kMhPT1IisvhFSL6K8Dq3iRaeNvjUQWuzrg20W2xgkF8ZwujHJ38FDG5
         AQmv6nqdiN4LvdauAm2TfEbPq6NzMUvsY/Mc2/oOp7AVUjTrRduedkdwGtXsHNCvZuDm
         su8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693243737; x=1693848537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ROVqh1j31/yDGoQGEjD+ZgYxpbyP+vRNz9MgEfFrbg=;
        b=YSq8lO7DX6XO3uLRxhnzVeOltrCCFdtJphAjh7XK5W/pg4VQy7Ze1VI8bsd15pQkmF
         8uQTNrB4QD0BXFozAdz6gBjDAF/xLwGng32v/AsDCHCDBZbYswC1vQtLIu9wRDVIjwsj
         N06t5T/srAoo+H+Rw2bClDs0OcDzmspgNCkSoWZ/QHuuWd5jFDO0F8D0p9bxeZADbDq0
         faoflapQUsDyH76MKZdAjTud+OKXXxBVhyIGAYrFGfZK6bKFbB+VAfccYScXaT1x8etx
         flhhDce3B3UkJWyC2wxT70j3HHpON4NWv3EG02S99bE8+ZDtAb5WHVg+GXYmF0bUySW5
         tWvg==
X-Gm-Message-State: AOJu0Ywm9QupoPpFBTOqMgdM5C4uIRdmNla+MULe74qJWVWZ8biKVmCC
        lBnc0L7yK8HbYY9zCxPqoSaL1i0YJP4K6/2bUtw3zXigaU4/6eM/tJXFog==
X-Google-Smtp-Source: AGHT+IFyIHIZIR/85snzj7o3/qdZ+zqzzm7B7WPWqfAfLUvy19QYleCGvQPodVs1Bc2aZHxXjIcYeubJXbgU0cTA0pA=
X-Received: by 2002:a67:eb06:0:b0:44d:5298:5bfc with SMTP id
 a6-20020a67eb06000000b0044d52985bfcmr14248099vso.17.1693243737352; Mon, 28
 Aug 2023 10:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230828145737.6ff53bc9@canb.auug.org.au>
In-Reply-To: <20230828145737.6ff53bc9@canb.auug.org.au>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 28 Aug 2023 10:28:46 -0700
Message-ID: <CAKwvOdms3YEsJ=buMvMbEK5yDqWwJO2LPmeJr+RP=SkP6h33fA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Aug 27, 2023 at 9:57=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/kbuild/llvm.rst:127: ERROR: Unknown target name: "reprocibl=
e_builds".
>
> Introduced by commit
>
>   bda09c0e14a4 ("Documentation/llvm: refresh docs")

Sorry about that; thanks for the report:
https://lore.kernel.org/llvm/20230828-docs_fixup-v1-1-cc78af124667@google.c=
om/
--=20
Thanks,
~Nick Desaulniers
