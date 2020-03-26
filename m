Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A55A1938B1
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 07:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgCZGhB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 02:37:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50029 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbgCZGhB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 02:37:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nwJB0yJFz9sSH;
        Thu, 26 Mar 2020 17:36:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585204618;
        bh=AVMi9zNmzZTPMq/e9Qj767J1YMAyuM/Z5EjCyw0SljQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OXLPvTnwslbBC6TjRctA7OG1AjwUh0uccXCiWpX9Fh/ByfpI8dK1z3m3zv6kNcwDr
         1pKvuR3wN4V0/qStTJ2wxyCDDrLll6TC0XnUkHk86wV+uHhscSPqms1gl5gZtQSKN1
         1mOjVldqVaE+2Ggq7DXx+WiTRm63vLGMmaOSwxDSK/wCxt8KvwkF6rpLiHbOYnlYhX
         VM7QqVskZqCFta5DamnyIz5ESzIX9PHDNLhdtfZ2pNF8BIzsq8yHLVHo0woSxZD/o6
         k4IpYLw4JQNUNPxw3n+Bnp3eT3OfT2Eqz+iLxl8uWEt2oK3lY9AVS6uiBo9cAMARNm
         bdhYCVHhnqqsg==
Date:   Thu, 26 Mar 2020 17:36:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
Subject: Re: linux-next: build failure after merge of the irqchip tree
Message-ID: <20200326173656.691628e8@canb.auug.org.au>
In-Reply-To: <20200323175946.7ad497ea@canb.auug.org.au>
References: <20200323175946.7ad497ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/913JVVRB1tgs/aeh7Xd7+Y8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/913JVVRB1tgs/aeh7Xd7+Y8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Mar 2020 17:59:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the irqchip tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
>=20
> drivers/irqchip/irq-xilinx-intc.c: In function 'xil_intc_handle_irq':
> drivers/irqchip/irq-xilinx-intc.c:176:10: error: implicit declaration of =
function 'handle_domain_irq'; did you mean 'handle_bad_irq'? [-Werror=3Dimp=
licit-function-declaration]
>   176 |    ret =3D handle_domain_irq(irqc->root_domain, hwirq, regs);
>       |          ^~~~~~~~~~~~~~~~~
>       |          handle_bad_irq
> drivers/irqchip/irq-xilinx-intc.c: In function 'xilinx_intc_of_init':
> drivers/irqchip/irq-xilinx-intc.c:253:3: error: implicit declaration of f=
unction 'set_handle_irq'; did you mean 'generic_handle_irq'? [-Werror=3Dimp=
licit-function-declaration]
>   253 |   set_handle_irq(xil_intc_handle_irq);
>       |   ^~~~~~~~~~~~~~
>       |   generic_handle_irq
>=20
> Caused by commit
>=20
>   a0789993bf82 ("irqchip/xilinx: Enable generic irq multi handler")
>=20
> I have reverted that commit (and commit
>=20
>   9c2d4f525c00 ("irqchip/xilinx: Do not call irq_set_default_host()")
>=20
> that conflicted with the other revert).

I am still getting these errors.

--=20
Cheers,
Stephen Rothwell

--Sig_/913JVVRB1tgs/aeh7Xd7+Y8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl58TYgACgkQAVBC80lX
0Gy1fwf+KrhnaPWcFTJnh+ks0wV74Ujj1CSP/c/ilu5V5SpaQtP4+oZdXZ9gkQ92
J8elsP7jWnIsh4s6IkaICGLmNY2/J/h60hpB8BkLlK9mpWEsGJ9NtdvG9An76aBo
EJ0vzhcoLB5O4SA9W1XR4pq5Itjlf+CBRM31jesCYtLbUhJHNS4Jm6aX2DNlecKg
jQUQ9qpTyOH+F0TGbMfMEzTkz+9m2z4KFRimJC/3IdddGwZ0L/0Od+VrHxByO2CZ
1kPghYA8NmZPBsqjnfz0KDJbolfw+17M9dbeSJaebqtVyWBoBMfGYlLsLMaLRL4x
zXLTi9k08k+8vsApwNcyYbgwTWDGXA==
=0OpA
-----END PGP SIGNATURE-----

--Sig_/913JVVRB1tgs/aeh7Xd7+Y8--
