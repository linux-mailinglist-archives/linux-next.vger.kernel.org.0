Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1BF31B2E7
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhBNVxE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:53:04 -0500
Received: from ozlabs.org ([203.11.71.1]:37697 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230093AbhBNVxD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 16:53:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1DM6GTZz9sBJ;
        Mon, 15 Feb 2021 08:52:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613339541;
        bh=PMUN/fcN9JT7PU2lqAfKDDe+l9d0lQU4DfOzC1NuoYA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MrxzG0IRHbDjicfNem9oLfUcZmzrMd4ZAzIz4odT1gaau9oNwm/z/AF+OHZUQB7xc
         FS+Vx7sWj1zO7NLnDq5uj8POqJo5cR13IDddN85Qk0blirfsCPVvUDo0/t5B/eltbv
         hpnvpaq6hiDvgm5Z8s5O31HGBnOj181g9zqQRsZDPKX0KVL/GYCEReZbc5y2YlZ58c
         95kZwLzYjM+x4F63Kikzw423+dD5opFry4H/o6/AddH/14VMGEZiWGA9g86iW2u4xs
         u5WyHtPmr72XJQ3Vxf+OwWYRWAPS81+po0Qn1yFXzdmElQG8ERKkabXUJvTbUlSciC
         fytgqwKH1lObg==
Date:   Mon, 15 Feb 2021 08:52:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Atish Patra <atish.patra@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm64 tree
Message-ID: <20210215085219.619a0aa5@canb.auug.org.au>
In-Reply-To: <20210128102747.3ae8e5eb@canb.auug.org.au>
References: <20210128102747.3ae8e5eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PhYnCvk0_U=mv5HhCv779KL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PhYnCvk0_U=mv5HhCv779KL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 28 Jan 2021 10:27:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the risc-v tree got a conflict in:
>=20
>   arch/arm64/mm/Makefile
>=20
> between commit:
>=20
>   072e3d96a79a ("arm64: hibernate: move page handling function to new tra=
ns_pgd.c")
>=20
> from the arm64 tree and commit:
>=20
>   ae3c107cd8be ("numa: Move numa implementation to common code")
>=20
> from the risc-v tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/arm64/mm/Makefile
> index 77222d92667a,cd60e4fed78f..000000000000
> --- a/arch/arm64/mm/Makefile
> +++ b/arch/arm64/mm/Makefile
> @@@ -6,8 -6,6 +6,7 @@@ obj-y				:=3D dma-mapping.o extable.o fau
>   obj-$(CONFIG_HUGETLB_PAGE)	+=3D hugetlbpage.o
>   obj-$(CONFIG_PTDUMP_CORE)	+=3D ptdump.o
>   obj-$(CONFIG_PTDUMP_DEBUGFS)	+=3D ptdump_debugfs.o
>  +obj-$(CONFIG_TRANS_TABLE)	+=3D trans_pgd.o
> - obj-$(CONFIG_NUMA)		+=3D numa.o
>   obj-$(CONFIG_DEBUG_VIRTUAL)	+=3D physaddr.o
>   obj-$(CONFIG_ARM64_MTE)		+=3D mteswap.o
>   KASAN_SANITIZE_physaddr.o	+=3D n

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/PhYnCvk0_U=mv5HhCv779KL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApm5MACgkQAVBC80lX
0GxjxQgAoY4p6YoKU4/XE/DS0WQ9dN4dSl9Bb/34qVFdZe+33EHqwumXjWjRja+e
y3m710FCxcjmWzDvNRPiVx3c/R0P0U/iQqJXswV5hJqBcQ1fSj4cBvssA64hOJPD
ISZIYjWU3kNF/GQka+g/3eyj0GpQikbefmUQUSFOz/Wgqapcl97tfwoWhjzOiMUq
ABEEtPofyt5jqF87Xhx81jyGvwjfxzNgcah30TlX7XXJL9NPHP4ps117FMlbODsu
sf7HyMgdHaxOcDuuTpiMWUi7r4BjTw0xsaer4kmNKW1djXi144gB1+aWWWRNdwqB
qDM0iVvblJYEQWMSerMsZ1n8+eTejQ==
=6vza
-----END PGP SIGNATURE-----

--Sig_/PhYnCvk0_U=mv5HhCv779KL--
