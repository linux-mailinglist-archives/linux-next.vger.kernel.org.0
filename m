Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C622133099
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 21:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgAGUd6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 15:33:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37735 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728561AbgAGUd6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 15:33:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47skcM2xFdz9sR0;
        Wed,  8 Jan 2020 07:33:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578429235;
        bh=OFs/IkFFrLcuDeusWvjaN3qFeCgRqQ1i+hTSsiEXdVk=;
        h=Date:From:To:Cc:Subject:From;
        b=nCuR6y8VmYxn0TbgxkCOmwNZwfaW13814iSF20y9jF6VHA/y+tNpIebCdCrzzfNOm
         FC//9e8E+70v72HpAtDa6WE8uKxaGh3YWoGC/yMDla6LFzZoEJNwj6HHeEVH/crrCh
         EjWSdcIkWggky5P+MYa9lGWKqLFlF9ntiDxe1wgOz1KawDxxH8n4DvJzTgoFCVkidc
         wAZtiGYiqBfX5q5dwOSgmcuqdUoMydsgOYUzsZU3taGadMXi7dC9s+J5oUWzUT3cZ0
         h4rsjMcmNpozbm/cDL9eyFy+1G1mdUuENEg3W+adhjV+HgmFq09CXkGd5NR20NO6Vf
         F4fgsdOoEFjXQ==
Date:   Wed, 8 Jan 2020 07:33:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Kaike Wan <kaike.wan@intel.com>,
        Dennis Dalessandro <dennis.dalessandro@intel.com>
Subject: linux-next: Fixes tag needs some work in the rdma tree
Message-ID: <20200108073349.2b270de3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LiN5NbM_U/GS/M5ePDbAkVD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LiN5NbM_U/GS/M5ePDbAkVD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  44ec5aa3c615 ("IB/hfi1: List all receive contexts from debugfs")

Fixes tag

  Fixes: bf808b5039c ("IB/hfi1: Add kernel receive context info to debugfs")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/LiN5NbM_U/GS/M5ePDbAkVD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4U6y0ACgkQAVBC80lX
0GxrgQf9FLbTeg9iPajwYLHI4J2BJeP/gbu6sO0GH8j5iIerFgs6jdDhwFZyHuEa
DZUAkNMljNnOAlaQAF5OU6O26fx37WFUSHUCTrN28PNB3y1C/vz8wwFbpW7atSLe
DYwGCO6o2CEITfru8xr9C2vByKuDcHDPfkXmUCgjqCwmPNmuNjZxjmPJ03CVJyhJ
j5X9pX7BXieYDQKEnCCTgblgcTZDLhMsr5XGzQqr4l3CeSi8vZx5fijjxmne9lhC
mktutQb29p0d27ODa0MjwQcvCigjNhPK88dYeLqk9Ix/3KYWzXUqBEdHQ29+VgSw
QdbBKrdn6SrJMzPSnyTyNSYV0feLWg==
=chLr
-----END PGP SIGNATURE-----

--Sig_/LiN5NbM_U/GS/M5ePDbAkVD--
