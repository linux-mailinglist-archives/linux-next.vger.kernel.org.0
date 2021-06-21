Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651C43AF848
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 00:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhFUWMy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 18:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhFUWMx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 18:12:53 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54C9C061574;
        Mon, 21 Jun 2021 15:10:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G83cr0lZHz9sRN;
        Tue, 22 Jun 2021 08:10:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624313436;
        bh=GnzZNzlmyed4Oqjm8Dz4y6A/UQBy79JHgxdRF+4U/yg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HITEbOXkKV3JA4R2YfqYpm2lZAdV0jc0dN5GqnkZgr7M27zl69c4FZ33FRJl8pMSZ
         c6NpY0Uhlzt5bLuRod2pLPn6CDwGOAbAqTMm7akOzJ1PrpKA/93IhAGhXFxu5x2VBO
         M7sdbe/eOzzCuVFlwlZ7PLfvkWCvE5mS7wGZQhS8ZMYhWIUerh51uwFzbzxifQpVQz
         QkfpjQg5P9xLrCpUbDLBW2GRfqMaV5zjmBSZoU6PBfQjDZEzI5MaN60DfOtdUHlE2+
         FF8HWOJTFJbM24VJgwd8774dkj/OQr2YorcSvPOJG9lttCmwzBUQ+6z7sjINeT43Ep
         7Yuf357aaiaNA==
Date:   Tue, 22 Jun 2021 08:10:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Allison Henderson <allison.henderson@oracle.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the xfs tree
Message-ID: <20210622081034.472513aa@canb.auug.org.au>
In-Reply-To: <20210621215159.GE3619569@locust>
References: <20210621082656.59cae0d8@canb.auug.org.au>
        <20210621171208.GD3619569@locust>
        <20210622072719.1d312bf0@canb.auug.org.au>
        <20210621215159.GE3619569@locust>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=XLiURUMYZZpPMDN6ot1ilS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=XLiURUMYZZpPMDN6ot1ilS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darrick,

On Mon, 21 Jun 2021 14:51:59 -0700 "Darrick J. Wong" <djwong@kernel.org> wr=
ote:
>
> > Of course, you should not really rebase a published tree at all (unless
> > vitally necessary) - see Documentation/maintainer/rebasing-and-merging.=
rst =20
>=20
> Heh.  That ship has sailed, unfortunately.  If we /really/ care about
> maintainers adding their own SoB tags to non-merge commits then I /have/
> to rebase.

We do *not* care about maintainers adding their own SOB to non-merge
commits that are in a branch that are all committed by someone else.
As you say, that is not possible without rewriting the whole branch.

--=20
Cheers,
Stephen Rothwell

--Sig_/=XLiURUMYZZpPMDN6ot1ilS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRDloACgkQAVBC80lX
0Gwy4wgAjuRwKDluvG4G3yoAmqLWo/ZeKoIe9KO7pftZsDQnYkNp0Jv/1Mbk4Hvx
6JfCcQpIOCk6KhUqtAtAUjozYS1PTyE9HD9Hp1N8oSvMz7ezMrUBKeu7OOhHK2Mi
I+K6VsB02Y8XHaOsKw9WyeUu+cYsFS+pWxWWB2tdolxjS8ae+82HMWEh1UQxaEpa
Z+lnzR4eapKQe9t9yy5b2EMlVGbodz/VFcxWspphnTZIt+w9ZeH6FrGhck/OJKRX
IVX0v4GnYYF8hQq5C3tSlL7Mo5t3dv2xkJiKKDLXfb/QJa7U0h3IloZvVLDPTJy0
ohDXpt3/Mx0nm3Si7f/iT9X1o11UoA==
=7XIC
-----END PGP SIGNATURE-----

--Sig_/=XLiURUMYZZpPMDN6ot1ilS--
