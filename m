Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E85284C32
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 15:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgJFNFw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 09:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFNFw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 09:05:52 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAD1C061755;
        Tue,  6 Oct 2020 06:05:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5HlG0kH8z9sTK;
        Wed,  7 Oct 2020 00:05:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601989546;
        bh=q9mpa/0KffrcwWOYPGlh8L15Eanc/pISr+9iZYcDjTA=;
        h=Date:From:To:Cc:Subject:From;
        b=Z3LhaWQ63AkrZnv4Ays2nvFojIu78WkcEqwEcpcfR2TpahT2qxQhpUeye3fY6EV/W
         osa/GG+0YVOV7nTv71lQZslfZSiQj6Ptm5zkmYzVXW0G8D0fU32eGtOhJXQCJ8x4cC
         iW6wsPBN1sQPBlCtshTpUXjOs3jl0FAMqObGTLztYreYUUDHt0ApWTOKAxDcUeFgai
         b/piRFkgtm508Jj4P+V+R6DUoyMr9hLRvMdJyO354YFVzzULJlmvGf37Vn68q5Vt1y
         HvlVXnrPEHLjJ61+L03NVCKirVfH77NscHYP02QJK4C7C2iOIXsoef37YGJregrNXD
         rfWJPGT2vmbmA==
Date:   Wed, 7 Oct 2020 00:05:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the powerpc tree
Message-ID: <20201007000544.48aabc91@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F60SFxaoty6HOU9ZG//eX4x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F60SFxaoty6HOU9ZG//eX4x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3b6c3adbb2fa ("powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group=
 constraints")

Fixes tag

  Fixes: 7ffd948 ("powerpc/perf: factor out power8 pmu functions")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Since Michael doesn't generally rebase his tree, this is more to be
remebered for next time.

--=20
Cheers,
Stephen Rothwell

--Sig_/F60SFxaoty6HOU9ZG//eX4x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98a6gACgkQAVBC80lX
0GyhGgf/dKuWO59GS1sTLc4QQFWvP5GchwtYC0M3p6TOGGoofD6TtCvxmxR4DPG8
DcOvgvWF5hMq4LOE0Ts2fUpGpps4HdYewvgi4SiCBr7VWYZHWNEVhSO/VQZ66gn5
vEMVEozGw2JOwtSHvk/oNmT6sLeqpbYLzsQtdG32I5Oe+gh/odT6Eaz23T4NGW7J
r/TINbteFZezngchveOIGyN0lb4cOuHMbu3LClivARydqzHFhftgEnh5JHhOWSAY
ORrEHC5XkGPSv+OOTtfsWHYI6y4bjt1KkQ7vJ4IVbjxuYmQJcE7sNYy9Ku5/9kA3
/aNNq1R8B5To65aFGwfPHxroB/uYoA==
=oBxs
-----END PGP SIGNATURE-----

--Sig_/F60SFxaoty6HOU9ZG//eX4x--
