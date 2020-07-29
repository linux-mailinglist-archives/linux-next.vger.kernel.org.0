Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C47231DA5
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 13:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2LsT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 07:48:19 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:59876 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgG2LsS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 07:48:18 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k0kYv-0008QF-EN; Wed, 29 Jul 2020 21:47:58 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 29 Jul 2020 21:47:57 +1000
Date:   Wed, 29 Jul 2020 21:47:57 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200729114757.GA19388@gondor.apana.org.au>
References: <20200729210311.425d0e9b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729210311.425d0e9b@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 09:03:11PM +1000, Stephen Rothwell wrote:
> 
> After merging the printk tree, today's linux-next build (powerpc
> allyesconfig) failed like this:

Hi Stephen:

This loop was introduced recently by the powerpc tree with

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=aa65ff6b18e0366db1790609956a4ac7308c5668

powerpc/64s: Implement queued spinlocks and rwlocks

However the loop itself goes back further and in fact someone has
already tried to work around it by adding ifdefs on CONFIG_PARAVIRT
in asm-generic/qspinlock_types.h.  I'll try to fix this properly.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
