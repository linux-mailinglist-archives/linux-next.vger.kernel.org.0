Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CBE474AAE
	for <lists+linux-next@lfdr.de>; Tue, 14 Dec 2021 19:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhLNSXf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Dec 2021 13:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhLNSXf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2021 13:23:35 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE1BC061574
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 10:23:35 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id t5so65921988edd.0
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BH/wyW5b6ZLsqDtk7HoFzzH8zAQQigEUOeTbAwzBS4M=;
        b=3nG/z3h8gTZOVS6dCPVTY3pohzKG7wjQCvZeMoIogLH7pTGV0V007zgGdQctUPbOm0
         H8nbIMk7P13ENcnPTpscY4y30b3De2mNHkF2WwRXxavGK7JIo4F70cSdXV9ZSXWw9sge
         xRedYpwTUeWKkFiWnchFkbjWtkD/3bQKPhFu0ueWuoQE9PTA3k7SAZyLNUxV00Hb1ACt
         DBpSpv69L5LlymxZKehL4/mDpVH6ZGeklR34ugA/VSZMqn/zBaHm5vD2kZjtA3X6Glz1
         VRwC2DPKYFc1QX0zz9cUgAxjTZvuzYhJMoa1Z5F7/rPLN/IdNYSTiL4zXHjrlraM80Hh
         VMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BH/wyW5b6ZLsqDtk7HoFzzH8zAQQigEUOeTbAwzBS4M=;
        b=U6yhn6ZaHhGbRXYq3SbIjBH+f0n+M5D8QjS3krxrWtySdPxp7MlUtJQ5BDgrOVcAc1
         PAC4MDNjMdrD8dHlG4OBLAxMXuL+uIs7FjP3LxmWapjF7KnX8DCs/X2Fv/UKp6kiVjFE
         BYF0dtog6eG3KI+jLCECNPBvOlMhlkTgBdmCeMKjiX5SzFFib+akUcmrDCinWl9IuWCj
         A2bv80FG5gYfaaLd8HJfXQQrTpebmhwWW8SUpZUiAG0wL8NE3rkV8HJEoPrLQpi8mYiQ
         vpZ8q6xEI8nimMP2J2cBU0PG7c39btZr2KPf4a094j5z+YsgGzVLE4kz3TbplfVZe0K4
         7Aow==
X-Gm-Message-State: AOAM533bp94yK/hGWMCZ5/GO0gwSwqTJPaRP+2U2CySCEhljNTYn3aku
        +/93JH9mxWkEWTQy6IpCnSSJKc6wNkiziQ7H+ZxIOPZze0tL
X-Google-Smtp-Source: ABdhPJw56SWg8NjpfiW1SDbrfnDf8G9149S+aYRucO92yhvZcYnvJJLzjXEnD/Smx5evCJejVOXkLZ4W5n9y3sFBsx0=
X-Received: by 2002:a17:907:e8e:: with SMTP id ho14mr7600870ejc.12.1639506213438;
 Tue, 14 Dec 2021 10:23:33 -0800 (PST)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au> <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au> <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com> <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
In-Reply-To: <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 14 Dec 2021 13:23:22 -0500
Message-ID: <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 14, 2021 at 12:59 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Hello Paul,
>
> I've been trying to setup your test suite on my powerpc board but it's
> based on Perl and on a lot of optional Perl packages. I was able to add
> them one by one until some of them require some .so libraries
> (Pathtools-Cwd), and it seems nothing is made to allow cross building
> those libraries.
>
> Do you have another test suite based on C and not perl ?
>
> If not, what can I do, do you know how I can cross compile those Perl
> packages for PPC32 ?

Is there no Linux distribution that supports PPC32?  I would think
that would be the easiest path forward, but you're the PPC32 expert -
not me - so I'll assume you already tried that or it didn't work for
other reasons.

I'm also not a Perl expert, but it looks like PathTools is part of the
core Perl5 release, have you tried that?

https://github.com/Perl/perl5/tree/blead/dist/PathTools

Finally, no, our only really maintained test suite is the Perl based
one; there have been other efforts over the years but they were never
properly supported and fell out of use (and applicability).  At some
point you/someone was able to run the test suite, why isn't that
working now?  Or was it a different powerpc ABI?

-- 
paul moore
www.paul-moore.com
