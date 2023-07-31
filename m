Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43993768ADC
	for <lists+linux-next@lfdr.de>; Mon, 31 Jul 2023 06:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjGaEyO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 00:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjGaEyN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 00:54:13 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17ECCA
        for <linux-next@vger.kernel.org>; Sun, 30 Jul 2023 21:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1690779247;
        bh=cIittM/sdO1aNlqsGjXtlTJ98Mwv/74WzbWAgnKzMIs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WUuVJWJ5pEcKWi89rjsTt9ompAyjAoJ5juRdv2cgCuutWTD2cIlOQ8gAeZawknYoL
         vzPUFfqaYqdAn8yVz56pr0LLjBm/HTEOTFrAzFX2aofqJwVq3KO6OqOcY1CBkpX/u0
         nlyvtXtz3MYK5r7AnY7SJk1JZ1elsJIpzSSrQFRlrZF3IN9ZWBeWmTZzy9f4+Fg6Zb
         9FY4bR3Vd2Uahi4j4HzdPeUkucP3JIr0uQ6tvlcwX+LNS/uRWeOF++BZy8KYECFAxs
         BH5f9Xp+QwelhCKJvvWR8XGz7T6yEmgFpLVsSWmoyXzKw94xyBxKhDIeDVTV4bxN7J
         XOk6f2do2yBPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4RDm9V63xNz4wqW;
        Mon, 31 Jul 2023 14:54:06 +1000 (AEST)
Date:   Mon, 31 Jul 2023 14:54:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c inclusion in linux-next
Message-ID: <20230731145405.13394138@canb.auug.org.au>
In-Reply-To: <20230730222921.637gy5xbtfekmite@intel.intel>
References: <20230730222921.637gy5xbtfekmite@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tlPdsN3RFRxZfSc39=HDJ/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tlPdsN3RFRxZfSc39=HDJ/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Mon, 31 Jul 2023 00:29:21 +0200 Andi Shyti <andi.shyti@kernel.org> wrote:
>
> could you please include in the linux-next i2c related branches
> from my repository:
>=20
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux=
.git
>=20
> the following branches:
>=20
> for next:	i2c/andi-for-next
> fixes:		i2c/andi-for-current

Added from tomorrow.  I already have an i2c branch from Wolfram, so I
called your branches i2c-host-fixes and i2c-host.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/tlPdsN3RFRxZfSc39=HDJ/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTHPm0ACgkQAVBC80lX
0GwFYwf/UvRm/gIRraP0u+FuZuosEmBk5+alNvZQCEEaO4/KVzQI6VxMLJPra5ZA
3i9GesNQJ8TMTAfFxbJKFTSNBZfugNqANk1s9XnZ6cRd/0UOQlLeZXL6+grXRYoT
ZuR4/bctknXIvdsHS7ebVdTH5BeWrRb6HMPK7LocGus3GqxfDTwFrQYiaWKfJKmQ
XZa97no+6n7UXe0XbLqvZo2iWmilG0eXLSF69bXrFYXsHbPtnKThbDJxKsbQyvsG
BIBfUYAtJXZbDcJzKk0E27xWC7mX1tA7l12wjFnjhCEh6nslMdkf7N+RfpRKogEF
e3q5vU7z3PsiZwLn3BJRt6JQSaXT0Q==
=fIkN
-----END PGP SIGNATURE-----

--Sig_/tlPdsN3RFRxZfSc39=HDJ/8--
