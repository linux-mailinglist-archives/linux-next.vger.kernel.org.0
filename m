Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9802FFD00
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 07:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbhAVG5e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 01:57:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbhAVG5a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Jan 2021 01:57:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMVRg4rzWz9sVF;
        Fri, 22 Jan 2021 17:56:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611298607;
        bh=KB6IRruOTre2oTQaVLyZaKh2Be9Iqb8Gy9pP2SUWK0w=;
        h=Date:From:To:Cc:Subject:From;
        b=HMEY670DwB3o1t/EBhf+L10u22jhXyTyB4NJUVgG+H2QKDdGdPkSPL2XuJoDekkH1
         Qc21PRyHmVoOfaG4EclsCIcQfCb9ijhR8paSV3Hl9R8eB5BwqnZq2yLMwAu8M6dc6o
         NYYLyVAslbIJwZEBwgS4LA6UoD/mXKTYqTqrKyfitHVct4Z6/1rg9uZegttlI643+j
         nYjScv40jYM3e2v1l5a0VTa2mlB60S9FNbxhbrzIjbmjgGA1jdCEf9stMOw0fXz2Qu
         cS6UK392YA5kOOWDEkRPaZEN/qTGAVyeeT21Wrvivnla3c9VhBDzXF62h9FMkH0vl0
         64GXixtDDoK5g==
Date:   Fri, 22 Jan 2021 17:56:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Mikulas Patocka <mpatocka@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20210122175646.024623eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4BP=O7+GE7fGSc0QCYi_T/a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4BP=O7+GE7fGSc0QCYi_T/a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/admin-guide/device-mapper/dm-integrity.rst:19
2: WARNING: Unexpected indentation.
Documentation/admin-guide/device-mapper/dm-integrity.rst:193: WARNING: Bloc=
k quote ends without a blank line; unexpected unindent.

Introduced by commit

  61b8b2a834bf ("dm integrity: introduce the "fix_hmac" argument")

--=20
Cheers,
Stephen Rothwell

--Sig_/4BP=O7+GE7fGSc0QCYi_T/a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAKdy4ACgkQAVBC80lX
0GyGLwgAia8JELcQNMQbXJteF7yh+b2uVmoIe2X9Oza/D9NBkJb5UQ4SHib54OdO
6WcI1ymBjSbnWwVFN3bp4FiVdMtV+HrjCSG1Yl1tls52MmQ+PK7Jax8d+7gzsocM
2ysGI18kkK7Yk5g1DMdC4UeFKf+mZc8AZEAnqF5yqEwCt6P61GT6KnNhZpJZU1JG
tTckka3BH4x1F0xZdFj2pt+QQ/gI7vQG1bR3Ke2WZEgqB0BxNWPGeRcnt6yOVU24
cIuZ6sJXKWSnNvwSr5AKLT1hykFZs9tx/h9lrVANCgMpI+x92Mey8fq+oD6QzGzi
LskO/3SCyomhozFeRVl7KANTLV3vpg==
=1U6d
-----END PGP SIGNATURE-----

--Sig_/4BP=O7+GE7fGSc0QCYi_T/a--
