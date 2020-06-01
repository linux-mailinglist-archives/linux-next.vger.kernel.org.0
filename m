Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096441EB220
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 01:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgFAXUq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 19:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgFAXUq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2020 19:20:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C48C05BD43;
        Mon,  1 Jun 2020 16:20:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bWPP5qRFzB3sy;
        Tue,  2 Jun 2020 09:20:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591053643;
        bh=lshRSFsN3HPLbDT6RUh9tV90UDfa8ShqrsJXN34ckpA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JLEN+joPC2hx4lO4TW6IEqyMGllrWCbdUNdYrTO7XleF6AoyHEkyRcsGOC5ncRdLz
         FEdiJZ7+iE6K2zAKuUJxQF8nDZ7Eo1iNaRGBR1/T+LndROhzvzi9NVWSnzfkBYG6Ce
         EQZyxLwHJIiJD0Yr0fDM/7sNUVNxt10O4jvSYmolukFgL/vH2y5d7/a4KbOVqjVnJq
         nywGHykmwxBTXWlrQP8f2i61KqScRDhofcpOh0oXgxy4gkUepmTQAD4uFkQCsPMKdz
         P/HLduw3zLENmIs/3jQbgzv2ZKeGWrR/aq0KEyTCvhQtOKTr/LMngq/6jINy06Ih3O
         qJYUcuDIgJn2A==
Date:   Tue, 2 Jun 2020 09:20:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Steffen Klassert <steffen.klassert@secunet.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Ahern <dsahern@gmail.com>,
        Florian Westphal <fw@strlen.de>
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus'
 tree
Message-ID: <20200602092040.5ef52300@canb.auug.org.au>
In-Reply-To: <20200511130015.37103884@canb.auug.org.au>
References: <20200511130015.37103884@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TkH89WJytnR288K=Gm+4mTy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TkH89WJytnR288K=Gm+4mTy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 11 May 2020 13:00:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the ipsec-next tree got conflicts in:
>=20
>   net/ipv4/xfrm4_output.c
>   net/ipv6/xfrm6_output.c
>=20
> between commit:
>=20
>   0c922a4850eb ("xfrm: Always set XFRM_TRANSFORMED in xfrm{4,6}_output_fi=
nish")
>=20
> from Linus' tree and commit:
>=20
>   2ab6096db2f1 ("xfrm: remove output_finish indirection from xfrm_state_a=
finfo")
>=20
> from the ipsec-next tree.
>=20
> I fixed it up (I used the latter versions of these files and then added
> the following patch) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 May 2020 12:57:24 +1000
> Subject: [PATCH] xfrm: merge fixup for "remove output_finish indirection =
from xfrm_state_afinfo"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/xfrm/xfrm_output.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
> index 886a9b284b3a..0f4b3a5e02ba 100644
> --- a/net/xfrm/xfrm_output.c
> +++ b/net/xfrm/xfrm_output.c
> @@ -574,16 +574,12 @@ int xfrm_output(struct sock *sk, struct sk_buff *sk=
b)
>  	switch (x->outer_mode.family) {
>  	case AF_INET:
>  		memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
> -#ifdef CONFIG_NETFILTER
>  		IPCB(skb)->flags |=3D IPSKB_XFRM_TRANSFORMED;
> -#endif
>  		break;
>  	case AF_INET6:
>  		memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
> =20
> -#ifdef CONFIG_NETFILTER
>  		IP6CB(skb)->flags |=3D IP6SKB_XFRM_TRANSFORMED;
> -#endif
>  		break;
>  	}
> =20

It looks like this merge resolution fix up was missed when the
ipsec-next tree was merged into the net-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TkH89WJytnR288K=Gm+4mTy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7VjUgACgkQAVBC80lX
0GxFUgf7BVP8TUGqwFITcohFkSvSY2BCjRPAirE2bJHgWC23rDFlNDUBQprmEbF+
7jJEe+X9lggKAp94xG/w2oBqKbHGOhe5e4ZakSNaCL6WccU+SjO8F2WppOgCeBgM
rOYYVVzS7QYmM7YP4hJzSU+yCT9ouc446zp2AxltRkWrhg4uXmFwZZIpl6MgeNOD
alAmkjLl12qisgY5n9aGP05srEwiHMKJsVpxB3+NLlghjGkjLSPRAv3jLr9dfGlN
2raQn/Qj1C2Y1oD/AsaBIcRxpNgyhe6UdAwahQ/7B/yDzObJiHlRsI60r+l1pqpZ
DUVSPe/dDEyTGmOlpiimnBbO2WlaCA==
=xNkS
-----END PGP SIGNATURE-----

--Sig_/TkH89WJytnR288K=Gm+4mTy--
