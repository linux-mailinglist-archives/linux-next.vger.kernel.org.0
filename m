Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C550C78274D
	for <lists+linux-next@lfdr.de>; Mon, 21 Aug 2023 12:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234824AbjHUKo5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Aug 2023 06:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjHUKo4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Aug 2023 06:44:56 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346E6DB
        for <linux-next@vger.kernel.org>; Mon, 21 Aug 2023 03:44:55 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-58419517920so34676957b3.0
        for <linux-next@vger.kernel.org>; Mon, 21 Aug 2023 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692614694; x=1693219494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtxD7adfjwKLhyH6cVNSeAqAWFExTn8fb1CoOUK3l0I=;
        b=JToSM+gNangjXOEQfoZzHcjr0OHrQlb0WhIoiVHG9n0tKjPCmY8mum8bWOibBvh3TI
         GoyCVojO8OqVrXgVdeijm6/QORsSRbyq3f6VhccPRDOE5pjWTe3PAggUPishPrcbwq/r
         HHHPfDRtd79RYH1yzEExDOmNkhAj1YM2ZfDBZHzKsULIxr4+d9kY0rQxt9zCL8NydfNO
         IY21qmCJdxGkQhC9xu4fg7kssd7JG7YzCiqkW4ct0mCDrY7DiFko7vkGabxMaH2UmIBD
         i3k8G67dIWFjcusbeDAJEnRKJbb4jllWDMxyWWz32cuAMJx3cQpxda6rD4JUdT07ANVn
         GRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692614694; x=1693219494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtxD7adfjwKLhyH6cVNSeAqAWFExTn8fb1CoOUK3l0I=;
        b=XcNnqqslXE11MZkDKB/XdRKaKXH3fUpH6qRINcoYowyFdt4u4YLMYSU11kpgsgpXeY
         Xm0KVIgR+MlB90+Oxy0vCO+wcCAtojjNcMBPFyWUayQsoEWCfbf/ArKY2u3rWokdYzHF
         8UWSJx0yhFu/P07GmJ96k7DNmm0q89A9eUPwlbnpLVZK9nBtg6xKo3U+rOpR/H7mRVwp
         A8aS32xCyapSAArstpLl826RUQqBo2Ldg2kwSPBck6PEy6bYwI13jJ+OakChaRKGMYMe
         s9rSoYb1q1yBF1Qo7hMN/pc0EegespRhTyw/TH0KFfXizLkPRymbgFM1ddk4H87QYQCh
         j71w==
X-Gm-Message-State: AOJu0Yzxk85YFFRNlp8NiYSxXMM78XL2iJ+XQWkIPSiCtLCakwxU4XbD
        vdmalORxxjGoufzcXvcif7TJaBT5BSQnUeig3o1RSg==
X-Google-Smtp-Source: AGHT+IE5KBdM6hLkxoWOxcMZKCWi2iIUOsdw8OimSEx+IgkUvQ1RfGdH1D1BQ8TiHyjmgXBL+gkfSnLJf0iG/Qijp5I=
X-Received: by 2002:a25:2e01:0:b0:d04:f936:556 with SMTP id
 u1-20020a252e01000000b00d04f9360556mr5875458ybu.36.1692614694460; Mon, 21 Aug
 2023 03:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230818160837.147b1e2e@canb.auug.org.au> <CAMuHMdWQFYZS8qACEsaZvMEuvrVY3Ag0pJBi1SE6Kkj8tTMbrg@mail.gmail.com>
In-Reply-To: <CAMuHMdWQFYZS8qACEsaZvMEuvrVY3Ag0pJBi1SE6Kkj8tTMbrg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Aug 2023 12:44:43 +0200
Message-ID: <CACRpkdYu5WVQPpz5GE4cqjLJS_bpi-r++FeAw7CKovqvWd0knw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl-renesas tree with the
 pinctrl tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 18, 2023 at 1:26=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
>
> The resolution LGTM. Thanks!

The conflict is local to the pinctrl tree now, Torvalds will fix this
conflict when I send my pull request for v6.6 to him.

Yours,
Linus Walleij
