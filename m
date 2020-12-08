Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6B02D22DB
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 06:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgLHFDI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 00:03:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgLHFDI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 00:03:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cqp2V0j16z9sWL;
        Tue,  8 Dec 2020 16:02:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607403746;
        bh=edv2CqI4iBAUuIFvbAZ0YNS7FHbH6CwTe06qjo9u+v4=;
        h=Date:From:To:Cc:Subject:From;
        b=jI0q7oGOEIXqBur/Tfj6SyF27e1INxhuzN7hcsvpB+wT3Hiz8gkDgE7ex7jrIuc5T
         wdLVEvqjg+y4mQolmCPYFyNmcuFQMhBUqr2OJ5xh+1G8Vwi+FQYsBLTL5wFfnsyso5
         zHAR6vBZpIWpdKXqYe+tkARDtFEHIMSl7o1E5drb7HUH/8DwPJfGEoyNObipb3mgN3
         MMgF1riTBj3sSyXF7cu20I3UVaRghQJVHO/UjRasLza7UGtqPwU30ennRPFHkWIFBR
         dgkvzT2zQc5U29Yg6iThuz3ncFi4BfXdnGe+cA/gIgYOMkPvuKArGZe8r3uV3z3B8l
         ubipgQ84QlCfw==
Date:   Tue, 8 Dec 2020 16:02:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20201208160222.04ad114f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7zL33gzx8NipyD/ueU5m=UB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7zL33gzx8NipyD/ueU5m=UB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/ring_buffer.c

between commit:

  68e10d5ff512 ("ring-buffer: Always check to put back before stamp when cr=
ossing pages")

from Linus' tree and commit:

  5b7be9c709e1 ("ring-buffer: Add test to validate the time stamp deltas")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/trace/ring_buffer.c
index a6268e09160a,7cd888ee9ac7..000000000000
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@@ -3234,12 -3391,16 +3391,14 @@@ __rb_reserve_next(struct ring_buffer_pe
 =20
  	/* See if we shot pass the end of this buffer page */
  	if (unlikely(write > BUF_PAGE_SIZE)) {
 -		if (tail !=3D w) {
 -			/* before and after may now different, fix it up*/
 -			b_ok =3D rb_time_read(&cpu_buffer->before_stamp, &info->before);
 -			a_ok =3D rb_time_read(&cpu_buffer->write_stamp, &info->after);
 -			if (a_ok && b_ok && info->before !=3D info->after)
 -				(void)rb_time_cmpxchg(&cpu_buffer->before_stamp,
 -						      info->before, info->after);
 -		}
 +		/* before and after may now different, fix it up*/
 +		b_ok =3D rb_time_read(&cpu_buffer->before_stamp, &info->before);
 +		a_ok =3D rb_time_read(&cpu_buffer->write_stamp, &info->after);
 +		if (a_ok && b_ok && info->before !=3D info->after)
 +			(void)rb_time_cmpxchg(&cpu_buffer->before_stamp,
 +					      info->before, info->after);
+ 		if (a_ok && b_ok)
+ 			check_buffer(cpu_buffer, info, CHECK_FULL_PAGE);
  		return rb_move_tail(cpu_buffer, tail, info);
  	}
 =20

--Sig_/7zL33gzx8NipyD/ueU5m=UB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PCN4ACgkQAVBC80lX
0GzrrggAm5437ppwZJkiqFKBp5MNSX7lRO5GCUge0gdfN9NC8QnMchG5n7+juSc7
qDYOym/d1i6bwJUep8sBzothGMzDAOAD5YSoEqD/nHS9+GUQmnQQSAZNCvU5WCNN
nf1vp/Cjb5Z9g+/dC0iLt6OnUP1Y8EJ/3mT4XJMQRc+jGX1T1LibrsPsmHCtiBgQ
W6806MMctYxkltouQ2YRUs0T9aJY8Dss4PH0TJLm1hsxvbvRadmFEadsLU/EoUwX
Ie6aXijk6YBpe2MQm1fJLcorr6c9gxjRtLrPvwLkzSruv8N/Bh6uqR/RvwYs0GWV
A0+M7A5zvmICrztGgzNTK2y7xeaelQ==
=D9QM
-----END PGP SIGNATURE-----

--Sig_/7zL33gzx8NipyD/ueU5m=UB--
