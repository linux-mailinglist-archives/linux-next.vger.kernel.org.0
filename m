Return-Path: <linux-next+bounces-8539-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28483BB44A4
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 17:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00C657A1A51
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 15:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321D9194A44;
	Thu,  2 Oct 2025 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE/ls8AK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A69D2CCC0;
	Thu,  2 Oct 2025 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759418355; cv=none; b=FmJXGKzHCJzmTUjHZfSaa+Qjnjlv1ii8Nnu4n6VyYRruFf9uVFP+eVnwYZDzOJMG3Oc4qAJdC8HnsM3laZb9iu7ahpGJGkZ8E3o4wwcOBGXqdUqTCHRwTdb8D/g7hLAA/uY3u3wDcn3vvE4NiGij7HnDOCo50+AdjCeolz0JpTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759418355; c=relaxed/simple;
	bh=52z6Vi0V9bS76ga+Gq4jeAA16tCIeXDKH633DY7nwVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1LaHhhO8lPz8u2yealxBy1IBcLlXYp52rHC4GPa6OU+s2Kk9/DocmWJKGGESVRwLC7J3IYYJwgbB7rwjgVML/QksSpCv9/uT1mRCjR+B2HRFXM5w2U+y9cY8OXWuN4BZiAohLs78URpQJNjCMGNiAu5XTzVpsg5FgLpfg0D6Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VE/ls8AK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B29C4CEF4;
	Thu,  2 Oct 2025 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759418354;
	bh=52z6Vi0V9bS76ga+Gq4jeAA16tCIeXDKH633DY7nwVU=;
	h=Date:From:To:Cc:Subject:From;
	b=VE/ls8AKImGUN6yFCV40ziwMhE2nc9AJQsb7Ceq/kY3WZMkUCbQy2uE0lvIrtk1pb
	 3oQ2Nm1SPYQEPMK+CbOfj84b3m+ZEFCgKlnPtR4XM93x0cUVIPLE8QBsQJOn8i9KEh
	 u6/h1dCI8N5Pj1NukdDKuNv+95XhXbIFKVocmNuRCReCMnp1rs6B86qfrkmaxQEFnD
	 BN90ceFY/Jd7VJnFcD4UXvvQ+OqR0gVTN2G3qdQqnbGr7ZqEMVaU8C35mdp1bN0Ga2
	 LvNmVeMU3RsbeFRoIf1+eHNU9jqFk5oos50P9qRq0JGnGe9iDNijtU0XQ1cC/N6gQg
	 hisHGcdBX9uQg==
Date: Thu, 2 Oct 2025 16:19:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Crystal Wood <crwood@redhat.com>,
	Ivan Pravdin <ipravdin.official@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the origin tree
Message-ID: <aN6X7mvUjNw0DCn9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5lrJ10G9x1tJJWav"
Content-Disposition: inline


--5lrJ10G9x1tJJWav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  tools/tracing/rtla/src/actions.c

between commit:

  b1e0ff7209e95 ("rtla: Fix buffer overflow in actions_parse")

=66rom the origin tree and commit:

  05b7e10687c69 ("tools/rtla: Add remaining support for osnoise actions")

=66rom the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/tracing/rtla/src/actions.c
index 13ff1934d47c9,991139f9069f1..0000000000000
--- a/tools/tracing/rtla/src/actions.c
+++ b/tools/tracing/rtla/src/actions.c
@@@ -127,11 -127,11 +127,11 @@@ actions_add_continue(struct actions *se
   * actions_parse - add an action based on text specification
   */
  int
- actions_parse(struct actions *self, const char *trigger)
+ actions_parse(struct actions *self, const char *trigger, const char *trac=
efn)
  {
  	enum action_type type =3D ACTION_NONE;
- 	char *token;
+ 	const char *token;
 -	char trigger_c[strlen(trigger)];
 +	char trigger_c[strlen(trigger) + 1];
 =20
  	/* For ACTION_SIGNAL */
  	int signal =3D 0, pid =3D 0;

--5lrJ10G9x1tJJWav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjel+0ACgkQJNaLcl1U
h9AUAwf/XOqi/rsABt1ZUQhVk6eXqIOShFxSu7xGSanoxgXUVTsCMjUjI6BrRAGn
obVUxteEmVdRYcq+xFMtX/dI/4/thtn1uh+TwUW6zl04fHnlISsBV9wFv6pslUlp
10jFjGWs5Sm+tjgc3tQMztcd91MvasqI0QcwAaH8LTogG7OozZlVeWllyGMdgbis
cA3FRFJwP1CVJkcZBuGYtQeaYnrh2bVIH3760mMgUarG1SV+L+vnP5e+fYrrMkmO
1PHyOpU6WtlB4GppFKuDJ1192Kp7GZ3lgKsF8vk7CXl2CUgBi4IDQFyyr9hLqOrr
mRh9rBKLB5pYutjOQjYDC4P3ks+ukQ==
=dqBR
-----END PGP SIGNATURE-----

--5lrJ10G9x1tJJWav--

