Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66C3283533
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 13:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgJELxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 07:53:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57475 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJELxS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Oct 2020 07:53:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4fB42MDZz9ryj;
        Mon,  5 Oct 2020 22:53:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601898796;
        bh=90DJR4YZuZUi5jw0C6qKl2jVLUGZP7/Y2iUBXg2iYzA=;
        h=Date:From:To:Cc:Subject:From;
        b=lm/F8KSL3UJumn0GzXqvdh+lEcESwzfVcHJTAefeaw6u2wMbuIXYIUFqSXpiTLbeY
         RfSw8Idtk6tzIxuJlgw6jyPbpEQVGzcOHD3ZEV6JfvqtdHEI9UVGGuyWZpEfmR0Uys
         bHXlxx+Ly+QlYUUHWCEWQwCB/ApCugC+SPcycHzGZHHxZDKib+Qm4reeKZ8EbEUhUQ
         fwF+ZohLbFKYXqyBEd/iIAOIQVHW7I+j60dYB9JZ5trvzy1ZSZ4P1ay8ttgxEITcs6
         ztppoRuktmPN/U3R+NQ4FEg5sd77iCIWwcciaAhFfK76eYionNQELKhnw5uhWlAe46
         FrxAQCGpNAajQ==
Date:   Mon, 5 Oct 2020 22:53:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20201005225315.0dd420c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GY5RmMK1ieA1qis=h4au0Ch";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GY5RmMK1ieA1qis=h4au0Ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  fe0d06f03320 ("srcu: Avoid escaped section names")

Fixes tag

  Fixes: commit fe15b50cdeee ("srcu: Allocate per-CPU data for DEFINE_SRCU(=
) in modules")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/GY5RmMK1ieA1qis=h4au0Ch
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97CSsACgkQAVBC80lX
0GwYtQf/WrYd/Z3TNl2TBYnC0OxS5m6O8daev4PabvO/lM9A9Z8v2HhPokA+rcWe
1LUu3q2hDXmfZio/g0WWB1o5ZVyfPQUtT2xTfownmgFpfK6k6tYfs5Tt3Sl7/GCz
ETumcqHRaBTvWGDKD8kiM/hibLdZJuLhz7VpYvMtFV20Dm/uf5JhU/2iEScFaYWx
0SYWOdP+/Ah1u/5yOXKBwVaUsrX/5zF6guJ5DhHZSR3L2mhKCX00eopT3HeL+Idh
hcP4wtTRr9MbsNYxEslbnDLS49jLSZ8jMLw6lA2BKYkX0/p31NBo5mUw9NVnE9ZE
eUSAIwk2X3Rds3dkSgUfVqlB6JlFkg==
=p3Lz
-----END PGP SIGNATURE-----

--Sig_/GY5RmMK1ieA1qis=h4au0Ch--
