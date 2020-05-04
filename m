Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498FA1C317D
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 05:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgEDDr6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 23:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgEDDr6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 May 2020 23:47:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B169CC061A0E;
        Sun,  3 May 2020 20:47:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fpj72ZVsz9sSm;
        Mon,  4 May 2020 13:47:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588564075;
        bh=Td0cSyuzVACEX7tfTYvz/fdY299O+M7CdkC6C5xIMP4=;
        h=Date:From:To:Cc:Subject:From;
        b=AuGvfOUrRKEx9hfXNKyD5kAXMblqtilZOEOmVJA7aIgmVuTK1R0WK/jQRfZsAiSB/
         yPcyaBNfPdwQj6GIQbZQjdHhR51NW74pgrwKi2W8oM0Su+QD4BOa8mAKi0FnW7my+U
         opbBpaFrJM9JXDGY8WP+GaX3ROV3753MXrgG354or70nzsqsmyWCV3pxVzRBwKtVDF
         aC/j4XFT5F5S/IGA0RYl9YcPMGPUnsMb6g2wuvpwEEjpHVv6Q0v/J5XqC+LYbmvQRR
         ifzUe8DMU4/Bc2yc+rHaLINPpOlDDIodHTQ5aaiVzkEOFCMsxsZqCTfjOYE3Q/L11B
         w4UjSqpYbvw3g==
Date:   Mon, 4 May 2020 13:47:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings after merge of the keys tree
Message-ID: <20200504134750.2278a82d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1XZK0Dwfyu4JkePuLhLdX4i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1XZK0Dwfyu4JkePuLhLdX4i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

scripts/Makefile.lib:8: 'always' is deprecated. Please use 'always-y' inste=
ad
scripts/Makefile.lib:12: 'hostprogs-y' and 'hostprogs-m' are deprecated. Pl=
ease use 'hostprogs' instead

Introduced by commit

  631ec151fd96 ("Add sample notification program")

interacting with commit

  ee066c3ddf7b ("kbuild: warn if always, hostprogs-y, or hostprogs-m is use=
d")

from the kbuild tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1XZK0Dwfyu4JkePuLhLdX4i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6vkGYACgkQAVBC80lX
0GzHkQf+KjaVxRmU/nnXYisA/bsA1eXNfZe4KaUShD8h5vafak9Nsc4tlV4hGbZk
PShZgR+YSFYMpy3HTA20mL9tIblAeIflI8oSTaThj+JM047Jyt3C1x9GktwjQBbs
MADgHhyLpXOB0lIIjkogxoxddP7AhsJkQgZD3m7dEgvEu+FnLokpo2sYyPrtr4gb
jB7X2/0hRTJXEl5IVPIiABMWyvAAkVhkXRCUnkRn/JsQBfHA4Ts4MSy8+W27BPgJ
li5C7dKnF0b4uDyipdyxA0Q5OQnbXczUIfkDVMbJ30gmF/loto2qLvpt9z0n32gC
4tzBqI/aU0SH+kVGTH+259u2FOWVBQ==
=7RtC
-----END PGP SIGNATURE-----

--Sig_/1XZK0Dwfyu4JkePuLhLdX4i--
