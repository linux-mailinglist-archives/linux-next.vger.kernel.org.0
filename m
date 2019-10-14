Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD8ED6AEF
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 22:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731534AbfJNUv7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 16:51:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35685 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730222AbfJNUv7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Oct 2019 16:51:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46sW2N2b7zz9sPT;
        Tue, 15 Oct 2019 07:51:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571086317;
        bh=+woaMqI+w+XO68IadXLSdy4fscKlqe58SOieYWQ5Ypw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ulw2JIpH/8IzePZKo4vjd9Uk90ON0dcTBRlxrfPMAY/qdi0DLoAuZmLVOysflP8VT
         6iPijn4IZq48VEC+9AHMXe4PGGQrAAVGSLr1YOdFNnvCKQYn7rVk9bo6lgScjffhrL
         ct5v4qrXrpiStm1L2cD+cAZKcXAtqTLejarj8ah5jGEzLjfHNtlGP7ppy0qb24WFqv
         hhyvpxHVjS52cYA61HSPNz++TipfH59OmUe1pmSh9RDxa1z/XoXuxynTFZoqy0H0FO
         8nBP3lu0b3YcC220YSPh7yiwpqFtBf5gZNOvnolYr5wCU71PS1MwuREXuXD3TeJCU7
         UMeZ6cGaNBmOA==
Date:   Tue, 15 Oct 2019 07:51:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: Adding thermal group git tree
Message-ID: <20191015075154.4858a256@canb.auug.org.au>
In-Reply-To: <540b4561-8920-f4fc-1b90-b013f20c8e25@linaro.org>
References: <540b4561-8920-f4fc-1b90-b013f20c8e25@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FYwws6uNwdDjB..rzTB9Mqq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FYwws6uNwdDjB..rzTB9Mqq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 11 Oct 2019 20:30:33 +0200 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> we decided to consolidate the thermal tree into a group which becomes
> the reference for the thermal subsystem.
>=20
> Patches are reviewed and tested with kernelci in a bleeding edge branch
> and then merged to the linux-next branch.
>=20
> Is it possible to add the thermal/linux-next branch to the linux-tree?
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
> thermal/linux-next

OK, I have added this from today.  I renamed the previous thermal tree
to be thermal-zhang.  Currently you are the only contact for this new
thermal tree, let me know if you want any others added.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/FYwws6uNwdDjB..rzTB9Mqq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2k3+sACgkQAVBC80lX
0GydYAf8DJTwHoLFPJDtU2zOhUrBiBPndYPRqaEZq3rt/BNcAw9fK4rp3eNfdTKe
UXyb29+Qo2u4GaeI5hNsKKWbc/7l0wmjjWQpd5nNWX4vGSjijMtouLu9Qtf7PLkb
URyWKqYSww708ybBJMzCARfVBlvDh9WK117Ktxn5hobfaoNdqozwdAx1z0p2Nz0G
/ySSsQY1CvKOQTwh1ZSynho3cSkPNx40IYrQiCu0lLJNyrjNPhqP+XU8Fz+pXw/6
UI8FCDIFr3QzQt+f2n1FZ7GIfRmJ1zLBulULocJePLufe2qg3rpkFp2rwOnfL+oN
+XQf/Koyr6OVSSqGsbUBZOqUcNiRAQ==
=nUSK
-----END PGP SIGNATURE-----

--Sig_/FYwws6uNwdDjB..rzTB9Mqq--
