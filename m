Return-Path: <linux-next+bounces-2411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B22A8D2A07
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 03:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A059C1F270A5
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 01:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0D95336A;
	Wed, 29 May 2024 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ek0oGbVX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631D57F6;
	Wed, 29 May 2024 01:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946304; cv=none; b=hNFA6HthDb/HZr0ME4OB1BfHTDceFt+a7/y+kJABHfhZZ34hEAJagypVwZsKntj6wLwE9KnkXy05gvtkT/+OXUy8eeRUKhryRvjjmupHXyaiSTyU1lN5HtQJ1yKOFMTj9oNTLSpLWNJ/A8OBvXmHsjEEoFRWCMf7tNahtnHvTXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946304; c=relaxed/simple;
	bh=XWJd0u7jf4+kwWI2PlUYNjKVj7V3MZrSBbXD0e50dGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=drLnb53XhGGpqWfTKEDmdU0VxdcH85oBu4SJcBbMUlA1/17yWLvAqRINmuzGDAgETTBoo7623Tc+NEcExzMqnavG6TCWzAuwMwuELHZW+8HFp62cA5FmENXuj8EVLE8Z8Ik0GkTr8roB8VBGvhj6n+883yc8FegjjbMgK4pPdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ek0oGbVX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716946299;
	bh=sYIwi1Me3rXEzjWBIGPWij+mjxNI1SFRGHLiv03UBqU=;
	h=Date:From:To:Cc:Subject:From;
	b=Ek0oGbVXYN8bWjZR3HzHk4WuKizlTPQKyeec8Bm5RISeoTh/BXZJj6w8Qh54izcoN
	 zFcDZeVQIm9e3IVwbCFwPvX1yBJQ1kYne2gz3WpESNpMUSImj1ELavI9sbGniDLZH9
	 CJxI1ChqnIqS14bKUApHJVOav1kXcnuMYX6dq+Yjy68acDxDCYLrhlvrKg/wr69Bk7
	 spuY2uKjhgGq5AesSOo3EJSfZ6dnVL3ALMiwZuH2m9n8UCm2RV0A72iIT0ta9cT632
	 99PG2OsGfLovWjOVGSNClaW+9aj9BzhrMb689Ujq78XeJdhn8yhBcHUo/WsDnbAiNH
	 /mnx+QuRBB6+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpsL34J4Zz4wbr;
	Wed, 29 May 2024 11:31:39 +1000 (AEST)
Date: Wed, 29 May 2024 11:31:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Petr Mladek <pmladek@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, John Ogness <john.ogness@linutronix.de>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the printk tree with Linus' tree
Message-ID: <20240529113138.323f48d6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/id9/qOf4mqjq9Ewt487Rki=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/id9/qOf4mqjq9Ewt487Rki=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the printk tree got a conflict in:

  include/linux/serial_core.h

between commit:

  1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")

from Linus' tree and commit:

  e18c650e4653 ("serial: core: Implement processing in port->lock wrapper")

from the printk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/serial_core.h
index 8cb65f50e830,fe91234d5b7c..000000000000
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@@ -11,6 -11,9 +11,8 @@@
  #include <linux/compiler.h>
  #include <linux/console.h>
  #include <linux/interrupt.h>
 -#include <linux/circ_buf.h>
+ #include <linux/lockdep.h>
+ #include <linux/printk.h>
  #include <linux/spinlock.h>
  #include <linux/sched.h>
  #include <linux/tty.h>

--Sig_/id9/qOf4mqjq9Ewt487Rki=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWhXsACgkQAVBC80lX
0GwGNQf/bJqM0AARD5DyUy94FVT9yp+dc+Y+/qHdNghnd326ijfjKqNToeBl6Qzg
pQStHytYW3i9WJer7hbNIiqIPXtIpeKReQm1Q94fAsH50FmUejiHUw+XY1x0iHL0
iHUN0MbXVw6Ad+f9FO6XPXOAQA7hQqFXqlniWtsNm3m6bOGcBoscLE3cc+QdnETB
xe2AgQqIFvVHbJnbnD3CPbi7KI6x0IHlJzlgAYJ4lb651r1ovzYYq/HIgz9ZjjBT
qS3lfR2FW2zh9aGe1SKyDmSn6QtAvEWXyYwqP83/emBp1D3ZDLNA+pA+WsLq3uh+
pQtv9WMtJHGlHn4nSwdXqpQOyE+1kg==
=TyRp
-----END PGP SIGNATURE-----

--Sig_/id9/qOf4mqjq9Ewt487Rki=--

