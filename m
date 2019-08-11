Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B899489463
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2019 23:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfHKV1P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 17:27:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbfHKV1P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Aug 2019 17:27:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466Brc3ctcz9sML;
        Mon, 12 Aug 2019 07:27:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565558832;
        bh=lemg1XZKoY/pD1ybQMwC+6Du3MCkFzha4FmfuaD/GUg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sqBxk/kZNe2wpuIoLf3MW/bewetlG4FJlGudpYYvjnftLt2Bp0iYHwoZil4N5VP2z
         4LnyAp8oLHh3MxnW0BmpPNiLhXnTKIexqw1l1pZI5rgGLPsgG/D6hN0q5ljXY18DQ5
         cI7JRXRcTAu+T/3xZDPiFD17iz8A3zLWbL7/kSzuTv5g7zzlsVrFaRIPWQWaYBIIEZ
         q2VJgeF6pWtv9JrICw1Njf7JKtcM3c9l37p3h3UiduNypikFD6H1/3yxeCLLHYAHiF
         TjVyuNpfQNtvkCmvquvWg5/fSRKPbSFfY9oXfmBUuQ1nSgYGROWUfyH68SPfYbgRPN
         EFafp5E2ap1mw==
Date:   Mon, 12 Aug 2019 07:26:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Add SPDX kernel tree to linux-next
Message-ID: <20190812072659.606b2107@canb.auug.org.au>
In-Reply-To: <20190810115533.GA6302@kroah.com>
References: <20190810115533.GA6302@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/joDWPergj0mqSvlW2B4zo=E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/joDWPergj0mqSvlW2B4zo=E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sat, 10 Aug 2019 13:55:33 +0200 Greg KH <gregkh@linuxfoundation.org> wro=
te:
>=20
> I realized that I've been sending patches to Linus from my "SPDX" kernel
> tree for a few releases now, and it's not included in linux-next, which
> is not good.
>=20
> So, could you please add the kernel tree / branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx.git spdx-linus
>=20
> to linux-next?

Added from today.  One question: is this meant to be a -next tree or a
-fixes tree?

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

--Sig_/joDWPergj0mqSvlW2B4zo=E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1QiCMACgkQAVBC80lX
0Gwlzgf7BHK49PKtF9cbwzB+OTFwcYVI5QBhlxcgG7jPdrI+YRBJXPnszm6VcdwA
TZ3qgjkJl8SDAy88LsefAtMqRgZi52rIiJ6SB9YXfPlPzu/3tre47Umb+zLfTCoj
+HMN6zHnKskaPB0jxyEv3Lm/m8CWT4pzdXlQnWMrguvp+6PVbczZMsvJqMg9WEWr
X8a8df9QIlhDPIHOFgJ7BiNSMT1/L3/uN2Wu2szqMLix5PoRoAI+OSA8mBRcWWUI
RPE9fa8SGwloMIoU8CsRFAmy9DAT+F+wArb11iyjyfuPavqhglGJywPzCQS4O5/1
v+PjPeos8+qfC6AxI23IjvFJtBxEaw==
=7LyJ
-----END PGP SIGNATURE-----

--Sig_/joDWPergj0mqSvlW2B4zo=E--
