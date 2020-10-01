Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665CF27F733
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 03:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgJABWK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 21:22:10 -0400
Received: from ozlabs.org ([203.11.71.1]:59853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730881AbgJABWI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 21:22:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1wMc5Qcsz9sVH;
        Thu,  1 Oct 2020 11:22:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601515325;
        bh=lxReYaKMZ4Whv2LEP3oxnspFk35br6e0B7xf7dEz2Hs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ANfcG7RdhJU1XQnVrLkFQGNV7ML0+gzOP0wt19ipwQvTzqfpvosIZJmb/7H4BSXg8
         FwYA3EcniJxoluxnUgvxMvwul94/Z/jxuKmdU/xRopJOZugV80cs9oiClg8QTppvAr
         Dn4hP0NbFWzVdDo7Ze9pT6ZRqoEJtBTBEtG1Zzbl/6ag/ZntzA0yyty+obbzS2BX0U
         rdngucPAK3+IhM+ucc6EUyJBEKpfdjKcAi7qbvCw5AopFEGeBTUmF7EROycUfoBFWK
         WNah0SHXXAWohfPWGEYSGhBUrlimt/ncFdEX2wQfxoKCTOtrGkCdPFmBXH4ysidSTU
         aOHvmbTNL9dpw==
Date:   Thu, 1 Oct 2020 11:22:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
Message-ID: <20201001112202.74a7e72a@canb.auug.org.au>
In-Reply-To: <160151172628.310579.596467424545504483@swboyd.mtv.corp.google.com>
References: <20200923214632.079690f6@canb.auug.org.au>
        <160151172628.310579.596467424545504483@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/epqEPDSI/CmOSX7m.VoxL/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/epqEPDSI/CmOSX7m.VoxL/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, 30 Sep 2020 17:22:06 -0700 Stephen Boyd <sboyd@kernel.org> wrote:
>
> Thanks for pointing that out. Is this part of checkpatch? I run
> checkpatch on most patches and didn't see any complaint.

This is not part of checkpatch, just some scripts I run after fetching
each tree each day.

--=20
Cheers,
Stephen Rothwell

--Sig_/epqEPDSI/CmOSX7m.VoxL/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91LzoACgkQAVBC80lX
0Gx+nQf+N09NcphrAUh/sN1LRxsfksBpBEVB4mQj8b0IiHRSmKyN2Z8tOlogwLai
jELGwd+EhUzNrlWXoVDEgCLjC7P+4Jo2DWnv0kZyl/iCQJgQC1C9Y6smOqPOomnb
rQ8UnL9z9rCZF46o+CSq3eOfysml969SCeEBiVAzq5eUvyj4KqNhwgDTZpRbVSBe
GI59K9DfhPkgi/pCmd2TKPwnsrceU89hSYsPYVRefqxzyjYPKVj2gC7ktXDD4fpj
V2O4Hfbc3TEdttqo/yyk6Qc3K4dvhswkcv8YiF6A5b5c3RISMWssatGxz12BLfwy
Qf4zDskYWoOewM7apkFEWhNtcYZkBQ==
=XxkC
-----END PGP SIGNATURE-----

--Sig_/epqEPDSI/CmOSX7m.VoxL/8--
