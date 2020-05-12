Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBB71CFAD4
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 18:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgELQge (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 12:36:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgELQge (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 12:36:34 -0400
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B03C206CC;
        Tue, 12 May 2020 16:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589301393;
        bh=91nyVE8ReRAiTTKEOFm9HnxmsFsnbrrzeLeNSCnCH8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IUJYxFgzVQMqKDBkD7MDLV8ejclwyguVwqo4hIrkfXRRwh44UVV3rKXV3o/Bahe7a
         2wQpnvD0MzW4TqvJQpkoQrqjnCB0FeaL0sYW5RoRnp/aNzvcvvneUKvFAK9J1mY4nA
         k2V3WGe1AoGhCSS4USPxyyq+7ORETR9s2+Of8a10=
Date:   Tue, 12 May 2020 09:36:32 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the crypto
 tree
Message-ID: <20200512163632.GA916@sol.localdomain>
References: <20200512144949.4f933eca@canb.auug.org.au>
 <20200512162205.GI5110@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512162205.GI5110@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 12, 2020 at 05:22:05PM +0100, Mark Brown wrote:
> On Tue, May 12, 2020 at 02:49:49PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the sound-asoc tree got a conflict in:
> > 
> >   sound/soc/codecs/cros_ec_codec.c
> > 
> > between commit:
> > 
> >   85fc78b80f15 ("ASoC: cros_ec_codec: use crypto_shash_tfm_digest()")
> > 
> 
> Oh, this is the first I've heard of that patch :(
> 
> > from the crypto tree and commit:
> 
> >   a1304cba816e ("ASoC: cros_ec_codec: allocate shash_desc dynamically")
> 
> > from the sound-asoc tree.

I Cc'ed it to the people listed in MAINTAINERS for "CHROMEOS EC CODEC DRIVER".
I guess wasn't enough and I should have added alsa-devel@alsa-project.org too?

> 
> > I fixed it up (I just used the former) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> 
> That doesn't seem ideal - Eric, Herbert can we get a branch with the
> crypto patches in them to pull into the ASoC tree or something?

We should just drop one of the patches.

If you just want to eliminate the compiler warning about stack usage in
wov_hotword_model_put(), then my patch in cryptodev would be better, as it moves
the stack allocation into another function in another file.

Alternatively, if you actually need to reduce the total stack usage (across all
functions), then the kmalloc() patch in sound-asoc would be better.

Which do you prefer?

- Eric
