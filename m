Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185E526F7AA
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 10:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgIRIFG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 04:05:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58293 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726040AbgIRIFG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 04:05:06 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 076895C03CF;
        Fri, 18 Sep 2020 04:05:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 18 Sep 2020 04:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=GYZrs3ZrnzLZ5pRK1bLyJotKq+S
        TI0/t/EY5xE4WRI0=; b=CncC44iR8csm2o/5cF2nSi4wSvdeiAtskjhZTnD4cPC
        CVYTw3kfzpyhTzh8bs5pIkotvDFeGGL0p8aL0DL9d74MM1nYEHWkNgRMO19z4dS7
        ncgR2ZOB5juHNzIioeeNECcRDj1G/xRXbtVrZeMDJKCo0XDAhyaZWdjxM8ipAUk5
        lRTYk/a7WSqC8WVlyvvGMUcgCyXeyz/CkdB7l4F0tNXNfSM68nCFCHHYRgoFhso2
        +UtuXefNJwRTtaigg/XMqwY6OQhHIokxAoJ/C25cfG5GNEBZWiRYc6YNf4O1/DFg
        ukTm9bMTNTL/bG7hwLM6XFzsci/z08DmSHhZ/yvEvgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GYZrs3
        ZrnzLZ5pRK1bLyJotKq+STI0/t/EY5xE4WRI0=; b=LVa8wL8lpLAlo2fG3KcYNM
        kpUdMYVhWQOlzhiUriJIjGd70OvvgqwRzHyKjkNI8W5W6dCDuiL7T1ejvJYQ3jgG
        o2trMFaigAIsHxodB5V8J9iCfPIwJaodyCEurFxbcjeZ1OCGMv+Y16Rn3yEyilco
        9xTOsW5RNWHlkp5qfL3jRXzu1WIuwmnQG3rGQVRvxeP8PxwPkPKm5SAWiPlxdhXW
        UYWqDsnp+pm4a8CeLj+uh5bEgV7flt8LLKHkC8fjEGIWVCHAxD3vGu4bDBnh27rV
        L8XF5Aw4LzuNydWvzBeJkkiEXbydcC3HQ/RoTYV41k/XRlKs2Odnd4AvXvbKLspg
        ==
X-ME-Sender: <xms:L2pkX8NaK5n8hhRuiA3bMmCKnfLc5YP3yOhpi8tFQSGRx9i-jBHo3A>
    <xme:L2pkXy_zuji6ox12DoyXpeo3lkNNkC7NeUaJJWrZdpqoyNMiHcT3F99Wc_LXDnvH_
    FEYb23_Stk5Xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeiucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceo
    ghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehjefgfffgie
    dvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeefrdekiedr
    jeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:L2pkXzQdygY5LydTXlT0ZBOR95KsYIhObNa_vxRPq2yLbwSt2s0q1A>
    <xmx:L2pkX0uTHsMiUz4dk8burSC_r9W_4ory4buJdltI9988Dr6xJhVFSA>
    <xmx:L2pkX0fdwZuGN_bqg67YxHWM4-FOLpaptty3890DKYEgVDtlCGYdRQ>
    <xmx:MWpkXz5GzB90YAH0l9W0_XO1rGvYDSZu3CkLlGGxF09Sa_2urALlWg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 49E9C3064685;
        Fri, 18 Sep 2020 04:05:03 -0400 (EDT)
Date:   Fri, 18 Sep 2020 10:05:33 +0200
From:   Greg KH <greg@kroah.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the crypto tree
Message-ID: <20200918080533.GA994032@kroah.com>
References: <20200918152127.4414b524@canb.auug.org.au>
 <20200918054134.GA9252@gondor.apana.org.au>
 <20200918074911.GA987884@kroah.com>
 <20200918075036.GA24315@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918075036.GA24315@gondor.apana.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 18, 2020 at 05:50:36PM +1000, Herbert Xu wrote:
> On Fri, Sep 18, 2020 at 09:49:11AM +0200, Greg KH wrote:
> >
> > Ok, I'll go revert these.
> 
> Thanks!
> 
> > > As the driver has been converted over to the lib arc4 API, it
> > > does not need to select CRYPTO at all.
> > 
> > Is it converted in your tree?  If so, have a branch/tag I can pull in to
> > prevent merge issues in the future?
> 
> It's in the cryptodev tree, but unfortunately it's not in a
> topic branch so you'd be pulling all other crypto changes along
> with it.

Ok, no worries, I'll just revert the above commits and all should be
good.

thanks,

greg k-h
