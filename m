Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965A728EA4B
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 03:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389169AbgJOBjj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 21:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389114AbgJOBji (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 21:39:38 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2950C0F26D2;
        Wed, 14 Oct 2020 17:19:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBVK76dyWz9sTL;
        Thu, 15 Oct 2020 11:19:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602721181;
        bh=2Tcp5S732htwqUBy5RB+MjIuctB4QUMXobgmn0fnjNM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FUx+//vxnKoP75TV5gzGLH3Ec0olLPSPR+6thvoT15s1ewq9pJuRXJEoomDDkxnyM
         RJSssJ3osfNTVSukP/rprI/TCm/cRlYeZlkaeEt3tnAZPchz/q8ygUxg4HudeLx927
         gyR1fXe8fUTPc6sT6Kojj5wQlh1ormNAci6Cc8eeNGkXXTCyEH0K87WfjOGbjeTFS0
         UN4XPODiwg5Nhy+8Wc3W7F8NfuG2vVH+0bC2z1eQtE1AnruvrRf1maJZlFaK23xqQB
         M/2HyNLHr5v1CsXHTm3EFo8Gax1K0SIrGCOzPtl4C2SqUuXI0R5T9wTOUWXS/xdTLq
         rxSNXPrYAsrig==
Date:   Thu, 15 Oct 2020 11:19:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201015111938.5bd779c3@canb.auug.org.au>
In-Reply-To: <202010141607.E9A032C686@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
        <202010031451.ABC49D88@keescook>
        <20201004102437.12fb0442@canb.auug.org.au>
        <202010040125.B5AD5B757@keescook>
        <20201004210018.5bbc6126@canb.auug.org.au>
        <202010041944.7FEE22407B@keescook>
        <20201015092526.144df583@canb.auug.org.au>
        <202010141607.E9A032C686@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fBXYlQhN7kmOsjyMuhj6N.e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fBXYlQhN7kmOsjyMuhj6N.e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Wed, 14 Oct 2020 16:10:05 -0700 Kees Cook <keescook@chromium.org> wrote:
>=20
> I've pinged the thread of the patch (from Oct 4th) that fixes this.
> Hopefully that or this email will float to the top for an x86
> maintainer. :) If it doesn't get picked up soon, I can try sending this
> direct to Linus, though it makes more sense that it come through Ingo
> (as he'd done the orphan tree pull request).

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/fBXYlQhN7kmOsjyMuhj6N.e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HlZoACgkQAVBC80lX
0Gz/FQf/Rx+9JlWEpBOajoa+TegPawUWU2z2r2/P3a6yM7qYdVuqOwvED1ghkuTs
+fN28pYe2G9Q8OsvVywJfZv/oTKJfjX9ySEOnq/lRTvvN9VlHBN1z0AiX6x+2vgx
2f1iHBZzHFSKzq3R52NfwZWeFOjPsAHekE0wS+zq2k5FA+9YLWTNFzp1WB1fT0hM
UzcNYcwLncQRDAXR+noE0XKE08bTY35HIysYg8AkIPg2cVTU1jsSS52qRA5AMs9h
Hjku9WAOpwqw02344AI4PfeM3HOa1FjkzOp3zChKTPznvetgP4iZexMVm380bHtw
paPMstiIP+wkYUiYlO8x89/ziODpMA==
=c0IV
-----END PGP SIGNATURE-----

--Sig_/fBXYlQhN7kmOsjyMuhj6N.e--
