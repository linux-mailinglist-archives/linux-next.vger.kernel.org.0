Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9309B2F6AE7
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 20:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbhANTZc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 14:25:32 -0500
Received: from ozlabs.org ([203.11.71.1]:35803 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbhANTZc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Jan 2021 14:25:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DGvQT5Dc1z9sWC;
        Fri, 15 Jan 2021 06:24:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610652289;
        bh=FSjGlIsasFFClfDzysM0SDh6teWCJZLen5r7JeIuKF0=;
        h=Date:From:To:Cc:Subject:From;
        b=II8Mi0rDGjX53qP6Kt4nCI2tU2Z0E5pbgzX+89K4XqdpHBYBdAIwpy/1J6F+1XF1j
         DPACt6FSLonRP8rjf3JxxwjiTWRE0Tw411MM9Ur247+v930GtQ/kZ2dae43X2kJcds
         VBcFjSTrsSOahzW+d4q78lbqkld8BmrLIqvR7Cae26e9ol+sHnGsFcVHtzzOMduBw1
         uZdEVASA6KV7xLI304yYTq0cmvWe+71wSzv+po3KO5pZt/b4B7HolRYyn9St9UximE
         Id2keYI2c8SJSqnLCuPJI2HLy1jbxvqNtDculwUr2QdBJppoiKHo+fUKMKATL3jnuU
         wA8nG1KwnvB1w==
Date:   Fri, 15 Jan 2021 06:24:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm64-fixes
 tree
Message-ID: <20210115062448.484390ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qkFg.5To/jTBhiwyZHWIr13";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qkFg.5To/jTBhiwyZHWIr13
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b5639879902a ("arm64: syscall: include prototype for EL0 SVC functions")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/qkFg.5To/jTBhiwyZHWIr13
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAAmoAACgkQAVBC80lX
0GyCUQf/TFE8oM2e71+/LW5hLMEyI81AkYieb1mrziROHBxlC1gVBRljRYkfbUJC
mwmZJoyDS78FJzjOgD7geVP5ieNMGqNPPsKXGckbZmWuMQP5+u6K3h6NnZGAnRmr
4z/luuD7J2Z8M7dEIN+rly3mqpJUf3vpzoegsWg5olskN185dYaV2uiAy4ThfbJG
m6bDw1lASqSs33uL/+UhcWAJKBJKmHRo2133b4hEuMK/2Wd+LPKrsRHP9d6e9kxF
unrJRkDYIVu+OINe/j4qJ5DuiP1wV4yyAyTvE88WmBAVe9TBtSnF48NojRZ2Rgs5
RFIdW1dEKoRlQTLQBgymYDR6yNvq5w==
=WVqv
-----END PGP SIGNATURE-----

--Sig_/qkFg.5To/jTBhiwyZHWIr13--
