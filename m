Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC9B444AE6
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 23:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbhKCWe6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 18:34:58 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43001 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhKCWe6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 18:34:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hl1jQ36vBz4xbY;
        Thu,  4 Nov 2021 09:32:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635978731;
        bh=ukFn8MJKB6eV5j3350o9I96qLsjfgN3gnAVOj1+UnRU=;
        h=Date:From:To:Cc:Subject:From;
        b=jNBO5s99U2+DK00+FhOjlGBxluRLLm7N+T0A92h263e3EXlwa9Ysz+Or5o8e+OF6k
         cpVxxdy1SXCjVA+7WTQJhNv9XW7aqAhGmcTJVZ3qTaoWARSwH1SyOrSzQCE9Hm7613
         7MRRHxzRogwShjysIVn9HmHaFYiv9k8iQhAW2OJba1jFOpC+Bibcp+/bM1ZN/mL9TE
         BhnjelFPYctGSvlKNhSu5tEdGrj20Kvm3mV9j18t9QxiVy56WbFHiur2uDcrKCEcWz
         7z9i1j81npPh5wWQVjQDZ0vOlBN8MkH6jVY515J7ALVIEGWtVP3mjDfzcgNcFOW5+h
         lyCl9Z0W3P4Nw==
Date:   Thu, 4 Nov 2021 09:32:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20211104093208.0380c1f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/auZ5W9A94GE0siOfE5R44Xt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/auZ5W9A94GE0siOfE5R44Xt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got conflicts in:

  arch/arm64/include/asm/stacktrace.h
  arch/arm64/kernel/stacktrace.c

between commit:

  cd9bc2c92588 ("arm64: Recover kretprobe modified return address in stackt=
race")

from Linus' tree and commit:

  552e196d88e5 ("arm64: ftrace: use HAVE_FUNCTION_GRAPH_RET_ADDR_PTR")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/stacktrace.h
index a4e046ef4568,9a319eca5cab..000000000000
--- a/arch/arm64/include/asm/stacktrace.h
+++ b/arch/arm64/include/asm/stacktrace.h
@@@ -57,12 -53,6 +54,9 @@@ struct stackframe=20
  	DECLARE_BITMAP(stacks_done, __NR_STACK_TYPES);
  	unsigned long prev_fp;
  	enum stack_type prev_type;
- #ifdef CONFIG_FUNCTION_GRAPH_TRACER
- 	int graph;
- #endif
 +#ifdef CONFIG_KRETPROBES
 +	struct llist_node *kr_cur;
 +#endif
  };
 =20
  extern int unwind_frame(struct task_struct *tsk, struct stackframe *frame=
);
diff --cc arch/arm64/kernel/stacktrace.c
index c30624fff6ac,13ea4e4a4d27..000000000000
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@@ -38,12 -38,6 +38,9 @@@ void start_backtrace(struct stackframe=20
  {
  	frame->fp =3D fp;
  	frame->pc =3D pc;
- #ifdef CONFIG_FUNCTION_GRAPH_TRACER
- 	frame->graph =3D 0;
- #endif
 +#ifdef CONFIG_KRETPROBES
 +	frame->kr_cur =3D NULL;
 +#endif
 =20
  	/*
  	 * Prime the first unwind.
@@@ -126,19 -122,14 +125,18 @@@ int notrace unwind_frame(struct task_st
  		 * to hook a function return.
  		 * So replace it to an original value.
  		 */
- 		ret_stack =3D ftrace_graph_get_ret_stack(tsk, frame->graph++);
- 		if (WARN_ON_ONCE(!ret_stack))
+ 		orig_pc =3D ftrace_graph_ret_addr(tsk, NULL, frame->pc,
+ 						(void *)frame->fp);
+ 		if (WARN_ON_ONCE(frame->pc =3D=3D orig_pc))
  			return -EINVAL;
- 		frame->pc =3D ret_stack->ret;
+ 		frame->pc =3D orig_pc;
  	}
  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
 +#ifdef CONFIG_KRETPROBES
 +	if (is_kretprobe_trampoline(frame->pc))
 +		frame->pc =3D kretprobe_find_ret_addr(tsk, (void *)frame->fp, &frame->k=
r_cur);
 +#endif
 =20
- 	frame->pc =3D ptrauth_strip_insn_pac(frame->pc);
-=20
  	return 0;
  }
  NOKPROBE_SYMBOL(unwind_frame);

--Sig_/auZ5W9A94GE0siOfE5R44Xt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGDDegACgkQAVBC80lX
0Gzb0Qf/elkKtsERKOjVJ+fJ6XLSOx8TTnYgznkzEKfXfar6aHT2Ty+TN5MEoXv3
PCfNobUoVLd8lqVcts6aUCTMSsr2/5paJS5M9Q22ejecn/4GpvJbX0bny3B7NWKF
kTreMRqruz2RJp4vajdaXL69MpHJz7f/H1iSiBkZ32QJPiBOFPKQ68Egzzii7RQX
LzAhpJsQTlkZ0qIxO0/lWhzhTlxspxRwBaIeqRX9+59noi0udTy9A2MRAIl7o0NC
NSHwUWkjXOaST4cI9iRLnDTUht53MUgKhwI1Qj1xlu4Bw8Rsx3OsI9riCk7dQmhc
z12BRtyW7B6KZ7vuHQ6Z1YPRHuJnEQ==
=ER4d
-----END PGP SIGNATURE-----

--Sig_/auZ5W9A94GE0siOfE5R44Xt--
