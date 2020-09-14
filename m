Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C062E2698FB
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 00:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgINWgG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 18:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgINWgD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 18:36:03 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315C6C06174A;
        Mon, 14 Sep 2020 15:36:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Br1RG3TNnz9sTR;
        Tue, 15 Sep 2020 08:35:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600122956;
        bh=hkG3JIvyG35IhNUVx6HXFIMkJibsuYKVrsgpZVTAVlg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K+cwkIUrBBVa/RfaJ92o/0LF+SwecmOFbOf5+wM0TW+aLTlXA+EDwhxROI8G4nQjd
         SibM9krdxTL7bsGh9+2+AcecIKGh+Qe8KfT6xrp+WkwPSCenb05WdilTUXUMWBNkO6
         LaRGL9xDAB2kzS3YXN2KasqFw77g+BlkzFMJwZFKSfVEjScORjpriJM1BBRWnVNIU1
         nY0zNleh5TsonpLnXJHdU+d3n8rdkXJ4RrN5+HV2Tg9sWFy/GYHsk0TFVDLeWZm0eT
         p3wbLqqHoAyRL8/+uwcq6Xpur5hHGFrGdDrpG1PGSW6lFIimJ0YHIiG48CUS4r+A6a
         ZcYW+NsKLQxgw==
Date:   Tue, 15 Sep 2020 08:35:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20200915083553.144aabef@canb.auug.org.au>
In-Reply-To: <202009141310.C668784@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
        <202009141310.C668784@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/si2Qo.3GZDyydCiIfESV.hT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/si2Qo.3GZDyydCiIfESV.hT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Mon, 14 Sep 2020 13:11:37 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote:
> > After merging the tip tree, today's linux-next build (x86_64 allmodconf=
ig)
> > produced this warning:
> >=20
> > x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kerne=
l/trace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
> > [...] =20
>=20
> Hmm, I wasn't seeing that...
>=20
> Which gcc and bintuils versions are you using?

gcc (Debian 10.2.0-5) 10.2.0
GNU ld (GNU Binutils for Debian) 2.35

--=20
Cheers,
Stephen Rothwell

--Sig_/si2Qo.3GZDyydCiIfESV.hT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9f8EkACgkQAVBC80lX
0GzGcQgAoZvYJhci+oNcKY1ijoLmNSzUjI+IU/nIsZ+oh2c/xbd/CWNWI0s2spV7
cdCX+DKPXdYlgOm9TgjKwPGulhJ7MAYw8u3qslC0T4v70+a+kHd9PPI52xqhDpOl
n2N9z1iws7Qmjtjn/7H1NVYLjXfYSk3JVHxuaRBpFGQpDLzbqpCY7XWf6TsIQjQc
dUHXuGODYbmVzYujkjkU2sAXvitoqGIhDIT03OfpTxuNTVsqlMfEqmumTT3UozIe
YmMI/wGdtMlzT8txqVROSW3mGcM86U9St83//zBe27w4Dw0KmlBTo2UtDgZtGZbY
CtRb1nE90IxS0PYZzXTDwqo85JJtlQ==
=Xa5c
-----END PGP SIGNATURE-----

--Sig_/si2Qo.3GZDyydCiIfESV.hT--
