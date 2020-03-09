Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B87917EC0C
	for <lists+linux-next@lfdr.de>; Mon,  9 Mar 2020 23:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbgCIW2O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 18:28:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727262AbgCIW2O (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 18:28:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48btCb69vsz9sPF;
        Tue, 10 Mar 2020 09:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583792891;
        bh=u1UxQdSuypNkAJOG3qMHitNN1nWBfFBDr66nW58kTKk=;
        h=Date:From:To:Cc:Subject:From;
        b=HPwbrRK+ZCIzra+AJhCvXD6vaAMFTuxfnTA1FLCPrdVE/ig3HH0OKxn2dezmlbT4P
         FWqJmpSPq1KPOq8TZo0DILi8NR/itGFM3bxVuyRLEcvmIXPgVODxpJ5SYMbaZY87ue
         nva/Cj9W0OQueN/qklNdIwmy9Phkpg9r16YEtJdvPCW+jWmeWtxb30PdB3/DhGZQLD
         7FXr8kwWRDUaMFP8nIQRxcqZUf6nABp3YY78oP35KyupPnE8ND6BQV+4SitT/R+K7p
         RxYlYpvcUZxcwsh4PEBpZAzpO15PE31ObYaB4yXrDsNzSjWlJOtKtEOc+3+e784aWJ
         eD3u0SO32vgzA==
Date:   Tue, 10 Mar 2020 09:28:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200310092805.7c37c3c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GODDuKGEfgBSeGe8GXZWyCE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GODDuKGEfgBSeGe8GXZWyCE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  91737cf1a418 ("cifs: smb2pdu.h: Replace zero-length array with flexible-a=
rray member")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/GODDuKGEfgBSeGe8GXZWyCE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5mwvUACgkQAVBC80lX
0GzEuAf+LwplOvjSFlFkVRWU8Pn6GtgzZS8ccV4wtcZe70pUPRIuBYlFtXiPJWaH
L2VAwH16LcOrlWPu9LF+5AacyRfeCwLetUcBL2HCD3QM4tyekhALpfFJrsnbferO
My4IatYD3cRUkxakJF0A/UDyXR6UcgfI7Hye50ZP4IysLeBQoYLqS9Oo3D/T7V0E
C3iaZR9SWu0dWwRTH9F2YhgZybaCPXHgy5mnv96cltnoI663O6hQfaUxmSOSgooq
9U1c4f+EI18TBhsbTaVGrcPOLc1V/v6iPIjWYXe15bcWdp9fnwKyIou/ShlU8l2j
XvxLlE0dLpxOnczswlgZo9NuboTi3w==
=WmkY
-----END PGP SIGNATURE-----

--Sig_/GODDuKGEfgBSeGe8GXZWyCE--
