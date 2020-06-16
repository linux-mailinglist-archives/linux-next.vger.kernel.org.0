Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6901FA80C
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 06:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgFPE6h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 00:58:37 -0400
Received: from ozlabs.org ([203.11.71.1]:53941 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPE6h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 00:58:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mGDq2PG6z9sRK;
        Tue, 16 Jun 2020 14:58:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592283515;
        bh=7GLGFhL/QHujkVIIjcnIDkPTb/22qEvL8NhVUFJXMhQ=;
        h=Date:From:To:Cc:Subject:From;
        b=IM0UkkiaZMUu4MD3RSBy7mXdCx4y1GizCW0uOW4tVGuIVdxY4GKKPDJWvfCpQ/Xex
         8ZSSrU6Lvq11FLdxK9s5ibcMN+BCYa7g/1Sux1kByfjN2KZKsLeiHg15CFi0aLnOgP
         m4B15MskOKy0ItfLGKSt20S2stfq6a5bigspQr1PbD3CL8yG34dlbv556Ok9mf5mei
         0sVAnxxXfY1k56mVDrfhogFw0pLwto9g/8eEr8wGx4N5N19zebr8KFCsx/uzPhHSKf
         d0uT9yu10aEZPvGvkj4enDMx1Wvg9jPn7UuC+Oab6UPjBIHz4euOEKP7XhSYyqJkaZ
         QgNzakXRFRfwQ==
Date:   Tue, 16 Jun 2020 14:58:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shaohua Li <shli@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: removal of the md tree
Message-ID: <20200616145834.55a47e1a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ddnfssb2ynXpSa745Dk1n=e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ddnfssb2ynXpSa745Dk1n=e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I have removed the md tree
(git://git.kernel.org/pub/scm/linux/kernel/git/shli/md.gi#for-next)
from linux-next because it has not been updated in more than a year.
If you would like it reinstated, please just reply and let me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/ddnfssb2ynXpSa745Dk1n=e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oUXoACgkQAVBC80lX
0GyQQAf9EXcHmrNjuWnPThnnCDgeJly+6iHrtgh4oyzQEui0GbUwodzD4F9gMt0N
c6P2j9yQs3Ua4AnocMQm2MJGdILhCeZCbWQdbS44xfIQ27TravD+HRNr/MDjaIjr
1vahRXbkBMIGfa4YTaoePfVPMaNmSrmoRDa3hTg6deJoQwBKjD0DED+OKEXHeliO
aIIFlb/gtolVPT18sjD4VucxnvOffTUeEO5crVerLSHzcJrOYlD3UQp2SXNijbjo
C4C2qLO0ZGdUGxZHs01LbPVyzLQocFBEV15SYoMVRr/7SaNLHL1uFgpEuh7VAOhM
lke1d959IHgkTRzG+0aBUXKnnN8/Ow==
=oh4I
-----END PGP SIGNATURE-----

--Sig_/ddnfssb2ynXpSa745Dk1n=e--
