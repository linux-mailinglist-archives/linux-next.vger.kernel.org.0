Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05F62169543
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2020 03:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgBWChE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 22 Feb 2020 21:37:04 -0500
Received: from ozlabs.org ([203.11.71.1]:57153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727775AbgBWChD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 22 Feb 2020 21:37:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Q8V50nJ8z9sRs;
        Sun, 23 Feb 2020 13:37:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582425421;
        bh=iF1LmUYFEg93iV7aJIqF9r7DDzLjYsI+kw+08kbHf2g=;
        h=Date:From:To:Cc:Subject:From;
        b=nPtc66egQUO59o9577aY3oBBfrdkP3eQVDm8Lm+LZSFB4WmcHIf45QZoziFL+NoJ2
         sygOX4RgvA48iWfNAGWPN4YICqKJDDLFIh/2hMkT6XTupP/AmzKYl7DQmlglTWGE7t
         wrEXSuRzWDFXtK70AJZogOKFOjAcNOxAHhdlXHG8oYtiEWSapGZkOhNnNfEkvod2yo
         dCScgQSeirKrcLtQa6cDLC4SCAbnzSU/LT9QtNd3LUT+ZJFSE4KM02TysHQn6XKurw
         ozvjAqvF2pP8TURqgL5Lm2uQgDG3Ut4Fkl3spqdC5zAIh+Psr9szFm6OsxMw7pwT2f
         R/2XiIllMvu0Q==
Date:   Sun, 23 Feb 2020 13:36:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
Subject: linux-next: Fixes tag needs some work in the btrfs tree
Message-ID: <20200223133659.47fe9684@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5/HHZBFhvDuP4BC../=y=jB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5/HHZBFhvDuP4BC../=y=jB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d461d8be723f ("btrfs: qgroup: Ensure qgroup_rescan_running is only set wh=
en the worker is at least queued")

Fixes tag

  Fixes: 8d9eddad194 (Btrfs: fix qgroup rescan worker initialization)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/5/HHZBFhvDuP4BC../=y=jB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5R5UsACgkQAVBC80lX
0GyghQf/SQI55/C0LQhDgrE0P6g1jOCE6OeKrUFKr8EKaQz8DRiE4tUce1i8Xmh1
YTElRx5P1k/XyPeMDIeGH+iGunLGHNahc6LK58rMDat3mazbFGETaQkWzhnuEYbi
4DD0WAkBu0TT6eeMgzyyQTF/dQsRPZ0bwtapQWxX4IHWpqlekNIiTfu9TW6ynwgi
02KSwm0c6APvMobbn3zAduvHee+T7NhE6vHfCN3S04PEdi0W3ENblhcs0zPpvv1j
x7VcbakmZcDz1d162SvEhs4LnbWVJk8pQZSs74aVokp58toVLL3rIO0q/PvN0+UR
Ob1boOPmlrafIs5bWDpRjBVNu0o3pw==
=W4LF
-----END PGP SIGNATURE-----

--Sig_/5/HHZBFhvDuP4BC../=y=jB--
