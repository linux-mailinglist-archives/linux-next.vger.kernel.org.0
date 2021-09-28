Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175B441A6F8
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 07:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbhI1FSC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 01:18:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51379 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234148AbhI1FSC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 01:18:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJSQs5y2Bz4wgv;
        Tue, 28 Sep 2021 15:16:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632806181;
        bh=YayUMtO1Bju7/J5xYvIjpk4bEm82PgnvsAQ8Es0oDGw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DIhxhTmOKN6bnSSi9ooLdz4StLy/+LdcPv+RkgUv8HzwX+ZLU+1pvFGM0BTMYBtHz
         DdViYS28cpQlhogYhK04GlzIeErSANZKIoGr7YPwNwYZdhJKhi4KyMp/IqHUHG3ax8
         7J3i+whBMzZfI3OJtfJ0uSckvYIq3U362ta4NEGpsqxzdcISljK2pI/CT13Uzn0RIM
         fLOriHEZwZwAYtBU6KJecBzjSGoSJzgSmpGA7G/ge2qFi4YbekPPso5EGH9mVfpXan
         fm7JqVTsSP+iz9zEPWifWoNGpwBzRDr3odfZjyfVxoTnzb5tMA2PyDFs52yMKMngeL
         JKeND7WVL9C/Q==
Date:   Tue, 28 Sep 2021 15:16:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] crypto: api - Export crypto_boot_test_finished
Message-ID: <20210928151621.7aec3f34@canb.auug.org.au>
In-Reply-To: <20210927112341.GA22483@gondor.apana.org.au>
References: <20210927143229.543749f4@canb.auug.org.au>
        <20210927112341.GA22483@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ClZjcy/bnsPV/jLYuBXNe+7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ClZjcy/bnsPV/jLYuBXNe+7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Mon, 27 Sep 2021 19:23:42 +0800 Herbert Xu <herbert@gondor.apana.org.au>=
 wrote:
>
> Oops, does this patch fix the problem?

Yes, that fixes my build, thanks.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # ppc32 build

--=20
Cheers,
Stephen Rothwell

--Sig_/ClZjcy/bnsPV/jLYuBXNe+7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSpSUACgkQAVBC80lX
0Gz6qwf/Qkt4Kr48KaWj55l97WffRRjsxyBx1TH2ssYLP/OiJz5lekeAbdXGkVut
2bX32c5vTSgjfoCZ6ZIGKTd/HVIZcoHnaP90uo6bWDrRoQi6KW+4L1r9gbNLUEdy
T6Hx9joPayWg//XTGFIQ9oPhxIOgUWZ/zCkF//Hi7GnTxQnMk4OjhmB8dP6AnxrM
OMiKQG35HsazZyDuvtUtJ4TYIrKbEirKXvi2rHZ48DbMopWumKfWwlKH9/r1FQFc
XAuzjMOnVCqm6stMtfr3KnlxybUcunmd6WqtFuBSx8cZhMTnPxTlBLaRvPT2IGPk
UdFg/IR2Ayj6RM8o09Yp3QIuc/qvAQ==
=tTbA
-----END PGP SIGNATURE-----

--Sig_/ClZjcy/bnsPV/jLYuBXNe+7--
