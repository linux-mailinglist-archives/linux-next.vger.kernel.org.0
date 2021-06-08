Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4882C39F38B
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 12:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhFHK3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 06:29:45 -0400
Received: from ozlabs.org ([203.11.71.1]:52169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230405AbhFHK3o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Jun 2021 06:29:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fzmdx3q44z9s5R;
        Tue,  8 Jun 2021 20:27:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623148070;
        bh=qb/wxBsojBXliStkx5bANvecAah4WHhT3m1LyLlzdBc=;
        h=Date:From:To:Cc:Subject:From;
        b=G3LgomeixrLm9NpzULhRA6zLYq9JvkeKw/rtr53B112b7T/JD4XSrZKrKBz57egbJ
         MjUUqEkeyOTqQILs2hK6yv634E9vz1B+KohJQ8134I5CJYubgch2SIM2yz7svfpVR4
         yGexkeB+2NW1LlPkx8NRS7mItfin3hPLcziOjOp0RTrMOpRHsYsuhzwjWz9jnUrMwO
         gnKWMg92Wb1+ypV2dZgs5mquUXSGfCnq5inNbEETuVoiDDKvu2SgEwrLPedToEjdsz
         ALSHahvxLC6gvvQv/W3KE8//GXDmrxkJ+daLK/L7L9j6hLzVVxWS25mNR2SlP6joa7
         HYJxu2rvcaM0g==
Date:   Tue, 8 Jun 2021 20:27:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Namjae Jeon <namjae.jeon@samsung.com>,
        Hyunchul Lee <hyc.lee@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cifs tree
Message-ID: <20210608202748.06334136@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9HI6M8GOi+eUDGg1yG95zW2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9HI6M8GOi+eUDGg1yG95zW2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifs tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: fs/cifsd/spnego_negtokeninit.asn1.o:(.rodata.spnego_negtokeninit_decode=
r+0x0): multiple definition of `spnego_negtokeninit_decoder'; fs/cifs/spneg=
o_negtoken
init.asn1.o:(.rodata.spnego_negtokeninit_decoder+0x0): first defined here
ld: fs/cifsd/asn1.o:(.opd+0xa8): multiple definition of `gssapi_this_mech';=
 fs/cifs/asn1.o:(.opd+0x18): first defined here
ld: fs/cifsd/asn1.o: in function `.gssapi_this_mech':
asn1.c:(.text.gssapi_this_mech+0x0): multiple definition of `.gssapi_this_m=
ech'; fs/cifs/asn1.o:asn1.c:(.text.gssapi_this_mech+0x0): first defined here
ld: fs/cifsd/asn1.o:(.opd+0xc0): multiple definition of `neg_token_init_mec=
h_type'; fs/cifs/asn1.o:(.opd+0x30): first defined here
ld: fs/cifsd/asn1.o: in function `.neg_token_init_mech_type':
asn1.c:(.text.neg_token_init_mech_type+0x0): multiple definition of `.neg_t=
oken_init_mech_type'; fs/cifs/asn1.o:asn1.c:(.text.neg_token_init_mech_type=
+0x0): first defined here

Caused by commit

  4a957ba6daf6 ("cifs: decoding negTokenInit with generic ASN1 decoder")

interacting with commit

  fad4161b5cd0 ("cifsd: decoding gss token using lib/asn1_decoder.c")

from the cifsd tree.

I have reverted that cifs tree commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/9HI6M8GOi+eUDGg1yG95zW2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC/RiQACgkQAVBC80lX
0GyQqwf/TBVY3mCXhLlpLHOd/1QdtUNqhKn74qaa5C9Ce/gLIWl68qzDH+t0OYW1
rkq1OutR2pX4EQ5YOfiE4FY17d3VdASdgxYkt32wwNmvaHjY3nuQ/N1sDwPuwQ0Y
2emEahlEvyPFSIoiu1KZsFOkvF8SUaj3S9+KNobly4T+fl7KhohXv/FAut/avvL4
7W4F4ub29CTlG/aaE7MdCjELQ6RtUoN7mIin4LPXnF58E3FF2SAHOAkmtPRNQ/Up
+J7eAdms2SDCOdWmZyemkdSjDs2s8+Yo/TUGDZD5HnoCRm6BSx1svLCh+TEqV8fx
zFuhN0ytbzSBRYq7AuTMoRySBb73xg==
=F+G4
-----END PGP SIGNATURE-----

--Sig_/9HI6M8GOi+eUDGg1yG95zW2--
