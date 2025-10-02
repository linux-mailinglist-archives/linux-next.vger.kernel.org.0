Return-Path: <linux-next+bounces-8534-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B41BB3BFE
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 13:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9E8C16CBD8
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 11:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AE32BE7A0;
	Thu,  2 Oct 2025 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5inC1Uo"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013F27FB05;
	Thu,  2 Oct 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759404672; cv=none; b=keyWyVkBjoqEsLOTxugOILgYWNE65/Tw1RSSH9bnjZqX5SLYHQ2tDUABGGmq2R9y/jUXO3R5eQBRw5Me4sLb0CEPFVgWavaOB1Oy/FOzY4JUfBZtVcZbkoNpcygF8zjIjLFL40MG6feHp/MfGhzDIZn+7nSDQVWlwFJKgosZbpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759404672; c=relaxed/simple;
	bh=4EuJllRQA0iEzC0IuBd6i0ecIEih+qjlGh2GGaFjKBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaQteQqtBaw2MGHKnkR8TtYFypKOr0D69t0qm/6K9rm+8cRezDwzGR4oshV/0msQozkfxsff2iYjsPj60SA8tlGC6nB3V++TzDO7iDvJ2J9liqjJhiL63bmgErk7wLGYUXlJnkcx7CPtlDquFvaolomRJ7NjxAAacocLzRHKysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5inC1Uo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDF7C4CEF4;
	Thu,  2 Oct 2025 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759404670;
	bh=4EuJllRQA0iEzC0IuBd6i0ecIEih+qjlGh2GGaFjKBo=;
	h=Date:From:To:Cc:Subject:From;
	b=A5inC1UoDca7Xgusgqk3xdwLp8GfwDQsmNXFiZHs1T5YrZK89dwAkaSTtWJio+re2
	 b1sgVafpSqo40MZa5UI0hA7jCKfC7bmmeWCcqtptgYlcK8GQYUkXBK4AVt3Bg/APgS
	 8Fm3w/vaBnLWhFe9euYwU77wPvrm6oIclBPnVuFDPtsrwKVjgjS4uMh1aQLbasYgFx
	 p83HzF6CIyvwRSydkm06yd5dSdV3Ro3rstNqEhJDMDv+v7XAmcLm32dJp2Q9a9Tmp8
	 9bxHO8K2w/UMaP+jHM28vC7wp/XO08etUvVXpo4CMejJAQwFvV2ahXTlY93lDeZ+A0
	 r+4I4fXIzCaWQ==
Date: Thu, 2 Oct 2025 12:31:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <aN5ieRk8tV7SC3UI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nc+F/v1Zzu/Z3zP+"
Content-Disposition: inline


--Nc+F/v1Zzu/Z3zP+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  include/linux/ipc_namespace.h

between commit:

  18b19abc3709b ("Merge tag 'namespace-6.18-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/vfs/vfs")

=66rom the origin tree and commit:

  53195eef8fbf0 ("Merge branch 'namespace-6.18' into vfs.all")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/ipc_namespace.h
index 12faca29bbb9c,75bd73839b3b7..0000000000000
--- a/include/linux/ipc_namespace.h
+++ b/include/linux/ipc_namespace.h
@@@ -129,6 -129,9 +129,10 @@@ static inline int mq_init_ns(struct ipc
  #endif
 =20
  #if defined(CONFIG_IPC_NS)
++
+ extern struct ipc_namespace *copy_ipcs(u64 flags,
+ 	struct user_namespace *user_ns, struct ipc_namespace *ns);
+=20
  static inline struct ipc_namespace *to_ipc_ns(struct ns_common *ns)
  {
  	return container_of(ns, struct ipc_namespace, ns);

--Nc+F/v1Zzu/Z3zP+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeYngACgkQJNaLcl1U
h9Agtgf8DGivOqD/IqFnMCF2U1iIs4NnNy8STaiIsyplxXlJPSBpN6FLByOiWJRf
TQkRcWREy9OBTo7QTBUszJLnQjL/QBUqGMVxWG8JhqKxbcBcrbDD89PEaFHjjatp
KhFPq5z4u+HRGo6ulF+x4JAMJ3+kL2P3Qi32bImUe/lGDoWNSg3NwUyTg3RIhqOg
KLB7Dtk3tctVZyl/dCjNUKpRU1VC1IMo9xW3AHrcjzsB9c8P7lC6CFJ94WxakMjf
jTlTSHGWg/QMYa7Auuxn4VBN/ceV8bRxUViPcTPdYCiQRsXIb37WXE8AAAu60lhN
m2wIhyKvyfRUOmwkI72zaqMNP/9EEw==
=FD61
-----END PGP SIGNATURE-----

--Nc+F/v1Zzu/Z3zP+--

