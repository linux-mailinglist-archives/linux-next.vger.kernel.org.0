Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 812C48585D
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 05:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389645AbfHHDCB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 23:02:01 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:58116 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389632AbfHHDCA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 23:02:00 -0400
Received: from gondolin.me.apana.org.au ([192.168.0.6] helo=gondolin.hengli.com.au)
        by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hvYgg-0001B1-8I; Thu, 08 Aug 2019 13:01:58 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hvYgf-0004H8-DD; Thu, 08 Aug 2019 13:01:57 +1000
Date:   Thu, 8 Aug 2019 13:01:57 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <20190808030156.GA15782@gondor.apana.org.au>
References: <20190805145736.2d39f95b@canb.auug.org.au>
 <20190808115245.0c88c300@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808115245.0c88c300@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 08, 2019 at 11:52:45AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 5 Aug 2019 14:57:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the crypto tree, today's linux-next build (sparc64
> > defconfig) failed like this:
> > 
> > drivers/char/hw_random/n2-drv.c: In function 'n2rng_probe':
> > drivers/char/hw_random/n2-drv.c:771:29: error: 'pdev' undeclared (first use in this function); did you mean 'cdev'?
> >   err = devm_hwrng_register(&pdev->dev, &np->hwrng);
> >                              ^~~~
> >                              cdev
> > drivers/char/hw_random/n2-drv.c:771:29: note: each undeclared identifier is reported only once for each function it appears in
> > 
> > Caused by commit
> > 
> >   3e75241be808 ("hwrng: drivers - Use device-managed registration API")
> > 
> > I applied the following patch for today:
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 5 Aug 2019 14:49:59 +1000
> > Subject: [PATCH] hwrng: fix typo in n2-drv.c
> > 
> > Fixes: 3e75241be808 ("hwrng: drivers - Use device-managed registration API")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/char/hw_random/n2-drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-drv.c
> > index 2d256b3470db..73e408146420 100644
> > --- a/drivers/char/hw_random/n2-drv.c
> > +++ b/drivers/char/hw_random/n2-drv.c
> > @@ -768,7 +768,7 @@ static int n2rng_probe(struct platform_device *op)
> >  	np->hwrng.data_read = n2rng_data_read;
> >  	np->hwrng.priv = (unsigned long) np;
> >  
> > -	err = devm_hwrng_register(&pdev->dev, &np->hwrng);
> > +	err = devm_hwrng_register(&op->dev, &np->hwrng);
> >  	if (err)
> >  		goto out_hvapi_unregister;
> >  
> > -- 
> > 2.20.1
> 
> I am still applying that patch ...

Sorry, I forgot about your patch as it wasn't cced to the crypto
mailing list.  It should be out there now.

I've also added a compile test for this driver so at least it should
fail for me on x86 too.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
