Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9627923E3A5
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 23:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgHFVxl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 17:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgHFVxl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2020 17:53:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76AEC061574;
        Thu,  6 Aug 2020 14:53:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BN2LS2FsKz9sPB;
        Fri,  7 Aug 2020 07:53:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596750816;
        bh=XwxwNSO3SG6BX2CT5JF82sNFU49GS1W1sjSA2z5Vb4w=;
        h=Date:From:To:Cc:Subject:From;
        b=nhcqN/RESk2PpCUnWFjEX8Ck7oDdlVvsCJUGFfzXTtJmmENf5yUiMT5B7h1fJRr/K
         4JHZPUowhfnOg0K9aSvoqBlfiSB9D7wMhwkQyNvJQAblmcROHFU70cE8cGdeYBiEmA
         UDEJS/Oz4yNSBfARkEFiL/F1hGj8CRMeGEbGEDNSqAFWdvRL7vByQuTtsAijqW88P4
         HItZJNHq+u7nDt/YcM3xbuk8fPAV2GaYrwx2ICNj0IXgVg0ZzoggX9TEREAOnfoO4S
         QMLoJ6rJ237ZfC3K43/T11kd8v3/1l3OrPH50by5Yk0DGX26ipdAKQcluiidmpTVUn
         hEV9mAtYyVy7Q==
Date:   Fri, 7 Aug 2020 07:53:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ext4 tree
Message-ID: <20200807075334.1b15e62a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z.4Hw4py2MT5EN7SW9odY4j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z.4Hw4py2MT5EN7SW9odY4j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c1d2c7d47e15 ("ext4: skip non-loaded groups at cr=3D0/1 when scanning for=
 good groups")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z.4Hw4py2MT5EN7SW9odY4j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8se94ACgkQAVBC80lX
0GyH6wf/W1K7HyLzAqF0bo/6Ftz6xodUIZ+GOpuFNN4JZvfw1tjTIsUpHaijXXHW
4Jeg0XA4FRj3dE2CHP9r2HikO+0aq6l3LaZQOQsWER5AZrPsj4cDFnokCnaBTqsD
4fN76NNtF+CE4hiws4FxlSRQTUo9l9de71qTqINp6PCWONUyjpZVN4GDzw8Mf48z
h6h+K0a6u1xUXDYOGy9P3QoF+kcVOaD9efn++mWG5UmhkZ37GnH8fxHO3e0R+iPI
AEUNTvIL9bmAk0G/PXE+0hrUO8Wc9U1lvAycCsd2K2ZFwljnqyDWw48LJf16MThU
sfYam2Jl+NzC/vVuZ5PIGULsV623lQ==
=Azbi
-----END PGP SIGNATURE-----

--Sig_/Z.4Hw4py2MT5EN7SW9odY4j--
