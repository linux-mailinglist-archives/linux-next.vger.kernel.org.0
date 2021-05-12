Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D9537EFDA
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 01:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhELXdj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 19:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349910AbhELWtt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 18:49:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9726FC061243;
        Wed, 12 May 2021 15:40:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FgV9F6glfz9s1l;
        Thu, 13 May 2021 08:40:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620859202;
        bh=Navsh3UkHyNKtYmqFDF2NfsG/JY/pBhTfFzjx8SufpI=;
        h=Date:From:To:Cc:Subject:From;
        b=Dy+WWJKabZVQJkIWX+TqQbcG229a4mw7fDBsadcdglRTa9GeaJL5k7JRTaqw79QVU
         7f0TnwaAr7Q+2GBe9ZILAcgabR2i7o1IeS1RFb8P2BGWc7iopJ24/W4ir2eFfZqNZj
         NGYbc3YGpOQBt4JRS7DySJe7Vhf8UnyrlxystuTff34wVxN6AFouvcDbG2oo+jr8No
         b9eiPSJNQ8DXeuECBZg8q+Td51VvdAERNqwYcIt9MnUIfR1i9Ev435X/UQXf+k0cbY
         fKm+RDK0iuz8UMvgpR8l318ZM3W7OBF1I2xY+WZ5RbcPJlhcyGQF9PZplw4XAJHkiT
         HSxEbFskd+VoA==
Date:   Thu, 13 May 2021 08:40:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20210513084000.4af670f7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bdJ0x63OQ2JbiYRGOutlyRT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bdJ0x63OQ2JbiYRGOutlyRT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ad839121dd4c ("ASoC: SOF: Intel: hda: fix index used in inner loop")

Fixes tag

  Fixes: 6f5d506d7ff1dq ('ASoC: SOF: Intel: SoundWire: refine ACPI match')

has these problem(s):

  - missing space between the SHA1 and the subject

Actually, there is a trailing 'q' on the SHA1.

--=20
Cheers,
Stephen Rothwell

--Sig_/bdJ0x63OQ2JbiYRGOutlyRT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCcWUAACgkQAVBC80lX
0Gx4DAf8CZfKIOmQc9cNqckYDSoC71PE4HQ3bnLmSCBq0+Nz4FinkBXVTLBhfqbR
brsk9hdXBO9MHRUYXob5wCt2v9Eecu7Vviqll+sYkpLDvL7DGQfHErvxy4TJRus7
vo6BuN8G4EDOFpLXHT1osVh8rwAisqk4HRGJOtUQGtlFd3c7wQKvT0Hqhh6vVV5W
2iZRyoFbwT/X4YInrm7qwkuBDQtIuEZkZyLYthaTkl7uWQuuGoP1A8ZRz9Aw6HYm
lJCijXWVWj4rkMdVpCNdjYDNMzt08RQE18JB0SAAnnQNQ3XSjKPGeZFx/Nyd8Twu
DgJhIKJqm+J9JhbvtRxBCPmlkqXsgg==
=12eT
-----END PGP SIGNATURE-----

--Sig_/bdJ0x63OQ2JbiYRGOutlyRT--
