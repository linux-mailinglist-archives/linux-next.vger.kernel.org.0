Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF098598C
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 07:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfHHFAI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 01:00:08 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:58726 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfHHFAI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 01:00:08 -0400
Received: from gondolin.me.apana.org.au ([192.168.0.6] helo=gondolin.hengli.com.au)
        by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hvaWz-0002b7-Ul; Thu, 08 Aug 2019 15:00:06 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hvaWy-0004V2-Jr; Thu, 08 Aug 2019 15:00:04 +1000
Date:   Thu, 8 Aug 2019 15:00:04 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <20190808050004.GA17267@gondor.apana.org.au>
References: <20190805145736.2d39f95b@canb.auug.org.au>
 <20190808115245.0c88c300@canb.auug.org.au>
 <20190808030156.GA15782@gondor.apana.org.au>
 <20190808131710.7186de0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808131710.7186de0c@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 08, 2019 at 01:17:10PM +1000, Stephen Rothwell wrote:
>
> Excellent, thanks.  Should I add the crypto mailing list as a contact
> for problems?  Mostly the emails are just reporting conflicts and only
> very occasionally do I actually send a useful patch.  If so, what is
> its address?

Yes please.  The address is

	linux-crypto@vger.kernel.org

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
