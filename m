Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92957DE078
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 22:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfJTUhc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Oct 2019 16:37:32 -0400
Received: from ozlabs.org ([203.11.71.1]:60133 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbfJTUhb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Oct 2019 16:37:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xBQw3KYQz9sP6;
        Mon, 21 Oct 2019 07:37:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571603849;
        bh=upnRy8tqqVvDvcoLd180YZaMcbXw/YqYzjzMeYbKPfk=;
        h=Date:From:To:Cc:Subject:From;
        b=j1yY7rs9+VbeOHx348p7EECsY91vfYBvORy61KinUgkinaysbL0WSD2TKNKvzqLXo
         2N1OGWgCALv4j+m0S7lPopf0kbQ9+dnm9hSOvWOUnK0eoIkE6Ij/ggPm/N39HrpjN7
         wKXkMFNbdJvXKLwZJqq1k7MV7WkIdqDx5FWwqg9ve4wgcXQYJC8hnl7t8n7wX38RO0
         nawMdMMf7wGy7ButuKayYip41fOalTybZ//2/EFydzaWGTnOfW6iZf7bYTj54hF6wn
         ZQQhg6dBmEfJw0j3V+T03k7MDNT6jPtE0dJYobQWLBpf+kMk4hZjXFDNIL9j1S/e0A
         BBgWCaLtWHgoA==
Date:   Mon, 21 Oct 2019 07:37:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Faiz Abbas <faiz_abbas@ti.com>
Subject: linux-next: Fixes tag needs some work in the mmc-fixes tree
Message-ID: <20191021073714.4267fa4a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OKBh253c0Fno9Cw+Y=mzrVV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OKBh253c0Fno9Cw+Y=mzrVV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8d84dfa2df53 ("mmc: sdhci-omap: Fix Tuning procedure for temperatures < -=
20C")

Fixes tag

  Fixes: 961de0a856e3 ("mmc: sdhci-omap: Workaround errata regarding

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not spit Fixes lines over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/OKBh253c0Fno9Cw+Y=mzrVV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2sxXoACgkQAVBC80lX
0Gz9dQf/Rv/cSQ2TtF9Sj+ul/i6Phn+bO9PR0HZDP2/HknxDV/TYMJ7Sdn/cmED9
zaTeNJRG+iE/LzjdSDhn2MN5ogkhxcixNhCfYXKUQ8h2WznVsQ/ZOcKgJHjVu6XO
jx9mkoY3ZNBIKf3ZJvIq2HwgK/3ns4cg3u63SM2JgUUVCVDGG9TmVstVoPjcJm4/
2rXJh6do9CiK0kZo2XOG0k6jzmaP3Ler/kwRhyQXrftGZBwF2dU2jWrrOP5JJQt2
CLHJ/kRC24l9XdSm13P4fvFqkz5VpZBhAL8hx7Y86gtZhLDNdvAWKOVwLGJggeO7
NB2wSpwN/LbuXlDNBi8xKV/zvFURZw==
=Pj+5
-----END PGP SIGNATURE-----

--Sig_/OKBh253c0Fno9Cw+Y=mzrVV--
