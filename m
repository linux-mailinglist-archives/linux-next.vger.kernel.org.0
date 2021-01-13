Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAF02F443B
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 07:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbhAMGCC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jan 2021 01:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbhAMGCC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 01:02:02 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E4EC061575;
        Tue, 12 Jan 2021 22:01:22 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFxdr2y80z9sCD;
        Wed, 13 Jan 2021 17:01:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610517680;
        bh=66amEMKH7R70JstH/zmS7PgronKiGTR0zomde3LApDY=;
        h=Date:From:To:Cc:Subject:From;
        b=hxsz4mc+y9VfhE+svExmzp1arnyg2RYSCvkCjH3iTykfGbs7/4ekv23aPosC+IxXJ
         x9doYfwf0Z6vosaNDb9DNwr2qTNl1RZNBDDftFR2svpPJ1YmOUYg4lRdAb0Nxkgwq8
         yfHAW3KaBWW7Erp6uHdJK/92p5oDUauJQEee4//RnUkT3UUasocqSVSuLtov1pR/Zs
         c4JiuiQVGVY9u/i9Jbyhkej0yjcqd4/tvxOTcg8ipNHo9WAonVcN6ku7ZQ1alHhtNr
         al+gQjP9QGI7ACfc6V4uXaG3rNAVffUZRZizXsMI1sPMdZwSWx6cfSIuV4eqEMgQCe
         pENpMOEy5uAVA==
Date:   Wed, 13 Jan 2021 17:01:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the
 devicetree-fixes tree
Message-ID: <20210113170119.7e350597@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZNxTswUpX4iyRekv+22nRHJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZNxTswUpX4iyRekv+22nRHJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  79aae8a66926 ("WIP dt-bindings: cleanups")

is missing a Signed-off-by from its author and comitter.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZNxTswUpX4iyRekv+22nRHJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+jK8ACgkQAVBC80lX
0Gx1ZggAjoIbKvXdzs3q5w28ZEf2Fca1ZX4oLjb2HPT6JZ/ZIfBlzrahx0rHHYyX
0c25gXY4jbQ95cVaYixVxWHoqNVbK8InKQ2wR9KVg690RMMukhBsvVcq8qa77OMS
bSJlK9Wsbtx1o6T21H+chGen/SqPotduthzPb5nK+lPBZdgwF3F4cyqTTD9SWwXr
yHaN2el9dzpAWNyfzL/hxtkHBNOqUxzUG2i1dmZYZSfXYDkFYTh93Vk1K7yqRUTV
6cJd3jUHlCS6m8jdp9EydupAt5MEkbknU8RJo2tx9NwMg3E0C1TInv0s2UF5apt8
zlXLn072wNtPOdx4Ub5XIxxw0njXpg==
=gz3d
-----END PGP SIGNATURE-----

--Sig_/ZNxTswUpX4iyRekv+22nRHJ--
