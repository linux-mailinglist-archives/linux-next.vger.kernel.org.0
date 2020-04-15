Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943201AB392
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 00:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730880AbgDOV7z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 17:59:55 -0400
Received: from ozlabs.org ([203.11.71.1]:52543 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730785AbgDOV7y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 17:59:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 492bqq6Kdxz9s71;
        Thu, 16 Apr 2020 07:59:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586987992;
        bh=f9ffZL059DRbr5MCmSZnq70759kgBOjqq5bBazpkPXc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jIMfPtI6pUIWFFs67hckV5OtsECRmmTYhbAvr15L+tyZR2g8YkMlorVMfFEmP8Rfp
         u7ZPdRtPVmjLCA0k/ZBnYRyD0kBrJqECLMfkEdXlwKvYgVzS/OJEiSRv6XJuYuvwM+
         Y6qly4j7xb/+HjrmmhIT8wWxZzXVKj89zMkRU2hhjTLROL7OL4IAmbDXEbXlBqxcJd
         RhW0sUXkTxY0kQRvmBz1lgQiU5Soma1LIM1JKMJ1QmW8T+zjMIO7qV7PQBVUN0W2OE
         yUAhxt3bJhXfin4wlFruSlJaIRuEUxzQWqw1ShfkrBqlK5v3z5NpGEYTyYBCcys3tZ
         lY3j3cnw2jBcg==
Date:   Thu, 16 Apr 2020 07:59:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Namjae Jeon <linkinjeon@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next inclusion request : exfat filesystem
Message-ID: <20200416075950.4c1b81fd@canb.auug.org.au>
In-Reply-To: <CAKYAXd9O4F3Y11zAV5MGxhsTgCQNTL-9suKR0AZi08=bXDT5AA@mail.gmail.com>
References: <CAKYAXd9O4F3Y11zAV5MGxhsTgCQNTL-9suKR0AZi08=bXDT5AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sn2IfJh2UtkZPTiJgOtMU/.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sn2IfJh2UtkZPTiJgOtMU/.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 15 Apr 2020 09:03:58 +0900 Namjae Jeon <linkinjeon@kernel.org> wrot=
e:
>
> Could you please add exfat -dev tree to linux-next ?
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git dev

Added from today.

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

--Sig_/sn2IfJh2UtkZPTiJgOtMU/.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Xg9YACgkQAVBC80lX
0GxCMAgApCcb7ghe/8ufjr1hYylz55Wy4QXURzW+eCwijvtMDQX52RlWREqlrIXU
kw9b+TR76d14uRnlfGVGv2TzM9dLL28elJLJJ0i2OU1wEzesCgXxVumNK2Mxo8LZ
MXKlbBroZNQxT+uSwLeEcfjsW1RW+b/wTt2oMFeygG/cd81WVQBrBwdOnj2GG9WD
2WtLqXSIlnE5sSsZdgGkHje5COG6GMQOu02lN5/Ns1cPy+U6z/gqSkkVIF2j4TOv
74tUDOKqDyBPqv3AmbCJ1OQu6IT4sGnG8UMic0zW7+SOt9vdnCoojVm+kOtBgpV9
Q538wsTStaDvr2DbL13xe7Xnt1kanQ==
=7NG1
-----END PGP SIGNATURE-----

--Sig_/sn2IfJh2UtkZPTiJgOtMU/.--
