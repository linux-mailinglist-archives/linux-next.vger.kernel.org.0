Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1941930C
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 13:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhI0LZW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 07:25:22 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:55638 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233959AbhI0LZV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Sep 2021 07:25:21 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1mUojW-0004A4-Pj; Mon, 27 Sep 2021 19:23:42 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1mUojW-0005r0-3W; Mon, 27 Sep 2021 19:23:42 +0800
Date:   Mon, 27 Sep 2021 19:23:42 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH] crypto: api - Export crypto_boot_test_finished
Message-ID: <20210927112341.GA22483@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927143229.543749f4@canb.auug.org.au>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
Organization: Core
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> [-- text/plain, encoding quoted-printable, charset: US-ASCII, 18 lines --]
> 
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> ERROR: modpost: "crypto_boot_test_finished" [crypto/crypto_algapi.ko] undefined!
> 
> Caused by commit
> 
>  adad556efcdd ("crypto: api - Fix built-in testing dependency failures")
> 
> I have reverted that commit for today.

Oops, does this patch fix the problem?

---8<---
We need to export crypto_boot_test_finished in case api.c is
built-in while algapi.c is built as a module.

Fixes: adad556efcdd ("crypto: api - Fix built-in testing dependency failures")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/api.c b/crypto/api.c
index 1cf1f03347cc..ee5991fe11f8 100644
--- a/crypto/api.c
+++ b/crypto/api.c
@@ -32,6 +32,7 @@ BLOCKING_NOTIFIER_HEAD(crypto_chain);
 EXPORT_SYMBOL_GPL(crypto_chain);
 
 DEFINE_STATIC_KEY_FALSE(crypto_boot_test_finished);
+EXPORT_SYMBOL_GPL(crypto_boot_test_finished);
 
 static struct crypto_alg *crypto_larval_wait(struct crypto_alg *alg);
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
