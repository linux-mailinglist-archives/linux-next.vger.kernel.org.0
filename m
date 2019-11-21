Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7440A104E11
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 09:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKUIfk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 03:35:40 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:53740 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfKUIfk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Nov 2019 03:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Pf9HiS6tkQID0Zrfp+JWOOfK8fSCKwS8E5N1FoKMFok=; b=ggQmS1WwNOr5lswFOkl8wAvMV
        hLRy/t77717TKhEUigKvyKAQpDG5AXLyMFQA9Bb7lgtglU25McuSAqzRL7P2ZNk+6dr+h43rDXu/0
        7/YuwPYzLlKU8R0s+bzgqCJZMO+FJA0yX9EYHwTcLz0sa+5Z99iqLt2ermLbf8TvB+Ut3mdbhSKDe
        qJy3fnQbWCM6rMX1QRDN74QVrK3SeAwYOe9fEr25JrGPrIyaPs/ZrIlKBoZOyfAaV4MAFf6+JzqtM
        VrYUzZA/hVhGdZLpUJPQBwHYZqM9DdkSkq8oRyH8NdgFBFRgdG3K0OfRwcVPrKTGXexeuLDhXAY6K
        nI+cg3Xjw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iXhvx-0004Ou-JK; Thu, 21 Nov 2019 08:35:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A6A683011FE;
        Thu, 21 Nov 2019 09:34:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 1E2DE2B28AC3B; Thu, 21 Nov 2019 09:35:23 +0100 (CET)
Date:   Thu, 21 Nov 2019 09:35:23 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: manual merge of the tip tree with the nfsd tree
Message-ID: <20191121083523.GL4097@hirez.programming.kicks-ass.net>
References: <20191121142833.2c9ffd62@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline
In-Reply-To: <20191121142833.2c9ffd62@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 02:28:33PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   include/trace/events/rpcrdma.h
>=20
> between commit:
>=20
>   832b2cb95543 ("svcrdma: Improve DMA mapping trace points")
>=20
> from the nfsd tree and commit:
>=20
>   60fdad00827c ("ftrace: Rework event_create_dir()")
>=20
> from the tip tree.
>=20
> I fixed it up (I just used the former) and can carry the fix as

Yes, that looks right. All I did was remove that stray ';' anyway, which
the nfs patch did too.

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAl3WTEoACgkQdkfhpEvA
5LoNAQ//ZqKoR6y13GCkjtB1W2OK6eyOIEmny2E2NIMDfHdqZyZBN2BIIFeZVId6
rp5O5yMk828GbGbjoFMc1Y1EPNyIu7ekQkFuskaZJuozK5gIjePRd8SxZ3HnEmRX
w3ZowXaiL3NrjpiJyMDSqPe9xu+JNNeqkakS50Z/FIyC0RHLctVjCM9u13vlMaiF
1seJeJU2Xs8XOQ8WiCkT2ln4z8Pc2WWP5Wn4Yz23M4yhekU6DiXKcYIbvCOVLrmg
JVqaO+ZGUJ9rb8lyj3+nGvB39HkSn9C6Vmw6vkJ6oVshfXrv70DK6oHdUz8qt3v7
9X8QwmIYLq7DiGJCKx8058qCq/SxPQfuXHIWieIQNJ3gHP+0EQciXhyDgA3a1RX0
5GvMXK28Ur9VWdroq0OIcbpfF/Khk+/71PHouoA4RqhAyNHoMKUo7yUH7WdGYxdc
d9fkX3XBUdm0bbB1Cnx97+x0iPFRK7gQ+hUbygbPJx9UM0/BAFptKwHedhs2wRCb
mWxnhDlwxsnTbtIuRDRep0PLah7L5U+yGWAkLA4++iDcUMKA+OjcI9psqW1YZiHF
LpBfESeMF+KSti6v75DuBPtNkwRdoH+cVt7Rsws+ddgyoorlE8rNBKbYzq8RCdd5
ay2/BViteY5tuDOljY4rlDA+nn2VCaGLqjFM5c8U9gEq4Ka5AnA=
=DMx3
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
