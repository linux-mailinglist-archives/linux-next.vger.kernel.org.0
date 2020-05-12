Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE3A1CFEFA
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 22:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbgELUIH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 16:08:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgELUIH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 16:08:07 -0400
Received: from gmail.com (unknown [104.132.1.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9B8620753;
        Tue, 12 May 2020 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589314086;
        bh=WIxjCGmDxQ1SCu6wVosqqN4J8w/cmTxtmOB9BUVBcds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f/DDtkxBZCej+Nx2mjFkfYDYUJTVGkFshMcR7tqW33KwzWIz0t7zxHR+ea32Ey6J0
         /iFiQYhb2aMSOdYmyUYYoAodi2SjUheEhkdBu6yi87tKZNQlqReI7UghQksf3KTrMa
         8gQh9JxpMBDKP3R3EXYb0NGRPWXmoTupR1yj1+Io=
Date:   Tue, 12 May 2020 13:08:05 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Mark Brown <broonie@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the crypto
 tree
Message-ID: <20200512200805.GA175421@gmail.com>
References: <20200512144949.4f933eca@canb.auug.org.au>
 <20200512162205.GI5110@sirena.org.uk>
 <20200512163632.GA916@sol.localdomain>
 <20200512170801.GK5110@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512170801.GK5110@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 12, 2020 at 06:08:01PM +0100, Mark Brown wrote:
> On Tue, May 12, 2020 at 09:36:32AM -0700, Eric Biggers wrote:
> > On Tue, May 12, 2020 at 05:22:05PM +0100, Mark Brown wrote:
> 
> > > > from the crypto tree and commit:
> 
> > > >   a1304cba816e ("ASoC: cros_ec_codec: allocate shash_desc dynamically")
> 
> > > > from the sound-asoc tree.
> 
> > I Cc'ed it to the people listed in MAINTAINERS for "CHROMEOS EC CODEC DRIVER".
> > I guess wasn't enough and I should have added alsa-devel@alsa-project.org too?
> 
> Yeah, you generally need to make sure the subsystem maintainers are
> included as well as individual driver maintainers.
> 
> > > That doesn't seem ideal - Eric, Herbert can we get a branch with the
> > > crypto patches in them to pull into the ASoC tree or something?
> 
> > We should just drop one of the patches.
> 
> > If you just want to eliminate the compiler warning about stack usage in
> > wov_hotword_model_put(), then my patch in cryptodev would be better, as it moves
> > the stack allocation into another function in another file.
> 
> > Alternatively, if you actually need to reduce the total stack usage (across all
> > functions), then the kmalloc() patch in sound-asoc would be better.
> 
> Well, reducing the stack usage overall seems nicer overall - heads off
> future problems if the struct grows or something, and if we still end up
> allocating just as much on the stack then we'll have trouble at runtime
> anyway - does that make sense?

If you're concerned about total stack usage, then my recommendation is that
Herbert drops my patch "ASoC: cros_ec_codec: use crypto_shash_tfm_digest()"
from cryptodev, and you keep the patch
"ASoC: cros_ec_codec: allocate shash_desc dynamically" in sound-asoc.

For later: if SHASH_DESC_ON_STACK is causing problems, we really ought to find a
better solution, since lots of users are using this macro.  A version of
crypto_shash_tfm_digest() that falls back to heap allocation if the descsize is
too large would be possible, but that wouldn't fully solve the problem since
some users do incremental hashing.

- Eric
