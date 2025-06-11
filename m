Return-Path: <linux-next+bounces-7137-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01560AD4A92
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 07:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A52189B553
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 05:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF19226D03;
	Wed, 11 Jun 2025 05:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pKWWr+dK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17021A45D;
	Wed, 11 Jun 2025 05:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621321; cv=none; b=L4+KgjcbKPL5aZ6MWznSciildIZDHgNfnbD1STtNM2jXneNngMjc0pEw4gtN5ImMtR/QfutEdInShNwdVDsbOJHASNhpaMsn6w4w9SxnZ0mf1123KRQ9SWCLYjB+p+w3JjsuDWIJnjWG/qtsri6kL6lnWC4KeRTIdK4oMJqaiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621321; c=relaxed/simple;
	bh=M+RX7Sm6vTes28CLo8jF9qgMIGSRXd9u5bepTyu0pe4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFX9EVxubn9aPKI4XfCPSQtIboUbKhgZtog+8XM+IlvWcs2FCvb9c71g2fxLzWD0jZbwQ7D7kDPGAgZZ/R07u+kdwDnPQCtQM+UZ/7/WyUDZYD3RAD7VOTPRX/UvH28YfZgYhnA6UDzhdS9X/xJzrDf/BovY/ifNoEiHciRLw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pKWWr+dK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749621314;
	bh=buJz4Z3wI9xlaIPUzINVO+1DGNQSeQV/MNOMXKq/vH0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pKWWr+dK0EUJcNtSPt73Wo5wxPGwmLAyFsJNvY46I8fbRlY5HfLGu+V3jE9PB2enQ
	 X1sbV4VXKC7eRyERuirVw8xolYfd/W5TuA51QVQs3XYdWjEyEhNyL49SKa01HUGLwD
	 grDtSF6qtTaKO//k9bUMOxsOyA//9bPbdiZXXYVMmHgnI8e9q7Hy7U3QHq1gysO2Zy
	 3YgODETEYaaeSCNZ6QlJQ/nWE3NREdAdRal788PnQtnKlTJzrXKw7WbpEjfQ015LZ7
	 MYDsWuZ9q4XH0mSQIeZvsTnIa7x34Xglq1E24xFyTkYYPE3HkPB6HGXR5W75I2oC73
	 g0sEt9b7VTz6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHFHk1KBBz4wnp;
	Wed, 11 Jun 2025 15:55:13 +1000 (AEST)
Date: Wed, 11 Jun 2025 15:55:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: stats (Was: Linux 6.16-rc1)
Message-ID: <20250611155513.651ac322@canb.auug.org.au>
In-Reply-To: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qOBy5Pcht._AyJNM6xfX=Hs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qOBy5Pcht._AyJNM6xfX=Hs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20250526 was the first linux-next after
the merge window opened.)

Commits in v6.16-rc1 (relative to v6.15):          12899
Commits in next-20250526:                          12253
Commits with the same SHA1:                        11854
Commits with the same patch_id:                      157 (1)
Commits with the same subject line:                    8 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20250526:     12019 93%

Some breakdown of the list of extra commits (relative to next-20250526)
in -rc1:

Top ten first word of commit summary:

     79 net
     65 drm
     63 bcachefs
     48 selftests
     39 riscv
     23 netfilter
     22 perf
     21 tools
     21 asoc
     19 can

Top ten authors:

     62 kent.overstreet@linux.dev
     19 biju.das.jz@bp.renesas.com
     17 rostedt@goodmis.org
     15 fw@strlen.de
     14 phil@nwl.cc
     13 kees@kernel.org
     12 rui.zhang@intel.com
     12 cleger@rivosinc.com
     11 masahiroy@kernel.org
     11 jiawenwu@trustnetic.com

Top ten committers:

     81 pabeni@redhat.com
     63 kent.overstreet@linux.dev
     50 kuba@kernel.org
     47 palmer@dabbelt.com
     41 alexander.deucher@amd.com
     35 akpm@linux-foundation.org
     31 pablo@netfilter.org
     30 broonie@kernel.org
     30 anna.schumaker@oracle.com
     29 stfrench@microsoft.com

There are also 234 commits in next-20250526 that didn't make it into
v6.16-rc1.

Top ten first word of commit summary:

     47 drm
     43 arm
     25 apparmor
     17 arm64
     13 dt-bindings
      9 pci
      8 i2c
      7 soc
      7 extcon
      6 pm

Top ten authors:

     18 john.johansen@canonical.com
     16 himal.prasad.ghimiray@intel.com
     12 linus.walleij@linaro.org
     11 potin.lai.pt@gmail.com
      8 ninad@linux.ibm.com
      8 dario.binacchi@amarulasolutions.com
      7 krzysztof.kozlowski@linaro.org
      7 arnd@arndb.de
      6 christian.bruel@foss.st.com
      5 tomasz.lis@intel.com

Top ten committers:

     29 alexandre.torgue@foss.st.com
     28 andrew@codeconstruct.com.au
     25 john.johansen@canonical.com
     15 himal.prasad.ghimiray@intel.com
     14 cw00.choi@samsung.com
     12 florian.fainelli@broadcom.com
     11 andi@smida.it
      8 michal.wajdeczko@intel.com
      5 srini@kernel.org
      5 matthew.d.roper@intel.com

--=20
Cheers,
Stephen Rothwell

--Sig_/qOBy5Pcht._AyJNM6xfX=Hs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhJGkEACgkQAVBC80lX
0Gx8ewf9F6rvfg5YkaGnvLU9QLrp8I1dXgMU0phS+L3hbxx3BV7Xx8ofiJoV5tjX
sKyZlTup09TkCrFQRJoec6M8KlWGPxhrTQZ2CsVSZm+GLgj2V2MDEqaifY3tx8xp
yxpx6t0x4G57LWVYXyF8Kqd3Ona4pQ+YCoPLE2N9jHg7oL0Xfha9oyhFvIUMrsjD
p85J3YzIoAa0OL+bIbPEESjpLkXBO47BI+zj/GQPBm7tpYaMxZvVC9S7QYVACz3G
ttMaQGU6q96QhQbR+67zNU3Z0w8RfZiPkFMvPtuWo3FmHg/D4VCiK76djVz1VThn
4VPH2lzuQP1g5cWRyTG5L6eXDVkTnQ==
=YR1A
-----END PGP SIGNATURE-----

--Sig_/qOBy5Pcht._AyJNM6xfX=Hs--

