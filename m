Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F611E764C
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 09:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2HAt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 03:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2HAt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 03:00:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366FDC03E969;
        Fri, 29 May 2020 00:00:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YFp54HkRz9sSn;
        Fri, 29 May 2020 17:00:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590735646;
        bh=JmdeQbywYmwyV5DYNQNCrP7115o0Bvo2NjplQUEC19U=;
        h=Date:From:To:Cc:Subject:From;
        b=t7o0zMk39MfSn+z0OXJ541E8kh6fKuh37wgtjUNgu46YPG2RfPGZEoLdqMslLx2xH
         ADgMhaAG5o1sA9G2CqaXBpYGp98rbJEmctC7hoh5XeTM1Jq+tsqHoPoHaf++PogK9G
         ePIkICr774H/2ncp9qcpeP0pr2okkCFjTh87Tp/SrIVx/glXHDB6JKHh0DmIxOYTU2
         LSAzEuw770aUvjokpF1uUrMuEAOcPgTbHjL37n7a2fRf4zzeEFtEhfYuezmpEg/0h7
         wch9Oc4Wj4JfI/7LchUF/ebWmwFeyP+td2jhIuH0tDnC+vX0NGmoOhdJUH46/SoktD
         1cShFd0906QyA==
Date:   Fri, 29 May 2020 17:00:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dave Martin <Dave.Martin@arm.com>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20200529170044.2e62a967@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PyDiTgV.oa11JTTo=8f7P1_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PyDiTgV.oa11JTTo=8f7P1_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/ptrace.h

between commit:

  8ef8f360cf30 ("arm64: Basic Branch Target Identification support")

from the arm64 tree and commit:

  d9d7d84d9906 ("KVM: arm64: Parametrize exception entry with a target EL")

from the kvm-arm tree.

I fixed it up (I used the latter - the former just added a blank line)
and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/PyDiTgV.oa11JTTo=8f7P1_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7QsxwACgkQAVBC80lX
0GzjFwf/VJmDAF8MiYhR7ye6FLrsjUMwLZ8kRLiT364odDUlE7U4dX2emsDJamXB
SnYGmG8wyt/0EJ3H/7WiCojnC0yv+oylJwily8MpUjwktBLE28R8mznDXk7nRFH9
oMuyNSmZCtU/qTXMsJORvvIbFYSS6ikAZQqsB+wpQdFHT2GqYTMpSYJpiabdBId0
tH4uZAM087ywHl/GTA6uEtTRVGEjc8mjGaRo57TVdfLzafahVkT78PJVHL34wRGb
9sA5yTZTMJ/ViyAwV1wUDXDdt8g1HlytBgKTJOVH3GRNzo8NEg6MWAmAm9O6C3lR
E0q7uIreRT+U8mvvjdl5Uv8NOyVLNw==
=pTav
-----END PGP SIGNATURE-----

--Sig_/PyDiTgV.oa11JTTo=8f7P1_--
