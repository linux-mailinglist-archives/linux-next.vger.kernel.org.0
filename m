Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E25826F5C8
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 08:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIRGKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 02:10:53 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:57360 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbgIRGKx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 02:10:53 -0400
X-Greylist: delayed 1746 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 02:10:52 EDT
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1kJ99K-0001jz-Sz; Fri, 18 Sep 2020 15:41:36 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2020 15:41:34 +1000
Date:   Fri, 18 Sep 2020 15:41:34 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the crypto tree
Message-ID: <20200918054134.GA9252@gondor.apana.org.au>
References: <20200918152127.4414b524@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918152127.4414b524@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 18, 2020 at 03:21:27PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/rtl8192e/Kconfig
> 
> between commit:
> 
>   054694a46d64 ("staging/rtl8192e: switch to RC4 library interface")
> 
> from the crypto tree and commits:
> 
>   243d040a6e4a ("staging: rtl8192e: fix kconfig dependency warning for RTLLIB_CRYPTO_TKIP")
>   02c4260713d6 ("staging: rtl8192e: fix kconfig dependency warning for RTLLIB_CRYPTO_WEP")
> 
> from the staging tree.

Those two commits should just be dropped.
 
> diff --cc drivers/staging/rtl8192e/Kconfig
> index 4c440bdaaf6e,31e076cc6f16..000000000000
> --- a/drivers/staging/rtl8192e/Kconfig
> +++ b/drivers/staging/rtl8192e/Kconfig
> @@@ -25,7 -26,8 +26,8 @@@ config RTLLIB_CRYPTO_CCM
>   config RTLLIB_CRYPTO_TKIP
>   	tristate "Support for rtllib TKIP crypto"
>   	depends on RTLLIB
> + 	select CRYPTO
>  -	select CRYPTO_ARC4
>  +	select CRYPTO_LIB_ARC4

As the driver has been converted over to the lib arc4 API, it
does not need to select CRYPTO at all.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
