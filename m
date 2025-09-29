Return-Path: <linux-next+bounces-8518-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB6DBA95D5
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 15:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6431673A0
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 13:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508103054CB;
	Mon, 29 Sep 2025 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdX/Qa7p"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FD730217F;
	Mon, 29 Sep 2025 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759153024; cv=none; b=RgCRyvG6Vrg5jRPx7JrUypTThIj7AVFZYMjdDKuEjlIiK/8CNBY2N+tyKzsXzwKnLn8CzGOKwNooG57xgNanlJZvIFy7+I+fjCDdEVqIKxxGorG03uANAi0U+B/GDNhVdPdQHnwzd84s5bV6CimaEiemMXQypfIdAfApdeq2HzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759153024; c=relaxed/simple;
	bh=oAMuRCP/ILd1GgaUaGuXlFjGorcJg+KN2FQmP0ksWE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVmP5mLonrgw1i9aUFumN/VaV1svUhwr5mJDeRAGG+t/EeQu8hRnENpzmZ2N/FMhz+Zejw9zyLxUvQJtYQhnxmkBnWAAh73/FK3dUqpPcOVqEFQRExb8+pDn6Nq6qQR0RyHiMjwbpNqZpOKrQJYIAAyv42qITxm+zDelVyVCm08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdX/Qa7p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741C7C4CEF4;
	Mon, 29 Sep 2025 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759153022;
	bh=oAMuRCP/ILd1GgaUaGuXlFjGorcJg+KN2FQmP0ksWE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdX/Qa7pyw4bg7A4kSHZgWTHCdEc0mKTQSW0YlXylJIdktF29XQ8k85KpqiK+A79C
	 AD6UtdHbxLf0DclwGWxPOsLgMjwKOrso5BbAcEcA6uuidDv6iaOeW4MYSHneDO9jri
	 OZYPxZmkidkPY+tKGJ4BeboiFSR7NMjO/bxC2zHE2Pg5GLc2qcFbXcCaap701xVyNf
	 GpZAJ8zy5vc9DuoMaVl34IQ8uqMYuc6USqqxzgEClPOiSzrRyGxqnXjIX69IwY7dbr
	 FIehYIor2GRBpRPAvd5xMng9z6WPyoeAbvnD2+Ib5fGGvQfsZNJN0AwKCaNgjb7y2G
	 79vjo/DM3pBzg==
Date: Mon, 29 Sep 2025 14:36:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <2e987876-9ca8-4670-904f-044c6aa497ff@sirena.org.uk>
References: <aNpm-6LS0ZHJQMI-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zhf+32XI7S/eWacZ"
Content-Disposition: inline
In-Reply-To: <aNpm-6LS0ZHJQMI-@sirena.org.uk>
X-Cookie: Stay away from hurricanes for a while.


--Zhf+32XI7S/eWacZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 12:01:15PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the vfs tree, today's linux-next build (x86 allmodconfig)
> failed like this:
>=20
> In file included from /tmp/next/build/include/rv/ltl_monitor.h:11,
>                  from /tmp/next/build/kernel/trace/rv/monitors/pagefault/=
pagefault.c:19:
> /tmp/next/build/include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
> /tmp/next/build/include/rv/ltl_monitor.h:75:51: error: passing argument 1=
 of 'check_trace_callback_type_task_newtask' from incompatible pointer type=
 [-Wincompatible-pointer-types]
>    75 |         rv_attach_trace_probe(name, task_newtask, handle_task_new=
task);
>       |                                                   ^~~~~~~~~~~~~~~=
~~~~
>       |                                                   |
>       |                                                   void (*)(void *=
, struct task_struct *, long unsigned int)

> I couldn't figure out exactly which commit was causing this in a timely
> fashion (and suspect it may be an interaction with another tree), I've
> used the VFS tree from 20250926 instead.

Actually the whole dance with fs-next meant merging an old version seems
to break.  The issue is due to edd3cb05c00a ("copy_process: pass
clone_flags as u64 across calltree"), I don't see any obvious
interactions but I do note some stuff got silently dropped from that
branch which perhaps was ending up fixing this up? =20

I've added the fixup below, and note that -next has been continuing to
carry a revert of "nios2: implement architecture-specific portion of
sys_clone3".

=46rom f308042de4fe7206fc4b75212e9001f54069a20f Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 29 Sep 2025 14:24:24 +0100
Subject: [PATCH] rv: Fix up for clone3() API change

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/rv/ltl_monitor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/rv/ltl_monitor.h b/include/rv/ltl_monitor.h
index 67031a774e3d3..5368cf5fd623e 100644
--- a/include/rv/ltl_monitor.h
+++ b/include/rv/ltl_monitor.h
@@ -56,7 +56,7 @@ static void ltl_task_init(struct task_struct *task, bool =
task_creation)
 	ltl_atoms_fetch(task, mon);
 }
=20
-static void handle_task_newtask(void *data, struct task_struct *task, unsi=
gned long flags)
+static void handle_task_newtask(void *data, struct task_struct *task, u64 =
flags)
 {
 	ltl_task_init(task, true);
 }
--=20
2.47.2


--Zhf+32XI7S/eWacZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjai3kACgkQJNaLcl1U
h9BKowf/W8nryjxbQCvtoAk9Jy6E79iPcsmdXo4UZcK0wmSLQ4X38aq/zZ/YP9i/
YF+Y/lCcNviKSdagi3qPDhzsXud2uAE6lPZSIHVQcd1/VCubRjO6QN+/z5K4OQ0X
YPDAwK8F8+DLQQ587urmY7mQ/FinlucKdrdE6D8OVC13c4+Fw+HiRByiGhf4G6w8
9YIHVsD+4rC+T4obc8z1ipMJrojYm2E4YVbYIhwu8SNsBVgRZFQx1+XgLTMXEnjG
EcFyA7E9fIUpUx960IruRJxw5J7G7a5B5dO8eFIaBLFfi2sjaYezn7JoEqFttP0T
hj433WZYZX7hd6U+w/7MrB4CpkrEiQ==
=S6yL
-----END PGP SIGNATURE-----

--Zhf+32XI7S/eWacZ--

