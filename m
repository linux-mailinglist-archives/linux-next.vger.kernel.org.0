Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D405F1005E3
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 13:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfKRMtx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 07:49:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:42388 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbfKRMtx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 07:49:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A049DAC6F;
        Mon, 18 Nov 2019 12:49:51 +0000 (UTC)
Date:   Mon, 18 Nov 2019 13:49:49 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Samuel Neves <sneves@dei.uc.pt>,
        Ard Biesheuvel <ardb@kernel.org>, Jiri Slaby <jslaby@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191118124949.GA8028@zn.tnic>
References: <20191118141110.7f971194@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191118141110.7f971194@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 18, 2019 at 02:11:10PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> arch/x86/crypto/blake2s-core.S: Assembler messages:
> arch/x86/crypto/blake2s-core.S:50: Error: invalid character '(' in mnemonic
> arch/x86/crypto/blake2s-core.S:176: Error: invalid character '(' in mnemonic
> arch/x86/crypto/blake2s-core.S:180: Error: invalid character '(' in mnemonic
> arch/x86/crypto/blake2s-core.S:257: Error: invalid character '(' in mnemonic
> 
> Caused by commit
> 
>   ed0356eda153 ("crypto: blake2s - x86_64 SIMD implementation")
> 
> from the crypto tree interacting with commit
> 
>   6dcc5627f6ae ("x86/asm: Change all ENTRY+ENDPROC to SYM_FUNC_*")
> 
> from the tip tree.
> 
> I have applied the following merge fix patch.

Thanks.

I need to remember to point Linus to it when I send the pull request
next week so that he's aware and can apply your patch when merging the
crypto tree.

Lemme CC him now too, as an FYI.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Nov 2019 14:00:40 +1100
> Subject: [PATCH] fix up for "x86/asm: Change all ENTRY+ENDPROC to SYM_FUNC_*"

<--- add a commit message blurb here pls.

> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/crypto/blake2s-core.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/crypto/blake2s-core.S b/arch/x86/crypto/blake2s-core.S
> index 8591938eee26..24910b766bdd 100644
> --- a/arch/x86/crypto/blake2s-core.S
> +++ b/arch/x86/crypto/blake2s-core.S
> @@ -47,7 +47,7 @@ SIGMA2:
>  
>  .text
>  #ifdef CONFIG_AS_SSSE3
> -ENTRY(blake2s_compress_ssse3)
> +SYM_FUNC_START(blake2s_compress_ssse3)
>  	testq		%rdx,%rdx
>  	je		.Lendofloop
>  	movdqu		(%rdi),%xmm0
> @@ -173,11 +173,11 @@ ENTRY(blake2s_compress_ssse3)
>  	movdqu		%xmm14,0x20(%rdi)
>  .Lendofloop:
>  	ret
> -ENDPROC(blake2s_compress_ssse3)
> +SYM_FUNC_END(blake2s_compress_ssse3)
>  #endif /* CONFIG_AS_SSSE3 */
>  
>  #ifdef CONFIG_AS_AVX512
> -ENTRY(blake2s_compress_avx512)
> +SYM_FUNC_START(blake2s_compress_avx512)
>  	vmovdqu		(%rdi),%xmm0
>  	vmovdqu		0x10(%rdi),%xmm1
>  	vmovdqu		0x20(%rdi),%xmm4
> @@ -254,5 +254,5 @@ ENTRY(blake2s_compress_avx512)
>  	vmovdqu		%xmm4,0x20(%rdi)
>  	vzeroupper
>  	retq
> -ENDPROC(blake2s_compress_avx512)
> +SYM_FUNC_END(blake2s_compress_avx512)
>  #endif /* CONFIG_AS_AVX512 */
> -- 
> 2.23.0
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
