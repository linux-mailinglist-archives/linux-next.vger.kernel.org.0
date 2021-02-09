Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDC73151BF
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 15:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbhBIOfI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 9 Feb 2021 09:35:08 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:39863 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhBIOdc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 09:33:32 -0500
Received: by mail-ot1-f43.google.com with SMTP id d7so15357766otq.6;
        Tue, 09 Feb 2021 06:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dxDnC1Zz5HK79WzEP7wBzhcdkf8+JiVvyiK/PaMB65U=;
        b=IePbOSEC7QGmtTgRlIRx7ClboUD12sS4xc0/u+EH8xcaPiwTuKad4CTQyWT2EWFGyk
         wjgeNP0SRcFIOkvzhzUpsQUC+EiIwz2iBR2FayKEgBslXP7/iyY6tG1sUWNfCOPioJ61
         +O+uVY4f18TvhTbSr+a7wMVAEQkZ5OJOn2rdhM6PFVmiT2dXYDaTuHjCE4lTfyX+Rm7M
         hbhYfsDmVUrj2zHrCnf2g211TOWDYTJl+hCv6/oZzNV/pw8UYkRTJ/7QOD8VFmSGLyjB
         +V1ladv1MJDkJsVPfkK3zx+v2ZQQqm0ZWyZlXY/KHruvX0aIRQB3dPtJsmqzXxQ14aQ3
         dKdA==
X-Gm-Message-State: AOAM532pYqfwIPPM9h825OOdTnTEIyG/qaS9HtS1AY8DVhibW7dNFIMZ
        8YXSBlPa6pSDrhjGjx5Dg2o+j4uKV7vwoonhd5XZ5b6k
X-Google-Smtp-Source: ABdhPJwCvfZqdipzCsaXpiZaEb5d4aRE7XskSSQXmgvN3yqT/jdADqL7ri6vhKZT5x2GjuoOulZ23ePtmf6vRrFC/PY=
X-Received: by 2002:a05:6830:1481:: with SMTP id s1mr4673179otq.206.1612881171389;
 Tue, 09 Feb 2021 06:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20210205115153.799dc024@canb.auug.org.au> <CAHp75VfiyAtxg+wqZ30kSzCfFFsLndLjzrUc1njZG0x6vQeyBQ@mail.gmail.com>
 <CAHp75Vdrnmnu3vfmtEmnU=dH9tjoZtSZUtgDNXp29E90tT+j7A@mail.gmail.com>
 <3936997.7vkU7uULjK@kreacher> <CAHp75VcUP1475T_jWQkZkjhZrfNEZ6UaOopm5v1WBOPoriTE3Q@mail.gmail.com>
 <CAHp75VfS=LgZfY6KTZeM7B+PgKpV3x_4zytszdaS=43A7BJEZQ@mail.gmail.com>
In-Reply-To: <CAHp75VfS=LgZfY6KTZeM7B+PgKpV3x_4zytszdaS=43A7BJEZQ@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 9 Feb 2021 15:32:38 +0100
Message-ID: <CAJZ5v0jbg8KWmmiAV0YrvndcbaY3CApUbPsTYVgxH-0HspZW3A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pm tree
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 8, 2021 at 8:48 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Feb 8, 2021 at 9:47 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Feb 8, 2021 at 9:30 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > >
> > > On Friday, February 5, 2021 12:15:22 PM CET Andy Shevchenko wrote:
> > > > On Fri, Feb 5, 2021 at 11:14 AM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Friday, February 5, 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > >> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> > > > >> failed like this:
> > > > >>
> > > > >
> > > > > Rafael, maybe I was unclear when explaining to you the dependencies with the series of series, but all three parts should go ordered. In any case it’s easy to fix. I will send you a PR late today of the immutable tag (part 1) that needs to be included in order to avoid the above.
> > > >
> > > > PR had just been sent to linux-acpi@ and Rafael in Cc.
> > >
> > > I haven't seen that PR, though, in any of my inboxes etc.
> > >
> > > Can you please point me to an archive or similar where I can find it?
> >
> > Sure, lore has it
> >
> > https://lore.kernel.org/linux-acpi/YB0mPPgpIpQzhNXS@smile.fi.intel.com/T/#u
>
> If it is possible, please pull that PR and on top of that (re-)apply
> the MFD related series.

Done (merged into the bleeding-edge branch).

I was confused by it apparently asking Linus to pull. :-)
