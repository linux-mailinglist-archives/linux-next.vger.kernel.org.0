Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FC5345787
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 06:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhCWFwY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 01:52:24 -0400
Received: from ozlabs.org ([203.11.71.1]:47197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229437AbhCWFvu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 01:51:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4L8y4tvpz9sSC;
        Tue, 23 Mar 2021 16:51:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616478706;
        bh=6x9O3U5LYou/LxyIlUpvO9WmX3PQsUq3RFxPZbQkWu0=;
        h=Date:From:To:Cc:Subject:From;
        b=io+UbUd4si4BXm5MuXaFztuP6fziMDHx0WJRbnbpsRfa36NWly0wt5MSLdYOkSh8r
         2dano1DDEaO9Tc5mxqi9IdwUJ5d/Kwd6HAb3qNfH+mkbgEskVrGThXXkkmBduigh4I
         dCMBgj5JCQkDZgr1i8LOhbz2wOqa+odTK4QjklQp6gWjFUVHrCk1cSMuvPye1ai2ED
         c32DGo3qTY9PInxowTyj5jKCNyADyEG7Q8NM4A5Z6t3UBJx94ivgHG7nnxjWJTHuoe
         jonJHyms5kTEYlX3qcY5S9UBjB2OJGFTDj2VeqHHT27u68MiSDPl5rpIOc4hXzOXLY
         33VoLkA3sBbtg==
Date:   Tue, 23 Mar 2021 16:51:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20210323165145.2ae9a0d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y4dpXuUMZPUkj_+R9ypi+/T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y4dpXuUMZPUkj_+R9ypi+/T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

kernel/static_call.c: In function '__static_call_update':
kernel/static_call.c:153:18: warning: unused variable 'mod' [-Wunused-varia=
ble]
  153 |   struct module *mod =3D site_mod->mod;
      |                  ^~~

Introduced by commit

  698bacefe993 ("static_call: Align static_call_is_init() patching conditio=
n")

--=20
Cheers,
Stephen Rothwell

--Sig_/y4dpXuUMZPUkj_+R9ypi+/T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBZgfEACgkQAVBC80lX
0GyVwQf/TbIpqbcV1LUNGSaeb0VULKk+6qIKrTnHfT6yaxu8Yy9Tfc+bke8AjY96
wWyULNsfcRehygaT6xvadwxBUqnKI0d5jUiKSfkv6ewH1k/E4tuKKdiVy1igWA1t
0XRjqg/y8f6O+tLygS6UVKbWjCh0JRugrYQtyiyh2T4PyH4wqs+61H1PYFhs5d8P
IkMRETnLAQ0s/hLOvHZbAwtGJ2wBln95BNdyxvgGnqohbi4zX7QHZSxurU9WjoeM
fF2FyaJMkAPAqeVmxR2Dd3QB2eKPfH+1tl4DKGharnKzA7nKMs3u59cFVAyHguVh
t/ieVxraHlBedUaWeGLyaXxosj8joA==
=fGO0
-----END PGP SIGNATURE-----

--Sig_/y4dpXuUMZPUkj_+R9ypi+/T--
