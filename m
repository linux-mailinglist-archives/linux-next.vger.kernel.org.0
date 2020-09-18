Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181B626F75D
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 09:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgIRHus (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 03:50:48 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:57714 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbgIRHus (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 03:50:48 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1kJBAC-0003vW-7h; Fri, 18 Sep 2020 17:50:37 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2020 17:50:36 +1000
Date:   Fri, 18 Sep 2020 17:50:36 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the crypto tree
Message-ID: <20200918075036.GA24315@gondor.apana.org.au>
References: <20200918152127.4414b524@canb.auug.org.au>
 <20200918054134.GA9252@gondor.apana.org.au>
 <20200918074911.GA987884@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918074911.GA987884@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 18, 2020 at 09:49:11AM +0200, Greg KH wrote:
>
> Ok, I'll go revert these.

Thanks!

> > As the driver has been converted over to the lib arc4 API, it
> > does not need to select CRYPTO at all.
> 
> Is it converted in your tree?  If so, have a branch/tag I can pull in to
> prevent merge issues in the future?

It's in the cryptodev tree, but unfortunately it's not in a
topic branch so you'd be pulling all other crypto changes along
with it.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
