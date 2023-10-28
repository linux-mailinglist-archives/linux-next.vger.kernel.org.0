Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7E97DA7D4
	for <lists+linux-next@lfdr.de>; Sat, 28 Oct 2023 17:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjJ1PfD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 28 Oct 2023 11:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1PfC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 28 Oct 2023 11:35:02 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C39CF
        for <linux-next@vger.kernel.org>; Sat, 28 Oct 2023 08:35:00 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d865854ef96so2340403276.2
        for <linux-next@vger.kernel.org>; Sat, 28 Oct 2023 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698507299; x=1699112099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8nz7Y347FoMR7VcvdwalitvLrVo2XnIXuxuFyGWSWA=;
        b=Z2UKQk0Y9z2cMwJJdzZ1TDugoMe287IWUTyC16I49d+UY6VOr/YX/tB7zpQXGRS/1G
         /uFL3gx3KvcMT8iWfbycktH+jyvKKITi8q9aObDMuzbRCiXL2KFr7POU3eC+lB9dhKtB
         U8tiYI7dYJTD1onDsSZLINhyhBgmUo1q7ANuXUQH6EzxAuKYdhBbB4mRWBcsCI7XN4E6
         iIN/eHm8nadJB4DjHfdDNCL+mLb3xQ4A/WjhO9l6bvjFINQQqJP4MpdP5tWMYb6BGGMI
         b725TlFim/R4xx8nj5/UzRxZoK9XhhYNn+rABmYaucGCvVySanitMiS6aohK70Re/iyU
         UvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698507299; x=1699112099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8nz7Y347FoMR7VcvdwalitvLrVo2XnIXuxuFyGWSWA=;
        b=o3sSJ9As45XqdGtm31vjUopvGpXQ1fRMyqWmu2/TneD1mPjLGIVQWXv909BZ33VWtq
         b9Abw/v+i1UYVS4weozANcGU9E4vmJRQGqcFliDGfSTvp0zPaxdO8vvdYaA0KF/9jhEf
         TH7exQz2DUfCq1dklUT1FhIR4Y942klsB71erZtNejCWbNNWxJBEAcl7rfoUVcsV7c9X
         0PvBi4Au1TLyzu1JQ5F0qItBUcaEX6nlGJA/isZyzCRXpP9clrk9hmGNyiN54DjL2N+C
         cjy0wm6rErtczgn9tlnCXa6TNs6L7Nt93g5W1zZv3vwSsbDvFSw8BzW9woJu7i74gDc7
         Pj4A==
X-Gm-Message-State: AOJu0YyGFPsZ5eeU3d91yytOzTZNMVsk8tyCP7M270CtQmRnnz0S79x5
        NzsCInJ6h6Ua/Lw+NKDw42FAylDRdg6DapdV05UF
X-Google-Smtp-Source: AGHT+IEhxraiZOz31Kh6g9w1ZKQEdOuTpbHM8zmyCV+huYIiGODPmBP0B+MGMGs4ux5B9P9q18WHQUubaNepET00LNw=
X-Received: by 2002:a05:6902:1209:b0:da0:52e4:b5aa with SMTP id
 s9-20020a056902120900b00da052e4b5aamr7298142ybu.8.1698507299391; Sat, 28 Oct
 2023 08:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231027163400.5764d549@canb.auug.org.au> <20231027.Soon0Gee4xul@digikod.net>
In-Reply-To: <20231027.Soon0Gee4xul@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sat, 28 Oct 2023 11:34:48 -0400
Message-ID: <CAHC9VhTHVhgdBpSkMocmgWZgQzMcxMwC8Tp=Qr13Xvxaof82Pw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the landlock tree
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Kees Cook <keescook@chromium.org>,
        Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 27, 2023 at 8:56=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
>
> Thanks Stephen, your patch is good! I tested it with the merge of my
> branch and LSM/dev-staging.
>
> The new Landlock changes (tested in -next for a few weeks) add a new
> call to security_add_hooks() which gets a new signature with commit
> 9b09f11320db ("LSM: Identify modules by more than name") from
> the LSM/dev-staging branch [1].
>
> I plan to send a PR with my branch in the next merge window (for
> v6.7-rc1).
>
> We should squash Stephen's patch in commit 9b09f11320db ("LSM:
> Identify modules by more than name") but it would not be possible
> without my branch. I see two solutions:
> * keep Stephen's patch in -next only, or
> * rebase LSM/dev-staging on my branch now, and rebase it later on
>   v6.7-rc1 once my branch is merged (which is the workflow described in
>   [1]).
>
> Paul, what do you think?

Thanks Stephen, Micka=C3=ABl.

Once the Landlock tree is pulled into Linus' tree during the next
merge window I'll update the LSM syscall patches currently living in
lsm/dev-staging and this conflict should go away.  FWIW, there are
other conflicts with the LSM syscall patchset, most notably in the
syscall registrations, that should also resolve themselves when I
rebase on top of v6.7-rc1.

--=20
paul-moore.com
