Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2DFA2D3A6F
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 06:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgLIF0V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 00:26:21 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54501 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbgLIF0V (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 00:26:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrQVl3D2Rz9sWK;
        Wed,  9 Dec 2020 16:25:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607491535;
        bh=MKm4YaY54mjqQIyd8PdoeI0X0w5w3qrs01+JxPtWH+o=;
        h=Date:From:To:Cc:Subject:From;
        b=qJsTL8N+5C5RPvw4bU9LKO0l78qaCsQgXqBOgzatTk6omk/0TsgCk7b8KGiXogR8b
         MnVy/M2y5AwI9Hp0tuobm0j9TwUMfDxzvNjfqpN5GKrZxRJoE5dwO7OhPWK5Fr8nCE
         Ro9Wh3ap7sGl2TYGp9QoIgQ1LLpViHWZLfT4xZoZoOp2HLi4Or7v0HP+asGA1e3TEs
         1F1aSyDyHhYiFtWn8PXRZ6O9doTfYgFA3Nv/GfJRfkLycHxiq3616kzsiFRPu/hPoa
         jvF47JGGjahch0GwYo8aJ0oKwbbv+VFX9COyu0QTVBRrpjc1/WKTwvWrN1fJ3RK6xH
         xdWYtFKlEqjEA==
Date:   Wed, 9 Dec 2020 16:25:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Mackerras <paulus@ozlabs.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kvm-ppc tree
Message-ID: <20201209162531.4280c64c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lc/qF7pK5aKwhOR94Lv+UsV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Lc/qF7pK5aKwhOR94Lv+UsV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2259c17f0188 ("kvm: x86: Sink cpuid update into vendor-specific set_cr4 f=
unctions")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Lc/qF7pK5aKwhOR94Lv+UsV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/QX8sACgkQAVBC80lX
0Gy8CAf+OOZ65xPguEYDcWvr3OpIL9NWhNwdkhiczLFIj22julIjkxLnKOwqBHvx
pNVGmcbT0PsRkvxbBD9IEkeBWmH274K21lUJI5v3jDR6AONqmv4Pg9YuX9F5lO+g
K+ZTz2jvDxrH4RKO3tugl2GL9Eb45z5LxDTLtWV4xf2997tQa+dXBbTtiMuXZ+7o
0BDQMevbJ773nTWcmwHD8wnKKvOdJ2Y/l6QmrEp9I+rv/f79z6a6lma2FUQ1O3Qg
cRuFl4NPe7o8SsizJyODY9MAfqXFqMALqpSutF1eqDrdr7lb9lLTHAjProJpzZHC
hm3r97V+K/hOiEa80GBB0yxIbjkNmQ==
=geIM
-----END PGP SIGNATURE-----

--Sig_/Lc/qF7pK5aKwhOR94Lv+UsV--
