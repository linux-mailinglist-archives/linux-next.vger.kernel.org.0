Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEDA8202827
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 05:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgFUD0W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Jun 2020 23:26:22 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:40062 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbgFUD0W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 20 Jun 2020 23:26:22 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jmqcQ-0001RA-Hn; Sun, 21 Jun 2020 13:26:07 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Sun, 21 Jun 2020 13:26:06 +1000
Date:   Sun, 21 Jun 2020 13:26:06 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200621032606.GA30110@gondor.apana.org.au>
References: <20200621131554.5a662afe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621131554.5a662afe@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jun 21, 2020 at 01:15:54PM +1000, Stephen Rothwell wrote:
>
> Caused by commit
> 
>   494c8512c90e ("printk: Make linux/printk.h self-contained")
> 
> changing include files is hadrer than it loooks :-(

That's because this patch depends on the lockdep_types patch which
is in the x86 tree.  Petr, this patch needs to go on top of the
lockdep_types patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
