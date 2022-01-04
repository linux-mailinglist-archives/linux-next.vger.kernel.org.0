Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F8E48494A
	for <lists+linux-next@lfdr.de>; Tue,  4 Jan 2022 21:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbiADU0e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Jan 2022 15:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbiADU0c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jan 2022 15:26:32 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F48C061785
        for <linux-next@vger.kernel.org>; Tue,  4 Jan 2022 12:26:32 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id f8so23606002pgf.8
        for <linux-next@vger.kernel.org>; Tue, 04 Jan 2022 12:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YstHcFLIO10WKW4pal7ZY0piHIOQ0oYypxCHj1uABng=;
        b=nC+BySciKySvoAqIFMFvNskr8W6g2HgamXyDh9gjJLnyubE++rW71crAlqEKB2xHS1
         oEQqJmNtLhnNk2L+K+xxg9gEE49zJaw3sJv1WmjrZSE29p8UV9mTsViAeDl90yjPkuXv
         GaJWW7S1/bV8JdSlTOz1kY4DutokSm/iMXU9ZO1CIF6t6EXQcFUOwgGxLY/eenhadyKf
         kmTaKeMiPr9wHEmHfmW6U3mwKfgdjSLHTkWXoNNs+CLesqFJKywlnHy059Lh/vcAHiiL
         TK73dLx32iwKicKC09wy1Lan4fgKTNI7QCCF7x+15r5c6r/4RNPDZs6ODV6XS2U9Cx6b
         xAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YstHcFLIO10WKW4pal7ZY0piHIOQ0oYypxCHj1uABng=;
        b=NBH0bqnfqowoUoB+XirO+9bESOSyMrRqpVj/0iQh8Wg/AuZkstMl65+/VqQvfXwz22
         6gHurvPW4S33fCk4IBKEiGMYHVZ6HBUPU4AxUAMzS6nzZ3DbHoZnGzbCrPCLp6Cme0ei
         uoBNWbwoaC6aqVn3Q/QHo6wot4YuIU3y+88/meC8RrD+x9xHjVU4S5Fum7WzuzQJqbZK
         tb3KtWBzi1EZJJjhbOzkGgaXwdDmTMH2aeoe3XZgink7eCNUODnZ4xorZH8nYqH28mzo
         i90nF4hbtM3fcOJzr90iL40BasI0FXdm7WV2hvh69pq07J3bSDa5LjijU+Alye/1O7k/
         oY5A==
X-Gm-Message-State: AOAM533IEm4MyRMlRVB3Tf3UaxD0txElb8kKU8p5MddMjWu058Veq9OB
        MGzQj6P+Z/zNZGBXFqz5eGi4tlU9Q1ApNYs0H6KcE7w10JlX9w==
X-Google-Smtp-Source: ABdhPJwolS1Dywi4y8e5blBUJcQQ4Uo5Q4X7S4DL1BG5VQw3UfKCX8GZuCZAU33oW+6zdvriTKjCSS7XXC8aN7u6fgA=
X-Received: by 2002:a05:6a00:24c2:b0:4bc:bea:1e60 with SMTP id
 d2-20020a056a0024c200b004bc0bea1e60mr35311557pfv.63.1641327991879; Tue, 04
 Jan 2022 12:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20211224163256.2a0f01af@canb.auug.org.au> <CAGS_qxrmxi3a9-HGxQMwJhPnR4xfzvYFOn36QcqDgitoHdfwHA@mail.gmail.com>
In-Reply-To: <CAGS_qxrmxi3a9-HGxQMwJhPnR4xfzvYFOn36QcqDgitoHdfwHA@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 4 Jan 2022 15:26:20 -0500
Message-ID: <CAFd5g46vsEek4YKjh1LnSPH5_5enSVmqqhptCynqagP97SFb+g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the jc_docs tree
To:     Daniel Latypov <dlatypov@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Harinder Singh <sharinder@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 4, 2022 at 2:05 PM Daniel Latypov <dlatypov@google.com> wrote:
>
> On Thu, Dec 23, 2021 at 9:33 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the kunit-next tree got a conflict in:
> >
> >   Documentation/dev-tools/kunit/index.rst
> >
> > between commit:
> >
> >   6c6213f4a29b ("Documentation: KUnit: Rewrite main page")
> >
> > from the jc_docs tree and commit:
> >
> >   58b391d74630 ("Documentation: kunit: remove claims that kunit is a mocking framework")
> >
> > from the kunit-next tree.
> >
> > I fixed it up (I just used the former version) and can carry the fix as
>
> Thanks for this.
>
> Harinder's patch should supersede my small fixup patch.
> It wasn't clear when Harinder's patches would land in the docs tree.
>
> But it looks like my patch two files that Harinder's didn't, specifically:
>  Documentation/dev-tools/kunit/api/index.rst | 3 +--
>  Documentation/dev-tools/kunit/api/test.rst  | 3 +--
>
> Shuah, Brendan: I can send a new version of 58b391d74630 that only
> updates those two files, if wanted.
> Or we can go with Stephen's fix, which looks good to me.

I'm fine with Stephen's fix, and I am assuming that is the direction
that we already went - so probably the least likely to make waves.

So looks good to me.

Sorry about the delayed response. I was on vacation.

Cheers!
