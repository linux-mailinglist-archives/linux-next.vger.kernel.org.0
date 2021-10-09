Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA8A42777B
	for <lists+linux-next@lfdr.de>; Sat,  9 Oct 2021 07:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhJIFKp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 9 Oct 2021 01:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIFKp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 9 Oct 2021 01:10:45 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5A0C061570;
        Fri,  8 Oct 2021 22:08:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HRCl265tgz4xb7;
        Sat,  9 Oct 2021 16:08:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633756127;
        bh=mNuumbvlIZPJWISrf5EkOeLygrUGyi9lLdGgk6mAGHY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Seh17pBQNL8U1UrJcQVSkclfrjgh/h+RZA31/dAMl0l40rZaN6Nb5JDRsRDdMK4o3
         3nBpo9SsGb3HFKQ0RlWXW3txr4yLghY3ZSRQoYin3VwYik231/4eCgxtIdhtWHgtOP
         nfOJnfTVsCiDJ6FvZkyxo++2xji/+5Ppd+f098B2zBZFXskxQgTz+91jjv4EpNePKz
         kAgxDbBdLHBR31DuANwqP0aSqlJdNRudYlvAFgEmRZ2SuqEtS0c4gIa2AkRx2hC5jn
         BHBRi+M8GkwHLGPSPdmwlEFAzFD4OupMRjMXIhdS3SZuxgBjfeRqhsSdcFBSZ2+Geg
         ynz71iaOHUfKg==
Date:   Sat, 9 Oct 2021 16:08:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: contact/tree changes for the swiotlb tree
Message-ID: <20211009160846.5b90d9ba@canb.auug.org.au>
In-Reply-To: <YWCZHIk+QpsDb7Y8@0xbeefdead.lan>
References: <20211008082637.78598d36@canb.auug.org.au>
        <YWCZHIk+QpsDb7Y8@0xbeefdead.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GZVamjOgJpFn9mAQgcrEbYR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GZVamjOgJpFn9mAQgcrEbYR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Fri, 8 Oct 2021 15:16:44 -0400 Konrad Rzeszutek Wilk <konrad.wilk@oracle=
.com> wrote:
>=20
> Yes please go ahead and drop the swiotlb.git tree from your excellent
> system.

Done.
--=20
Cheers,
Stephen Rothwell

--Sig_/GZVamjOgJpFn9mAQgcrEbYR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFhI94ACgkQAVBC80lX
0GzY3gf7Bl779vMsHMq5hWlRsJvHwozbenLttTGaCIGvQUVVSnK7zE9EFXIMnYcG
AFSkKjS3zFj+DjdBF+siG/wPNyHVGZ+PXWvJZwS0d5q73e87FA7xVh8hle0Kt3Ft
oIxiZGXtk20om2slx4Djc/viEDHjGQYAzlAaJiGB2doSvSD9oKftQVNxjIT4xuX9
bRkI02noYM9NaCTdgvGIRdHrNmoA74122Mi3x4reqVf5qHJq6bMeSs7Br7Ap5TQg
9J9BUd/157tbIzoU1TOFT/emvdSTtAv8HJAZtiOwb2CCEyE6Mciqvi1WFrZMoKSB
ZiiTdQ3C7yU4pbZd4HZhY5Ka0nUo0w==
=zE0v
-----END PGP SIGNATURE-----

--Sig_/GZVamjOgJpFn9mAQgcrEbYR--
