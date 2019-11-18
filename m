Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AAD1001AD
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 10:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfKRJtq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 04:49:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34313 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfKRJtq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 04:49:46 -0500
Received: by mail-wr1-f68.google.com with SMTP id e6so18631389wrw.1;
        Mon, 18 Nov 2019 01:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=t9rW3xazlhVCaoGmTPjVJwPHQBKcd3ozdYqgzIwnr/8=;
        b=DCN1ocCVTucIGj7KNmA2jUUfOU1x+6+1OewOqvAlVaP/zCB/ceRh5LVZoWlr7SB3mB
         kQeKosxVk+pggXUDU0hNnRrjlPrkQMwoqLhjOfJlvETQG865wBV2v6FUJudcK+vbi4bf
         VS5Y1rHolM2B3pLEPZ7X/rwcx4bXO3GusFLdBl53La1rucJdiajDvoht6cN6AbC3k/z+
         CbkGA9vcjMeMMFC3NlyptWDn9CJ1iA3nuquiU22y5OgjeAvmHDITSUp4KP7pzQdJRLfG
         IlzxxBDWKkAeD6aOqJt2GQRETQYQnlXt0s/L/jVGbEZb1WpZUKym9EsxniTgcTL4bpI8
         /XXA==
X-Gm-Message-State: APjAAAWKIr+rNivbjw/mQ5p2WaQ1wWkDFEnM9MmLmQcFGElISj9oQNPH
        2BaiauCeVGc8Oyj0kveI6fo=
X-Google-Smtp-Source: APXvYqzZwdF7H+g/R9MVcbwaNmBPQesu+OjiQ1yhCJs+I7NnfCqwpleeYzJzDkvNeRvUnnxjzkPSyg==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr29980233wrq.91.1574070583608;
        Mon, 18 Nov 2019 01:49:43 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id f188sm18478495wmf.3.2019.11.18.01.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2019 01:49:42 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Samuel Neves <sneves@dei.uc.pt>,
        Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@suse.de>
References: <20191118141110.7f971194@canb.auug.org.au>
From:   Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4d2f41b1-9a8f-1528-0cc0-2730ea8e5910@suse.cz>
Date:   Mon, 18 Nov 2019 10:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191118141110.7f971194@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uw1gbWEREqHpoXFcHJQJeSB3SoaOJAsEV"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uw1gbWEREqHpoXFcHJQJeSB3SoaOJAsEV
Content-Type: multipart/mixed; boundary="gqiFj2hYAJy8MN2QAsNKEkKp6ID1wrVMu"

--gqiFj2hYAJy8MN2QAsNKEkKp6ID1wrVMu
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18. 11. 19, 4:11, Stephen Rothwell wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Nov 2019 14:00:40 +1100
> Subject: [PATCH] fix up for "x86/asm: Change all ENTRY+ENDPROC to SYM_F=
UNC_*"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/crypto/blake2s-core.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/x86/crypto/blake2s-core.S b/arch/x86/crypto/blake2s-c=
ore.S
> index 8591938eee26..24910b766bdd 100644
> --- a/arch/x86/crypto/blake2s-core.S
> +++ b/arch/x86/crypto/blake2s-core.S
> @@ -47,7 +47,7 @@ SIGMA2:
> =20
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
> =20
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

Hi, FWIW LGTM.

thanks,
--=20
js
suse labs


--gqiFj2hYAJy8MN2QAsNKEkKp6ID1wrVMu--

--uw1gbWEREqHpoXFcHJQJeSB3SoaOJAsEV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE1pWBVg1LlveO4uo2vSWxBAa0cEkFAl3SaTEACgkQvSWxBAa0
cEmq4xAAh+65kv4YO7CsHet1k8twziFh9OTGwSLT3hJgXheuJMVvJ6YgZsbRfmbv
Nkc5+RgThtzfQSvFmgdzUEexWd64Nm0m3/0+KjFNo03+D2MssJ/cpTg76CDdRaIP
MRN+0K7UsUv+28YdSJDgabJZqowghZUXXhsKizVZyxlqAeRJG1fS1kwnxGo7EYdB
L81YGU8kP5tCzD3JRsplWyj7NVS/ERqbwGQO2uWGHF9eMdWn0RFWR8jFaiRwUg0o
lBFJk76QK8tq2H35ulc1CVzd5aRQtfebEjOxiNyQUiYZHkkjClPohxpHOPMWiFIY
M5zi0T0a1/SGZal/O/h3qQFHycBYKreYrW8vluo+XeZLe34B/eklfnYFSWrYeLJd
fwrImxVcDuTFYeGiFZEef6rq/V9rmiid035um7fds0vjmuGcz/tSi6CGjaP6hAvt
FxNe0HSNdXl+GS0NZ3GvLs7m3SkBlCaxSfD8eu1c/fMyJlFRYQkaXoGahtASI/y1
owKHr736XQG9A9Ws3oN1lrg6vvXg2qjrolMBJZMdqJ7P4oteAJpcrtcqViC8SzOH
73OGyBpOUb/8BSqa6HQsT4B+TkGA5BJygxZFm5pCO/BY/GdmUWAcsvVsrTjpBA4R
8LKq4vS94phxFSMA0YALYIQ6qWhCqv/+rJTtWTb79sdG0Yy9kGA=
=O84y
-----END PGP SIGNATURE-----

--uw1gbWEREqHpoXFcHJQJeSB3SoaOJAsEV--
