Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DCA1D052C
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 04:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgEMCxB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 22:53:01 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:45694 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMCxA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 22:53:00 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1jYhVk-0007aX-Bt; Wed, 13 May 2020 12:52:45 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 13 May 2020 12:52:44 +1000
Date:   Wed, 13 May 2020 12:52:44 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the crypto
 tree
Message-ID: <20200513025244.GA14328@gondor.apana.org.au>
References: <20200512144949.4f933eca@canb.auug.org.au>
 <20200512162205.GI5110@sirena.org.uk>
 <20200512163632.GA916@sol.localdomain>
 <20200512170801.GK5110@sirena.org.uk>
 <20200512200805.GA175421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512200805.GA175421@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 12, 2020 at 01:08:05PM -0700, Eric Biggers wrote:
>
> If you're concerned about total stack usage, then my recommendation is that
> Herbert drops my patch "ASoC: cros_ec_codec: use crypto_shash_tfm_digest()"
> from cryptodev, and you keep the patch
> "ASoC: cros_ec_codec: allocate shash_desc dynamically" in sound-asoc.

OK I'll drop this patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
