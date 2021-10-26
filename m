Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C498143AB58
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 06:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhJZEku (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 00:40:50 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:56326 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230414AbhJZEks (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 00:40:48 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1mfEE6-00008Q-4e; Tue, 26 Oct 2021 12:38:18 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1mfEE3-0004dn-AT; Tue, 26 Oct 2021 12:38:15 +0800
Date:   Tue, 26 Oct 2021 12:38:15 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] crypto: api - Export crypto_boot_test_finished
Message-ID: <20211026043815.GA17728@gondor.apana.org.au>
References: <20210927143229.543749f4@canb.auug.org.au>
 <20210927112341.GA22483@gondor.apana.org.au>
 <20210928151621.7aec3f34@canb.auug.org.au>
 <87sfwpbotz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfwpbotz.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 25, 2021 at 05:28:24PM +1100, Michael Ellerman wrote:
>
> It fixes the build, but modules_install still fails:
> 
>   $ git checkout adad556efcdd42a1d9e060cbe5f6161cccf1fa28
>   HEAD is now at adad556efcdd crypto: api - Fix built-in testing dependency failures

Sorry, the fix is in the queue:

https://patchwork.kernel.org/project/linux-crypto/patch/20211019132802.GA14233@gondor.apana.org.au/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
