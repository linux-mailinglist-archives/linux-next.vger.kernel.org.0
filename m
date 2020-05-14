Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFED1D2FDF
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 14:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgENMfM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 08:35:12 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:53426 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENMfM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2020 08:35:12 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 04ECYp9S018712;
        Thu, 14 May 2020 21:34:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 04ECYp9S018712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589459691;
        bh=hP9Rf8p3EqFJ6yAcUvagABRS8Pxtr0WriLBTnApUZ9M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XC2bcBh3QW4f65wQ/vD63W9suAwmBW5f8fhxGQnNCW0oVLlE5NpLBaro6uV0thJVW
         ujKAuwg5dOQEgtzsFTpCCLEmfWHbAotumXYQUXrJyog+C88gHZE+hwvUcZ5aCLSEp/
         guU6MOU2R9R8fDB0WAkhfcFIwZFkgUuuXQgAgXV5xFVM8L2hGEPcZ95opdRa+YqdPb
         wlL/Rdm6nafqFZFXjSg9mb1E1Dnue1g5VVaIo2Rl7+3J/eADdKptjCVKLjATLOgbbb
         bgzgqoiouGT/4QfeRCV3LE0cFV8M8KXbDtX4mtMW7EwbD8+3w/k87ddaMXxBvJ3lJF
         bfLQCxc/yNmQA==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id 1so1816420vsl.9;
        Thu, 14 May 2020 05:34:51 -0700 (PDT)
X-Gm-Message-State: AOAM531kl8enxNhM73bY6E+EVx+B+2ic0b1JyoTvbIgz1ZPtB3CkhUsF
        tCqBlQXwrHJuNwK3KceRFFj9byUZEMRgTVJdh6s=
X-Google-Smtp-Source: ABdhPJzIXEiN9gXYr3FA2neQ23TCsBmxC+MIHmoI3aHpS81jzOtdSm49rna3BKs0DPGp9EjZDg57BbYbiFAB9ryHOHA=
X-Received: by 2002:a67:d00e:: with SMTP id r14mr2894079vsi.215.1589459690272;
 Thu, 14 May 2020 05:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200514143055.1f71ba68@canb.auug.org.au> <CAHmME9osYhwzFEyGUELqSSNexgK56NJrOrWTi3vnyDft8tv-hw@mail.gmail.com>
 <3672488.1589458306@warthog.procyon.org.uk>
In-Reply-To: <3672488.1589458306@warthog.procyon.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 14 May 2020 21:34:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMnHJi+42NUABD-FJQ1tTF2y6qaN=vcS9wEr11+7LVTg@mail.gmail.com>
Message-ID: <CAK7LNASMnHJi+42NUABD-FJQ1tTF2y6qaN=vcS9wEr11+7LVTg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the keys tree
To:     David Howells <dhowells@redhat.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 14, 2020 at 9:11 PM David Howells <dhowells@redhat.com> wrote:
>
> Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > Your touch might be helpful here. CRYPTO_LIB_CHACHA20POLY1305 is a
> > tristate and depends on as well as selects other things that are
> > tristates.
> >
> > Meanwhile BIG_KEYS is a bool, which needs to select
> > CRYPTO_LIB_CHACHA20POLY1305. However, it gets antsy if the the symbol
> > its selecting has =m items in its hierarchy.
> >
> > Any suggestions? The ideal thing to happen would be that the select of
> > CRYPTO_LIB_CHACHA20POLY1305 in BIG_KEYS causes all of the descendants
> > to become =y too.
>
> I think that select is broken in its behaviour - it doesn't propagate the
> selection enforcement up the tree.  You could try changing it to a depends on
> or you could put in a select for every dependency.

I agree.
'depends on' will be cleaner.

> I'm not sure there are any
> other options - unless we turn big_key into a module and institute autoloading
> of keytypes on demand.
>
> David
>


-- 
Best Regards
Masahiro Yamada
