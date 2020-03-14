Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40C0E1857E6
	for <lists+linux-next@lfdr.de>; Sun, 15 Mar 2020 02:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgCOBrk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 14 Mar 2020 21:47:40 -0400
Received: from ozlabs.org ([203.11.71.1]:50001 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbgCOBrk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 14 Mar 2020 21:47:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48fj5p2pj2z9sRN;
        Sat, 14 Mar 2020 23:47:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584190079;
        bh=Q5DgF0waz9uQBuR4s+6iPky8AEpNRI5/Rx5hxa5Iecs=;
        h=Date:From:To:Cc:Subject:From;
        b=h/Dx6Y2g5VrM0EVcgKgNo1cn3KJaGZUPoikFwa2vRule/YRYlkyouwGIvyB1hU9AZ
         p1dsvuyGesZawcqisembzFY4HLa5kHBu1LmLzeKKg1LlQbg92WBUGrqIdx6fbcHeks
         NcP0zcbd+EzIheUaGdRW8+uzaUy5jdZ4EU1owuVUMHLvp7Nh47UG2sDNhux0L/pOIw
         Wu98uXgP5+bm0GnBkzOjgFOcm59ntkcF53YO36DVqjPB1c8XmbbaKtTURi0wPoNJ+T
         Fd7BIm9qrE5ftW2HzIyXWkubCI7KJbqx3UNiwXtUD3eJV7SlA9hB66YsE/7sZSjAfP
         sLZDxExc8bhEw==
Date:   Sat, 14 Mar 2020 23:47:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jeff Layton <jlayton@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: Signed-off-by missing for commit in the file-locks tree
Message-ID: <20200314234756.05c925ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C=spu8ayGbCN3+CLN_1pkly";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C=spu8ayGbCN3+CLN_1pkly
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  86eb9b936e87 ("locks: reinstate locks_delete_lock optimization")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/C=spu8ayGbCN3+CLN_1pkly
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5s0n0ACgkQAVBC80lX
0GzbQggAi0GH7HoTo4xH2miS5LXCrqTDCNx6KMyitd0iqaCpw839xXD+MzH/LabF
rdf1Wn6AkPPR9EsB9uh+JNjSlzysRnmpafvdUUpFWNrOBoFVQFdRkw/3XdDsrtIw
eDDfzYwBa5P4qT+72QA/nkWtNSA9N8hwZqhy/2jZE3AvQkAtU6G1xLTizggcwRPr
rg9fTWf1XttN8VFoWiDFVKHvFEC7QNFndi4qPzDdRPbLPLH1z3GNmBwBztNx4NWV
rK+2re9UpYN1ZM3QS9e1vw5VBcK+7PmkElaLTngkOiqXo0JIRxduvVwE066GncK8
t6NG8fwvs89baE1b+s7m4yCcOfuJpg==
=3VGy
-----END PGP SIGNATURE-----

--Sig_/C=spu8ayGbCN3+CLN_1pkly--
