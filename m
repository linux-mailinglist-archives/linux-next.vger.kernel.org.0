Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82D5441A1B
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 11:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhKAKqp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 06:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhKAKqp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 06:46:45 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD39BC061714;
        Mon,  1 Nov 2021 03:44:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjV5K1KvFz4xbP;
        Mon,  1 Nov 2021 21:44:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635763445;
        bh=gB9iNl3t799T/J5L9ejYsk4Qt71TSkLbd+1y3ioJFPM=;
        h=Date:From:To:Cc:Subject:From;
        b=ThJPBVPssquwH4q2JzpqVj6NF4eEVIT04BkEeb6N7r5Yr8PVHdUxQEcuMfAyHrqOO
         DQMp9+YLbCjPLGLu3QosVGo/J/CqgDcH3ta17ozp2xIiko+8RGdiusaFB4AgkBx43d
         Ar9bIhNyBKzFLMTYFYmzDui9NcAo+cC/wbk9FLES4HaRKJqOSsxPglhIhhMI+5qJTi
         3e1A/nmUfxF7AwnoVIk1RjxZXLd/wEdx/0NkiA/1P66s4fJJTwv0SbmFDoE/OL+sjA
         8V5ivP8MUHywzsi5m2CLWTOMJl3xM/vLvJLNPHegCt9ZPI/hCN2foG50utIZG43wLW
         HNRLYXtq8K1gQ==
Date:   Mon, 1 Nov 2021 21:44:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the parisc-hd tree
Message-ID: <20211101214403.47d36f6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v=_TMBRR3YUcklTba6sU78e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v=_TMBRR3YUcklTba6sU78e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  cad7eadf2afb ("parisc: Use swap() to swap values in setup_bootmem()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/v=_TMBRR3YUcklTba6sU78e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/xPMACgkQAVBC80lX
0GyGJQgAjAZF344KJSQPoX9s/CM/DzCD7jzR7IMuE8XLw/KyW1fApQ5BiEsutRfp
w/kUmdZgdNtma/fUt4bjJpWfVKLFS2xEmMbGtlrvxgmPQtxUYnySF3kMxSRXIWfZ
DrWsfXZppK7W6bOC4UTED4a1OfaJHKU5ijChvmaB/oZF/PPcD3mvgkyNdLegWyHF
VrIU+wcuHUwKxcsB6n+4uyevCv8SzOoZjRbY7pjaUaeuQeF+8F8hi8vFRa7JmcA1
7wgaKty9mvM8uMa3HyzndTUP+zznDhPvx5W0vM5lioEk/JZxszZcCIMfTv+LJ5Af
GYRbyHcYODja5+bMlivrPeFJh4C9iw==
=faFf
-----END PGP SIGNATURE-----

--Sig_/v=_TMBRR3YUcklTba6sU78e--
