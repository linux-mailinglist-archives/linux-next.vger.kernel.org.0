Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC1423C2A2
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 02:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgHEAjq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 20:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgHEAjq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 20:39:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B91C06174A;
        Tue,  4 Aug 2020 17:39:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLt735JXHz9sPC;
        Wed,  5 Aug 2020 10:39:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596587984;
        bh=7HOEEvKq5LRz3PCysubAFOUBjpgsNPcl/sqB7xY69rk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OsKVGMpfDDYHRvsJ2U8AVgqaFaBdk3eIhstFU8+ymX0EcgiT9wPC7hK6S0Xb2s4Du
         Z4SA20XFYUO5Xy2hU6Qf39jfx34t54Yn9/LN7d2lAS6XM0C7ZiGhxzEg/fiMv2nfn2
         gHwNN7E91YPlno3MjGl1sttWX8tlyT8cQY/g2iOXzdr9ns89v1UIv9wubh/caL1Xwh
         GInZobQSqyLWJ9TEC/vK0nAjC3mmaseyjZJAnZ4qZs6PiT0UGN6bax2h8zsZgzNOBU
         iob0FegrzLTXyCAJeELqEqzUs2uyky/zGC65QodZQLedzp1gSNBVOjefnQzWjDiyOH
         ic+6S8G1kIwVA==
Date:   Wed, 5 Aug 2020 10:39:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greentime Hu <greentime.hu@sifive.com>,
        Tobias Klauser <tklauser@distanz.ch>
Subject: Re: linux-next: manual merge of the pidfd tree with the risc-v tree
Message-ID: <20200805103943.3c28da7f@canb.auug.org.au>
In-Reply-To: <20200713165846.5166ff82@canb.auug.org.au>
References: <20200713165846.5166ff82@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mDVi9AE0kO8GzyJSGotW5Sb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mDVi9AE0kO8GzyJSGotW5Sb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jul 2020 16:58:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   arch/riscv/Kconfig
>=20
> between commit:
>=20
>   95ce6c73da3b ("riscv: Enable context tracking")
>   929f6a183839 ("riscv: Add kmemleak support")
>=20
> from the risc-v tree and commit:
>=20
>   140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")
>=20
> from the pidfd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/riscv/Kconfig
> index 76a0cfad3367,f6a3a2bea3d8..000000000000
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -57,9 -52,6 +57,8 @@@ config RISC
>   	select HAVE_ARCH_SECCOMP_FILTER
>   	select HAVE_ARCH_TRACEHOOK
>   	select HAVE_ASM_MODVERSIONS
>  +	select HAVE_CONTEXT_TRACKING
> - 	select HAVE_COPY_THREAD_TLS
>  +	select HAVE_DEBUG_KMEMLEAK
>   	select HAVE_DMA_CONTIGUOUS if MMU
>   	select HAVE_EBPF_JIT if MMU
>   	select HAVE_FUTEX_CMPXCHG if FUTEX

This is now a conflict between the risc-v tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/mDVi9AE0kO8GzyJSGotW5Sb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8p/88ACgkQAVBC80lX
0GzIlAf/Rftvp1/cSxnITUMvWcQOwcQHwpbtZV+Wtrn2dTTQ0v/ZVvEs+AZ/6ZUQ
Kol9AlQPt8+2cD4LCdHw3jL4wv5H8obhGtHpvRE/Q4JTBHrRhlasJ9n79oa4FRQg
hPcZHh1Xu2kjuCGy1FP6UYDnmzxHO8PJ2zHz3s78NgkTTlSzO4zgrAHXDmHGWlTs
LtvmhQ4/d51huR+PUjr4ErX6GPIVgMJDkVSM1aLHyBOLbSGx14zpgv+XFEX/ijYi
RCYOld0KsELs9nrE5mqE4Pgnzf2QJ2x3ZmrWu/WHwslDWGhhlfjwhbZLISeXEhkb
NGO+ABooPXwg+dlxZB8VU8C09MSVTw==
=Y0Xn
-----END PGP SIGNATURE-----

--Sig_/mDVi9AE0kO8GzyJSGotW5Sb--
