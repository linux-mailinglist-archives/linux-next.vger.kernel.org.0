Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47C12026FB
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 00:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgFTWGj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Jun 2020 18:06:39 -0400
Received: from ozlabs.org ([203.11.71.1]:41645 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbgFTWGi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 20 Jun 2020 18:06:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49q8s52k95z9sSJ;
        Sun, 21 Jun 2020 08:06:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592690793;
        bh=C6gzytZix5n4NvmNhPQCmN7XIOEMRcpNW/RTiERTazE=;
        h=Date:From:To:Cc:Subject:From;
        b=HRLmumYt2rplHOqzxs4XcYFDrtgnDG3MjIVEngX+f275Qiz5G7MNtcP4IRM/hV89M
         YeNuSijm1B+Rw1tIMFJIcLV4ZWkStj5cWDyRts6DDkgWksdo+pk7OV8211XjMc9Hz9
         Gn9Oe9cmAUZcyp/97+MGp8vnetLeBmBNV1AIi8DlDhctQmsBvbRe12rBMqHlYb6LJ9
         uZ9F/U44LYcCS+x1bDjr0nBvy0A9mDhiCARip3rob/6MX3vDsqCUmq7KN6LZ8/19vw
         +f8wcemVqfzXKJpafNMOy4yONmPEuPkkLMlOeu04htgVVqVeDHPSBmHUfdN7mvhR4d
         DuaxLwIF/1BDw==
Date:   Sun, 21 Jun 2020 08:06:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20200621080632.0819a404@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qsdugVI9ZGuKCCO/lSE0u56";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qsdugVI9ZGuKCCO/lSE0u56
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  aa56127d9ac5 ("rcu/trace: Use gp_seq_req in acceleration's rcu_grace_peri=
od tracepoint")
  63222f379b92 ("rcu/trace: Print negative GP numbers correctly")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/qsdugVI9ZGuKCCO/lSE0u56
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7uiGgACgkQAVBC80lX
0GyJxgf9Hj6MN2oXbDogLbC6tZmc+7h0HxLceCYzwvuXW+GtZjHtpaNYO3t4KOqA
uVxE8klVAkpN9tQv/ys5ATNrR9E/yTJ/8cvBtFDyjUdMtoNbEX/pVgHnQucqvSMp
ac8fkCInuRJTfeBXJphqBLCdskAOtQmrftKZA6E14t+OqRCHkD2j7ztPXvYmgaoi
/oGBIeovmEmd8AfNAnjK0mQ9e1ELEixBlk2dAWR9Mkkb4NRgfLjlcJ/ODDc7KzDB
KLHFMPFGkJytaasb4wcng5GkPGMgSJqCN/H8bcbr2bDOetfU+8G5eCLznWnj3m0K
DFaK05WJaCKmVk19aUg1rwiqBQOetg==
=ntyg
-----END PGP SIGNATURE-----

--Sig_/qsdugVI9ZGuKCCO/lSE0u56--
