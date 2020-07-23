Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8793322AA35
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 09:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgGWH6f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 03:58:35 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:34770 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgGWH6e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jul 2020 03:58:34 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jyW7a-00061b-QG; Thu, 23 Jul 2020 17:58:31 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Jul 2020 17:58:30 +1000
Date:   Thu, 23 Jul 2020 17:58:30 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Uros Bizjak <ubizjak@gmail.com>
Cc:     linux-crypto@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] crypto: x86 - Put back integer parts of
 include/asm/inst.h
Message-ID: <20200723075830.GI14246@gondor.apana.org.au>
References: <20200720135157.4332-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720135157.4332-1-ubizjak@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 20, 2020 at 03:51:57PM +0200, Uros Bizjak wrote:
> Resolves conflict with the tip tree.
> 
> CC: Herbert Xu <herbert@gondor.apana.org.au>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: "H. Peter Anvin" <hpa@zytor.com>
> CC: Stephen Rothwell <sfr@canb.auug.org.au>,
> CC: "Chang S. Bae" <chang.seok.bae@intel.com>,
> CC: Peter Zijlstra <peterz@infradead.org>,
> CC: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> ---
>  arch/x86/include/asm/inst.h | 148 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 arch/x86/include/asm/inst.h

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
