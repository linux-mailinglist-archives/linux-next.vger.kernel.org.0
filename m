Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25FF2026FF
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 00:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgFTWQl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Jun 2020 18:16:41 -0400
Received: from ozlabs.org ([203.11.71.1]:37183 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbgFTWQl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 20 Jun 2020 18:16:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49q94g4st9z9sDX;
        Sun, 21 Jun 2020 08:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592691395;
        bh=PLQpteJOljxHo8RPSEJUMw2CeNV3+tlEUt657hkwLWg=;
        h=Date:From:To:Cc:Subject:From;
        b=GrALNB8htVe4+zWix3srOr54JzapR8+cRF/NnCkjDq+fLZyvtwJi9qRAU/qgtf4On
         pIq/Qhq9Ep8f80H1bS3Q9Kx1cBrWKsVQk+nUEnA10O1s9xTRfh2UVtxfzep3HQeHcG
         XjBpGOlmTAJ/xpTr0jIlv4Vm0t9B9w2ApnPxlhoq6d35F0TMwbo6S6ZEz70Hniascr
         aR7yjRi2owykhSDPI0Y0qgt7kPey0+v7JYsj38RVL/bk6qQ34C0Gdg9WTu+0d4tasl
         6BFxJOWALVrQd4SKV4h2Y3DiKM5MDkHrv0uTgyYJ1SkTtpfDh8gHhyxek8ZJ4PIH6d
         KtPHghrXOBIGw==
Date:   Sun, 21 Jun 2020 08:16:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the fsinfo tree
Message-ID: <20200621081634.20a3d18c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mVOzmjCzUmOGzJOXRN8lhX_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mVOzmjCzUmOGzJOXRN8lhX_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  dbc87e74d022 ("vfs, fsinfo: Add an RCU safe per-ns mount list")
  1293806368bc ("fsinfo: Add an attribute that lists all the visible mounts=
 in a namespace")
  93737ccf05ec ("fsinfo: Add an attribute that lists all the visible mounts=
 in a namespace")

are missing a Signed-off-by from their author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/mVOzmjCzUmOGzJOXRN8lhX_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7uisIACgkQAVBC80lX
0GyvNgf8CX9YiGjAHqr+8kU5wWxapW80thPp7flhvFXTgDl87/3JRBzB/9qVjNDb
EEJUNaQtTyEu6LsUxIDCDepzMWXwlFiDBQYt2C0nMku1hJQY305R6pLCp1Q0fyHo
my0z8PoXuT4s02n077ucGIXdMR4SAeYahtSFJvFKbnc2Ri7rE+ljB68BOaux2+UP
xjvWEJaZwb8Ax/WeXL16t7InvZakvxcMhCCr36kE5nLa/M+A5FwWEsX2KUD0kvN5
kgO4FdmfvLY3UcKteEAOV9AH/Rsg1BiROnSazLH0BauZJFBDZPgD18eTvxzrTQys
hA8CUL/HE+Z+sImNTgFXhYtFBLR2HQ==
=mW6z
-----END PGP SIGNATURE-----

--Sig_/mVOzmjCzUmOGzJOXRN8lhX_--
