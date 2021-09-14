Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472B340A39A
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 04:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbhINCkl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Sep 2021 22:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234374AbhINCkk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Sep 2021 22:40:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A43C061574;
        Mon, 13 Sep 2021 19:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631587161;
        bh=NNLdb+tECq1l7xogf7Au1N/ustEDQllv2zv66oTGgyw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RxWoqC8fZvwPwEJrTLsNOSlk3DTOTx7zLVy+eV586m5Ls6i4NqwCow0eUFM/SpuMQ
         EoAdWDY7N5bKIRYzNFJ+QvNAT5B1SfOZhhK/ifPri4SAnkkJ10e4yYMMe6i471GrHt
         z3w1VgrWxo/xOOIUuTu2V/wSOXYmbNx9aqjCRwuEf3B9iZEXb1dAs3gapMlnAYkrp6
         sgPCnqWA9ESkqVdkge5pMu2WnB82/IzfQcPSLWh3gFgmgggMttfiYiMgX0KBnXT9XP
         pQ+DIMPN9wHQ2SHUjyKeHnFd0XTSRfgkba/EAvVzgr5U0pzXUh7gAih1n0NkuWpgg0
         g2GbR4VL4MbFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7nc85xK1z9sPf;
        Tue, 14 Sep 2021 12:39:20 +1000 (AEST)
Date:   Tue, 14 Sep 2021 12:39:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20210914123919.58203eef@canb.auug.org.au>
In-Reply-To: <20210914120818.4a102b46@canb.auug.org.au>
References: <20210914100853.3f502bc9@canb.auug.org.au>
        <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
        <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
        <20210914105359.5c651d55@canb.auug.org.au>
        <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
        <20210914120818.4a102b46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W27Rs8bNl2dBu3K5aSr+_f0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W27Rs8bNl2dBu3K5aSr+_f0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Sep 2021 12:08:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> That patch works for me - for the ppc64_defconfig build at least.

also allnoconfig, 64bit allnoconfig, pseries_le_defconfig and ppc44x_defcon=
fig
--=20
Cheers,
Stephen Rothwell

--Sig_/W27Rs8bNl2dBu3K5aSr+_f0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFAC1cACgkQAVBC80lX
0GyFpwf9G08XKB33hmCsxFax7/TDrvGw4LjQgaGMmSAGRyoNbUfaQDKufP6jlej4
w+ZJt8Dulpbi8y9gczXXtbwT65gU8jjK8M67ufP76UL+GJ5fcSqx6hwA8yq0RV2/
t5HaQd83VM+PzVpSsiAcqOhMntuZrbz3wIieqGgytFUKUKtpA2MfBSsH4zm2pD9X
uw/LtGyjsCk39CIMRBbeKxBbtMcrOaxnW/Q2JK5XEyTIT9LSInuHehh/xXQ9+I3d
Bnz9JabAJKl3ke5GkRX/pq97oenQNx1J0udAaztYdbeGg+me96aNohEPZkITLl5S
AV6jJUq3ruoETgb85CFKIjVoiij/kw==
=N9Ki
-----END PGP SIGNATURE-----

--Sig_/W27Rs8bNl2dBu3K5aSr+_f0--
