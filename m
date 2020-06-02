Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6298F1EB9C0
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 12:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgFBKn7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 06:43:59 -0400
Received: from ozlabs.org ([203.11.71.1]:41951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgFBKn7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 06:43:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bpYm0WBpz9sSg;
        Tue,  2 Jun 2020 20:43:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591094637;
        bh=oCZcV2xkPgXGtfLS8LiMCGtpvLn30ooD4U0COUOX/b4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WqwHYZKYBGP5kZDObHwPkHf0NRZsodarotdxs067xV/EvqItasvREu3qd9jKV8jXB
         PIESJgR4Z6PAdb9ZAC89vouejPTTKzuDeOfEm44aH9gwqgrU16L5Tx4zd+6KTRh8e/
         3+BnAd5unZ4shAxf731bGpfcRl7r+RgMNen3LHHNEa7QNrkAgrfqpQrTGhW7PTBOLl
         GpQKgybhSZBzBfAyOeEHXFH89p2XqlJEbrl7LTFUUzdbnlSU49D51OiHcv7suuP6bg
         NqjbwRcYZCH74bGFtSpQuCSMpSVpZ1FU5v/6qKgrRJLDrFwgJYmMq3XHBzamXCR9Vs
         RiLGYgpLW36jg==
Date:   Tue, 2 Jun 2020 20:43:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Max Gurtovoy <maxg@mellanox.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
Message-ID: <20200602204354.39727fdd@canb.auug.org.au>
In-Reply-To: <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
References: <20200602125647.5f5ed151@canb.auug.org.au>
        <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x+8EnL2NCLRCz5R=VQZuLEU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x+8EnL2NCLRCz5R=VQZuLEU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Max,

On Tue, 2 Jun 2020 11:37:26 +0300 Max Gurtovoy <maxg@mellanox.com> wrote:
>
> On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
>=20
> This looks good to me.
>=20
> Can you share a pointer to the tree so we'll test it in our labs ?

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

you want tag next-20200602

or if you just want that trees that conflicted, then

block: git://git.kernel.dk/linux-block.git branch for-next
rdma: git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git branch fo=
r-next

--=20
Cheers,
Stephen Rothwell

--Sig_/x+8EnL2NCLRCz5R=VQZuLEU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7WLWsACgkQAVBC80lX
0Gxtpwf+MjJxsHWVelBpn/KVJRHjupGaIcGL2U0kojSsWBZqInmRjF5ELqKU0os/
DfCMysJ9J1sSXv6DyFuZ77fJjNQWQtj4ti0MBRZ6uqUgaV49dULnUAV0gZUPAhOK
ZlsKjSC2G2MsQkpYthiy8/CfzF6QdrJa3+01u9Ey5viDbnMKk2C1KECGLMweRoO5
f/GX0eA3taImkwbPuAO2dFUs2omqZ9tIxAEApwki4PaV/e/IHBAv9NNNK+wINnCr
ZQoge5hJJ4Jvn20S7tNBHbLJXuvwUArZqfTSHnLyrs6mPIJlvyNMXBVV4rbHF8yz
58/UhmBdab2mvOJpMjCO/XqirMeNXw==
=CUqi
-----END PGP SIGNATURE-----

--Sig_/x+8EnL2NCLRCz5R=VQZuLEU--
