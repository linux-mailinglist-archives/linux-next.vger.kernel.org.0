Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D3C10061C
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 14:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfKRNFB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 08:05:01 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:53736 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbfKRNFB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 08:05:01 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1iWgi8-0001xO-Ni; Mon, 18 Nov 2019 21:04:56 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1iWgi5-0007tq-RZ; Mon, 18 Nov 2019 21:04:53 +0800
Date:   Mon, 18 Nov 2019 21:04:53 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the crypto tree
Message-ID: <20191118130453.zioloc2qg66i6zae@gondor.apana.org.au>
References: <20191116101954.33672f2d@canb.auug.org.au>
 <MN2PR20MB2973E1EAD50B58826FCEC763CA4D0@MN2PR20MB2973.namprd20.prod.outlook.com>
 <20191118191223.1b7c11a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118191223.1b7c11a9@canb.auug.org.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 18, 2019 at 07:12:23PM +1100, Stephen Rothwell wrote:
> 
> Unless Herbert wants to rebase the crypto tree (and I think this is not
> a good reason to do that), you should just consider this a learning
> experience. :-)

Right.  It just so happens that I screwed up one of the patches
applied prior to the one in question so I had to rebase the tree.
The problem should now be fixed.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
