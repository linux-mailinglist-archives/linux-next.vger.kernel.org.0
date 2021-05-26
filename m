Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA99392231
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 23:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbhEZVlp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 17:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233357AbhEZVlp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2021 17:41:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8683C061574;
        Wed, 26 May 2021 14:40:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fr49j2j4nz9sCD;
        Thu, 27 May 2021 07:40:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622065209;
        bh=8x8GB8N/IBQv7ugJj9VaZJqSyrNd6NiKWkGarO5c4n4=;
        h=Date:From:To:Cc:Subject:From;
        b=e0CILBpRiYUHw2ayWZ6ohpD+R1ynLwZOij4xPtW0HC9qLLdJh4nJp4P/2E2kAIaFl
         aqnwi/sBMu742GsCuoqE/5dgaSI71zVpkg8ynWs5qFVNaM5FvfHlpFDwmwwMtac/Cc
         91HMfwfqJRhgqIUA9wRcZAP/7c4cS0PlYgOMkuCSg9BLB/zdZIRSrBkopux7Ots75d
         Sg7Vn6WRE+4EJKF5cImYUXnsRvwPA5Ji8jpCVNbimeaQa1i5+uN/BBOCMMAcH/id20
         bdUshq0ZVVFBa/YJ/nKrdwtduFpEMpg+/YgDfg7kAARDGNr6fY+zD2lT4Sxj3Q2PfB
         N/xQ7yiqCh7Sg==
Date:   Thu, 27 May 2021 07:40:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the omap-fixes tree
Message-ID: <20210527074007.462e1167@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2.q5xtPiUsyGwug2aExAPi=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2.q5xtPiUsyGwug2aExAPi=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1e195f9cef08 ("ARM: OMAP1: ams-delta: remove unused function ams_delta_ca=
mera_power")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/2.q5xtPiUsyGwug2aExAPi=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCuwDcACgkQAVBC80lX
0Gy1+Af+IAVweh/3fPzJSSt8CItQs+lds4ga2FWPnbk9mTsYusB65Q/LQB6i1XP3
Wgm2WVmPYFtGWvh160Qj/MasKFmKapNC+tnCSGUf9ooNf0RHuhAHLFuJ0ju/mP17
4Hm4AUIeuRjREOYl3NCn5pHUbp5iXMtK+T033daNeiPUXMCczjLQYxAWJkV1KQBJ
NSmhttreKu93WIBnEXZJvoOLOH9dMKu9aqhquQ6+IMThzrAJ2hcrZiyPfvk+6rNc
rErGhAYPJpa6wexwcccMb+nm/35v2kzotXSEokOKkSd53oXm7+qdfF9QgMk25ebZ
7yXJBuc/VYysV0KBeGI7xE0J3zaTug==
=5I0i
-----END PGP SIGNATURE-----

--Sig_/2.q5xtPiUsyGwug2aExAPi=--
