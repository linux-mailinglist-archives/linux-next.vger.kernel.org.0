Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1749529905A
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 16:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782879AbgJZPBc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 11:01:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34597 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1782665AbgJZPBc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 11:01:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKdMY2Mxxz9s0b;
        Tue, 27 Oct 2020 02:01:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603724489;
        bh=DP4lrEFmt36v0RCu63f0nZ/HlLsY0ZcriqFUxoGoeoY=;
        h=Date:From:To:Cc:Subject:From;
        b=MwZMQU1GBV2z6qyE1rsNY0gw57xgwTYogLGZPoP3GuAecbIuOgTmglllSMB/eV286
         FV1uL3i01uOjbnLoZwY0Nv2oJcomoHKw0cnho8AkKeNBpQobc6uKS66+YIIcc3hirI
         E62eJ4V9QMwnyPG2gEKzgV87Gkgm/JJutht8JnVcZZ7VV35Xtskcoc8WFR29fE9bgO
         Vv9gmovifpxLPuSgcKQgoiVH+WIPOeQyyDmjZ4/entUtqOz0oULGMLTjN0zw/e8h51
         HfzLzHPRZkddyrvpOvaivwOz3e3i/cFxRRBMTTzSXhhZdPQc1TJXxpcHRxEipRA4Mm
         X/KY9k2adgtcg==
Date:   Tue, 27 Oct 2020 02:01:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the btrfs-fixes tree
Message-ID: <20201027020128.1034187a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uQEm5_cfFNZ5CQVTi80D7zf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uQEm5_cfFNZ5CQVTi80D7zf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ae1a53ee21a5 ("btrfs: don't fallback to buffered read if we don't need to=
")

Fixes tag

  Fixes: b5ff9f1a96e8f ("btrfs: switch to iomap for direct IO")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: f85781fb505e ("btrfs: switch to iomap for direct IO")

--=20
Cheers,
Stephen Rothwell

--Sig_/uQEm5_cfFNZ5CQVTi80D7zf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+W5MgACgkQAVBC80lX
0GxQTAf+Lz0x1nCKLB47UtDeqJeg80wJ4/INEXPOZjoDAYtXIWIzqBh6COERds6l
f7dFoJEbAiBE17WMy133qFA3fejZF2MX3t9FqYO9FJECUVntThbIp6xxAa0yNniv
AZs8vs86xz6BpyGrZ4iUIXTB3pdWfJTgjivPsNtU51nBtqcaZY5DwKz9g5cf+r0R
6r7ABmfKHqikVe2whViM0SGUp8PeSIZ1RAIUbOc2GIxe72fPQ82jlXR+S+dU7RQu
UbA04fmQjIizm5gdjy3W6MapF+3bWzr5eRTHFYao+mj+aa8ukWMdtNS9rmxN/k/y
/VMaCZiUcu3+1JX76sD4Wyo2Sk+N8A==
=rnbt
-----END PGP SIGNATURE-----

--Sig_/uQEm5_cfFNZ5CQVTi80D7zf--
