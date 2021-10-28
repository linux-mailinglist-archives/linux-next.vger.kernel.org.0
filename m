Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4238743DAC0
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 07:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhJ1Fdm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 01:33:42 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42611 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhJ1Fdm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 01:33:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfvL93mtCz4xcB;
        Thu, 28 Oct 2021 16:31:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635399074;
        bh=yZYawobkENgE1I6+jbr9EHc4+oOEH0e5xwvS7zwmPN4=;
        h=Date:From:To:Cc:Subject:From;
        b=ICwfpShRpKUMOuJWW7S8O9/8i30LEsKIUcvqSVhyuE8ib8TQnMjJ8C2yLofXDKjkc
         p1JlnRFGpC/oDCpeq6eoGAVrUYciFN6nQy011+hfWqDka6EcrwvuI6hP1Uz116YnE5
         Sb48/S8qtL+ftsDSvOBHGYKt6MsGWYUfdq0WyHbuOiiFCRN8ziuxV8m0D8dlL6/X1V
         sVTKKlUHaEJJTYa4Qe8ujGCmT/zvE3W8A90g/nARCryvlkggvqIthR9HJnDyxkgaq/
         NGVUb/+eeriDllDdsBTsfRJ0rQlhS1R4TVAPgMDPKU7cURptlvr/fyqC5PZuuYTYN7
         r3f+PgZZfUaSw==
Date:   Thu, 28 Oct 2021 16:31:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Wang <yun.wang@linux.alibaba.com>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20211028163111.7f09f7eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VLiZnhr=XxBCyJ44NH/xjlb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VLiZnhr=XxBCyJ44NH/xjlb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got conflicts in:

  include/linux/trace_recursion.h
  kernel/trace/ftrace.c

between commit:

  ed65df63a39a ("tracing: Have all levels of checks prevent recursion")

from Linus' tree and commit:

  ce5e48036c9e ("ftrace: disable preemption when recursion locked")

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

diff --cc include/linux/trace_recursion.h
index fe95f0922526,a13f23b04d73..000000000000
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@@ -139,8 -155,11 +135,11 @@@ extern void ftrace_record_recursion(uns
  # define do_ftrace_record_recursion(ip, pip)	do { } while (0)
  #endif
 =20
+ /*
+  * Preemption is promised to be disabled when return bit >=3D 0.
+  */
  static __always_inline int trace_test_and_set_recursion(unsigned long ip,=
 unsigned long pip,
 -							int start, int max)
 +							int start)
  {
  	unsigned int val =3D READ_ONCE(current->trace_recursion);
  	int bit;
@@@ -148,10 -167,18 +147,14 @@@
  	bit =3D trace_get_context_bit() + start;
  	if (unlikely(val & (1 << bit))) {
  		/*
- 		 * It could be that preempt_count has not been updated during
- 		 * a switch between contexts. Allow for a single recursion.
+ 		 * If an interrupt occurs during a trace, and another trace
+ 		 * happens in that interrupt but before the preempt_count is
+ 		 * updated to reflect the new interrupt context, then this
+ 		 * will think a recursion occurred, and the event will be dropped.
+ 		 * Let a single instance happen via the TRANSITION_BIT to
+ 		 * not drop those events.
  		 */
 -		bit =3D TRACE_TRANSITION_BIT;
 +		bit =3D TRACE_CTX_TRANSITION + start;
  		if (val & (1 << bit)) {
  			do_ftrace_record_recursion(ip, pip);
  			return -1;
@@@ -162,12 -192,22 +165,18 @@@
  	current->trace_recursion =3D val;
  	barrier();
 =20
+ 	preempt_disable_notrace();
+=20
 -	return bit + 1;
 +	return bit;
  }
 =20
+ /*
+  * Preemption will be enabled (if it was previously enabled).
+  */
  static __always_inline void trace_clear_recursion(int bit)
  {
 -	if (!bit)
 -		return;
 -
+ 	preempt_enable_notrace();
  	barrier();
 -	bit--;
  	trace_recursion_clear(bit);
  }
 =20
diff --cc kernel/trace/ftrace.c
index 635fbdc9d589,b4ed1a301232..000000000000
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@@ -6977,7 -7198,12 +7198,12 @@@ __ftrace_ops_list_func(unsigned long ip
  	struct ftrace_ops *op;
  	int bit;
 =20
+ 	/*
+ 	 * The ftrace_test_and_set_recursion() will disable preemption,
+ 	 * which is required since some of the ops may be dynamically
+ 	 * allocated, they must be freed after a synchronize_rcu().
+ 	 */
 -	bit =3D trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START, TR=
ACE_LIST_MAX);
 +	bit =3D trace_test_and_set_recursion(ip, parent_ip, TRACE_LIST_START);
  	if (bit < 0)
  		return;
 =20

--Sig_/VLiZnhr=XxBCyJ44NH/xjlb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6NZ8ACgkQAVBC80lX
0GzshQf+LTuy4gpfVTawHLF9u9NZrUR6GTAdKb3Lr+Uf80XcP06rXz6RYntGXKZx
DCXzGi+q/oz22FnrIjl1WBFxeNLlGYUn6jM189VXszs2xS8VrfgL1Dzul+LPJfrJ
/s15vRGXM3v9oYX0uYThzsmk63io8bR69m7xtg/km/LMZTPTiQlsa+mqLM+O4+lv
5ULDWHl3u9dGMrRbE/HSmQMxzn8I1Epa0EOkSEQ6GdQN96mHXJg+JPIBNbM+ow96
aOD5+9bIXx45GU4eqYyXqNlqPvspWA8j4SRewhB+p5qGinLKC46+W+FB7ScgQNWP
4hPJSTj4xhcSA30g6ev7ik0qssEZXA==
=Ro0R
-----END PGP SIGNATURE-----

--Sig_/VLiZnhr=XxBCyJ44NH/xjlb--
