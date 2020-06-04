Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5185A1EDA6B
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 03:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgFDB0M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 21:26:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43677 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726519AbgFDB0L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 21:26:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cp5C0ZNKz9sRN;
        Thu,  4 Jun 2020 11:26:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591233969;
        bh=VIP1nuNK7nGcpajAs4ak9+w77pPUCQpV3oytFQaYUJk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r5Xt1VZck13b0Ygibc5YlFXvwXceSAQFtxC7nGmq2vvz3fHoX7RBB2WzqyZVjUeA+
         RqBROVechh9Z/hggwrbumrD6GPQViGOdhQWxM5m0wqnJBzDIxL+e0MqbLRuriT2HmF
         H7WyeviowbM88uWjCCenG68wows4laBY4IQ4lpJISk1Q8q2OqlDDluc82BdlmFFK07
         oeiUlSctf/p0njWAewfyn/PuCS1MDMpyQmtwbRb4M66VNlCbRDlTS73sRyZBUlFS+e
         lCgEBjw5gHEjAUIdYfUypS8vK9E+S5gCMh2nlFpA62shq8rHu42gllPo5UwsSsZPim
         n9/SQrRc6vjEg==
Date:   Thu, 4 Jun 2020 11:26:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     David Ahern <dsahern@gmail.com>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Westphal <fw@strlen.de>
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus'
 tree
Message-ID: <20200604112606.25ffde35@canb.auug.org.au>
In-Reply-To: <6092c5eb-6e50-97bc-90db-4f7a0ca29c6e@gmail.com>
References: <20200511130015.37103884@canb.auug.org.au>
        <20200602092040.5ef52300@canb.auug.org.au>
        <6092c5eb-6e50-97bc-90db-4f7a0ca29c6e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D7tpbDpAi+qF/qgFD4IZ1/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D7tpbDpAi+qF/qgFD4IZ1/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 1 Jun 2020 20:30:34 -0600 David Ahern <dsahern@gmail.com> wrote:
>
> On 6/1/20 5:20 PM, Stephen Rothwell wrote:
> > Hi Dave,
> >=20
> > On Mon, 11 May 2020 13:00:15 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> Today's linux-next merge of the ipsec-next tree got conflicts in:
> >>
> >>   net/ipv4/xfrm4_output.c
> >>   net/ipv6/xfrm6_output.c
> >>
> >> between commit:
> >>
> >>   0c922a4850eb ("xfrm: Always set XFRM_TRANSFORMED in xfrm{4,6}_output=
_finish")
> >>
> >> from Linus' tree and commit:
> >>
> >>   2ab6096db2f1 ("xfrm: remove output_finish indirection from xfrm_stat=
e_afinfo")
> >>
> >> from the ipsec-next tree.
> >>
> >> I fixed it up (I used the latter versions of these files and then added
> >> the following patch) and can carry the fix as necessary. This is now f=
ixed
> >> as far as linux-next is concerned, but any non trivial conflicts should
> >> be mentioned to your upstream maintainer when your tree is submitted f=
or
> >> merging.  You may also want to consider cooperating with the maintainer
> >> of the conflicting tree to minimise any particularly complex conflicts.
> >>
> >> From: Stephen Rothwell <sfr@canb.auug.org.au>
> >> Date: Mon, 11 May 2020 12:57:24 +1000
> >> Subject: [PATCH] xfrm: merge fixup for "remove output_finish indirecti=
on from xfrm_state_afinfo"
> >>
> >> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >> ---
> >>  net/xfrm/xfrm_output.c | 4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >> diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
> >> index 886a9b284b3a..0f4b3a5e02ba 100644
> >> --- a/net/xfrm/xfrm_output.c
> >> +++ b/net/xfrm/xfrm_output.c
> >> @@ -574,16 +574,12 @@ int xfrm_output(struct sock *sk, struct sk_buff =
*skb)
> >>  	switch (x->outer_mode.family) {
> >>  	case AF_INET:
> >>  		memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
> >> -#ifdef CONFIG_NETFILTER
> >>  		IPCB(skb)->flags |=3D IPSKB_XFRM_TRANSFORMED;
> >> -#endif
> >>  		break;
> >>  	case AF_INET6:
> >>  		memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
> >> =20
> >> -#ifdef CONFIG_NETFILTER
> >>  		IP6CB(skb)->flags |=3D IP6SKB_XFRM_TRANSFORMED;
> >> -#endif
> >>  		break;
> >>  	}
> >>   =20
> >=20
> > It looks like this merge resolution fix up was missed when the
> > ipsec-next tree was merged into the net-next tree.
> >  =20
>=20
> Thanks for catching that, Stephen. Important fix in 0c922a4850eb.
>=20

And now the net-next tree has been merged into Linus' tree without this fix=
 :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/D7tpbDpAi+qF/qgFD4IZ1/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YTa4ACgkQAVBC80lX
0Gy0Jwf+LLZf5xta8sHu9u4cDZVpwUKA57dz+7JnE+Qux/fwvmDdVjRRk9/HsEzB
5A0F6frHh9SkvmHdt55iYSmEoS6g7oWZzSVHnVZROBBOxR3B7wZ/E5mvUDh033oy
dHlUNi/x5FoaMmGHSpjnjzqJMOKR2dwiijsMEafDHqSm6G0X825xEq+6Q/CYjeLE
//4D1E1N8qZqGQcNUYuGjXeV62Kd8y6VdSWYJoAilM/u5CK3w6m5aL95Rw1CFdrS
sAM4BE8W78X/wEftsQ9XjyOKxmh9mPnTAsTSmITydy6V6Qz7/+v2oPEBLw8Cik9F
Lth7ALtNgc4Ubn8rkYUHWOCelb8EAg==
=gNoZ
-----END PGP SIGNATURE-----

--Sig_/D7tpbDpAi+qF/qgFD4IZ1/8--
