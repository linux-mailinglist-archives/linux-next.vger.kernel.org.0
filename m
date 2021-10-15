Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4212142E654
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 04:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbhJOCCc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 22:02:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56105 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232271AbhJOCCc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 22:02:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVqGv3YY5z4xbG;
        Fri, 15 Oct 2021 13:00:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634263224;
        bh=VSoqlCX0nQzSZmUT56l1XRpOc8YsMVqw5ljMHwwDSOk=;
        h=Date:From:To:Cc:Subject:From;
        b=NpxhYkSxxpG0mZw576IzAMNes4tI5CEeB+bh8bArsG0cw+Iiv3dkJ8toe0TsKd3oi
         lqYJWoCBFeYTrjbiLtpTmmYNGEAYI9mYRw8VTuhKZ4tyzdx5olOf+IpsUcUppVnHj1
         /VdxpTyhsmonnb2q7b6snHj44uWEGFrHFgRc7PClQCvWDN98YQtC05Gf+rKoO00vsK
         EVO0HteLEmsKKtsb2GxlIgNCxIxPifLXn3K6p1s3i6Y/k0RC5P59ARbGY29sQygG1G
         NDKf/qMeXkZTtXXRqr5BYsw9MeYETEG/RIeGlI+J4378Gfz10lyOuFKIE3F8rzq/tB
         DO7qPu3fOomzw==
Date:   Fri, 15 Oct 2021 13:00:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pablo Neira Ayuso <pablo@netfilter.org>,
        NetFilter <netfilter-devel@vger.kernel.org>
Cc:     Antoine Tenart <atenart@kernel.org>,
        Dust Li <dust.li@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the netfilter-next tree with the
 netfilter tree
Message-ID: <20211015130022.51468c6d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fLJIbhJf0t_u9d4k7m4vggE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fLJIbhJf0t_u9d4k7m4vggE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the netfilter-next tree got a conflict in:

  net/netfilter/ipvs/ip_vs_ctl.c

between commit:

  174c37627894 ("netfilter: ipvs: make global sysctl readonly in non-init n=
etns")

from the netfilter tree and commit:

  2232642ec3fb ("ipvs: add sysctl_run_estimation to support disable estimat=
ion")

from the netfilter-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/netfilter/ipvs/ip_vs_ctl.c
index 29ec3ef63edc,cbea5a68afb5..000000000000
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@@ -4090,11 -4096,8 +4096,13 @@@ static int __net_init ip_vs_control_net
  	tbl[idx++].data =3D &ipvs->sysctl_conn_reuse_mode;
  	tbl[idx++].data =3D &ipvs->sysctl_schedule_icmp;
  	tbl[idx++].data =3D &ipvs->sysctl_ignore_tunneled;
+ 	ipvs->sysctl_run_estimation =3D 1;
+ 	tbl[idx++].data =3D &ipvs->sysctl_run_estimation;
 +#ifdef CONFIG_IP_VS_DEBUG
 +	/* Global sysctls must be ro in non-init netns */
 +	if (!net_eq(net, &init_net))
 +		tbl[idx++].mode =3D 0444;
 +#endif
 =20
  	ipvs->sysctl_hdr =3D register_net_sysctl(net, "net/ipv4/vs", tbl);
  	if (ipvs->sysctl_hdr =3D=3D NULL) {

--Sig_/fLJIbhJf0t_u9d4k7m4vggE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFo4LYACgkQAVBC80lX
0GzeFwf9Gjs3lvcAEhdy3xb9bwv/bGgOT4Zg3gXCovwpigymKXXNGfK1b489cIl9
1YK1X/bFSRphJdEzdD9w1nqsqqgedxs3RtP4yL/QcRA4+APC1KO8QbHSkvQO51DX
K9vCqtn1RTBuyU9VzbuHQJ0Lm56k7ob+7iV5nGYTFUqEOFy93AINvwsBKhdzBUwc
C8cSDyrpNdDwi4Rs85MjR3Ut2rI34v7uGImBHCQQsUvUK9lRXoBfiRbJ7r06Q9Fh
NCP15am4liiVIiiVXhX0Zg1PFk/rIcBFVQCmytklc9QJNHx+IbMpeO4TEeqY6e4r
rMSFR/4niZT6ckJLMoQxtGuk8UWw5g==
=0Q3x
-----END PGP SIGNATURE-----

--Sig_/fLJIbhJf0t_u9d4k7m4vggE--
