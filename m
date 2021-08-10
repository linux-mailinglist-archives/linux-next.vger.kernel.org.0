Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB1E3E85FC
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 00:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhHJWQt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 18:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbhHJWQr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 18:16:47 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF11FC061765;
        Tue, 10 Aug 2021 15:16:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GknNN0KWvz9sCD;
        Wed, 11 Aug 2021 08:16:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628633781;
        bh=o+cglQLIotr3Y1Xh6JHcobmP+1AlGVcxzeiliZX3GiI=;
        h=Date:From:To:Cc:Subject:From;
        b=Gfzg4+iW2oqO1Qsg7WOkLwDBr9w5wj23nCg4kga8wPp3Z9cFm66EDN3CsIJmduR2U
         M/V6ZYyZEwUwOrCt2voKbj3KWmU5Wxf/thIWRhwLU/BUeZhmJv2DPizgMRZMkq2StN
         wiOOMNNHfWVrhTzf06eiDmI6zzJLJTTUNxEFuHyZp/T985k0gjUWhHNNuqx+g3hQ5H
         Xn3KOVxnosmXr2U4t5oI+tmEItJ0LkGjLrDLkniLUVfRerghEXaAApDtHDDvkU0qhp
         Yk2JrloaLXnmBBtB2nTdEZqeoFq4FGrlP8D5drfQZjhmOF2zOIoTZYkd+lvfk6eUJV
         gYV6oqPAxAy5A==
Date:   Wed, 11 Aug 2021 08:16:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drivers-x86 tree
Message-ID: <20210811081619.3d3434cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mTpN0s_=Ab.rly/fo02oUB5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mTpN0s_=Ab.rly/fo02oUB5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5c62c3d98b87 ("platform/x86: ISST: Fix optimization with use of numa")

Fixes tag

  Fixes: aa2ddd242572 ("ISST: Use numa node id for cpu pci dev mapping")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/mTpN0s_=Ab.rly/fo02oUB5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmES+rMACgkQAVBC80lX
0GxCRAf+KuoIpI0DU26V/X9tfMiav5x4xFJxKvbkP6J/dPJZF2pcaJQkKkdKxpPl
2JzW4SmJso+4tNZSu9fMsw93e9yGwZ82soC+dLwlnajTT/Qd1DoIFRwZc9U68zm8
gA0FDrt2Pty6hgmDsOw71mEOyElJCVX+p3kZpAUJZwuCEZp9b3nAtKKqeod+gr+g
06HIZl4mmFpW4gvBXd9UOn8VnIEXnYjOOixciVlFVY57Rw7ztUZvW2zvEUMsKFOA
iLTAR3ppYOmAdS8PUPN90BDVIPi6DjKVtguPhrxLERSoP9X9ODpsAREywAXZ2fUA
U+Diuktjb9HNiE6dkU0fUAlMRYFZJg==
=iNgF
-----END PGP SIGNATURE-----

--Sig_/mTpN0s_=Ab.rly/fo02oUB5--
