Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80698A60B6
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 07:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfICFhW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 01:37:22 -0400
Received: from ozlabs.org ([203.11.71.1]:50253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbfICFhW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Sep 2019 01:37:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Mwgz304Xz9sDB;
        Tue,  3 Sep 2019 15:37:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567489039;
        bh=w2qxb/Sy3tUOG8PCSjAokLxDpGJoDSR4BWpfSvlbetI=;
        h=Date:From:To:Cc:Subject:From;
        b=CQp9btUDrpbrM1BnGpNTYBwTDy1EZESCOA4T2Cv/2/+acHLFoGY39/rdf7hb4A8oX
         I7qO9JHVKHX7M29h6OsmEa3F09NxCODi0+vVdYG2lnmfLWVpdcNYviMkMH3v1D8FDe
         Be5YyYDhj9tVK+qhCx32fT2raTrltJHIj4gTGHTJ9alarudQMu4leMDetCzPJqNWBL
         PvO18xw4HdO7iLRrq4331B2KifGT5MlkJpq0jTLsOzz2R7B676s8rKaTB8iJDC6vtr
         LqiHXaO/kKOg/8sBJo+YO8fSQwJuAMQSR1CePADV1/Y3Z8SmJCGT0YGbKWwC1zSr0Z
         yR38H/0KlmRUw==
Date:   Tue, 3 Sep 2019 15:37:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillaume Gardet <guillaume.gardet@arm.com>
Subject: linux-next: manual merge of the devicetree tree with the
 samsung-krzk tree
Message-ID: <20190903153718.14b7a5e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RqZ7B3jqbL7dCxB30Rif/Pp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RqZ7B3jqbL7dCxB30Rif/Pp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt

between commit:

  5833f5a5daf3 ("dt-bindings: gpu: mali: Add Samsung exynos5250 compatible")

from the samsung-krzk tree and commit:

  553cedf60056 ("dt-bindings: Convert Arm Mali Midgard GPU to DT schema")

from the devicetree tree.

I fixed it up (I just removed the txt file, some fixup will be requide for
the new yaml file) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/RqZ7B3jqbL7dCxB30Rif/Pp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1t/A4ACgkQAVBC80lX
0GyQ0gf/XygfGSv3zzO6U7Sn2FwEZVlhLXfXh2k6n1bjF1XKXyE0gTHUOjrJp3Z3
nQnf8t2clU7LnjVzJXUwpTmB02aZxmo3EcYk9K/f9mxlj083tLAgZ9WMWBbbrnAC
WSNEF+dz5MgNVwVl2y4ihZUh+8T/R9VJMj6d9sfZ6NYEyYQ7z08Gjz9z94XIirR6
WnPt0/Fwgb3ArP2sQF1XAdjUYlpl5G2hLlvqyd6gjOPVCPpOmc6lWDGE9UKtnxt3
I38jZkolLuQ0RRNdSkhz3DZTxrnFfgQLz6wPSm6Rms7YKZnNIOXwMXYAxLjmMO22
vLrFDXDTiBf97nuNZC63qQHewcELjg==
=fXpN
-----END PGP SIGNATURE-----

--Sig_/RqZ7B3jqbL7dCxB30Rif/Pp--
