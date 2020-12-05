Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F502CFAE5
	for <lists+linux-next@lfdr.de>; Sat,  5 Dec 2020 10:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgLEJtK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 5 Dec 2020 04:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgLEJmz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 5 Dec 2020 04:42:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9D6C0613D1;
        Sat,  5 Dec 2020 01:40:10 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cp4H821k1z9sWL;
        Sat,  5 Dec 2020 20:37:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607161045;
        bh=ipNjAikEI2HyTGwjLs6S3R5Hxsth30qRNEjh2a5fmts=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q96cgSwxq2Vub53XuAq1c5FJeRBP4UUcO/XL0QpGSY038z0Ei5CFWgPbf9VxoKR2L
         ljdQR97rIb67PaY04rDFBCiNX+ThGfHxeVz9Bci55S9AeAiVliXG29oU3KVirKOX0W
         zdvaLW8BWMeeVkXkPb0PDVciRaOIqwAivT81yU00Y3gL1vr+mHnJMGeg+Tq4auk5D5
         KbtrQ3UjI4e5XdXACnhQQ8cpVsp1ZttD0bSpG+WGdzXBFoHaJsrMnKpXglxLLRY+bg
         K2QFXHnQBg0dAoutoSJWCjghLhRXSNnJ423dDpEkGdi/ldSKzTDErjNFHc8ZxXLxgd
         gPhsq5bRw5YeQ==
Date:   Sat, 5 Dec 2020 20:37:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Victor Chibotaru <tchibo@google.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <20201205203721.229abc2b@canb.auug.org.au>
In-Reply-To: <20201204211923.a88aa12dc06b61780282dd1b@linux-foundation.org>
References: <20201204210000.660293c6@canb.auug.org.au>
        <20201204211923.a88aa12dc06b61780282dd1b@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+1BVDbiYWPgRc_=P2Za8evW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+1BVDbiYWPgRc_=P2Za8evW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, 4 Dec 2020 21:19:23 -0800 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> Odd.  clang wants that signature, according to
> https://clang.llvm.org/docs/SanitizerCoverage.html.  But gcc seems to
> want a different signature.  Beats me - best I can do is to cc various
> likely culprits ;)
>=20
> Which gcc version?  Did you recently update gcc?

gcc (Debian 10.2.0-15) 10.2.0

Not recently upgraded.

--=20
Cheers,
Stephen Rothwell

--Sig_/+1BVDbiYWPgRc_=P2Za8evW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/LVNEACgkQAVBC80lX
0Gz0wwf9ERSJAMfthvrmEhC6meKoe5scEYwwny5nJQjD+tVxfYNwbg4+M5ddJsiQ
tnXyfYx8kAyguRteAwu5RbkY8Jt//wqg4q0XtxO2EzVkaVhxLe0D1abiPbr3Yq3v
j1q6nkAP1vS4xEF84Pzjr5NiBR2G7DxHD6qKBEoyCHQfiDdy6dYQJSYbvH95D8R2
n+tjnvCFOW7THzHdjOaCBFmtlQh/nxTwfGD7K8O5eojQLOPkbbRVsHBK857tCYSb
Kj/B2/owHiwpsVTCMtfFfcdPF7e+EztSJRpwkCbIOpHqy4xOUZl5i3H3JTw5rDjO
MIE/2p1F9xjoaG2rHmKkUFtj0mqhgw==
=TjG3
-----END PGP SIGNATURE-----

--Sig_/+1BVDbiYWPgRc_=P2Za8evW--
