Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531B92073B5
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 14:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389802AbgFXMus (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 08:50:48 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:48490 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388942AbgFXMur (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 08:50:47 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jo4rR-0002BH-5r; Wed, 24 Jun 2020 22:50:42 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 24 Jun 2020 22:50:41 +1000
Date:   Wed, 24 Jun 2020 22:50:41 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] lockdep: Move list.h inclusion into lockdep.h
Message-ID: <20200624125040.GA29281@gondor.apana.org.au>
References: <20200621131554.5a662afe@canb.auug.org.au>
 <20200623102655.6d16e610@canb.auug.org.au>
 <20200623121637.GA8444@alley>
 <20200623121937.GA9671@gondor.apana.org.au>
 <20200623142858.GB8444@alley>
 <20200624124212.GA17350@gondor.apana.org.au>
 <CAHp75Vez0fvWWATcX6ofFqREGa64NbAh0ftb=G4WtyvPUvG8VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vez0fvWWATcX6ofFqREGa64NbAh0ftb=G4WtyvPUvG8VQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 24, 2020 at 03:49:23PM +0300, Andy Shevchenko wrote:
>
> Does lockdep_types include types? Then we are fine and it is the way to go.

Yes it already does.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
