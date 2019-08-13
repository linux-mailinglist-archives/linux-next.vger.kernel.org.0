Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB1A8B2B1
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 10:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfHMImV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 04:42:21 -0400
Received: from ozlabs.org ([203.11.71.1]:41181 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726827AbfHMImV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 04:42:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4675n60Q92z9sN1;
        Tue, 13 Aug 2019 18:42:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565685739;
        bh=cExCFqXjxVjmxDksMkm9oq7FdCHKVzWSnPB8FZQzbLg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iQt7XCuPS4GyNXvi7WxSHszuG/jlNQT2PZwdC8UPug1LkCwBCCQdaYd93QK3fHzQJ
         IfEdmk2yWaHLO0P9X4usEz1MDfzAKKvE6wJ3ph2CD+m/Q43X8Q7QuSxwLeAVHdSiFi
         c+ZqR+E1CR+jpyQs29PDVNKoDGzNNh5YTJ60FPfGefwUJxAsq3DYy2sQcCGpGiZUaG
         EkSUlWEIlPfgTFUEhWlw9R4SbtDWeIpKTSPWyx/iV4wDhEM9/t3vz/LkHawFXroJML
         BjRM29dBKziBlbGhClhBb7fhYmpfSXGDDe+OCyBhDxm6XJl0fXNJMu/0EdfmK+Kdqo
         vxgR0i4nCOUUQ==
Date:   Tue, 13 Aug 2019 18:42:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Will Deacon <will@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Atish Patra <atish.patra@wdc.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm64 tree
Message-ID: <20190813184211.09b93f31@canb.auug.org.au>
In-Reply-To: <20190813082422.lecgqtknnn5g4dyj@willie-the-truck>
References: <20190813093447.747a5853@canb.auug.org.au>
        <20190813082422.lecgqtknnn5g4dyj@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BoYhefrZ/Ds4JUubZJLwknv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BoYhefrZ/Ds4JUubZJLwknv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Tue, 13 Aug 2019 09:24:23 +0100 Will Deacon <will@kernel.org> wrote:
>
> Paul, Palmer -- If it's not too late, then it would probably be best to
> stick this commit (60c1b220d8bc) and any dependencies on their own stable
> branch so that we can both pull it into our respective trees and I can
> resolve this conflict in the arm64 tree, which I'll send early during the
> merge window.
>=20
> Looking at your tree, I guess I could just pull in
> common/for-v5.4-rc1/cpu-topology if you promise never to rebase it. Faili=
ng
> that, you could fork a new branch from 60c1b220d8bc and I could just pull
> that part instead.

It may not be worth it, the conflict is not that bad.  Unless you
forsee more conflicts arising.

--=20
Cheers,
Stephen Rothwell

--Sig_/BoYhefrZ/Ds4JUubZJLwknv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Sd+MACgkQAVBC80lX
0GzTIgf/dgpXbBy8/A+AzSSRfawJTz79zIUOAK7zoTxNKkwIG3/E3WMbDKO+o34C
mh3si/PTJGGZ7jryX0Hleqo5JY4LtVt88j340jBUzKqmntY1/Wq2s4wdvhUHUTOX
AUc25HZwwEP8UHh6/q9DTCCae7KWLWhtPLwt8vzoRYl1x/kL4fXawH63lgm2TCDZ
2HuIwz2WdMjzKA6Ci1BSG8S53l+dJ+TO+ZhFM5BZ0w4Qk6C9jXZmQPAIVE0QX1jd
0DYwaNe9glHvgN/PVf/Uup4jTLYjT6bdBDKP2XnN+nLZ7SpMDB3Yo4I9z7Bu5cUP
PlWNZeAuv5wpRF/wGAhkPPAs2kK20g==
=DsOR
-----END PGP SIGNATURE-----

--Sig_/BoYhefrZ/Ds4JUubZJLwknv--
