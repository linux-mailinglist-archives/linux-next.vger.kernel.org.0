Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1463578B3
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 02:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDHAAq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 20:00:46 -0400
Received: from ozlabs.org ([203.11.71.1]:59459 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHAAq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Apr 2021 20:00:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FG1cM0Gspz9sW5;
        Thu,  8 Apr 2021 10:00:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617840035;
        bh=Z8O55YdHbi3MZg5cGU7/JVnYa2JZrrVCiR1q8OalKtE=;
        h=Date:From:To:Cc:Subject:From;
        b=CLflmq0r6J8KUHC77P5gSQa7vYY7otG6BAq0aCvGKNfQCBHoPGxfmWCKTXuJH9ECi
         AU0Ei0er0vaKUuw9ffVfbwutscssKasOdziu7OO2GC1PyL9lGCkICMNoE+vrXJg4rO
         Sjh4+zbElf4Uc2r02rNNKF/AJx/uOPiO2zSfsL+lLUv9f3N/OI5KocmICodJ+BVk7u
         mCpG7ZIhkMHliK4nsQpbBH43agebxmLk4qmynJn3Nl0IXLOqXaxD4avVl6FopcTpaf
         bcL+cPhN9QWH+3kpHMrE611mdZ5JSpZsQz3mMvPwIZzjQQZ66fXEDPTbUnX/ZHTpkK
         EXPXOmfT2JMRA==
Date:   Thu, 8 Apr 2021 10:00:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20210408100033.2113d84f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ir+82/2TzVXdmI8heNkSFcR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ir+82/2TzVXdmI8heNkSFcR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f48a273a4244 ("Bluetooth: virtio_bt: Use virtio_cread16 instead of virtio=
_cread")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ir+82/2TzVXdmI8heNkSFcR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBuR6EACgkQAVBC80lX
0GzCRwf+K803vKGCzZDpjJQg/99ABe+2jVULGQPeXJqWYKtYcBQxcB4TLuhL5UTm
pqD2eq6Qej0PS93PaBH1uUqkUj59HJa5uVXUfJjIY2ECpGgxVJ2HXQo+7KddDjQo
Huyq7lbF8xlmTYFoxv5Y9uG3eNNFwDYgwCChdvIC02hAlPgbrVAMa6VbAjDVzkNX
7+VE2YQHKsP/L6nTIoFeM5zEgxvvDAGgI5BcRLLRYHYHs5PyF4D7xVi/rxpCPte6
qzrMxHUW+FNXvFw+yGPeJShFgRFVEB3cQUZiJGqbyQ2MMeS0ZbvKshpw/WlkzOYf
Om0JAdcctXG/S09roT4bqCeB6xyGgA==
=e0bk
-----END PGP SIGNATURE-----

--Sig_/Ir+82/2TzVXdmI8heNkSFcR--
