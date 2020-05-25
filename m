Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9811E1786
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 00:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgEYWBZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 18:01:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40051 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727842AbgEYWBZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 18:01:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49W9z72Z9mz9sRY;
        Tue, 26 May 2020 08:01:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590444083;
        bh=sAxuPQ0qRJdBxxdXv6epFruslWnS8Af7oClB01uV2+Y=;
        h=Date:From:To:Cc:Subject:From;
        b=VMw4Omhj2kJe3tm9R8B0CFNkiOR8uPLIsTYJNPhG4j5hlaOb/HkIZFLNwYRPLy/z+
         Lt5k91PV8T5+R7kcgebILW0Cm1DPOTFoLUVEO80bH39iPV0Bcuejip+Yoq6DNwUzwM
         0+IL8JNegrHhK6nFtjcuA1m7DntXyeiGTnFtm9xSKSCfTcMfhEA/Xbd4DuuyZ4s6fP
         oFv9E7GAFW4e6hijqHmS67ouzX6xUXmXBvNaW6HnPSU6ml0gqeXGQXEJgLqgFLtOqt
         zxhMOUVFFZTYg6KYdrGatj5C+VDRnK/mv9k+JcCfJYNeG2mJEwXyC7PoyT1I5yMpnb
         WfPBYGfuWUesg==
Date:   Tue, 26 May 2020 08:01:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: linux-next: Signed-off-by missing for commit in the jc_docs tree
Message-ID: <20200526080122.5a91c78a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZRJZdZpL6+nMqRQnC4Y9pjt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZRJZdZpL6+nMqRQnC4Y9pjt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1fe411077207 ("Replace HTTP links with HTTPS ones: documentation")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZRJZdZpL6+nMqRQnC4Y9pjt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7MQDIACgkQAVBC80lX
0Gxobgf+PLkOTbL/wXnrV1GePlwDS0M9DeWjB7/r60W5lJbUgGkEQFm+r95uBLn8
jbKzJcf+CVm7L1YT/WsRh+Gd2psTPWZAZbdSYxvdf6Bl2vJ6YysfMaBj/8g9O9Zs
6hA2r8E1fn//DYMNl+FV/vcEvKHq12GNJRrT8RVikRNhtQThPIPDmgg0N+9l8oC8
PsOHoyNUc4gY8kETBhWQmlU+9SdQJNEii8Z6/eRVqXPeTGFad+HugtBETJerULr6
3tDB6pCvV8NVrUDCrNzaaBDLiwJW+pOMN5yLxrgUZb71T3AJw/cF0tlzAy9aKsRi
U0IdzQZrlX6Bb3SfB4uMrfhuQKb3rg==
=9YaG
-----END PGP SIGNATURE-----

--Sig_/ZRJZdZpL6+nMqRQnC4Y9pjt--
