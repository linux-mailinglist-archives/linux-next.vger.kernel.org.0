Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D86442306
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 23:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhKAWKZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 18:10:25 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44723 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhKAWKY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 18:10:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjnGG02L0z4xbG;
        Tue,  2 Nov 2021 09:07:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635804470;
        bh=ahP9+6U0lEYgYKS1RdstYss1Lpyoi4ko6k+AobHq7sw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PfJFcri5zkn1+2aLLBQ2vDSVUvUewEUCDSnEiYaCkZ4bYZz/jzV6DCdd8kUqibJDm
         9GDeFppV/8d7vvm+ChIVPWAWyMEWUVeBCbXMTZKkcqlALevMNsIXCuHiRP+8s4E9Hr
         qI+gAiXlh4GRzF3Dv6BdiMf5zR/zSuCQ1tnhWvw5KzSCVN4asMEL9+sAzOQcTdLW6z
         evasqAs5iYo+gP9gagb6jBoSh+mzN4rRjnsdyQOwFnPnsWiFOdM/xyqvnMus1PHwDS
         LM5KTPnSbqBzZeRsgshzeN34yA7zjfZxk5P7UjN21uUwYPR75gAph3BicWIu8Zkl6I
         FGwFVU+bbdQTw==
Date:   Tue, 2 Nov 2021 09:07:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the folio tree with the fscache
 tree
Message-ID: <20211102090749.009f42b3@canb.auug.org.au>
In-Reply-To: <20210921135421.13eac778@canb.auug.org.au>
References: <20210921135421.13eac778@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xfTOUFvRZKlPAnCwNxZFhRS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xfTOUFvRZKlPAnCwNxZFhRS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Sep 2021 13:54:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the folio tree got a conflict in:
>=20
>   fs/cachefiles/rdwr.c
>=20
> between commit:
>=20
>   405f4ff7f8a3 ("fscache: Remove the old I/O API")
>=20
> from the fscache tree and commit:
>=20
>   2e96a1a81b3f ("mm/filemap: Convert page wait queues to be folios")
>=20
> from the folio tree.
>=20
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between Linus' tree and the fscache tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/xfTOUFvRZKlPAnCwNxZFhRS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGAZTUACgkQAVBC80lX
0GxxhAgAjMBbF4PrFzBCvRtitVmkPRzvGR84XRt1AMfunCygD7H6acd96YY9iIUj
ZlB0YW4LosqdWm/x8CTYZ6wK8L+F1Vt+tgSst5sWqxm96Ibedh5VEkM3EgKvmCWS
8NpEAwGrqRrKPzSFt20zCAmuhlpfJ5xvBAfH2vM/G+zBmgsaAJo+Ncgy36bWYLdt
waS8G1WdxhV1scU2QBMqZCxTnyYj3X5jACCSiTA1w/VbfscDfecBcBBpa25zGFBT
8DORMLdlaSYfDgMMN/RN9AN5LufpE+Bx2Od54c5Xudg5q9WvbJSY+wTNU2hUP3yH
795ygJFkcN/VbT0qva7gqJRjZYQLew==
=nL7x
-----END PGP SIGNATURE-----

--Sig_/xfTOUFvRZKlPAnCwNxZFhRS--
