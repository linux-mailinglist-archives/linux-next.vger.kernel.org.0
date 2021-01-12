Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E9B2F3F9D
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 01:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732068AbhALW3j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 17:29:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51871 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394602AbhALW32 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Jan 2021 17:29:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFlbf0RK8z9t1Q;
        Wed, 13 Jan 2021 09:28:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610490526;
        bh=JWofPh/vLG6fRe0T7C0ijNvtTQCAwCldgdQ+lPDOdUQ=;
        h=Date:From:To:Cc:Subject:From;
        b=mv2HMHe0fmKWtTkBcsboE9PkISv6eErHHkc2yvW0+dkLqBCXUJuAKYv4/vJOR4s4o
         TOa9mbsWwFP561/ZYVnM4tXXEscxbIPbN14Od/AGCs/2kb76FDLRIYxyE9sS/lrskT
         1R7QRQWmXWT9J3WZ/x2IqB7r2Gg3GF3NjBYepuLfua5F8FlaJP/NNJu/PPnTyrMTdx
         bmsrD3m5aXrbp6Ilz9Oy961r51hYD69rBWaulYRwd6fzlrV8LuPZKwYsxEtiujHvZy
         dqWuTx45Hq3I0nRQsZl8oh7gB0WNcZRCaJKvus9cQvIW6dE0Q76MmApp9fB/t2rHpR
         z3JBzUwWS4cXA==
Date:   Wed, 13 Jan 2021 09:28:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Sameer Pujar <spujar@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the devicetree tree
Message-ID: <20210113092845.0ed42cf2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=wIPYtcR7sks/0I_btSFxNq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=wIPYtcR7sks/0I_btSFxNq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e9805cb2a361 ("dt-bindings: Remove plain text OF graph binding")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/=wIPYtcR7sks/0I_btSFxNq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+Ip0ACgkQAVBC80lX
0GwQLAf/VuZ/RF2gJ0llm+iXRKZHaWVRZ1uc9jVmeAmhGn65mCaEqSICfTuKvwee
9dOd5gxNldS1dwvNG03VqjAIinuKB6uQkc++P4DbrvbY9uto7XNlX8wEXyazt4+r
Z0eGP2LtoFKinNUn6+RHC2H9AN+ODmMFuU+bfo8ManQe206r3nPKRxYVPF8h6f5n
MS2jUFMgqY4zqifRdqfbkmjvl5eI2a/4mccRR3zEfR4w8WZyXSRgc+YxunplAx2/
We3UZWTAXf6bpzSo1SoBiDxFD3EZbw/8vGWkuV6sDjpdOPg7tbJSf9r5PC0D07s/
KasxZqAoeDy9e79qt14NOwqNsroYWQ==
=owuY
-----END PGP SIGNATURE-----

--Sig_/=wIPYtcR7sks/0I_btSFxNq--
