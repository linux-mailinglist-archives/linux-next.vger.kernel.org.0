Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8311C7E84
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 02:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgEGAWL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 20:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgEGAWI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2020 20:22:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958D9C061A0F;
        Wed,  6 May 2020 17:22:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HZ0D6SShz9sNH;
        Thu,  7 May 2020 10:22:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588810925;
        bh=jyo4zZIuRNjStCkhp9db7Sv1wx4+KRZGJtmNOO5v5nI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mB9hxhZ4G58ptnbABAszw2iyX5BIWlrlBnfdPw8wQhEQWvysvy3p8RiFw8tPBtcyb
         G2kirMdmzCiQKPncfV7lTAjPdgYGxnQezxABkPgu5XZxiUqrCZiZN0p7/ao2SYrWsX
         vR/HjPoxGKRkG6HhHzCa9vJzuMMbP3RuGY6/nmZDfPx135qBsYlQRJp+Mn9c9lgx1u
         XgG0u0wtiTKCp0CRl/1vgr+WbYxZ6pVgruXkTQt1E5FhfApfmhdKRKPtn2FAIrRzhx
         Lo0gnaW91t4iy8MsJmHCcJjelWt1yu2PaTlw42JcERirSYJDeJDIh+zGTvyCKu7er3
         hQy9Q6EL9VM/A==
Date:   Thu, 7 May 2020 10:22:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 14 (objtool crazy)
Message-ID: <20200507102203.2f48e2e8@canb.auug.org.au>
In-Reply-To: <9c7ce0f6-b15d-5205-352f-f82bfbcf7f29@infradead.org>
References: <20200414123900.4f97a83f@canb.auug.org.au>
        <e01557a7-746a-6af0-d890-707e9dd86b86@infradead.org>
        <20200414221914.hbvp4dvh47at4nlg@treble>
        <20200507085011.6d2edf32@canb.auug.org.au>
        <9c7ce0f6-b15d-5205-352f-f82bfbcf7f29@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UduUpsQ+CLrMJ8UNs2pSNwG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UduUpsQ+CLrMJ8UNs2pSNwG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Wed, 6 May 2020 17:13:40 -0700 Randy Dunlap <rdunlap@infradead.org> wrot=
e:
>
> Yes.  It's here:
> https://lore.kernel.org/lkml/02b719674b031800b61e33c30b2e823183627c19.158=
7842122.git.jpoimboe@redhat.com/

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/UduUpsQ+CLrMJ8UNs2pSNwG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zVKsACgkQAVBC80lX
0GyObwf9Gayq9XY6Im/0w9f1hyZFl4qTUCUMTyPRSOD6WAsbrd/hOQRJfN7nCtlv
NcUfNqgOQpJAyMkDJH9dAwu/ComJM3MCiH2lCtBQxFAg/yZ92/Np6gF5mRYpEthE
7iz3ecsxtgyh+UEOlyT3FbuT4ALEfy27mcHWr0tMbvNU8V2FGPn3fFUTYFE2hSnJ
+Xlv707bF4J+9iOPOt3+7PD4B/65yCm8eavpBXmcHnPR3Oc1U/n6qtXJj86Ks63f
ObA6F4xA+H1jVANCp8qeEcbgQxcshqsy2sob6yXpS+gLSOyUpwwVyOJKhUMYUgwl
6yrJ/7Dsb5BX3h6beevoBjwEhhwZgQ==
=DseR
-----END PGP SIGNATURE-----

--Sig_/UduUpsQ+CLrMJ8UNs2pSNwG--
