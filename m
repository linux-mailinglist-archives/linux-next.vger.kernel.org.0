Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5149C308635
	for <lists+linux-next@lfdr.de>; Fri, 29 Jan 2021 08:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhA2HFz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Jan 2021 02:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhA2HFw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2021 02:05:52 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E19C061573;
        Thu, 28 Jan 2021 23:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=GlH3x83KNd6bGiBeIIa+b8g26rMegA1+emYY6KXmkjA=; b=Gs0pRHF6QxNBf+BvuOtwoweAWI
        eZkW1ipxH4x/BMhgTys2SIwbX0oF7ilkRUSUgAKqb98hYH41VylhFgSWWKebVJjlkxuBw4Ja7eWkW
        ORM4i8jVXVKdK3S0Vl9cCdJmC0vISTRKk7qQ86gHaUVzASQaCnoVdk3fTg33QsYXmR8fIMDz/lnIU
        i0tb1YS2QL7QBZK5k/BPaCMjnleyWsKxCohFtXoKPv8dqO+9N/XoLRhMWQ/LNie7mwLZdYwR/n7tI
        Jwvt1JbeVc9pWegPbTPrWcSR1y5QyBwk4h7x6ODnvS41S0ovplEcbyB51m9fDK57QhFLgCrlA8xoj
        3QvcWHlg==;
Received: from [2601:1c0:6280:3f0::7650]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l5Nq6-0007vp-C5; Fri, 29 Jan 2021 07:05:06 +0000
Subject: Re: [PATCH] crypto: octeontx2 - Add dependency on NET_VENDOR_MARVELL
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Srujana Challa <schalla@marvell.com>,
        kernel test robot <lkp@intel.com>
References: <b1397a30-0018-ac78-2a89-4fc0db1d1ec8@infradead.org>
 <20210129054856.GA20020@gondor.apana.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eadfb919-ee53-2e4c-3134-62d6c53e1695@infradead.org>
Date:   Thu, 28 Jan 2021 23:04:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210129054856.GA20020@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/28/21 9:48 PM, Herbert Xu wrote:
> On Mon, Jan 25, 2021 at 09:41:12AM -0800, Randy Dunlap wrote:
>> on x86_64:
>>
>> ld: drivers/crypto/marvell/octeontx2/otx2_cptpf_main.o: in function `cptpf_flr_wq_handler':
>> otx2_cptpf_main.c:(.text+0x2b): undefined reference to `otx2_mbox_alloc_msg_rsp'
> 
> Thanks for the report.  The issue is that the crypto driver depends
> on code that sits under net so if that option is off then you'll end
> up with these errors.
> 
> ---8<---
> The crypto octeontx2 driver depends on the mbox code in the network
> tree.  It tries to select the MBOX Kconfig option but that option
> itself depends on many other options which are not selected, e.g.,
> CONFIG_NET_VENDOR_MARVELL.  It would be inappropriate to select them
> all as randomly prompting the user for network options which would
> oterhwise be disabled just because a crypto driver has been enabled
> makes no sense.
> 
> This patch fixes this by adding a dependency on NET_VENDOR_MARVELL.
> This makes the crypto driver invisible if the network option is off.
> 
> If the crypto driver must be visible even without the network stack
> then the shared mbox code should be moved out of drivers/net.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 5e8ce8334734 ("crypto: marvell - add Marvell OcteonTX2 CPT...")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks, Herbert.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> diff --git a/drivers/crypto/marvell/Kconfig b/drivers/crypto/marvell/Kconfig
> index 2efbd79180ce..a188ad1fadd3 100644
> --- a/drivers/crypto/marvell/Kconfig
> +++ b/drivers/crypto/marvell/Kconfig
> @@ -41,6 +41,7 @@ config CRYPTO_DEV_OCTEONTX2_CPT
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PCI_MSI && 64BIT
>  	depends on CRYPTO_LIB_AES
> +	depends on NET_VENDOR_MARVELL
>  	select OCTEONTX2_MBOX
>  	select CRYPTO_DEV_MARVELL
>  	select CRYPTO_SKCIPHER
> 


-- 
~Randy

