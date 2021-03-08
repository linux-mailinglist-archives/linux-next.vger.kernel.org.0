Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A743307BE
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 07:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbhCHGEM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 01:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbhCHGDg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 01:03:36 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93F8C06174A;
        Sun,  7 Mar 2021 22:03:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dv77Q2bwbz9sWF;
        Mon,  8 Mar 2021 17:03:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615183410;
        bh=GFXWEsmq8fqIrfJpmZDA51hRRs+14qe2ORZUfq9J02U=;
        h=Date:From:To:Cc:Subject:From;
        b=mOPq0Gm+abyiGkdY8R+v0ZLhQZ5j1VkW6d+2bD16dPVpwM+/18qvQiDRHHOoIDIuj
         PyvgjFENwYh8s77zWRMGkPZ/0wKDYCixVce/eVXhYY7W0x0s80HT2gy0U6ilfYvlWZ
         kY2Ild0MBkMtJFdalNlNTizvJeMH1DGSEMOdKgNfrOOzrEGR60kXeWRSX8kkJaTmHT
         /nlR66mJ7JQHwuQur6qfn1fN3Ya7cGHk3nNCJseRn0r8dOLILujDcVBZWoOnYxJFLf
         FzeAAqpcTEY/kOfhWFXAroMjHeHTzo5d+fPAwj6EJDXExr9JwcbEmud3lg16mCiLji
         PiifEkJ5uIWzw==
Date:   Mon, 8 Mar 2021 17:03:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20210308170327.3fc9badd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iWT9OnWeUoD_58rFWiUhWb3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iWT9OnWeUoD_58rFWiUhWb3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3e90d423e754 ("EXP net: phy: make mdio_bus_phy_suspend/resume as __maybe_=
unused")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/iWT9OnWeUoD_58rFWiUhWb3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBFvi8ACgkQAVBC80lX
0Gz37wgAhDB6GNJfRTaQphdfzOFby1Bxd5rvjlwMT69PREAWNCMrlUUNcYGiKh0W
UqP+28xhpkaiZAOXkFB+wWzYsdufFb2K5DsaGBX2uA8BaeFBzzF0jXeetVKGSu8+
mS5aCJNVk2I2aKgrd2QbLrxx0ozkJi2/n6/jOzOL49Ds7Pr2SOIn3leBCTNGgbWO
e1h2GiWNDWmNDTvzvnaD9FWnF8QqnS81SmQ6Su/TrF2X36eiUM+13prZuGUnrmYH
NcSPms93eFim9sYO0ObAxzs7vuKnuoAMSlQ+gQEEjhtH7pbVlOk4JJI0Db3mNR0/
b3E3NZZ0+bXPWDaO6a00i1GEg8nSAw==
=tSk/
-----END PGP SIGNATURE-----

--Sig_/iWT9OnWeUoD_58rFWiUhWb3--
