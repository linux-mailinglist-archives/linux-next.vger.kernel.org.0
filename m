Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9191C323507
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 02:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbhBXBMg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 20:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbhBXAcF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 19:32:05 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174ACC061797;
        Tue, 23 Feb 2021 16:31:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlcKT4S5Fz9sW3;
        Wed, 24 Feb 2021 11:31:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614126669;
        bh=q90uEgyYHcxn6xBm07NTvA0SmYwt7QYZzJDUPB1hTIw=;
        h=Date:From:To:Cc:Subject:From;
        b=pvKqSTgmP4RxHLXbWLGsEatAklTXzKCHh9NxWeHALdsLDdCFLL/8Pd5mZZpetIutp
         6Kqqu/EBV8svlur4vux+61ajssZdFNuk9Gbdd88nJxUcPhR4HoOke0PmOW8Z4K8yND
         jdf9w7/sY2YJ1rV616v7EMH9P4k5z6PpwJ6SgayP1K4YEt5dmdrMxssoxhPZPUkAaP
         +HiceKtFr9axccnVa+hOn2JzenDFC4LCFHLfi+F6YbiGosW4rz2ssid+HGsV6mufpD
         0SdNlmPkgRUjs6vPJqB2b7PFiPveytaob9gxkiFrYxGbvU5iXWPSaZc70yWw+FzUJb
         pG+rxCq3IMOFw==
Date:   Wed, 24 Feb 2021 11:31:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in Linus' tree
Message-ID: <20210224113108.4c05915e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q_b.E1bX5euukwq_pXNPK2b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q_b.E1bX5euukwq_pXNPK2b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b33fff07e3e3 ("x86, build: allow LTO to be selected")
  d2dcd3e37475 ("x86, cpu: disable LTO for cpu.c")
  e242db40be27 ("x86, vdso: disable LTO only for vDSO")
  b1a1a1a09b46 ("kbuild: lto: postpone objtool")
  41425ebe2024 ("objtool: Split noinstr validation from --vmlinux")
  6dafca978033 ("x86, build: use objtool mcount")
  22c8542d7b22 ("tracing: add support for objtool mcount")
  0e731dbc1824 ("objtool: Don't autodetect vmlinux.o")
  18a14575ae31 ("objtool: Fix __mcount_loc generation with Clang's assemble=
r")
  99d0021569c7 ("objtool: Add a pass for generating __mcount_loc")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q_b.E1bX5euukwq_pXNPK2b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1nkwACgkQAVBC80lX
0GzkwQf/YezJJc89M08G/SSmDvAr/nNDEIKuML9mmDgBxj4dxVXIotTO6yLfzm14
8nndQlbRKUjfn5y3zvbtvLEaVNz4OJDT5HSfC7Wg972lbfjKPUL/+//e3vt/w1Pp
JtCTJ57Mr1aQa4dny+gWpwkvsNHrgUaF6I0EFOc0QwHjKO9oyoQLSIWHbXQvFwtU
t/N1KMPUwnAhcPfeWLxXfeXEc9YtWJerzwNpUIzD7XBn+SlhDV2Wof5uP8HvjLgb
5iYAGZedzBPNtzruHk8EVieVYXlCSYcxfuCEkpnN4x27iNOqFn7oKyhrBvMLBXoZ
x9JtvdxckudMQOjI6RNk8uD8UYmE7Q==
=TfSi
-----END PGP SIGNATURE-----

--Sig_/Q_b.E1bX5euukwq_pXNPK2b--
