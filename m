Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8672DCA85
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 02:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388482AbgLQB07 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 20:26:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728002AbgLQB07 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Dec 2020 20:26:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxDpw6gl6z9sSf;
        Thu, 17 Dec 2020 12:26:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608168377;
        bh=atSKTng1v+l8yXiPUMghLqv7mN+VpAD2HB5YeQJTSRo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UczmcGoBTB5Kse4A4oBi6NbafihUpxTmmLjBoULV7paMhP3LTQDfzUoeCUqw8RRXc
         tCl7dt6Nc7D/p89m3AbeEuy1Jvm/yzLeAW/B7eUivhGzcXuQUmpv8J7J7wbBeAIHUm
         eJDjU0CW/ZWyRL3CS2o62FkM4+fR9kvWVDb0yHpyoATpbHEomyDhRRz+ujrb3KL33s
         c7rLns/lAxV1K+wmfiBXSByYsEjhhbLvnUqR6UJMeBDjbI3i11sak44jfQdiI4PZ/n
         //M+GjeWaeDqgyTJuCjKG3e8pBbq+3qBoVtJq34DdBXTynvJc9LGebjbCgfwqxylhT
         3vwvDGEd8q63A==
Date:   Thu, 17 Dec 2020 12:26:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 risc-v tree
Message-ID: <20201217122616.410c88b9@canb.auug.org.au>
In-Reply-To: <20201127183441.347e30e0@canb.auug.org.au>
References: <20201127183441.347e30e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gnev8Pg6bxY9mSpUJTRNF6i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gnev8Pg6bxY9mSpUJTRNF6i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 27 Nov 2020 18:34:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   arch/riscv/Kconfig
>=20
> between commit:
>=20
>   5cb0080f1bfd ("riscv: Enable ARCH_STACKWALK")
>=20
> from the risc-v tree and commit:
>=20
>   46b9b00649f6 ("arch, mm: restore dependency of __kernel_map_pages() on =
DEBUG_PAGEALLOC")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/riscv/Kconfig
> index 8a2a0523a9a3,9283c6f9ae2a..000000000000
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -14,7 -14,7 +14,8 @@@ config RISC
>   	def_bool y
>   	select ARCH_CLOCKSOURCE_INIT
>   	select ARCH_SUPPORTS_ATOMIC_RMW
>  +	select ARCH_STACKWALK
> + 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select ARCH_HAS_DEBUG_VIRTUAL if MMU

This is now a conflict between the risc-v tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gnev8Pg6bxY9mSpUJTRNF6i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/as7gACgkQAVBC80lX
0Gya7Af/YSjmSZwafIVH2OjEKW4luupifciSTXiROJ3Pu/ypDwTuaHUdyAG0laFY
gK8Y65gCEnv/NXlGmLV4yk6kc5Iq3KMDNf1r3xOpIp1sWZIFMtLXGPeY1bNd/6Ku
QtbwH5Js7pmoqFF9/ttbaRyGH+ssYYtU7238AbkWGkA63cpoXCBgKlaPL1tk8Ua3
P1GzlGb2M1/7ZcZgN2ek7mQsGmK/HyOEGBWBmMrB8YPWca1kCfWQtSYMemmhU8kq
ey15lHJDfIpvFiocp9HbesC2WyrAVO4Y67d6rHTNMBwrFmQOCjwAS0Ls6ZSoKgRL
kx98CD38K/Nhvaz3UKzrP6GihQjqnw==
=hptW
-----END PGP SIGNATURE-----

--Sig_/gnev8Pg6bxY9mSpUJTRNF6i--
