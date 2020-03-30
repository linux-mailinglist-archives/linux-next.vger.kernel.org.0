Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202841972F2
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 06:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgC3EIZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 00:08:25 -0400
Received: from ozlabs.org ([203.11.71.1]:53201 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgC3EIZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 00:08:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rJps2kKcz9sPF;
        Mon, 30 Mar 2020 15:08:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585541302;
        bh=4LklNUeeFMyLVbYa8fYmKcp69TR6b5eexoc9ScGOfyY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zocas/VnMI0Yq2+h0P+WXb7j8aCKussJrXDGL8/yLGvWifovRCrIlgJXhGBIN2SZK
         58q5nACvf00otQivjMDczJl1/qS3j3g0bhPF0sJr0YC7/p08Dvw3QqnJWh0oqLwNDp
         ndMPIEk+5QhCB9SoFPK7oQDcTAnrzAQbH70H0EQjOiA4+7wfWJvtHYYNWypWbQglBj
         ibenXkOktNMKUmo518Soj9GvXnCjI7HzFbgvRu9uadwpCPcNZ5ZKL6IcouKe3HJfCp
         +ELL7ljcepI0833Aeqp9MYo7GXR/OkZmfBZ0dCOeWJ03SLDMopFP/i0RQ8GNaFWVjF
         GeisJZAO3hfaA==
Date:   Mon, 30 Mar 2020 15:08:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "H.J. Lu" <hjl.tools@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200330150819.7f0199a2@canb.auug.org.au>
In-Reply-To: <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
References: <20200330143529.4dafeb34@canb.auug.org.au>
        <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ryc+xrSw9=HsrUjt4DZSlHK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ryc+xrSw9=HsrUjt4DZSlHK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi H.J.,

On Sun, 29 Mar 2020 20:53:42 -0700 "H.J. Lu" <hjl.tools@gmail.com> wrote:
>
> Please see my enclosing email.   Is anyone from PPC community reading ema=
ils?

What you really need is an Ack from the PowerPC people for the fix you
suggested and then tha fix should go in the same series that is now
causing the failure (preferably before the problematic (for PowerPC)
patch.

For reference, the change is (white space damaged):

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinu=
x.lds.S
index b4c89a1acebb..076b3e8a849d 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -365,9 +365,12 @@ SECTIONS
        DISCARDS
        /DISCARD/ : {
                *(*.EMB.apuinfo)
-               *(.glink .iplt .plt .rela* .comment)
+               *(.glink .iplt .plt .comment)
                *(.gnu.version*)
                *(.gnu.attributes)
                *(.eh_frame)
+#ifndef CONFIG_RELOCATABLE
+               *(.rela*)
+#endif
        }
 }

--=20
Cheers,
Stephen Rothwell

--Sig_/Ryc+xrSw9=HsrUjt4DZSlHK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BcLMACgkQAVBC80lX
0GwQPgf/UAJzJSpkJX3HeN7EVC2E7DRsnYnVlaR5TqipTOkpmflinpAU+ZvzCh+4
IID5+wHGLt30AwY/f9G4aq0TcvwyF5KD9YGpLOE5exgwXnDJYF3dNHuo1XlNOkYv
hdn+V84g1Ntoz+YdciL+RlvGdpQhJAiDTZK1PgUoQR8frt3VP/agZLwfJzLC8U9j
yCQj7scps5qauXHx9epiqb3pRmZIguHAWVsqY67KYN2+3nQT6T1APr4Uy6hqjkBK
p+PPomrOmFdnvbGsuxbEWIFgNqP2RXM4xOfm8wvEiTXcaIbXRI9PnfwaeWUxgDBE
T1l/9KoYxVURaM0mQOXLXR9P7CEMfw==
=uV8y
-----END PGP SIGNATURE-----

--Sig_/Ryc+xrSw9=HsrUjt4DZSlHK--
