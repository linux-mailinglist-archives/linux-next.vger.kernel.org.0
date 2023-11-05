Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C78A7E17ED
	for <lists+linux-next@lfdr.de>; Mon,  6 Nov 2023 00:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjKEXhF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Nov 2023 18:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjKEXhE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Nov 2023 18:37:04 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB66FF
        for <linux-next@vger.kernel.org>; Sun,  5 Nov 2023 15:37:00 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso2458922276.3
        for <linux-next@vger.kernel.org>; Sun, 05 Nov 2023 15:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1699227420; x=1699832220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzSqKUikOHBeX7iFBnbpnh2tz9SPjogXq2dkiXmXdQE=;
        b=TtmsU3m8CzI0ldMscosDUao0+q27+Gclg00LIcZWWMrZZDZdakv6b2v9y1K1kmeTBl
         Xs2nTZASOKiLBDbV9bglnbR3mfXQ//0DftYeY1uvFPXwXdZFyY33W8QjGXangy+lSV+6
         /JQ3Sz/iSiTXx0yUBpZWLHWughuBSjm6fKjF70AC+qhv1QYf1Oi2ijbq1w4xtdlN5wMf
         pH8KZpWIk9ASwQQBXFxyxWi/RYZdIVbDtojvoQIcOcz84AQ4fF7QAj84e/tpOHz0WAcU
         Tyf7/1reh0fEiNKHPUgt+C+d3BvLZoIOUdhpuazXhwAd6t/zSnChRKYcf+oaC9WhikCX
         cVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699227420; x=1699832220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzSqKUikOHBeX7iFBnbpnh2tz9SPjogXq2dkiXmXdQE=;
        b=apgzmnCmz6Xl+Pok0IyT4hxGCdDsrNxTchK+z0U6rDuTlHAw/gknlLEMum7EB+M3ib
         bs2BZUxhPBhWHKOGM0zBgH4xJrESJFqDzC12OOlKkqbVEpXdHeNJLPOuppRzSouZOR59
         QeOV1xjD2t6SFXdDypnvDewi2fThDtL9OE+gP7hjzjNHf63xtYE9nbznDb9GlJMCw68j
         tA18YPe0sZVeM19WgpeZMy4qCcjbhr4L8282K9Ez0T/kZb/iSwA1SR9TdJK7vRG9R7lE
         ZjTWb13HY7ANG+G3b7nl6qdVkrsYqYjXQFWDLjdxhk0lJo0iAKUUT3HWoCxg3YotUhIf
         VL0A==
X-Gm-Message-State: AOJu0Yw0iBUt9U61RTtJ98giJBtg9SEbyKLCSPRtuEyu/7HcGaaGSnWB
        e7jlZsGrtjrJ7qEogjPHrghInWh4GLAUHpYkTUX8
X-Google-Smtp-Source: AGHT+IHDsU+1kE9adaZnQPvPUleIvQSF3bEFfshHvM3GEFdpaDfxDryWr4eFwpMOu4AmXCOkBehgWzH7n6BQ2iu0v3s=
X-Received: by 2002:a25:6b44:0:b0:da0:38c8:2e66 with SMTP id
 o4-20020a256b44000000b00da038c82e66mr25816467ybm.3.1699227419896; Sun, 05 Nov
 2023 15:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20231027130320.69469330@canb.auug.org.au> <CAHC9VhQ+Nt7CrLxSZcOVNEtAypruOmM0ST0P0JJMrOq4XYmAkw@mail.gmail.com>
 <4b4eb40c-b65a-46e2-9e23-5412a9cdcad0@canonical.com> <CAHC9VhQbxJ4-z4Hp7CSmtcTNOWGFeQF2eEyct9=nHCMN_89YXw@mail.gmail.com>
 <20231031074649.3bdbec45@canb.auug.org.au> <CAHC9VhR=x7qB3gmQg+GPYLnXtGU88S3KCiZGjRYtDKSJHp4P1g@mail.gmail.com>
 <20231106101434.70c62773@canb.auug.org.au>
In-Reply-To: <20231106101434.70c62773@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sun, 5 Nov 2023 18:36:49 -0500
Message-ID: <CAHC9VhQkUVCAboT78M3g6LabmzFqKYdsxMHQ7ePETJKnzDiV+Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the apparmor tree with the security tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     John Johansen <john.johansen@canonical.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Nov 5, 2023 at 6:14=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi Paul,
>
> [Sorry for the slow reply]
>
> On Mon, 30 Oct 2023 17:04:01 -0400 Paul Moore <paul@paul-moore.com> wrote=
:
> >
> > On Mon, Oct 30, 2023 at 4:46=E2=80=AFPM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> > >
> > > On Mon, 30 Oct 2023 12:52:50 -0400 Paul Moore <paul@paul-moore.com> w=
rote:
> > > >
> > > > On Sun, Oct 29, 2023 at 5:09=E2=80=AFPM John Johansen <john.johanse=
n@canonical.com> wrote:
> > > > >
> > > > > is part of the Three basic syscalls series, the plan is still to =
have that
> > > > > series bake in next for a full cycle?
> > > >
> > > > Yes, that's still the plan.  Once v6.7-rc1 is out I'll rebase the L=
SM
> > > > syscall patches and I expect the vast majority of these conflicts t=
o
> > > > disappear, although I'm sure we'll pick up some new ones with the r=
est
> > > > of the v6.7-rcX cycle :)
> > >
> > > These patches should not be in linux-next until after v6.7-rc1.
> >
> > What if we wanted additional testing beyond the typical?  Do you not
> > support that?
>
> No, I try hard not to.  It just complicates things when I and others
> have to cope with conflicts and build problems caused by
> patches/features destined for next+1 while trying to stabilise the
> current/next release.

The LSM, SELinux, and audit dev-staging branches will no longer flow
into the next branches, and I've reset the current lsm/next branch so
this should not be an issue the next time you pull.

> Sometimes it happens that a feature slips after being added to -next,
> but please don't do it deliberately.

--=20
paul-moore.com
