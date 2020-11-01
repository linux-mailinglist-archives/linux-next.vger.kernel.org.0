Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644942A21E5
	for <lists+linux-next@lfdr.de>; Sun,  1 Nov 2020 22:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgKAV2a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Nov 2020 16:28:30 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45699 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727048AbgKAV2a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Nov 2020 16:28:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CPTgH2SM4z9sVH;
        Mon,  2 Nov 2020 08:28:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604266107;
        bh=h5rib1kLcrsTdh/aTpy+8q1WDTAqgC7rgt3aRUKXM9A=;
        h=Date:From:To:Cc:Subject:From;
        b=lUbeJXDyqZFL/64L5dBvlkH0F3MbtPNArkgHz3rICeYl34azNd0MXKXKUe1qj4LUT
         2s7KAqzFT+Ap9kbs3pxSt9aARNTTJbIjQXAxoUCcilB+4ycKL+MKYZl1IB9RuaZSjZ
         +/3VjYEwVTfbzDPOuucPwkhWtkpLWLf0oTwfGXx0BVLgunnoP8pNZ3S3/R20dU5Q/J
         o/jqxX6p03uPSeLy3xQpbmirRn8xGc2+qbsNeAvNrizf2hRnRvTGucphpqsWGux/lV
         RE/74g7yRV79ls9j5+p4ocxE6NBsuwO2oRdJFv8k9wIq19cuPMUvB8T5O9oMfQ2jQE
         7gd1IOl99c4hA==
Date:   Mon, 2 Nov 2020 08:28:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amdgpu tree
Message-ID: <20201102082826.31820e51@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mcna.j2gdjD39PLbUAOmOK5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Mcna.j2gdjD39PLbUAOmOK5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  fdaa4cf1097b ("amd/amdgpu: Disable VCN DPG mode for Picasso")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Mcna.j2gdjD39PLbUAOmOK5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+fKHoACgkQAVBC80lX
0GwkYAf/Vz2kkIeY+tP08959b9hBd4xJLjAiq7dXGJXePQKVH3sQcYQI3dNox3Vy
wpiDz2s68HnBjXkJtVaPtjH0U0vnrIz+KVMZy17VwwHCS8BG42ncOquo3bx0o0LB
LChbYjYSxw+112V/XAxFghdwv2t2QYHlckBB9z/9Rzn012OjIsAUfXwTRkBImriP
/X0DlHEmLRdG2ubjoz12J7saLp6X65TLbxBXOwhgCmVJJH+mqg3yhBPfHqpSDd7o
iQ9etdc7fJ55mUbfD7Iuk2y1UGXM7tzi+H2uveQT8Qty83QMhbMyB1OjEdrd0BB7
rTfOkfvVIP83FRuVcXSM/djwQl1zaw==
=OfVB
-----END PGP SIGNATURE-----

--Sig_/Mcna.j2gdjD39PLbUAOmOK5--
