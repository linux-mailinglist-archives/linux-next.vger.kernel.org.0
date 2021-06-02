Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCCD3982B4
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 09:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFBHLc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 03:11:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41221 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229911AbhFBHLc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Jun 2021 03:11:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fw0XD2CqYz9sRK;
        Wed,  2 Jun 2021 17:09:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622617788;
        bh=Y4lqlVIA41pKZ9nAYES1mRBSIqHxrzjwkJpyfWO6488=;
        h=Date:From:To:Cc:Subject:From;
        b=kspdrsXw4ZR1qyKqIszdO5YMiwP3DmWQ48TCkReKO3q6B4r8g7P487DCPEM5wARzR
         cmPSep6WiJ7JkR75DhVt9YBJKX9hGud5zplfZkEEwQo/gaBWwt34SdHSJOCqXoqYDz
         Ywp3Qa/E31KDsq29frLsTRl+Hl8kQKvRNmQ/b+RHSdyFrOvNvE6RAw66DuvCBIK5nD
         qNDfhlyKXauRW9IT3YilWzkeoBBBot0KVqnv6VoOG4NLqVG/4rAK6t4692nVqR59Xr
         5hvCa5SMffJlaaM9kUHBpW9D8ZOCTyWIvHDCYf3gDZFJvkPB/gmvegn2Qb7tMa3qoV
         U/11IyTJPJN9A==
Date:   Wed, 2 Jun 2021 17:09:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-current tree
Message-ID: <20210602170946.37a2c6ec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vp3I6SeL+bnQFa=GfCnD0bj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vp3I6SeL+bnQFa=GfCnD0bj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b3531c648d87 ("ALSA: control led: fix memory leak in snd_ctl_led_register=
")

Fixes tag

  Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking l=
ayer")

has these problem(s):

  - SHA1 should be at least 12 digits long

This is probably not worth rebasing to fix, but can be avoided in the
future by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Vp3I6SeL+bnQFa=GfCnD0bj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC3LroACgkQAVBC80lX
0GxEpwf+K62PdSiukkN0DuxdHC6Vu+txf+psQB0KxEf8GfhcWQnBFgW/dQD5akfw
7JeVKNw3qUGQ7qLGusPsTClPx0puVpqqO5wIJaBgtTxP8WnXcFoZezTSMbVElrtc
HdGQ8FfBxpfxXF6Ob2xamYzljDBheim0EoAS+dfY9H3bbly3uJMXI4bIpMcMxj1q
MB010Ev97PaJArGiFJ0ihUS9U3gWTNT0tdrcRqSFP28NUNT4NNtckbITD45dXN5G
THcHA0dAxApS7avHA6GgB4XBnDVpkYaVOkMgzRdIWj7nTTjw2Wf8t87dwoVd9xox
gr3GJ+XXsz6v+U9VTa6eIOKMo8fLZA==
=6nJv
-----END PGP SIGNATURE-----

--Sig_/Vp3I6SeL+bnQFa=GfCnD0bj--
