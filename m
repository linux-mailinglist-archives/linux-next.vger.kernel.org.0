Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B28688952C
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 03:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfHLBal (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 21:30:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60529 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfHLBal (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Aug 2019 21:30:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466JFT1j9Mz9sP7;
        Mon, 12 Aug 2019 11:30:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565573438;
        bh=ycnuaxxCviDjlprrcU6bj2KTDUtMKAFm4aMQpCZeFKc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=n0LhE3HdHO9KD6Ba7lOWaMe0hWIqzzi8cNhFNVw4m6+yo1TevrC7+qVhX4M7+imYy
         UaNWXNPdFyhrLmhfiDxeLEKbiwA8bL8VyhCL1yAed+KCGAOAkb6ibCVqo5vD/+dzWV
         TWD0tujyQA/SNI1+nfV6WYgOAcxMOynNxbZk5d3KALPNHR0cNTfppVrqQ6BVJseOf+
         wE3M12lAvoY5PvK6i6qxXFTfkNICG2zudyuPBHiLVBpBWwWYNj9iZlOkploPpFP0kK
         vGCDpDRSzNgKist/qVi3x2ahJuCU9GMP6154HTbCcm5xxgITqEupZ1lPWUERoqE+Ku
         KSgYZPcs4TyVw==
Date:   Mon, 12 Aug 2019 11:30:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     john.hubbard@gmail.com
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Ofir Drang <ofir.drang@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/1] checkpatch: revert broken NOTIFIER_HEAD check
Message-ID: <20190812113036.7a5dd650@canb.auug.org.au>
In-Reply-To: <20190811225443.31161-2-jhubbard@nvidia.com>
References: <20190811225443.31161-1-jhubbard@nvidia.com>
        <20190811225443.31161-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WuFc+e.ptM4HNUcVgI3bsBc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WuFc+e.ptM4HNUcVgI3bsBc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi John,

On Sun, 11 Aug 2019 15:54:43 -0700 john.hubbard@gmail.com wrote:
>
> From: John Hubbard <jhubbard@nvidia.com>
>=20
> commit 1a47005dd5aa ("checkpatch: add *_NOTIFIER_HEAD as var
> definition") causes the following warning when run on some
> patches:
>=20
> Unescaped left brace in regex is passed through in regex;
> marked by < --HERE in m/(?:
> ...
>    [238 lines of appalling perl output, mercifully not included]
> ...
> )/ at ./scripts/checkpatch.pl line 3889.
>=20
> This is broken, so revert it until a better solution is found.
>=20
> Fixes: 1a47005dd5aa ("checkpatch: add *_NOTIFIER_HEAD as var
> definition")

Thanks for the report.

I have removed that patch from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/WuFc+e.ptM4HNUcVgI3bsBc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1QwTwACgkQAVBC80lX
0Gzc/QgApOFkdaFpPZwPnhNs2noiONSVhCVI7cv+EqtUSnTr2FiuYJXNi5QKZ4fI
ggllREfOxuA9Aew2lcFPS4LALiiJLhwWdblhwfROKUBixQtr3JdS9+qBP4cP0Evk
LdKQVY7xo+Ib+R8/ylw0L97PWvIZEhgWngKdtooZYS5m0sN5C0XgvNXHIg0YK6yH
4s4Hgsu+uO1w/tNVFKUxpWiQuHuqDoVTxpIS/y1XghrvSk7szk93ohIC0xYZslc6
jW7bFjCMQI78UcfUcOg/9r8mSfXsDttTnCrxx0nyn1XQg+R/si8JEcYuwkkiCymb
ZkKAhXodanmRJuuKIeOTTEzuRct3Mw==
=7B0q
-----END PGP SIGNATURE-----

--Sig_/WuFc+e.ptM4HNUcVgI3bsBc--
