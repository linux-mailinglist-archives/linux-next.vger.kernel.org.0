Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76B3430D1E
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 02:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344869AbhJRAk0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Oct 2021 20:40:26 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38999 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242878AbhJRAk0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Oct 2021 20:40:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXdJj5X6Vz4xbT;
        Mon, 18 Oct 2021 11:38:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634517494;
        bh=ZK7VcIlv2Ng5BJ5iVBdxcffpMnaoVaLShN4I5ILK0gw=;
        h=Date:From:To:Cc:Subject:From;
        b=TSu9ILpXbaRrNUal2l/9dvHXs9vhzyItuPAOxKC6j5FVUDkrus7xaTRNOFi4aeE+v
         +ot2ZNSQWfEHmSfm/vwkEeGEItDDEgwcjjcCdb7AdjoeKfDlKMqqMxZE47KH/c8DW6
         BdZrfdPceQ/jdOCJ9Oint0dppTBZiVQ342e6mij6Z5O7qtO6m27bYwwwaXcmkv6AWI
         hAWcjeEjhUYhL4PQ43RS0LimFJ1D4N8vip1VJ8A0yyyc8AzPlFz675bjjWjwK5vPlM
         C6yi3VErERNGa5SBEdbrCwNw8ybnVSalpEUDI8RwbaRl+oA1QdSOL8QYq7MMydo7em
         iqEe5cfE1sPAA==
Date:   Mon, 18 Oct 2021 11:38:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20211018113812.0a16efb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vGpGCFzNxkE0dDvlPJK4Tl3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vGpGCFzNxkE0dDvlPJK4Tl3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from <command-line>:32:
./usr/include/sound/firewire.h:71:16: error: C++ style comments are not all=
owed in ISO C90
   71 |  __u32 count;  // The number of changes.
      |                ^
./usr/include/sound/firewire.h:71:16: note: (this will be reported only onc=
e per input file)

Caused by commit

  634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in =
register DSP model")

I have used the sound tree from next-20211015 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/vGpGCFzNxkE0dDvlPJK4Tl3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFswfQACgkQAVBC80lX
0Gw55gf+Oq/eAqzsLxv5jEQavsCxc8zG82NKfNc1aVevYrHUFrNO/JleWKgcjUsr
jLv0YPG3AM9vsOwdVGSGp723QR2RM1ayeezV4+6StRaFR8OIw6ESDnxIzG4lKcBh
Hk9b+cSdjvbS+bD/5OUL+yWP889QcK+cuAQk5CX0ru1NHfGlW+6cI5SMh5ovABMu
8pG+BcXjaurUUb4Z3FzKrahNoYZ/lhxo8P/WVnnE/03os0QY9G0j9qsq3MaWG03Q
2JZ/ghxxzK0uSn/0FRKG4KsZ+6EDtMp8tGQJ9NNaeMxxjkDLfxdtcoqlzen3NHBU
I0Il8u7Ht0hB9uTJz3MZIG5Id8eTbA==
=/Wab
-----END PGP SIGNATURE-----

--Sig_/vGpGCFzNxkE0dDvlPJK4Tl3--
