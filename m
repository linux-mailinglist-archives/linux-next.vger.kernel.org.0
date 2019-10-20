Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1BCDDC2E
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 05:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfJTDrf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 19 Oct 2019 23:47:35 -0400
Received: from ozlabs.org ([203.11.71.1]:43663 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbfJTDrf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 19 Oct 2019 23:47:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46wm1c1sdTz9sP6;
        Sun, 20 Oct 2019 14:47:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571543253;
        bh=o8+oIxUX6yzQsSu2d9m4mN9nvjplVa71+hajOmkXUAs=;
        h=Date:From:To:Cc:Subject:From;
        b=WGNmnQssL3GPAbwgq0KHD647FPMGkyxFF/ZyZs643sFuGmNewwlZdyBKK42CJXjkU
         kiyAxxHsYu2YdZSxtS3nPWDbv1qWRkEfCc6NFluMpOFxXOHvniNfGRRZ+xZCCfcADW
         uQwfBvQwrVzGJn/nz8hh4ECaD3XpGrA0dgmujvmyeypoxMDN4npEqe7dIM53xkoAOm
         7q9+DX1hR/D1Sn8hdTs+bjeRlcGQs2bRMZ3rrFNnZnlWnJ6TKpd02YRQ3U4SscM43F
         lhlphXLK9iUFXzV/rI3hIStpev81OzrLnwmQLK/4k0JABhPTmlyEX29oD6E0Soykam
         BcWOesOrL5VbQ==
Date:   Sun, 20 Oct 2019 14:47:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
        David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: cleanup the btrfs trees
Message-ID: <20191020144731.20bc0633@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/51z2qpfJ/LKQciMQK.jHB_E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/51z2qpfJ/LKQciMQK.jHB_E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The btrfs tree
(git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.git#next)
has not bee updated in more than a year, so I have removed it and then
renamed the btrfs-kdave tree to btrfs.  I hope this is OK and if any
other changes are needed, please let me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/51z2qpfJ/LKQciMQK.jHB_E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2r2NMACgkQAVBC80lX
0Gz0bAf/WanFsMIiVZ6LsXUxNoYIwVft/b1GOFjL+VF+HK7ayLg6yJ+S+TakksUM
mYQ/6faaBDzt+AMGhKh2inHNc8dnzrM1oXwBi3L2U55C3uGQpPEgvcKNLzBYUpGA
jqCF5K1b98Ok4cjajd8Eu4W6PQVvT1r3x9zgWutEtSfD16ULjh3Fq7QwEtVcYOvs
FD2Gu8HhtAqMrzHRPYoVic0gHus8lv3jLvP3a6q5nRcd01ianNAMrNq8+hTnh+3g
IDSB+XgkPV3ajsQN9pd2hKqZk/GP2em7r+KRYAvkG+hh/jD0dPcnU21wxXxB9Czz
Bd/wQjEJBvALkcBoo7bNfpj7YTvztg==
=LEVF
-----END PGP SIGNATURE-----

--Sig_/51z2qpfJ/LKQciMQK.jHB_E--
