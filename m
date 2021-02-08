Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F387313F84
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 20:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236558AbhBHTuE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 14:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236553AbhBHTsU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 14:48:20 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8D0C061786;
        Mon,  8 Feb 2021 11:47:40 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id gb24so166331pjb.4;
        Mon, 08 Feb 2021 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GKiTgTeFZ/IjOQISfVVtL4fOvInJ9h0enLQrB/L9hps=;
        b=IkBzzYHQbVJGRlSVPuWI70hZooALE13RTiYYaYNt4gAiHqGTf5oiIOM04bmMdJaXJ7
         dsIgXFtsfNsMME7Y7R5c3Q6cr58mqJvmbRjiDpzDWLEdb6GitJPHrjsAbT2YGwF0BJyr
         +70R2b889ucf3iVcPgyo84X++PiDhC2XZyuzGNkDqYLEJN6Z3UIjbXe10gnkKQ5ReNJC
         MwdXmPF4XT4+n9WJ1maAMa1PaIZPqB3Mbze3hHyzIJ3AM+jzkhPrxh9KAXBvyztPqJXO
         lNitk4hest5LGM9q5yISPxZ6xOhytY0UUnsmL5//7L0pP2EO0bIHrg2xUbdMCLMiuY2A
         ouVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GKiTgTeFZ/IjOQISfVVtL4fOvInJ9h0enLQrB/L9hps=;
        b=ZLegpIu657exCokqovbVYz37MAyoVHu9xFk8Usbdz7fPFUr+q7QiAPdONgQPJrV88h
         6wTbwP9A0OKJJ9aniwsTSIksk8eAMAM38aHV/FP6AHU/400FygRVE/+CXKb+cYMvMyqF
         3z/JXM7apEgbjouF8Zel1/hxdWHCneNi2UVpjfoLwN1T64B1zych6jBqGYzK3/+/OaUj
         XU9SNBQJ6KnmXmbz/bHVd7D/xkt6AVHN0BFQnQvgTN9e5AGttzM271oqDnpGbwZdp+OV
         VvoLVk+AXb2/z9DEfKTd3Ys6inRCPjdSzrYSxG90TNBlrsUJN9opFpUWlra0HpRLHbds
         TW6g==
X-Gm-Message-State: AOAM532q1TeA/baSjzFp6tg8P80QZwhaH+5YgweorjViIPVmuJTwqJQO
        mNallnddz57EnWzyUNb1KEKsp8ffAAfmSJIk18sRBt+dtiZYGnKn
X-Google-Smtp-Source: ABdhPJwfo84Yp9B9WfGDfuA1yEjHEo1Ozuh5AoAiBb68No2NpayxxGb9vi6qDInxv6RqjGRP73FspqepGVyhcItJH3w=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr397177pja.228.1612813659670;
 Mon, 08 Feb 2021 11:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20210205115153.799dc024@canb.auug.org.au> <CAHp75VfiyAtxg+wqZ30kSzCfFFsLndLjzrUc1njZG0x6vQeyBQ@mail.gmail.com>
 <CAHp75Vdrnmnu3vfmtEmnU=dH9tjoZtSZUtgDNXp29E90tT+j7A@mail.gmail.com> <3936997.7vkU7uULjK@kreacher>
In-Reply-To: <3936997.7vkU7uULjK@kreacher>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Feb 2021 21:47:23 +0200
Message-ID: <CAHp75VcUP1475T_jWQkZkjhZrfNEZ6UaOopm5v1WBOPoriTE3Q@mail.gmail.com>
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

On Mon, Feb 8, 2021 at 9:30 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> On Friday, February 5, 2021 12:15:22 PM CET Andy Shevchenko wrote:
> > On Fri, Feb 5, 2021 at 11:14 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Friday, February 5, 2021, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > >> After merging the pm tree, today's linux-next build (x86_64 allmodco=
nfig)
> > >> failed like this:
> > >>
> > >
> > > Rafael, maybe I was unclear when explaining to you the dependencies w=
ith the series of series, but all three parts should go ordered. In any cas=
e it=E2=80=99s easy to fix. I will send you a PR late today of the immutabl=
e tag (part 1) that needs to be included in order to avoid the above.
> >
> > PR had just been sent to linux-acpi@ and Rafael in Cc.
>
> I haven't seen that PR, though, in any of my inboxes etc.
>
> Can you please point me to an archive or similar where I can find it?

Sure, lore has it

https://lore.kernel.org/linux-acpi/YB0mPPgpIpQzhNXS@smile.fi.intel.com/T/#u

--=20
With Best Regards,
Andy Shevchenko
