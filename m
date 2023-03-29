Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEAF6CF3DD
	for <lists+linux-next@lfdr.de>; Wed, 29 Mar 2023 21:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjC2T6n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Mar 2023 15:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjC2T6l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Mar 2023 15:58:41 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D259618F
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2023 12:58:33 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54601d90118so158506857b3.12
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2023 12:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1680119912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4EJkdGyxMVcGxifO1qafyN9ve0DpJKcD1zNZPvkoOQ=;
        b=X7Pqfv0UK+v9i1cGCHrYEiTNG6rNWMy3nKSoSP69TUwEbb/VWxwJVWvgxXWGmfs0Ap
         y9phc0S0DAoRi77m3KGFUynMRyqcy59esvGK2+OUdkAQwkwL+sitXQu+ABjPu61jJ3IN
         fCySkM3AHpmLiN2nDRaI4fqn1aiywYTNjl09Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680119912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4EJkdGyxMVcGxifO1qafyN9ve0DpJKcD1zNZPvkoOQ=;
        b=oA6mhnBo/YJ8JbK0c0Y6rHz5NMounSU7svMm+9QSreeVw7G4qoHkO4X3mEjZSFw4Gg
         WzLq4AdOXopSAgPdfu85OOYfdOUO2/SPs4iPKeENHY4UUUZBdS0IxPgxOlmcFcndskPn
         TNsurV17HsePeBc3NRjV1S0uUu0kqDRXLiHm6jbkXvo8cGmKPg4brIrguvaEbGuQSWIX
         D+NL+FkbcP4FuMob8L/S1a3eCnzL0ZDWgo0bH9mNqCQRwYvBjP/n5TOW2V8Ym39bOKI0
         49YgZedh20Vh/z/Lq9ahAlB4scUXebzUvImVmWcnyWSfbLSPzew/LixA6vAggVa1ZhY3
         6dEg==
X-Gm-Message-State: AAQBX9emg7c0yx6g7gtXYSd2EvANYp9gTpRqDcgLYQSWV/nOOz57u9BW
        dyZFbntS9UDpnb3wLNswn0XCMvLq+KZzgPfW6zuHKw==
X-Google-Smtp-Source: AKy350Zxl1w9uKQOFJbJozgdk2onV0JTPFVvHfQK6FKbD2iD8tQ3HNsJrLn371sk+ohcuprwiigk4AQFfG32UhEiIkY=
X-Received: by 2002:a81:e308:0:b0:532:e887:2c23 with SMTP id
 q8-20020a81e308000000b00532e8872c23mr10210700ywl.9.1680119912635; Wed, 29 Mar
 2023 12:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230328121609.68105dd5@canb.auug.org.au> <4fd06223-e307-50e6-f4ec-40ca34fc1a4b@gmail.com>
In-Reply-To: <4fd06223-e307-50e6-f4ec-40ca34fc1a4b@gmail.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Wed, 29 Mar 2023 15:58:20 -0400
Message-ID: <CAEXW_YRMjXpRoss_cgF_mghseZbY-86UouDmcLbVW-oOpZ_D2A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with the rdma tree
To:     Bob Pearson <rpearsonhpe@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 28, 2023 at 12:38=E2=80=AFPM Bob Pearson <rpearsonhpe@gmail.com=
> wrote:
>
> On 3/27/23 20:16, Stephen Rothwell wrote:
> > Hi all,
> >
> > FIXME: Add owner of second tree to To:
> >        Add author(s)/SOB of conflicting commits.
> >
> > Today's linux-next merge of the rcu tree got a conflict in:
> >
> >   drivers/infiniband/sw/rxe/rxe_mr.c
> >
> > between commit:
> >
> >   5bf944f24129 ("RDMA/rxe: Add error messages")
> >
> > from the rdma tree and commit:
> >
> >   330f72b82ab0 ("RDMA/rxe: Rename kfree_rcu() to kvfree_rcu_mightsleep(=
)")
> >
> > from the rcu tree.
> >
> > I fixed it up (the code modified by the latter was moved by the former,
> > so I used this files from the former and applied the following merge fi=
x
> > patch) and can carry the fix as necessary. This is now fixed as far as
> > linux-next is concerned, but any non trivial conflicts should be mentio=
ned
> > to your upstream maintainer when your tree is submitted for merging.
> > You may also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 28 Mar 2023 12:12:24 +1100
> > Subject: [PATCH] fixup for "RDMA/rxe: Add error messages"
> >
> > interacting with "RDMA/rxe: Rename kfree_rcu() to kvfree_rcu_mightsleep=
()"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/infiniband/sw/rxe/rxe_verbs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband=
/sw/rxe/rxe_verbs.c
> > index 84b53c070fc5..bbdfbff5c752 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_verbs.c
> > +++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
> > @@ -1341,7 +1341,7 @@ static int rxe_dereg_mr(struct ib_mr *ibmr, struc=
t ib_udata *udata)
> >       if (cleanup_err)
> >               rxe_err_mr(mr, "cleanup failed, err =3D %d", cleanup_err)=
;
> >
> > -     kfree_rcu(mr);
> > +     kfree(mr);
> >       return 0;
> >
> >  err_out:
>
> Thanks, I thought we had already done this. If not then we should. This i=
s the correct fix
> for that rcu mightsleep business.
>
> Reviewed-by: Bob Pearson <rpearsonhpe@gmail.com>
>

Bob, could you please squash Jon's diff into your original patch
("RDMA/rxe: Add error messages".) before you send your pull request
for 6.4? Then I can just drop my patch.

That will be best. WDYT?

thanks,

- Joel
