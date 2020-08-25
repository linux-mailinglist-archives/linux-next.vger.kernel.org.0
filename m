Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28265250DCA
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 02:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgHYApO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 20:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYApO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 20:45:14 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDBEC061574;
        Mon, 24 Aug 2020 17:45:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bb9J64kqDz9sTK;
        Tue, 25 Aug 2020 10:45:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598316311;
        bh=XZ5U/mRjH4bfGsLqiTjpO9nUgHwgu//el4h0ktVGRbs=;
        h=Date:From:To:Cc:Subject:From;
        b=C4WmnLKmTy4rAxXXGy9wq8ugEm8xrkrqKmoaAnUxEAHcpLXBjiyLMVggqrwxfba8b
         JZWYqVh4J/HdUqAHkTvls6xAz0fIKIHT7p0Pjn5b3xUPapLnAnhAI1Qud0IS6dm/fH
         oN8oEZYY4TNrbh62Rr8GhZyjBq7JIfdS8EuH4W3qlkZLedLNuoFwR+uw8tzjqkMNFB
         kEpnBvDwMR5rTpcWuqewP8z8qWN9r0bmsN8J3meGlROnyIrsIvIkAb5c40Kr1GAbyA
         zuSOl1g5fWpqWOBb7wDkUvW6Rsgmj3yLethFxlvP1XOOGlksWpunYT+Erbo70D+nVB
         oixodeUXeZMEw==
Date:   Tue, 25 Aug 2020 10:45:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Nikolay Borisov <nborisov@suse.com>
Subject: linux-next: build warning after merge of the btrfs tree
Message-ID: <20200825104507.4c79c433@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XePTgdGnGNUt+GcXKp37B_i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XePTgdGnGNUt+GcXKp37B_i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/btrfs/volumes.c: In function 'btrfs_rm_dev_replace_free_srcdev':
fs/btrfs/volumes.c:2217:24: warning: unused variable 'fs_info' [-Wunused-va=
riable]
 2217 |  struct btrfs_fs_info *fs_info =3D srcdev->fs_info;
      |                        ^~~~~~~

Introduced by commits

  2a6fac3ea9a1 ("btrfs: move btrfs_scratch_superblocks into btrfs_dev_repla=
ce_finishing")
  438ac6dd65ef ("btrfs: switch seed device to list api")

merged in commit

  76e6c55d5432 ("Merge branch 'ext/nikbor/seed-cleanups-v2' into for-next-n=
ext-v5.9-20200824")

which should have removed the declaration.

--=20
Cheers,
Stephen Rothwell

--Sig_/XePTgdGnGNUt+GcXKp37B_i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9EXxMACgkQAVBC80lX
0GzKFAf+IbDKqYrrbY9P7HvyNC6vIQ7vq9+5+ZfUF+eV1QXttnnkQO+2+/spHd5m
iAiYljDWvQtxEcL21XEZHrPDksMg2gCsgYGjf/LXfYjNiVQg68RrwyfWm1MPhZoT
C2qVXiEy9aDQ4aHGNQYEnu4z6zy//6BEhdLCJavGQt/W5htKDoWATUN2bADsHfAK
XQgTsSBndnkcMWj5Is/q//cpnGDhRJaBgihgvas6EZTUwkTqeyrGGt28wj3PslIB
UyY+yK93m/MuldLc7x5Hw50kEUpwKf42DIM2b2fGdOhWLk6fIDckISJ3ffqC3JJU
zFkmRfxIxFp5jVAV0JjAgUpUxG27Ug==
=r9aG
-----END PGP SIGNATURE-----

--Sig_/XePTgdGnGNUt+GcXKp37B_i--
