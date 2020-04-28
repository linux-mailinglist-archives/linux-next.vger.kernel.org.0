Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4384E1BBAE6
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 12:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgD1KOU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 06:14:20 -0400
Received: from sauhun.de ([88.99.104.3]:41294 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727827AbgD1KOT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 06:14:19 -0400
Received: from localhost (p5486CA03.dip0.t-ipconnect.de [84.134.202.3])
        by pokefinder.org (Postfix) with ESMTPSA id 761D32C0710;
        Tue, 28 Apr 2020 12:14:17 +0200 (CEST)
Date:   Tue, 28 Apr 2020 12:14:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: Re: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <20200428101411.GA1140@ninjato>
References: <20200428082848.19d38b67@canb.auug.org.au>
 <20200428070130.GA2522@kunai>
 <20200428184104.27753d10@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20200428184104.27753d10@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Thanks for reporting, I obviously didn't notice. Well, technically,
> > commit messages can be UTF8, so not really an error. However, it will
> > probably break lots of homebrew scripts, so a checkpatch warning it is,
> > then?
>=20
> Not checkpatch, but my own script that checks some things about Fixes
> tags (attached).  Interestingly, my script does allow some other Unicode
> things (like matching quotes) ...

I wondered if it makes sense to add a warning to checkpatch; but on
second thought, the tags may include UTF8 anyhow for proper author
names. So, maybe we should be generous in what we accept and simply
update our tooling?


--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6oAe8ACgkQFA3kzBSg
KbYDGw//YIWeQHAEjtzXY6xSdP3/rNKWdXh6UbPe/zA8L5LK89OBLEIp6IoPLsow
ljAsAT/u9JMnleTs0si/golQiIOdRVStOC+dRTd5cJhxmL4kFA0DsxXlXRqNWZtY
PJqUXec2qKLTnVpTU/h2I8JSOmm3SRP9kH/RiBboM9VnHhbSHOR0qv8eLXiRgrcW
6eA7Nnib0U4rmq4I/r1+/rKVDjprsuo54a+KObd4cOgpqgDBJl9YOsBDIaK525sS
RIuDK+fT1h1Njq5+tAy1mS7B0LAbm1+Xfeznh0bT48XCVaDeQdZP4RQDjpcKaKK6
sPqfEDUc0ldS9lzaBXwg4btb4JVYOwLmXF02M6360tP4I/nim+fZOeSwC9QptF8A
LOLL2kDLNS4zLhOkQMsI6uo9oOwgHDh8FA3tD+zBmaiVG9JpxEPFw4kvTAgdOYKt
cpp+61wLoJxWnQ1bq3wrqQd6brsdi5Vwl3J9jGv+ioiwHSvlv0gNNrjg/TNo+heH
yxfGmwTnL0edmQ959v5wheMXAEcHI7zjan6S0xIX4rc/u8ZCtNzSdShv8f52I8F8
O6jiPqXYaKuweLbElUxEPahTDGfjD97uk+moPXoR4ly+yrftKkTiwS21430mG5JA
mhP0MEvWbBpBryZoqZNpCnzmnjSzGNlrG7WuCytweHw3ncDrWno=
=od//
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
