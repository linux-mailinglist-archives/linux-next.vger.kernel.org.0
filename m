Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BC524A8D9
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 00:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHSWBW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 18:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHSWBW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 18:01:22 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D63C061757;
        Wed, 19 Aug 2020 15:01:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BX1vL2hBQz9sRK;
        Thu, 20 Aug 2020 08:01:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597874479;
        bh=w+A/HsFnmPrTXS0lnZIHH+LtYazCOyLKow6OJCMjRi8=;
        h=Date:From:To:Cc:Subject:From;
        b=pxNT7EnJgXLFO+1qFF7ZNT2uYXM595p/bzR/BYBYJkUHiwaM58A2EqnDWH9XSOyoi
         nSt+CHbR7yGjzo02FVbxkiS4Cbh0C2D2kAOW/kuoohbOu4CYvhOqAe+yA4wIMwNd9g
         gXWHXO/eCbbynObzOfyidupcC6SnaSizN7J/6W7eWc/5BOY9wvioexsBGHCOks9FPq
         y1uxKybgsribCpNYzMlcGGsfyUBJ4MDfNtQp3FkjrzhCGCz2HCMlDuVFV2MFQM1soL
         A7tcwYh+OgatiVnUSeMMbZ2PEYfVfdWw7fJtkhm7sE4loor4o50mIXxLVkO4qIQ3K3
         QOH1ItzFTZc+w==
Date:   Thu, 20 Aug 2020 08:01:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20200820080117.6d7bcf00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x56PyRCkr9nLVDQDK3B82mk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x56PyRCkr9nLVDQDK3B82mk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ceac7fc18ac7 ("opp: Enable resources again if they were disabled earlier")

Fixes tag

  Fixes: cd7ea582 ("opp: Make dev_pm_opp_set_rate() handle freq =3D 0 to dr=
op performance votes")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/x56PyRCkr9nLVDQDK3B82mk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl89oS0ACgkQAVBC80lX
0Gwlwwf9Hr0BpC6I0KyNJjZGFLYxd7On7EKeJ7VZVTDvEUqj7pMSYaWNAkJHxHdw
/tnrx/PGdVr2cOT8DLKUUDgzA911B0odWrY8OV0emfyKEwMOHmTZA+C21iJp+KnC
IaIp2DBCgK5nrI1v5UIXyKd739ebAuvYwSHUJhaRcZD7WWBG1StkIUlktwbpA0BO
Dqckm6ovoP+cKbXNAFff6oeA8fTtPE3zxkeEQWUQ4v4DokyIrMkQV3CF87xScDys
TbGLdx5OuDLlyYcOm2SXbAStTlyvOFsMqKvHZdHa7GLbRsUBc1b0MbPHscHKd2Bk
0SpRaqXvkbOj5sIVY6h62TQkS7wKbw==
=hSbf
-----END PGP SIGNATURE-----

--Sig_/x56PyRCkr9nLVDQDK3B82mk--
