Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9301DD473
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 19:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgEURb0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 13:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgEURbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 13:31:25 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F9AC061A0E;
        Thu, 21 May 2020 10:31:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Sc9P1j80z9sPF;
        Fri, 22 May 2020 03:31:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590082282;
        bh=U2q+9nWVu2OnlzR+r83h0Q4ydB5//CzWr/lK+sJ4gsk=;
        h=Date:From:To:Cc:Subject:From;
        b=ucdqsCgAg+h50FMDhtJYH8rDSXR7O5vYBCKjBgJQUj0OzMT6ZNB1YI2utxF+JwDVn
         dN6tyPCwQ/xkZmDhrW0Hv0O0x1L93r+AQnBnyZYX3S2TDyXSy53Y8Ap1sDLi2fZe9e
         K6ybH1fafBN4Lf27gZ2hjB4r9nSch2UUb2hgO4Qyjc/ys4cBlOLpE3RPtfRzUcZw21
         nqZTv9uy8LW4cbTyi2yZ5cHpv/rjbPoWj8T4T89J1No3YLv6WDZogFTQGPwaTUaHFv
         CCHQX3D/A2mpMIEpjQVHeizVZFvziGLRRxHBQUUMRqqJXw1joGeDvW/yoUEh9bk/jv
         8R3yzJCwQIPLQ==
Date:   Fri, 22 May 2020 03:31:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200522033119.1bbd99c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wrxL7s9suCEcfFWKJZTtC/p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wrxL7s9suCEcfFWKJZTtC/p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, all my linux-next builds took signficantly
longer and used much more memory.  In some cases, builds would seg fault
due to running out of memory :-(

I have eventaully bisected it to commit

  cdd28ad2d811 ("READ_ONCE: Use data_race() to avoid KCSAN instrumentation")

For my (e.g.) x86_64 allmodconfig builds (cross compiled on PowerPC le,
-j80) the elapsed time went from around 9 minutes to over 17 minutes
and the maximum resident size (as reported by /usr/bin/time) from around
500M to around 2G (I saw lots of cc1 processes over 2G in size).

For tomorrow's linux-next (well, later today :-() I will revert that
commit (and its child) when I merge the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/wrxL7s9suCEcfFWKJZTtC/p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7GuucACgkQAVBC80lX
0GzOewf/azkhBK6A/fGfOMCMgugNIwuaoC8kaoodaK1hGp1iaXgXcHZvJ4EUOiwj
lMP8BiS2IxypBpPteksM+hUjO0thTNCQ07PlnmfLXEv4JPezAZF8jCvk/ZxHaUzz
ZuKA49fsQ5SDRsD10rayvwqyf7OGLTNpsvRA/kd9SxM3tjV1ayLo+4fe1YcrnjcE
FYHormIYKPWT6/qkpjp60pYmV0DFWzw013dXEM75npvaiErKKrP7H+li8fjWrxJo
H1Fjhuh3UtWcCkCOGxU/oCbS/EmPyZEghu1l6g9LpJzKfSSPcVs6jywL9PQ+ugZG
JBqE4uKAgvyzvhAAWIp7UGwe6A7ZxQ==
=7ehF
-----END PGP SIGNATURE-----

--Sig_/wrxL7s9suCEcfFWKJZTtC/p--
