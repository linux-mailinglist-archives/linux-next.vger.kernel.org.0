Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C205FE840
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 23:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfKOWqZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 17:46:25 -0500
Received: from ozlabs.org ([203.11.71.1]:34945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726974AbfKOWqZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 17:46:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47FD3d6wm9z9s7T;
        Sat, 16 Nov 2019 09:46:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573857982;
        bh=9kk4tpM+xxjU0ufiMTeD1kx3KsiLzcD7YNCNHOC4ve0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NRJTOEwBJNx9ZWewdvG/6aKTkCtT1kblChM8nrDB+f064gzs6RvFy9lC6mXLXdSlm
         Drl0tfSjHRzDodTtRs+kXgmXDQFUJR+Ed/o6aQjETvn1Kuyz7KRPMxQfap0sMuhmDu
         rCC1r1I/hj+SuFsxq9AydRAoRiZQ7VqYgp2IIU4jMC065tCYQaulDNYNepDj7rTYlK
         MSCc7u3YDl3Ht/PvIRDTEbThh92wl1LKxxNMsotAs6C8ZrNaOnO/ULyTvFhAEksI0l
         mC6aXfIrC5SuMdBrRuxG7a9s00KW+Ctt0eHyzZEVrRxp5qLNMxB5n/T0BEhqFXHzPT
         a+b8UHmAluiNw==
Date:   Sat, 16 Nov 2019 09:46:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Snitzer <snitzer@redhat.com>,
        Alasdair G Kergon <agk@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Thornber <dm-devel@redhat.com>,
        Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
Message-ID: <20191116094620.497663ab@canb.auug.org.au>
In-Reply-To: <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
References: <20191115190525.77efdf6c@canb.auug.org.au>
        <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eXHVxvF=qGFYOOsJe.=izN.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eXHVxvF=qGFYOOsJe.=izN.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Nov 2019 08:17:48 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on i386:
>=20
> ld: drivers/md/dm-integrity.o: in function `calculate_device_limits':
> dm-integrity.c:(.text.unlikely+0x1e9): undefined reference to `__udivdi3'

Caused by commit

  a236c37603bd ("dm integrity: fix excessive alignment of metadata runs")

=46rom the device-mapper tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/eXHVxvF=qGFYOOsJe.=izN.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3PKrwACgkQAVBC80lX
0GwPbQgAkkzpeWaBKkI6HeFDee9HWiD5sxxknAq8l1BBraY7AeFPNtJ1Ct3pVItd
I46PVCzzqOqwUYE6XVXE0YEqB8hh7pnBVTXdM322uNDGK5K/RHHIUpVvGjUCgLkF
zR5xfv6MkZ4ZT0wBALxe1R2REp/wPsTa5k/g1IcOHumKTq7lOfxTHHa8gdTnuo94
2TmrvOANSyh2/bKwylOppoaJBrVo+5ev+h7YmcdzjLUQVhcaZn8I543LS7kcOhxO
qf8BelKVE6PelvRukZn16qWMosoq7ik/vKfVwY0jqzZKh+OGDjg60XOuyNzsPh8k
ZEGMKkUn4mHU5Hc9yBBIVvfU2vD3NQ==
=SARL
-----END PGP SIGNATURE-----

--Sig_/eXHVxvF=qGFYOOsJe.=izN.--
