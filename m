Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E1B13BD5C
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 11:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbgAOK2A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 05:28:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53459 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729650AbgAOK2A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 05:28:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47yNnT3JS8z9sNx;
        Wed, 15 Jan 2020 21:27:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579084077;
        bh=5BX5OlZ3cL9ZYJfFFsrqoIGdVYAvou9z99rpn7nk698=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gWPeUiIl1aKxs9n0teqH4h1KX7q/F0QLv/X2wbS9eTbzTUNcNw71MXxQmZ3iDzs1o
         7ZM8o07J3YcHyz1GvQAygCvB8TPcmJlAzJPbU/FDuskkD196XQBacO5y81cP0+rVTC
         rccupVYg3Cqf6DEHfodUODDzAFv5YMMLiuxWNr7k1jqNFzemLTAfteYSjs5cEkldcW
         GzRVazcfIRKytx2Mr4aYN9SHQLv8HgOGT6iBLNyxKwvMv8Q+iprjo34ThyDryco/9o
         r3tvoGaOPxYgr55UW/w+zVbGuALizPRAYvYuSBfyBvhH4j3Rej79P5mCR2NbDXaZJn
         kdOfVmj0A+N2g==
Date:   Wed, 15 Jan 2020 21:27:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jean Pihet <jean.pihet@newoldbits.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the spi tree
Message-ID: <20200115212739.474e8272@canb.auug.org.au>
In-Reply-To: <CAORVsuWs=0su+y2iLfL7zUygW8UgT8WzTXoCJiyBGFp_UG8yFA@mail.gmail.com>
References: <20200115132325.3ac3ca0f@canb.auug.org.au>
        <CAORVsuWs=0su+y2iLfL7zUygW8UgT8WzTXoCJiyBGFp_UG8yFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qf_b=7/3tSMR196pg1OnJo0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Qf_b=7/3tSMR196pg1OnJo0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Wed, 15 Jan 2020 10:10:09 +0100 Jean Pihet <jean.pihet@newoldbits.com> w=
rote:
>
> I did not have this warning, it may be a combination of compiler
> version and build flags. Do you need a fixup patch for it?

That is up to Mark, really.  Unfortunately, Linus will probably get
this warning during the merge window which he will complain about.

It is really weird, as there are three other references to rx_wlen
immediately before the one complained about ... so maybe this is a bug
in the compiler I am using (gcc 9.2.1 from Debian, cross compiler
ppc64le hosted).

--=20
Cheers,
Stephen Rothwell

--Sig_/Qf_b=7/3tSMR196pg1OnJo0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4e6RsACgkQAVBC80lX
0Gx6Wwf+Ji5II4vWFmpzkIB9qJqtNt2wP+TjEN9PPgCMJQLLMZDvWDOmA6DVjs82
3JvgyqPB4uZIb52XOp5NcZ3ySvaV2K117jCqdCAsEIuTljxQM7/6JHhh0cuEm1Yb
ONkjH+V8+l+wvTIdxzPtz0XG3o9nNzemXWWHzUFNBvS38ClWS5aQFfzxRDt/Cint
QxtJspLF5fd8GAm1sX/tuquzyN9U6rcIy8LXg+EIOEYBextx2ax8miOi+DOyTYYZ
Wd2Oaui6jDiWJRqoa6w/iStxNNsf+3Md6OYxaYL3eMTKQE79naE2VSH0l6D0TUo6
kxVD46IZGCvSEEoPpeUQUN7Qs0NMAA==
=+m32
-----END PGP SIGNATURE-----

--Sig_/Qf_b=7/3tSMR196pg1OnJo0--
