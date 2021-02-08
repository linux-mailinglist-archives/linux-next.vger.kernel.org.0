Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C94313F87
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 20:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236458AbhBHTup (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 14:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbhBHTtW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 14:49:22 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F38C06178A;
        Mon,  8 Feb 2021 11:48:42 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id u143so4164883pfc.7;
        Mon, 08 Feb 2021 11:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1fPnxhE6fFGIPEhit0ESVSOZWCpc1SGO+mkWO2gbahM=;
        b=kWBoCHMew4BYyhsY0g0hsrwgyfyxM9nJYCD6xmbJIiwqiZXahaWqvy0RLC3NXBvcES
         aZQ9Y88vfnW4+eb7tz5L+f2OmkgigZQhp4kGWDumBViXjanTsh0GoBgYsq6xbY4hx9Zo
         kNmhFveJiWoB9E8oc+UZVG/SBvVTbGVwppR5N4iKGa84JOEBAh/917mknf7ro7AJsSiU
         qcKNpoLIqDbwXsA28vpDoYDu+kP6bUGilkU4dUVtENQunwgiOe1scFxoMOYtRBVyT/XA
         sHLQXVPJwukOYA5oEwEWuJEtBhPOojNmUk//o1RCSA163+9U6F6Ozgvxm3YGhMUX5g+h
         Fg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1fPnxhE6fFGIPEhit0ESVSOZWCpc1SGO+mkWO2gbahM=;
        b=HVTjVMN0e/O5DDgrnPPfMKNnZFrinKvJIl3NZ7GmkdOl6IsJChCpBVt2AbUDT9I1Cq
         YXlndF/XXjHs+UeMd31CI7nsVKisXQP7DJRMhbuxl6Rc583/H+RGt5mtd4NRr5WaSz+d
         xzPIpYEUq2TuAYK8e9AwketmdZ1WRzQkKz4vnSQhIbvniZPJlcaQ1Agrlb4w3NmUdPFu
         qejhB6pDC5gNBx9wi3F88m8LyYZHULBGY6wAufY5o2pBazr8Md0JnF0Aom6hdvmYana3
         sMpfXLG73090VIbL/e1EjdGFANPM9A59sbBOeKNgcYheSFxNRMH+vrkEIvFpWPdQ+CXs
         zH+A==
X-Gm-Message-State: AOAM532AYoc5CGbAYyQj0+vwy4dxkwgvmw+al0nrRk9GuahrM+yt8QN2
        1J3ft7lHJfxuCFC+UEfhH5/kG49pUV9lz15qBMI=
X-Google-Smtp-Source: ABdhPJwna7HMJ3JIYqemfJkRAh2VJqn5btLVb+ORnXuyyKuHq2LsqughYNMcQrax44PQu97+rcTykLHE8k3zSTF8HIM=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr19817254pfe.40.1612813722069; Mon, 08
 Feb 2021 11:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20210205115153.799dc024@canb.auug.org.au> <CAHp75VfiyAtxg+wqZ30kSzCfFFsLndLjzrUc1njZG0x6vQeyBQ@mail.gmail.com>
 <CAHp75Vdrnmnu3vfmtEmnU=dH9tjoZtSZUtgDNXp29E90tT+j7A@mail.gmail.com>
 <3936997.7vkU7uULjK@kreacher> <CAHp75VcUP1475T_jWQkZkjhZrfNEZ6UaOopm5v1WBOPoriTE3Q@mail.gmail.com>
In-Reply-To: <CAHp75VcUP1475T_jWQkZkjhZrfNEZ6UaOopm5v1WBOPoriTE3Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Feb 2021 21:48:26 +0200
Message-ID: <CAHp75VfS=LgZfY6KTZeM7B+PgKpV3x_4zytszdaS=43A7BJEZQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pm tree
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 8, 2021 at 9:47 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Feb 8, 2021 at 9:30 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrot=
e:
> >
> > On Friday, February 5, 2021 12:15:22 PM CET Andy Shevchenko wrote:
> > > On Fri, Feb 5, 2021 at 11:14 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Friday, February 5, 2021, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> > >
> > > >> After merging the pm tree, today's linux-next build (x86_64 allmod=
config)
> > > >> failed like this:
> > > >>
> > > >
> > > > Rafael, maybe I was unclear when explaining to you the dependencies=
 with the series of series, but all three parts should go ordered. In any c=
ase it=E2=80=99s easy to fix. I will send you a PR late today of the immuta=
ble tag (part 1) that needs to be included in order to avoid the above.
> > >
> > > PR had just been sent to linux-acpi@ and Rafael in Cc.
> >
> > I haven't seen that PR, though, in any of my inboxes etc.
> >
> > Can you please point me to an archive or similar where I can find it?
>
> Sure, lore has it
>
> https://lore.kernel.org/linux-acpi/YB0mPPgpIpQzhNXS@smile.fi.intel.com/T/=
#u

If it is possible, please pull that PR and on top of that (re-)apply
the MFD related series.

--=20
With Best Regards,
Andy Shevchenko
