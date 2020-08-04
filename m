Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885AF23C1D2
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 00:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgHDWS2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 18:18:28 -0400
Received: from ozlabs.org ([203.11.71.1]:58637 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgHDWS2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 18:18:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLq0163dcz9sRN;
        Wed,  5 Aug 2020 08:18:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596579505;
        bh=cmAmGaOTXjX5RdrLlLIfncXgIaCjo2+zNlODdTP7t4U=;
        h=Date:From:To:Cc:Subject:From;
        b=PRf7I3V3z3aHr8IUYQrOOJZzEhhvPDs6vQGF9sd4Un87KVjkxu1B8MpSsKzvF7BJL
         SpnR8GUN70+YbpTGQYmnStk2nT6hTj6fvli+4vYez65PgI7tlwdDJY/b9cXEh4/uck
         RcwH00olbrHG2Kh2qqMpsBZPbO4YYS8F5RPg0L/CS/Wh3Rqo+jUxLlOP+ZnVkR39Lt
         wAK+fbA/gvPWjg6MPTmHeqBgMxyJw3urdKrCOLB5QdeoRc9rAzX86p1fHgoL3rArQz
         4MhJCIgMltpV0QSkSSFHJrAFeT991IASNB/+5dMrNMEvTCs3hAD+dt5IBj+gWQTh2y
         CJ1x6zkJi4TrQ==
Date:   Wed, 5 Aug 2020 08:18:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs tree
Message-ID: <20200805081824.3ac6edf3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p0BDlw263XH1fJmmEi5XYlx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p0BDlw263XH1fJmmEi5XYlx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  cc593d22f477 ("init: add an init_dup helper")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/p0BDlw263XH1fJmmEi5XYlx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8p3rAACgkQAVBC80lX
0GxQaAf5AV+lt0ylfUzgoOFXAzGrRJx0wVQp4GyOX0UBjrdO9E0AcWqkR9rARHaP
58pQH5FxuE/2rizvXTyeJizU9N3IIgVFA8s6ioTVFVko3YYFu8NU9Q3rFJUn2oWD
39moH+iDfVVMBwenlhhlC4ixH925i0I5+9D2jPvdJTkNar1sd2b4wx7JWt1nX/SI
W4jIN15GRO5aJ7gJs0kuY0Bo0FGOeu0o6SkwFaMmWGw4FNU26hGcZdnxDKAJ/Bkf
AKnGAl1P3aOiEpAKIY+zF+lEWBCzN50WAnjsREz1ncZLwjCn+0pyNAg8SVpPaeGH
eLzAdrBScR5PLD5nyfD94bkOlfmtvQ==
=mCTZ
-----END PGP SIGNATURE-----

--Sig_/p0BDlw263XH1fJmmEi5XYlx--
