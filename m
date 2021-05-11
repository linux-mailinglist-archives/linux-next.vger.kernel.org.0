Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF57E37B10F
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 23:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhEKVxE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 17:53:04 -0400
Received: from ozlabs.org ([203.11.71.1]:41627 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhEKVxE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 May 2021 17:53:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ffs8C5cVqz9sX2;
        Wed, 12 May 2021 07:51:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620769915;
        bh=+PD2qb3jBwgaVAk7Hbw3sZGE+74JyVqVwMasNr2ztZM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KWpL2eCzpBLRkaP55d/B8hWG1mq/Vhk0uwsYaY8YviDFCZkbePP3Ct7IFSmbqI/eA
         OUWAKMe7BeLCiYjXflSmTW7pQsIKTENiVjmArNz265MLvUsuiEdRokoaNyQqKTK4vt
         8aC516hqKRhtfkwkbGo/e3MwHkHwWvBTWOeSZ7wBTAw+cPnjXZoUpKWEk8D/BPNaxf
         t73PT7vzn9lxgUCO27rkHjB8WEHIrBEbA9DDH7WsYTR8VQ2h3fYmNSw8rs2AlF8vIN
         WwyOUnD25HFeHEoulaG0rTbKZol19JafDR4VpyKSsTmhjhxYWltti5pv0k1DWP2Ioo
         30Nar75aYSwAA==
Date:   Wed, 12 May 2021 07:51:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the soundwire tree
Message-ID: <20210512075155.5b93c7c3@canb.auug.org.au>
In-Reply-To: <20210512075055.69047ec0@canb.auug.org.au>
References: <20210512075055.69047ec0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cqj7OV_K4yHz5kSNYcJQOYD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Cqj7OV_K4yHz5kSNYcJQOYD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 May 2021 07:50:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   f136f3279d85 ("soundwire: qcom: fix handling of qcom,ports-block-pack-m=
ode")
>=20
> Fixes tag
>=20
>   Fixes: 5943e4fb14e3 ("soundwire: qcom: check of_property_read status")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: a5943e4fb14e ("soundwire: qcom: check of_property_read status")

Actually this is in the soundwire-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cqj7OV_K4yHz5kSNYcJQOYD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCa/HsACgkQAVBC80lX
0GzjjAf/XRcmmDHA0PwdF9t5wVdyuSMqHuWfXFt+4OAZT0LBF7CGy+5B7oQoB0cf
4LDYnYTi6aBxvzGyZ5sIgqxy1bKfhdAqe1FMNMd+DCYqKXiRmDCG0Gr75B+v3OFQ
ewQ1k4XU1B4ZWnLp53W2mvQ+8Aj1aTirpcCfo19E8hn8fMnFpDXuYnzXM2iJZXxV
zr7DLIZ7gF1PvJQRaZv2xJAD3Kgk5MJ9Lmr5Cq7JEqEyycgvgTUYCnK7mRSIPgUk
9wdZRj+AgD6/NVVRG6vAi/M0u486jZi1ffs3G1YKQgIcWCRacJ+zPS14MuXvyINw
+8IT4Z6RMxJxT4uP8fftuqpRDGa/WA==
=3btS
-----END PGP SIGNATURE-----

--Sig_/Cqj7OV_K4yHz5kSNYcJQOYD--
