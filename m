Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAEB7B45C9
	for <lists+linux-next@lfdr.de>; Sun,  1 Oct 2023 09:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbjJAHbE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Oct 2023 03:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234371AbjJAHbE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 1 Oct 2023 03:31:04 -0400
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43240BF;
        Sun,  1 Oct 2023 00:31:00 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qmquc-002Oe8-EW; Sun, 01 Oct 2023 15:30:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 01 Oct 2023 15:30:50 +0800
Date:   Sun, 1 Oct 2023 15:30:50 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Sabrina Dubroca <sd@queasysnail.net>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>
Subject: Re: arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined
 reference to `crypto_has_aead'
Message-ID: <ZRkgKnpgW0tfZgTc@gondor.apana.org.au>
References: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
 <ZRbPBdu0ZJ86juff@hog>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRbPBdu0ZJ86juff@hog>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 29, 2023 at 03:20:05PM +0200, Sabrina Dubroca wrote:
>
> I guess the problem is that CONFIG_XFRM_ALGO doesn't select
> CONFIG_CRYPTO_AEAD (or _AEAD2?), just CRYPTO_HASH and CRYPTO_SKCIPHER.
> 
> Herbert, does that seem reasonable?

Sorry Sabrina, this patch is already in my queue but I forgot to
push it out.  I'll get onto it now.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
