Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5972B39D26A
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 02:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhFGAuO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Jun 2021 20:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhFGAuN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Jun 2021 20:50:13 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F94BC061766;
        Sun,  6 Jun 2021 17:48:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fyvql6pCBz9sT6;
        Mon,  7 Jun 2021 10:48:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623026900;
        bh=aCgb5smwR4VG7B5IC1tlkCJWklGlU/VI5tAz85+63wE=;
        h=Date:From:To:Cc:Subject:From;
        b=Y1DZxRoDSoOyRKlHCgp7FToeE39PFUDVHfMRe4R0VAy7muVmqtw32lUl67gB58mYQ
         SRtExHSUJKiRhjucHRmMvZ02rrJf2cZzJZrLhG2aoU8P/5GQ1VXrxnGfmBsRgEDqbH
         hjOwnJz86hEzO6pP2V06aoEGxgt377zV+xKr3LUUPO/vUAgUkOxafzDZmIYtWaKEvJ
         ICRZrM7JByQmEXQsMaweiFPB/GiSzVW9JGazoFbJymmfyR3r5Ajyaf30qEyDZyI5KD
         ajJ6ZtWp1+E5VzAvx5SqwTrAZzv2oXwKzv5DeIDUAwlJ3T+2JxyHnen2WAgfEK//Ri
         e1CcV6qLpb5rg==
Date:   Mon, 7 Jun 2021 10:48:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20210607104819.2c032c75@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YE+qMcNo31bYv5l4MYtG0ad";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YE+qMcNo31bYv5l4MYtG0ad
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (powerpc_ppc64
defconfig) produced this warning:

fs/xfs/libxfs/xfs_ialloc.c: In function 'xfs_difree_finobt':
fs/xfs/libxfs/xfs_ialloc.c:2032:20: warning: unused variable 'agi' [-Wunuse=
d-variable]
 2032 |  struct xfs_agi   *agi =3D agbp->b_addr;
      |                    ^~~

Not sure how this came about, but somehow DEBUG has been turned off
which exposes this.

--=20
Cheers,
Stephen Rothwell

--Sig_/YE+qMcNo31bYv5l4MYtG0ad
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC9bNMACgkQAVBC80lX
0Gz2NAgAjCv9pQa2V//07lwNVEQwbiKu29/zJuR1jT4hw/+mJaXhg8TILrg5Srpz
W1Bx3fpv/dG/17wEmgWSG5GQziGFBZzID6OIwfHJ0k2AzdvTPo4ZGSV/W3KAVhYR
rjb9p0T6mULCYUWdrzzN2e65aVI9lROgp6L2pHe7xPI4XaTvNnR4rUHFKmHJ4eF9
mTnspfuUnhff4Q+EMeW5VKY7nsDCfRDnkT9LegKS7nZhQTZ47pWxuUdV02bSQ48l
/h4j6rpBP2CjxxVBQkbp4JzOC1jedf7WpdwJEL0Dx2kJh/2qRj3b1XTiyrz5VUS7
w7twzROcxCzA8LWQeGfmMoCkJ3nZoA==
=nmjw
-----END PGP SIGNATURE-----

--Sig_/YE+qMcNo31bYv5l4MYtG0ad--
