Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C2220BC9A
	for <lists+linux-next@lfdr.de>; Sat, 27 Jun 2020 00:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgFZWfj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 18:35:39 -0400
Received: from ozlabs.org ([203.11.71.1]:37803 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFZWfj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Jun 2020 18:35:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tsCr4Wg4z9sQx;
        Sat, 27 Jun 2020 08:35:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593210936;
        bh=VsPonw6HrvtILuUmVg8NGus9ev/th2BftRC+hjhjcW4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ayYazI4KGOSlfob/Mi09ZOrku1US27VF+kz9govPFCfBJrfkSTKBJPJMFr7kd65EW
         1iUFaXB8poPoh1cKHhSWn8kzMUm+vRFxDOGgvu5gjoUJVvawfgejGokWrJ9Eh8Cro+
         FH0uQ96qhQOJOWzATGThV3ZhRD+ZTI+1dR0kDb2rRs365bTw9UuJKLJ0Q0LGPkaB5o
         RDjXmUpziYUMO5uJ1uJAdoN5mClTN0tttMkoOnHbN70K3PiJiHWBZiPUYdIQpH8nz0
         XcP9UUgRLYUmhSNjiNqhT31px3ZTXHJ9cm/wDz8uHv5mITtz+Vok36ZPrnjMBl3IQl
         WZnEZFnSpty3w==
Date:   Sat, 27 Jun 2020 08:35:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: Request to add linux-kselftest kunit-fixes branch to linux-next
Message-ID: <20200627083535.0723ddfb@canb.auug.org.au>
In-Reply-To: <35ddf39c-1ffb-3099-139f-391193ae3526@linuxfoundation.org>
References: <35ddf39c-1ffb-3099-139f-391193ae3526@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SSLLzUWyxOIKJB_La6y.KX3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SSLLzUWyxOIKJB_La6y.KX3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Fri, 26 Jun 2020 14:50:25 -0600 Shuah Khan <skhan@linuxfoundation.org> w=
rote:
>
> Please add kunit-fixes branch to linux-next.
>=20
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git=
/log/?h=3Dkunit-fixes
>=20
>=20
> Contacts:
>=20
> Shuah Khan
> Brendan Higgins

Added from Monday.

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

--Sig_/SSLLzUWyxOIKJB_La6y.KX3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl72eDcACgkQAVBC80lX
0GwjrQf+PqRVfovciX7hwP2yb4lju38hEqFgTnPIQxp6L5ueVtrQ4deF9aSku0sM
Ei1MD2dHX5fpyM/S3e2X2Kj7wHqCGnRVgXeaJsdNFzdiBml5U1dL5tuzcGh1o8gC
uMFcR6YS681eI9xzUXnpFh6wqVOBdm6v4EQbvuas1KepJGUIAECHcBjXeu2JlKit
KllmTHa7dXThhnbJcZEviAuBX10jorgD0EorSUtiQP1ipxZ+yOFv5n2RJcUjjTOW
yYUmG7daFuluVcIh8BUapvVkcINSRNEXzBq68uDvWfne+vtihnIziirEgt2+TtW+
7jMdQu/M3PdijsnFni+1hJIv+xArrQ==
=22p6
-----END PGP SIGNATURE-----

--Sig_/SSLLzUWyxOIKJB_La6y.KX3--
