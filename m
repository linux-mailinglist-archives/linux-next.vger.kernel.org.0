Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D196B207393
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 14:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389633AbgFXMmn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 08:42:43 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:48474 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389197AbgFXMmn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 08:42:43 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jo4jE-0001yO-Ix; Wed, 24 Jun 2020 22:42:13 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 24 Jun 2020 22:42:12 +1000
Date:   Wed, 24 Jun 2020 22:42:12 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] lockdep: Move list.h inclusion into lockdep.h
Message-ID: <20200624124212.GA17350@gondor.apana.org.au>
References: <20200621131554.5a662afe@canb.auug.org.au>
 <20200623102655.6d16e610@canb.auug.org.au>
 <20200623121637.GA8444@alley>
 <20200623121937.GA9671@gondor.apana.org.au>
 <20200623142858.GB8444@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623142858.GB8444@alley>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 23, 2020 at 04:28:58PM +0200, Petr Mladek wrote:
>
> My "allmodconfig" build has successfully finished with the following extra
>  fix on top of the two patches:
> 
> diff --git a/include/linux/list.h b/include/linux/list.h
> index aff44d34f4e4..6d606c4036ce 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -6,7 +6,7 @@
>  #include <linux/stddef.h>
>  #include <linux/poison.h>
>  #include <linux/const.h>
> -#include <linux/kernel.h>
> +#include <linux/compiler.h>

Unfortunately this doesn't work because list.h actually does need
kernel.h for container_of.

However, we can easily fix the loop another way by removing list.h
from lockdep.h as it doesn't actually use any list macros/functions
but only the list type which is now in linux/types.h.

We could either fold this into the lockdep_types patch, or fold it
into the printk patch, or just leave it as a standalone patch.
What do you guys think?

---8<---
Currently lockdep_types.h includes list.h without actually using any
of its macros or functions.  All it needs are the type definitions
which were moved into types.h long ago.  This potentially causes
inclusion loops because both are included by many core header
files.

This patch moves the list.h inclusion into lockdep.h.  Note that
we could probably remove it completely but that could potentially
result in compile failures should any end users not include list.h
directly and also be unlucky enough to not get list.h via some other
header file.

Reported-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 3b73cf84f77d..b1ad5c045353 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -21,6 +21,7 @@ extern int lock_stat;
 #ifdef CONFIG_LOCKDEP
 
 #include <linux/linkage.h>
+#include <linux/list.h>
 #include <linux/debug_locks.h>
 #include <linux/stacktrace.h>
 
diff --git a/include/linux/lockdep_types.h b/include/linux/lockdep_types.h
index 7b9350624577..bb35b449f533 100644
--- a/include/linux/lockdep_types.h
+++ b/include/linux/lockdep_types.h
@@ -32,8 +32,6 @@ enum lockdep_wait_type {
 
 #ifdef CONFIG_LOCKDEP
 
-#include <linux/list.h>
-
 /*
  * We'd rather not expose kernel/lockdep_states.h this wide, but we do need
  * the total number of states... :-(
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
