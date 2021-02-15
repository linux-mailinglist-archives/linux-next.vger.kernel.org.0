Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A1431B478
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 05:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhBOEDz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 23:03:55 -0500
Received: from ozlabs.org ([203.11.71.1]:41259 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229870AbhBOEDy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 23:03:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df9SG3pfxz9sBJ;
        Mon, 15 Feb 2021 15:03:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613361792;
        bh=OXH6hdeidcLRK2UHO5Rlipgo2NHJfCGt+TPjjT2FPg4=;
        h=Date:From:To:Cc:Subject:From;
        b=g13Vn+lJgT00BnBDyOrkbZexRqtMoAD7yL75fg+ZZjyTSCq75O1z5B4+o5p9eR7ig
         aDNWp2Wnk0oT0zY34DjWL8B22nqOfXIqHZ2TZeaIeA0CuyULru42RoS4TSjOhIMtcf
         A9BZBgacQR5Fgfsoc2CrApnp8Sw9DVdNbseMIr9qGo0c/SUvnfbJbvVafYqL6QeUa+
         oGHLcOplH5s+bw9G0Tx0rKpAO7fFGuU4kn+OVWKEArFzwql7eiflRKgzlHdVEpvv24
         yd0xre083bhIxTRr1f8YQTbHqFkkiEtmp+NFk3D3XZq6KxqEQ5wOgaXX0Q9FE04uP1
         UoDwllrSsZQ3Q==
Date:   Mon, 15 Feb 2021 15:03:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20210215150308.52dfc519@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YBh_Wk77iNjkx5_DnZhu8D_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YBh_Wk77iNjkx5_DnZhu8D_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/trace.c

between commit:

  b220c049d519 ("tracing: Check length before giving out the filter buffer")

from Linus' tree and commit:

  36590c50b2d0 ("tracing: Merge irqflags + preempt counter.")

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

diff --cc kernel/trace/trace.c
index b5815a022ecc,b79bcacdd6f9..000000000000
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@@ -2745,8 -2739,8 +2739,8 @@@ trace_event_buffer_lock_reserve(struct=20
  	    (entry =3D this_cpu_read(trace_buffered_event))) {
  		/* Try to use the per cpu buffer first */
  		val =3D this_cpu_inc_return(trace_buffered_event_cnt);
 -		if (val =3D=3D 1) {
 +		if ((len < (PAGE_SIZE - sizeof(*entry))) && val =3D=3D 1) {
- 			trace_event_setup(entry, type, flags, pc);
+ 			trace_event_setup(entry, type, trace_ctx);
  			entry->array[0] =3D len;
  			return entry;
  		}

--Sig_/YBh_Wk77iNjkx5_DnZhu8D_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAp8nwACgkQAVBC80lX
0GxHVQgAljNDRsk7Lh4YLIWd8bYs/zDAcdsVGwL8lbRAkB7+6QpXwb9VGLBIW3tZ
ElXo6K8bwFBcqokB+bN81KNdBDOJrcyuWrtovGe6AqlO3gBoUlLOfbCJaTc+L7wS
vlGwk+fDovuAOoXWNEDlvNT5sqUBPDLIK9fv+gzxREOQkPFE7/SoJbDkCzn2HZ5/
L3CPpXXe2TaBPOF1zFfTXKP3G8NMadql0iocAc/1LamWfOT5Y3LmzxATqJmzmZDx
2eDBwr8/9jRHv+MBYEGsjX2ixdo6gnt71FGBe3z6XP6DAl1+Styxd+tnDoC98Ig2
AJczvQqZ6yir19Ot/TMIECNo8811RA==
=i5aZ
-----END PGP SIGNATURE-----

--Sig_/YBh_Wk77iNjkx5_DnZhu8D_--
