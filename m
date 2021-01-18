Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0C92FAA2B
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 20:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393941AbhART2x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 14:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393932AbhART2o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jan 2021 14:28:44 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B7CC061573;
        Mon, 18 Jan 2021 11:28:04 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKMJH5ZTfz9sVS;
        Tue, 19 Jan 2021 06:27:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610998080;
        bh=mubgnygzcTN70GDw/jn8e3PuM+Myi6ckJ7sRedm/CeU=;
        h=Date:From:To:Cc:Subject:From;
        b=HjwOfzwmumlviYVvrK1zYilNl5SfKib5vTYeiWpRq6pk/GY2284Q6fjI+cBkyw7m+
         14904KJWlJBxmz3LAp8sUHLqvDiV2SZOFw+GvmuTNEkxLUpqCPfP+aawNrnqz1Naww
         fg0NmKLVf0EzVCho4B4oXowKQpsRVEgzQ7t1B37QrQ1fm7S3uCZIyrIGf1b1CylcJo
         RHXmvnF7kvWn8Ed52mgVVC/SXiosK5+8Cgbe5FBhyWwajf95K1uA7aiJSTB7X+q5S6
         jjDpRzJHR6BOCnTjGiaoJQLWQsik/XK/V1P7Za4PKI2o2USImNFTvUfwxO9uUaa2T9
         ahKHNrWkElMxg==
Date:   Tue, 19 Jan 2021 06:27:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drivers-x86-fixes tree
Message-ID: <20210119062758.75f9f8bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jgb.biA2iSdCfXk+KRIR8O0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Jgb.biA2iSdCfXk+KRIR8O0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  99d53ba0d0d9 ("platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNK=
NOWN_COMMAND errors")

Fixes tag

  Fixes: 81c93798ef3e ("platform/x86: hp-wmi: add support for thermal policy

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/Jgb.biA2iSdCfXk+KRIR8O0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAF4T8ACgkQAVBC80lX
0GzPhAgAg+hRq1gi/4bcB4h/+GGdmnQbsa6SHU1j0JpYRZ2jq3gbo8+EQz2RXm6Y
ZS77atlZMHNTwmq+a6dnDkRGfcxooQpyWg3gn/1dt/6KCE4C8JgqUGWRnU8fz0Y7
N/YVuKVyqgxFcTJj576s4olSphHcWLIDbq30J4vo0vFcTFPoq/dqAx7jB2sdUFz3
5zGFURplpM4t+vmmNZ7TcpKptEsFH1kbNzMSSvCB6XbB22cUnY6HwoknFaxjTNCE
N6sK9VI+5aevpNDCrdQxIZzgAqZ4ERxF/l9HK+8nIIlbXxKUH/eAq03iVUclQZEM
wq03CJ8tYIXzSLaLZobrpqcpxOcUJQ==
=Ia4x
-----END PGP SIGNATURE-----

--Sig_/Jgb.biA2iSdCfXk+KRIR8O0--
