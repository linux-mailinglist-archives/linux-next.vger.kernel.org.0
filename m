Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D8E3CCD99
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 07:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbhGSFt1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 01:49:27 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:51444 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229906AbhGSFt1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jul 2021 01:49:27 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1m5M6e-0004bd-W8; Mon, 19 Jul 2021 13:46:21 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1m5M6a-0004OP-Po; Mon, 19 Jul 2021 13:46:16 +0800
Date:   Mon, 19 Jul 2021 13:46:16 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephan Mueller <smueller@chronox.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the crypto tree
Message-ID: <20210719054616.GA16860@gondor.apana.org.au>
References: <20210719081320.1d205c98@canb.auug.org.au>
 <6604f8be7a73f727cbfae7f93a74da706e46befc.camel@chronox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6604f8be7a73f727cbfae7f93a74da706e46befc.camel@chronox.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 19, 2021 at 07:43:29AM +0200, Stephan Mueller wrote:
>
> Herbert, how do we go about this fix? I can surely prepare another patch. But
> considering that the old patch is already in the git tree, are you considering
> to revert it?

I think we should keep this in mind for future submissions.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
