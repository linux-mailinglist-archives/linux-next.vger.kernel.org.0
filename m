Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E181435837
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 03:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhJUBa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 21:30:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54625 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhJUBa2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 21:30:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZVH02P4nz4xbT;
        Thu, 21 Oct 2021 12:28:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634779692;
        bh=vDWuEnZ5RpZM5FmpEAHbWhY2teRuUOgp7f/FO0fESKU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P2p/Q7i/GeP8r7PnkI8xJOyNUDudRxPsaHhEszzMKZ9VZsGcodcTUtk5vGADIFiZt
         eFWCbPk23tNoPygGBY5KQpt9uSa78jCr4epCJ+Bs8O9vIgEvbeTWoYbNY1gUCx5OTg
         UBTQIFzGDiZ7VRXtxvLpGDcRV92HDwcMcMh5owq27Zz4vOG0TjBqV6wkdLKNQX1pnc
         X275FKMxbUycpyirxSj+vPG6BcD3KT/ugMzE/vduKSuEkCalm2CbGcPewTORmw68eG
         bmfim1eYFanKr/M6cx6C27gAYSxx0r5HVyh3LZ6T6W5YGrudFf091Miw8HnAJKBcLx
         lMMCFqmAu50DQ==
Date:   Thu, 21 Oct 2021 12:28:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Fengnan Chang <changfengnan@vivo.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning in Linus' tree
Message-ID: <20211021122811.1e7d96f4@canb.auug.org.au>
In-Reply-To: <20211005202900.29285789@canb.auug.org.au>
References: <20211005202900.29285789@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=Cr5nnekvT=WQ44hVISRhKM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=Cr5nnekvT=WQ44hVISRhKM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 5 Oct 2021 20:29:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> In Linus' tree, today's linux-next build (htmldocs) produced this warning:
>=20
> Documentation/filesystems/f2fs.rst:288: WARNING: Block quote ends without=
 a blank line; unexpected unindent.
>=20
> Introduced by commit
>=20
>   151b1982be5d ("f2fs: compress: add nocompress extensions support")

I ma still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/=Cr5nnekvT=WQ44hVISRhKM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFwwisACgkQAVBC80lX
0GxuoQf+Lf90QkZGE8k3tuoFSg4U6fzibeRS8VvrkUIkxvZV6rgLYT4Xy2NjwzsE
axx8hIr3Rk7bCh/Z7p7w9r8BaUMxoclGtkt4hDfjUBPDLQwp56vIq/Qe1lxmseND
gewXme+1HTWlfLVa3I585ptuA7EmYivgdH76+ER0/M0czJ65EFpEnOf2eUo0PXAZ
Wiw1lfapbbVlcsJw+cdHhLonBupcHSYkTmu85HiX4TD1z8rahpxqvIW/cR9sxP/5
GbSNuxnptmQ5Mf3rmr4kLppICg5paI6S/lKp0npa93w5dNzFjalWDtNIuU/TUh2J
14xpyRaxcRlGUmqHvOQGWkGitY4zIA==
=aHB3
-----END PGP SIGNATURE-----

--Sig_/=Cr5nnekvT=WQ44hVISRhKM--
