Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE903A7805
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 09:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhFOHer (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 03:34:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48079 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229493AbhFOHer (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 03:34:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G40Qd4sB8z9sW4;
        Tue, 15 Jun 2021 17:32:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623742361;
        bh=9LI8Y6Qw0hYMJkZk1/RR4N0ZWyK/sQ/3lbqBbQlAQ38=;
        h=Date:From:To:Cc:Subject:From;
        b=riioj+b5Y8A6NU7izQUNYj8UOwUOp42IMUyOgczSpvIN8ipEtKO+epYi6lh8IxLfw
         sVhTIb3dxaSYWyiMCDoDqCJft6ILZfRUFbn/HzHFJoLE6EmRPUI9mE5fig0zKa6I1j
         fgeds09iEl75ynXMVMzZKpbRQe0WjJwuCGAS/Ioimh5JtA98KsvLxqJ3fIcCkTSX4J
         0sePOlugJtRsxGoSk4PL9GKwtCOG4NIGW/s6KugrunoBszTXgkzkAB44jEAT1zLPLU
         o/Zwf73oKp6tgPRjDaufgC7Fe3P8VL48GI42VTCEDfY/qk7QZmmHMxWIeEMdUY9Soz
         SfbgCqpVogCBA==
Date:   Tue, 15 Jun 2021 17:32:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20210615173239.7a871019@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+cr6DFcNABDgW0c8lGG8h1k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+cr6DFcNABDgW0c8lGG8h1k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
modules_install) failed like this:

depmod: ERROR: Cycle detected: snd_soc_wcd938x -> snd_soc_wcd938x_sdw -> sn=
d_soc_wcd938x
depmod: ERROR: Found 2 modules in dependency cycles!

Caused by commit

  045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")

(at least reverting the commit fixes the build).

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+cr6DFcNABDgW0c8lGG8h1k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIV5cACgkQAVBC80lX
0GwnfQf/RP5m+NHsoS41etMB7ZvIDgeSu7BaLS38eWB61EyA8cyTPxLlMT2jHDqV
1q/6br6B6YAMrC7luRJwnpsPP0Q6pxMrSnwTTQvNpb6cvIt4qOImWtvoaWvt92yM
8oR4Ak71TDroH7+t5zUzPwJPOdB+LG3uFCuq+wViapt/VZO1sZYGJh3E2yZVtyWs
+D/tMk3d+XXXovCvAJ2+soYKKrscv/zDGwhg9P/LtK36SzgxUo1mcK5d47yQtQDM
3d4t6g3+c2GuIBlms1U/2upvtda9OdzymHr6xD07guko+Wnbg38cbNvxZXvs7Ae2
ojXjzs8D3TDzcJlosHCgNGKs4V0d3A==
=JHWZ
-----END PGP SIGNATURE-----

--Sig_/+cr6DFcNABDgW0c8lGG8h1k--
