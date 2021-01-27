Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D03A305312
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 07:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbhA0F7b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 00:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbhA0FY4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 00:24:56 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFD0C061573;
        Tue, 26 Jan 2021 21:24:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQX8X31Xzz9sW8;
        Wed, 27 Jan 2021 16:24:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611725053;
        bh=/JAM5q+VErmzCB+wD8zfoahFNxWaRfiQ7fX/mkhZKyk=;
        h=Date:From:To:Cc:Subject:From;
        b=JnSqVluGrJnRM/QpLmJDBPW3coy9++a20HOI1EIjdxyukkqVG1NnZ5ERrF5PKzPeI
         9O3nmnvHp8fgG1jUqYXDzXpB/6ePxFfATtK4oh3zbMgwXFKN3HNusudHElG/+l7wE9
         vS3fRazrdU2Kp382x3VhURX2GF4eSRxZR2wkw/w84tsIZOgAJvpKWLI5SuDw4h3DMl
         XOQDyu09KJlz0+A/a8U7Sv/HkfBREQYsAyoZK7uWg9OHAiWgFn1tW7C83sTBcrQ3hQ
         8aSDaJ1xy6tKulnIx7+h4IMUQC6fvhrKvodxwtDmo8qxYn9+ZRr5fouiCrcWKJjrXm
         6EhQK6FnTN2Lg==
Date:   Wed, 27 Jan 2021 16:24:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     David Brazdil <dbrazdil@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20210127162409.45bea5e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ujyzvWu02HsuFo04IhnRn=+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ujyzvWu02HsuFo04IhnRn=+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/kvm_asm.h

between commit:

  7001d4af926b ("arm64: Drop workaround for broken 'S' constraint with GCC =
4.9")

from the arm64 tree and commit:

  247bc166e6b3 ("KVM: arm64: Remove hyp_symbol_addr")

from the kvm-arm tree.

I fixed it up (the latter removed the code updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ujyzvWu02HsuFo04IhnRn=+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQ+PkACgkQAVBC80lX
0GxLjAgAnIhWZRcid/ixaJYoXKZ8X+9yUi5rB6P/y40jZOkGTYR2EAvYa3yaX0b3
ENG/+ncuG3NkEpj/c5fWCVBn/z35ukmhT8AJJiatjKr3k90Wfx9m4lpzQZbamiwu
ZvqCFswL1pPEkU+VcI0Gp/EOWS7hwYIE58+IH4Zvd5efKIkjd3MSt0tXrMy+cxri
Kw7r/QL2kJOg0WpV7OBac4TnaJj+MGA+bQrMWVUvvXwZhIsz4MDEcoLv/lXOuQt7
HaXXV9XEq3eki498CUW0pvhB32wFQfJAj0RwfvHfMYz4GcMIEE53E6kHs6ngIJYb
t/ZUR6dcLOQB0wK/9DRp5a2LoUuRtA==
=kChN
-----END PGP SIGNATURE-----

--Sig_/ujyzvWu02HsuFo04IhnRn=+--
