Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA6D1D3125
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 15:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgENNV0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 09:21:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgENNVZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 09:21:25 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D98620748;
        Thu, 14 May 2020 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589462484;
        bh=NPCFOYKBuixpacg9mBP6x+YT3849Zm5W+6nvvtaInns=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g1Qbodw5lhgSs16AFT0cVg5vXT6fIrJRAhu2YrXY/Cix3tICjAi7/YnJqTajr6Yb4
         0L+Rwluit5yJFJMBE9ndA1T8rlcy7qSJ9o9kAnkd+oMv5qJNxk71ll7xg3FAP//zKT
         KaCLtJNqFAkC5+1hLgeLOgl9fhQOfr/AsCoXj2ps=
Received: by mail-io1-f47.google.com with SMTP id k18so285774ion.0;
        Thu, 14 May 2020 06:21:24 -0700 (PDT)
X-Gm-Message-State: AOAM531mGbTzfU44Izqz2XAoJa05YRyQmcxCw4U/8zT2gR4CKEdhmmv1
        nk+RAdQ/9oi7khE+yqQKqQfNlmCZtHiys6L+CWI=
X-Google-Smtp-Source: ABdhPJyiu+K63MGl+EPSA7G+DKJxZn+mdZxhqUbhlq+A7hkIT3xsdbxmzRZbYfhilFS9AiVcsRLm9N42O9sHzLvzjW0=
X-Received: by 2002:a5e:8705:: with SMTP id y5mr4092694ioj.142.1589462483836;
 Thu, 14 May 2020 06:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200512144949.4f933eca@canb.auug.org.au> <20200512162205.GI5110@sirena.org.uk>
 <20200512163632.GA916@sol.localdomain> <20200512170801.GK5110@sirena.org.uk>
 <20200512200805.GA175421@gmail.com> <CAK8P3a2C-91vCNv8NV6ut8GDu2z9Yt6VwX+P2WggWnuCcMjcvg@mail.gmail.com>
In-Reply-To: <CAK8P3a2C-91vCNv8NV6ut8GDu2z9Yt6VwX+P2WggWnuCcMjcvg@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 14 May 2020 15:21:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHjWiXRU=-vHECF5FMDNiW-CRADP6RMLBAoMJUgZczWDQ@mail.gmail.com>
Message-ID: <CAMj1kXHjWiXRU=-vHECF5FMDNiW-CRADP6RMLBAoMJUgZczWDQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the crypto tree
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Eric Biggers <ebiggers@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 12 May 2020 at 22:31, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 12, 2020 at 10:08 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > On Tue, May 12, 2020 at 06:08:01PM +0100, Mark Brown wrote:
> >
> > For later: if SHASH_DESC_ON_STACK is causing problems, we really ought to find a
> > better solution, since lots of users are using this macro.  A version of
> > crypto_shash_tfm_digest() that falls back to heap allocation if the descsize is
> > too large would be possible, but that wouldn't fully solve the problem since
> > some users do incremental hashing.
>
> It's hard to know how many of the users of SHASH_DESC_ON_STACK() are
> likely to cause problems, as multiple factors are involved:
>
> - this one triggered the warning because it was on the stack of a function
>   that got inlined into another that has other large variables. Whether it
>   got inlined makes little difference to the stack usage, but does make a
>   difference to warning about it.
>
> - generally the structure is larger than we like it, especially on architectures
>   with 128 byte CRYPTO_MINALIGN like ARM. This actually got worse
>   because of b68a7ec1e9a3 ("crypto: hash - Remove VLA usage"), as
>   the stack usage is now always the maximum of all hashes where it used
>   to be specific to the hash that was actually used and could be smaller
>
> - the specific instance in calculate_sha256() feels a bit silly, as this
>   function allocates a tfm and a descriptor, runs the digest and then
>   frees both again. I don't know how common this pattern is, but
>   it seems a higher-level abstraction might be helpful anyway.
>

We are trying to move to crypto library interfaces for non-performance
critical uses of hashes where the algorithm is known at compile time,
and this is a good example of that pattern.

IOW, this code should just call the sha256_init/update/final routines directly.

I'll send out a patch.
