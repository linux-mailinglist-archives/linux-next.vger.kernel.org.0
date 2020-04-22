Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D261B353B
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 04:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgDVCzB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Apr 2020 22:55:01 -0400
Received: from ozlabs.org ([203.11.71.1]:34107 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbgDVCzA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Apr 2020 22:55:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 496Q5Z1Pblz9sSm;
        Wed, 22 Apr 2020 12:54:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587524098;
        bh=T8qV6w7B9lBd+fsLege8VP5ioZ0Edf4sm2JMw8Hx1IM=;
        h=Date:From:To:Cc:Subject:From;
        b=eZUdjEYlpde+MRRLfX11VgjRNJvS0x+a+/rEUa5c3Wy5B7Hgw6P/Ab0kHz5KhzidU
         43pNy7l9Mfw8QU+Q1sIXf6UlsOVefRZppC7R/b5WobMmN1Av3uAWfTR6ni1qVfDSSA
         RCwdKd1G2I358jJ22GHwiDirGE6eUq32CGNkfCJ5iiPkzsAbhHUKYPysssFRutrCmt
         pYXZesKu6VohTaYhowRi6fONHDFuPoCSR0DVy26neys+5y7LgsE27Iq1ZkkDl9Ulwx
         XpORvmaSw+DuBxwpShdMRViQIzzEw9QvCbRtepWCfDNemBQxR7CwXEp4dE2tnoRyD0
         D9jMO7iwSjB0g==
Date:   Wed, 22 Apr 2020 12:54:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
Subject: linux-next: build failure after merge of the device-mapper tree
Message-ID: <20200422125453.2fa88c9f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5yGH2uSSHj5jJy+4lHEyjU7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5yGH2uSSHj5jJy+4lHEyjU7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: "key_type_encrypted" [drivers/md/dm-crypt.ko] undefined!

Caused by commit

  5cacab0334b9 ("dm crypt: support using encrypted keys")

CONFIG_ENCRYPTED_KEYS is not set for this build.

I have used the device-mapper tree from next-20200421 fot today.

--=20
Cheers,
Stephen Rothwell

--Sig_/5yGH2uSSHj5jJy+4lHEyjU7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6fsf0ACgkQAVBC80lX
0GyNaAf+PJZU/6KC9mVuXUASOLXduHbynXjRruymtnmzoSgF2br4AI+VW27V1X0V
5eSptr/S5Z46SlR+G5Se5gN/ng8i6GHD2zvu+TECxGVZG3ylMTJ2qWsRfTWR34VV
77nze1NUXuF7ClY4d2oGvMi/TMhsdGa9jU29foaDv7SybeLstt6wdR1Mub6ZHWzB
khA0kRyPOTyUykfrt3j26cO72ONt3HUHdi2SUNff1mfDoRgsXR8HxhD31jUWlIFF
FD7mj5R4NPBkw0bTXY17eOtJ48FelucbTAV9Upt+uxdrl45gPFefc/0QbxR6G02u
Wtq+xl28saiXtildBXRKEfnC2hqgxg==
=C2wQ
-----END PGP SIGNATURE-----

--Sig_/5yGH2uSSHj5jJy+4lHEyjU7--
