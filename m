Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C174379A57
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 00:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhEJWnR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 18:43:17 -0400
Received: from ozlabs.org ([203.11.71.1]:44563 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231168AbhEJWnO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 May 2021 18:43:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfGJb6tCqz9sX5;
        Tue, 11 May 2021 08:42:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620686528;
        bh=P74C2MrK3HEj42rgdh3tY+YgtUH+5buY4fkAuuvZFKY=;
        h=Date:From:To:Cc:Subject:From;
        b=fCTZellFVu0RB5FoWhJ2I7xg9T4gRio1IoNnOHg751BGP3XfL4lwzEoDy/epl71ll
         H0iHcLenA3b3o/a0g8JVAOXE7zVqkOizoI7vpJlk8kHkoUzfcVTQjOfExDygT6Tyyk
         lMO57ODkpyUjN/huBs/Vos2jqmiZqdUQm8NJVNBcKrVebbGz9FRFfka4NTsXpQxgF3
         cj7bnHNpyjlkdYCSI7sA1ddqCNMvpdkwI3r2QtKNAHiZJiwvXmMFWw9TO0OFGAfB/u
         KZtRKJsuctbihZrQFY18wy/A3q5vw0z39QnEhnxmJijbFgbd9AbrNx3gKMrj/6lmBN
         dgAltJ7hQSFdA==
Date:   Tue, 11 May 2021 08:42:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     David Ward <david.ward@gatech.edu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210511084206.3de50d5b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/35obCy7lhwGO/C_AJiGlZxk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/35obCy7lhwGO/C_AJiGlZxk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0b62b6ed6959 ("drm/amd/display: Initialize attribute for hdcp_srm sysfs f=
ile")

Fixes tag

  Fixes: a193ed2094ba ("drm/amd/display: Add sysfs interface for set/get sr=
m")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Maybe you meant

Fixes: 9037246bb2da ("drm/amd/display: Add sysfs interface for set/get srm")

--=20
Cheers,
Stephen Rothwell

--Sig_/35obCy7lhwGO/C_AJiGlZxk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCZtr4ACgkQAVBC80lX
0Gzvigf+MAssc1Y7YeJy3bM1vcmUn70NL2jFlAmXWjCKqYkOfl7pwW59oPiAVwPC
eSVVkZVFvpG5VBz/wnQgdmbQHUGb6b3bR0MVCk31vqp6U+DyhzVY8G7xIkKGZKC4
iTZcacWLNU8ubscxuWsHIWokkOYCzyvzej9CPYxHev9B9Awg22NtTn8voNu5dkbb
BjrHZK1QmSbVj9tXKEV2lviMYZXL5wdVNVS5Zjm/3zwV0vVutgQxABq54ky56ZVY
LVvLeKSPIqRAuwdKSsG3+zWrM4WSersgqKMv7Nrzb7D/5NJ3mD9ZwTzBDG26S4nX
RZ87PCesYTLlSjOhZADIOXFGQ6WRJQ==
=bNmA
-----END PGP SIGNATURE-----

--Sig_/35obCy7lhwGO/C_AJiGlZxk--
