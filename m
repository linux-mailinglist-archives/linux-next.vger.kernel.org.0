Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2632DF77A
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 02:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgLUBbi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Dec 2020 20:31:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbgLUBbh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 20:31:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CzhkS2wXqz9sTg;
        Mon, 21 Dec 2020 12:30:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608514256;
        bh=cfqzuayEfl3861N2wJ9yWj0M/XfM+3gaaOmaNXGO51M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rhc4+Mw0ZButYP3rZKIatDPJc3wCZ0gb+fxW00Cns9Q0mugLOCfmxYp83jNoKSXXW
         VATGsPJdRhHLKTj8EqTKn0MNFIYiMwH7SUpAIpFlPFvJK/299XAevwIvx31jgymw0w
         QYhaZcfS9DZ07TjcjQ497zIPfByK4uWeN2J5fvpSBn2kA3UkJYCrXun2Fwik2gs5tz
         w2jJvWS6ui9TWBDEDt+/THZ4yrGzYB5PVuCdteCjfKZsDdWWCLqVCdYrrLWveQiics
         OU1tw23e3fwGYyAYJWhEtHE5miy1I2nkazgpGdOjYmuyDTgsZroLAqa6pJ+h4mQyYG
         PtZYzc0Sc5fpQ==
Date:   Mon, 21 Dec 2020 12:30:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20201221123055.4774ef1f@canb.auug.org.au>
In-Reply-To: <20201215071436.3629b5ec@canb.auug.org.au>
References: <20201203183958.3ba2c4f5@canb.auug.org.au>
        <20201215071436.3629b5ec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NSqjWY/HG6D7tz8e2hU.gdg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NSqjWY/HG6D7tz8e2hU.gdg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Dec 2020 07:14:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Thu, 3 Dec 2020 18:39:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the block tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > fs/block_dev.c:1838: warning: Function parameter or member 'dev' not de=
scribed in 'lookup_bdev'
> >=20
> > Introduced by commit
> >=20
> >   4e7b5671c6a8 ("block: remove i_bdev") =20
>=20
> I am still getting this warning.

I am now getting this warning from Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/NSqjWY/HG6D7tz8e2hU.gdg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/f+s8ACgkQAVBC80lX
0GxvfQf+PjNgr6eSrfQElaBH/3GeWWrvfAB3nczEeLjrWIE3SzSYttJrVT3KA9xT
KqJyK/KZRm1GomnYy9PRMrcnEaaUfWp6eMljFYf+oA2FZ/Z1wjGuIlC5JqUdx8EE
GJ5oGKT00jszzTv6rT5IPJsMNgM+MV8B2UotqsIRbnSP5Cmgh+Gu9J6xy84v3Jil
ZeVF2dFLXUuOR4UV+7STTRK41R0ECqzliF9ogvAsMjsitwO7fo52AAv79QJJzCAL
6dzb7TKPfU3VwXpXE+GftZodHwwXCk9TivOA+WRZRnLfSx0Zjryb9IjrY87SzgMa
IH92xs5c8AByEdVyWJo2t8kWYDK5Tw==
=hdta
-----END PGP SIGNATURE-----

--Sig_/NSqjWY/HG6D7tz8e2hU.gdg--
