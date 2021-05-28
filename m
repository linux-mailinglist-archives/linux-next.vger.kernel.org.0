Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16FC394884
	for <lists+linux-next@lfdr.de>; Fri, 28 May 2021 23:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhE1WBP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 May 2021 18:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE1WBN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 May 2021 18:01:13 -0400
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0205C061574
        for <linux-next@vger.kernel.org>; Fri, 28 May 2021 14:59:35 -0700 (PDT)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4FsJW16qXPzyQJ;
        Sat, 29 May 2021 07:59:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1622239168;
        bh=amiXFdTtq//850g5uO38QHCYw6ktbdlwBdadTR8J7+c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UL1gN+ghYAitXdHFK7/jHJzQzxb34/reN5fg2qNJvYcSc/cMdav3q/Sr10i1apkWl
         ZoJK+TufG9luT7odUJTrqbiTFrz/76EP3X5yzLf5RvohTZreEhdUuCaqRYyAmIaTS4
         1pUnb2F+QdHn7ejYnrP5xDgbL7jlqiatpEff1AA11eBYIVsYYyuNU464/Lc33hWrIG
         fCiAXaKWta7tw58ee7en+iu5Q/UEbBsDY89oVaTNjzhxrebghmKL/vjZWqIZc2aarj
         Aj1Otvf7IwTO5mbxM0CrWveV5L9URrXD1MuCjG2ygca4P7i0IBvvTKLLcWZess/rGH
         0zeY0Y/hBE0CQ==
Date:   Sat, 29 May 2021 07:59:25 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Carlo Caione <carlo@caione.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: updated Amlogic repo used for linux-next
Message-ID: <20210529075925.0694d253@elm.ozlabs.ibm.com>
In-Reply-To: <7h8s3yso9q.fsf@baylibre.com>
References: <7hmtsgrpkt.fsf@baylibre.com>
        <20210528083821.72dda431@canb.auug.org.au>
        <7h8s3yso9q.fsf@baylibre.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/goW/d7TRPBtLeAjiMOlOUHo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/goW/d7TRPBtLeAjiMOlOUHo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Fri, 28 May 2021 11:32:01 -0700 Kevin Hilman <khilman@baylibre.com> wrot=
e:
>
> > I still have Carlo (cc'd) listed as a contact, is that correct? =20
>=20
> You can drop Carlo.  He stepped down as co-maintainer awhile back.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/goW/d7TRPBtLeAjiMOlOUHo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCxZ70ACgkQAVBC80lX
0GzHmwf/eKHLQpOd6jU+5sLrlnTYIWAoV5Dq3MeRDZrs31v6T9aID4BQB+p+m4OU
3KC1+S8WluyLeZlvgfA/mGVvnjQV2w5nclHw4J/XVq9aVf+QgQY10uOR1jEPcgbM
2yYoRuv59Cs2pfD40/wQwAVC9bgCMSsRmiA/TiOG+YgwEyx8Nod02wPiu6AuqmT7
2opk6jekcrEuggOZWzLX5pcI9HtArXxnzb3t3wGA4ZFUSQjdaM9tikwTfbQfOaV6
oMuYEIUYQkGD1xm7R6MizIlqqRxmzGiRcHgvLsBfuXN5Ikj/2gnDD7CWdheVwre8
+UO/4mV6QHbAXWzT4hFGlfhTzeR2gA==
=dNpK
-----END PGP SIGNATURE-----

--Sig_/goW/d7TRPBtLeAjiMOlOUHo--
