Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD79D1D8AF2
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 00:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgERWam (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 18:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgERWam (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2020 18:30:42 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A05AC061A0C;
        Mon, 18 May 2020 15:30:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Qty74L52z9sRK;
        Tue, 19 May 2020 08:30:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589841039;
        bh=bigoxCg1iXX5sCstqeE44NNN/1nfzI5CL5y/EfgzvU0=;
        h=Date:From:To:Cc:Subject:From;
        b=XqqnFt+cA6yTP0rR1HoWtcCXzWBQhc8g7W/oVKTm0SH6b949btij96UdHBOt6rflq
         jBsYbY4oSe6YjLxXA8qGY9N/w84oRj1/MHrU+H6Qd5vckC+rGQGg8QoqG0WV574ngm
         7EOSmVzP2pNJaccFWnwyF6aDrbu+tl5qTogTHemY5QIt3H1VxmeVeorjTPdoXDmInj
         oQ41d/Vx+WAuMxJSOXEe76dLb9wsGWNU15MR47Ab5LsPB0DCMelW563w+XgUGhncvf
         jwbPc5g25Vkr30WvXYEW+MSNUhcz7y1vWe78La20EIX2mjxvRgIVgVJUOG3FOyynko
         7tYtcp0NmZIWA==
Date:   Tue, 19 May 2020 08:30:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the keys tree
Message-ID: <20200519083037.39fbdd36@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1XO=K56dui0GKESkAaCqnTR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1XO=K56dui0GKESkAaCqnTR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2a1dbdae70b5 ("Documentation: security: core.rst: add missing argument")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/1XO=K56dui0GKESkAaCqnTR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7DDI0ACgkQAVBC80lX
0Gxklwf/WWxgRpiD46SBuf0Pm1DZkV/+oADDRo0wavY0GxQecY1tZww9gDE/Q63W
Qnb5wM1oYYK5tvqqU9E5LBz5ymsT/bAXB77xD+sun2/hGQ5NTior2hyW64EhL6eV
h8IXA6ZuPDITa7clxBS+LGMQVYepKtD8C42dusswssiQt5Hk4m8HpThiUwQr8RMF
Ice2keRXkjumJaMIkxtlPM3CebWglNlAhFm+nM5l2Eibg7WJuC2c51/bPzGj1t3I
R+lCgqYH6zfJkhNLLrljXjDl3smK6ub2mi5wMoHC7YIQk2XNomEb1SubfJXqQyJj
xSBaejBlOR0OVe0IMd3BYv97zrYuuQ==
=Jq3t
-----END PGP SIGNATURE-----

--Sig_/1XO=K56dui0GKESkAaCqnTR--
