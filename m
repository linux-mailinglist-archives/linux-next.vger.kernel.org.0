Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B5E1CFF46
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 22:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgELUbs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 16:31:48 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44327 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgELUbr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2020 16:31:47 -0400
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mr9Jw-1imwKd1034-00oBq5; Tue, 12 May 2020 22:31:45 +0200
Received: by mail-qk1-f176.google.com with SMTP id b6so14003341qkh.11;
        Tue, 12 May 2020 13:31:44 -0700 (PDT)
X-Gm-Message-State: AGi0PuYyxWOJrZuTfJ0dn4e/8vq/2feu86nzh6vZHk/Ypi+il7F2e/U6
        dY81jpYiNcxCtVQ8feCcnRK71UGrj8SIyarvDgk=
X-Google-Smtp-Source: APiQypIKCdaOu3b8S6gkZ0qkFU4jDbgQtG+5bVY9dwPACknqdZumuyRrjNjyLTc7jX4YOm7JuUqqed4oej1b5IUnPE8=
X-Received: by 2002:a37:aa82:: with SMTP id t124mr21737354qke.3.1589315503943;
 Tue, 12 May 2020 13:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200512144949.4f933eca@canb.auug.org.au> <20200512162205.GI5110@sirena.org.uk>
 <20200512163632.GA916@sol.localdomain> <20200512170801.GK5110@sirena.org.uk> <20200512200805.GA175421@gmail.com>
In-Reply-To: <20200512200805.GA175421@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 12 May 2020 22:31:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2C-91vCNv8NV6ut8GDu2z9Yt6VwX+P2WggWnuCcMjcvg@mail.gmail.com>
Message-ID: <CAK8P3a2C-91vCNv8NV6ut8GDu2z9Yt6VwX+P2WggWnuCcMjcvg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the crypto tree
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Xo+MHz6hfyQZNbY1lyAhMEsaP9SY2L1bfFoJ4u+BE17weqcjyKP
 zVAB06kwTkaeHE+JMmUB1Gr9Z0AM/neUjR/rldED9X8b6mSGmDTqbiTUvCbe0x/BzT2ksgF
 fAfsBs1SdyU6WRx5xsw9YVtdHOQ0iSBQuAmy50gQeWCFvDZep59GOEac8qyWqxBFbLsTc6v
 YOMtmRpaCh1VW6rdf+Xtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Eb2/49Fu2C0=:g19ZN4RbD8yATAxsYw5hBr
 QP1xMoW0s6m2DjnFO8I9dx99StVIfwQoX/gkJYLnptW+D9xJa3rb5BUJoPjsbDlQKNrAuhnjo
 tLv9aQ7qgiOgFIx5d1zNaU6TsuKnsVOL6F6pAjSmmeLAlSOVoVhm/tv5k+uPov+RucznNeiTh
 dEIRymZjiUpwKH8ssbebTJvjkUdbJl7M0pdPoeNsyfPid+gT/Ol5R4+ZxOdlOEpPJHZ+5cLz1
 yQXgIUZ1FQj4tqAySjxe+jsU2kHiyKCz/byrL0Y3quGTOHFHYU2bTJYT/q665QbgqHR3nFA6x
 fAwsH2N/+xjmhTey13L4wp9p2M1zBsaeN71unY365T3EV2ojEyiH9hpFVGNngaDQMyMzo1hgD
 EzRjHjfooISHJLEypxRb+GReUNswuaRNznwrJCzvb9BkQg42UFHM1T1qLUDHzkG8J+rlyuqUw
 ukOxceIjudICcOg1TyeUOvaIjjegTNaL5tW2qdAB1IqK2V/F7/B1Ij5HurEcaC+p1w59MTxJn
 Z1FbqQ6gwmCK8PyktDGSdzKseEOu77EH1SgdepfL5CKVfjJXvwBDLv3YteV8temrsPgvHv6WQ
 D4EV05Xfb82eCICkRUNuPadUsi973mVffFsH9nzgbsOhvO8kRfU3UPGPAjoVNFgq5u2DORyuG
 /7cBLZ8EZBeADDgAs5i/1BuEWzdNkQO0L6EWGfyRCR5oLUYPb384V00wspjCJ9E4XQKSnNiEM
 TMF9WmuP9ELEqxBZc3mUj66qIwhE9vWTsO3SyZSBD6J5wteiVxsqO/bI9J75sD1OxvvOdV0ug
 4kpmi8NKxVKCy1DLFk1pG4EXuTmlRZXv8uNq563Boru7es4Qzg=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 12, 2020 at 10:08 PM Eric Biggers <ebiggers@kernel.org> wrote:
> On Tue, May 12, 2020 at 06:08:01PM +0100, Mark Brown wrote:
>
> For later: if SHASH_DESC_ON_STACK is causing problems, we really ought to find a
> better solution, since lots of users are using this macro.  A version of
> crypto_shash_tfm_digest() that falls back to heap allocation if the descsize is
> too large would be possible, but that wouldn't fully solve the problem since
> some users do incremental hashing.

It's hard to know how many of the users of SHASH_DESC_ON_STACK() are
likely to cause problems, as multiple factors are involved:

- this one triggered the warning because it was on the stack of a function
  that got inlined into another that has other large variables. Whether it
  got inlined makes little difference to the stack usage, but does make a
  difference to warning about it.

- generally the structure is larger than we like it, especially on architectures
  with 128 byte CRYPTO_MINALIGN like ARM. This actually got worse
  because of b68a7ec1e9a3 ("crypto: hash - Remove VLA usage"), as
  the stack usage is now always the maximum of all hashes where it used
  to be specific to the hash that was actually used and could be smaller

- the specific instance in calculate_sha256() feels a bit silly, as this
  function allocates a tfm and a descriptor, runs the digest and then
  frees both again. I don't know how common this pattern is, but
  it seems a higher-level abstraction might be helpful anyway.

      Arnd
