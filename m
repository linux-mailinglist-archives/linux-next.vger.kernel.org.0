Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9602F3ED8
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 01:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389720AbhALWEv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 17:04:51 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394154AbhALWEj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Jan 2021 17:04:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFl314rW1z9t17;
        Wed, 13 Jan 2021 09:03:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610489037;
        bh=pxLiU/M2TGTxCMd5N+CfJQC5UInIoBytPrlkfev10a0=;
        h=Date:From:To:Cc:Subject:From;
        b=TnTQx73XP6Wlp7tH0CSqsnG0YFDXjmoWQieAm/RJ7IVhLo8Jod5ckS4LoceyfA2Ma
         KB1yb6h71Pkyn3kw56MPsOUsjoqSfsBln/0uybQsrtVUBg5iV81hKmdU1cF2OsVaVr
         DoSTDi7wLc9ErFRE5GjV6AW5HWZFyVS9ZXDleoShL0VLcdXFX4RoeHJtMGz72SD2Yy
         kD/Z8QFXIR1ZUWxVTCLfCe6Pf2DsGlldL1rwNcRfo+Yo3N4VTwpOSYQ5MI3HO3dgAb
         tVb8aHtD+8t96QmJhuGSnRpgSEPXLIafxYHP2Ll+nLIGjRqLgRuhgb+WuuloR1xS5U
         VFp5Q55aH3ZQQ==
Date:   Wed, 13 Jan 2021 09:03:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20210113090356.3ef1b139@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b3t3rRs5p5zVsKNPZp419su";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b3t3rRs5p5zVsKNPZp419su
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  32678deac9cd ("timer: Report ignored local enqueue in nohz mode")
  8beeef08bd76 ("entry: Report local wake up on resched blind zone while re=
suming to user")
  7b3f45a1ad1f ("sched: Report local wake up on resched blind zone within i=
dle loop")
  4d19f38bb06c ("entry: Explicitly flush pending rcuog wakeup before last r=
escheduling points")
  a5b60c670b22 ("rcu/nocb: Trigger self-IPI on late deferred wake up before=
 user resume")
  679a2750284c ("rcu/nocb: Perform deferred wake up before last idle's need=
_resched() check")
  785ff6abc514 ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() caller=
s")
  d32f638a57e4 ("rcu: Remove superfluous rdp fetch")
  97e90370b8f3 ("rcu/nocb: Detect unsafe checks for offloaded rdp")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/b3t3rRs5p5zVsKNPZp419su
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+HMwACgkQAVBC80lX
0GyYkQf/UUnn1SicAqRoLdrHj0uVSTE2IgSaehKGHwkPZT5bMT5Yk6h7t+eVrhzo
F9GScpc3VsAg3IPYQ1RuQ+ZsWt+ssLLD4Kek8cgwsflqY0Q/P2NdgXxUQIzqTjhF
BBmsJEdC69aYRtpRNLmi9yRGVQlx7s00yFhQa1hrE80VWGu5kL0HGFe5WxQazFU0
SCYzI8uE/fiWAC0roIsz2cXH4r766XFXKzJhEdYs8SrGDYRI5ppKdPei5+ODAmj1
LhouAyqNciE/lnRQ8c/g/KU7/TXTvsen0sQTifxjL4i+6loABhb7Smmw0kMtO914
AAON3hCQ4wfP8Bjc4+bfdR7yb0MwHA==
=lnsI
-----END PGP SIGNATURE-----

--Sig_/b3t3rRs5p5zVsKNPZp419su--
