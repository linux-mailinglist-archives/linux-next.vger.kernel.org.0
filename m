Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0E7203816
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 15:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgFVNd2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 09:33:28 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:43638 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728901AbgFVNd2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Jun 2020 09:33:28 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jnMZg-0000Iu-Gy; Mon, 22 Jun 2020 23:33:25 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Mon, 22 Jun 2020 23:33:24 +1000
Date:   Mon, 22 Jun 2020 23:33:24 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     linux-crypto@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [next-20200621] LTP tests af_alg02/05 failure on POWER9 PowerVM
 LPAR
Message-ID: <20200622133324.GA4025@gondor.apana.org.au>
References: <DF21C7B5-3824-4A6E-B59C-78B67E247383@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF21C7B5-3824-4A6E-B59C-78B67E247383@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 22, 2020 at 05:55:29PM +0530, Sachin Sant wrote:
> With recent next(next-20200621) af_alg02/05 tests fail while running on POWER9
> PowerVM LPAR.
> 
> Results from  5.8.0-rc1-next-20200622
> # ./af_alg02
> tst_test.c:1096: INFO: Timeout per run is 0h 00m 20s
> af_alg02.c:52: BROK: Timed out while reading from request socket.
> #
> 
> 5.8.0-rc1-next-20200618 was good. The test case ran fine.
> 
> Root cause analysis point to following commit:
> 
> commit f3c802a1f30013f8f723b62d7fa49eb9e991da23
>     crypto: algif_aead - Only wake up when ctx->more is zero
> 
> Reverting this commit allows the test to PASS.

Yes that commit does change the behaviour if you don't terminate
your AEAD request by clearing the MSG_MORE flag.  AEAD does not
support chaining so each request must be sent in full before it
can be processed through recvmsg(2).  Setting the MSG_MORE flag
indicates that your request has not been sent in full.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
