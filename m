Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAF627FE07
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 13:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731888AbgJALDE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 07:03:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36625 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731131AbgJALDD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 07:03:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C29Fv5fl9z9sVK;
        Thu,  1 Oct 2020 21:02:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601550180;
        bh=b/tiFN1U/Aiqw+ie2Zucm7bU1puwwjzinLmQAmDT/OE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JWvFwotCR6KGK5My0YX/Z1YQGNvL1chdGmn0DaFsxTtwGmV7seAQe/9WKT1uCrsbY
         Da1EzJW+mwklKe9Hmr7Exl/DdbW0zeb9KjNcjF3WkFBYTP/qHFjTlmW/PWRzIzGUkl
         PS4nzDR7E65gWvTiiMvrAmhgURJYI9tntyuKTlP8SBscJJ2erPQ7bI8ek1HeBEIg0E
         oWd+MAtIPcrd877rnuTNQ+rlAOGIubLMOW/zgL6cU8yzEarEVrPm0OErJNblXYrKW3
         wnzJg8fDUT4Rb+zW6MczbFqu8w5pMcatOUj70Kyg4N64hNp5Ah3cDsSTjqPEhHdrJV
         inp1vRk0io97g==
Date:   Thu, 1 Oct 2020 21:02:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201001210257.19bc53f8@canb.auug.org.au>
In-Reply-To: <20200915083553.144aabef@canb.auug.org.au>
References: <20200914132249.40c88461@canb.auug.org.au>
        <202009141310.C668784@keescook>
        <20200915083553.144aabef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Yc3N3NdWKC0SC51nW3nvg3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Yc3N3NdWKC0SC51nW3nvg3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Sep 2020 08:35:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Kees,
>=20
> On Mon, 14 Sep 2020 13:11:37 -0700 Kees Cook <keescook@chromium.org> wrot=
e:
> >
> > On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote: =20
> > > After merging the tip tree, today's linux-next build (x86_64 allmodco=
nfig)
> > > produced this warning:
> > >=20
> > > x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `ker=
nel/trace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
> > > [...]   =20
> >=20
> > Hmm, I wasn't seeing that...
> >=20
> > Which gcc and bintuils versions are you using? =20
>=20
> gcc (Debian 10.2.0-5) 10.2.0
> GNU ld (GNU Binutils for Debian) 2.35

Any progress on this?

--=20
Cheers,
Stephen Rothwell

--Sig_/1Yc3N3NdWKC0SC51nW3nvg3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91t2EACgkQAVBC80lX
0GzcDAf4xrMnXkjfy+APZ5QGtcroObaLzcc7YfL+u7c1bOGesaSYiurzVkcIdmT5
yTu6odus61+klrvLkYaCdSt09AaMGj5/I78wtQpNJeaxlMO4ApGxKEtBUeFPwvkZ
+XTUePzSotrGHRzfr8lm8MhWt8luNNJyNlU6loJGPhN/6qiQPF9dBpMXUrsb6rfq
kg3ZwfeG9sj1sJkR+TLDBCvfWmp6OQvqxWnE3s5L/rrjp2stAmGTTH56FkoedP9p
aj4j94HUtDNEona8rllvLYooMzGW1LtBYt6B8Nfe1D71wEGGWfa+IQDtdW2D0i7w
RBmItjpb+TxEtxO/+RFzWGsnc8mV
=znXl
-----END PGP SIGNATURE-----

--Sig_/1Yc3N3NdWKC0SC51nW3nvg3--
