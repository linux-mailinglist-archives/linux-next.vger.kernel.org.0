Return-Path: <linux-next+bounces-3493-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1FA9639E5
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 07:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613FA1C21AD5
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 05:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176F812E1D9;
	Thu, 29 Aug 2024 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KaKfqPMf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C5B3BBF6;
	Thu, 29 Aug 2024 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909515; cv=none; b=fSEB2dWRvcRYPyQfMd6CXfDdWVbHlHKcDfN/qZWiJX2eKyT63tI5PlZRfM4Vkw996KGvvRLjigx67d1uWFmPhuBeqNAz+TtWFQAxkCqzOcX5VY5I5Ha6TCIeoHPQrXBl4iymHgeHUcugd9uIYUc1Jxnmyi6EnZMwxK2eRmUoWVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909515; c=relaxed/simple;
	bh=Y0HajbfS+F53T+99bHSu8tNmFstlDevBrgW5zNiW8ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DdqUgkw+59BnlO0u5eE0+4UYOoi5r4kFSp9SeBut5T6JSoze+CFjwZA65r16qDbRrrfyXS+z9WZk4jRBEzs3lnEzps1wDkXArs+4xKHTfUWPkjaqhFI2YLd3nXRbMEo9VqStbNDaqBUtZ3ufQwfBmdkuXf/jJnvo36Sma3SfNPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KaKfqPMf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724909508;
	bh=uDvloGG3rY+/rOFfyrSGxei59bzgiKp1Bc/hDJG9KGc=;
	h=Date:From:To:Cc:Subject:From;
	b=KaKfqPMfLMNzbRLBUaqRTktn0BNkMnK/Qsr2UI4MW9XfjdMvoBPzJBHZ92kcL5A/y
	 CHjcR52JYDP3iAL3CaM7Cku1sLIOmmFrJYrziuQdlR8iMKDmufde/dXcP02chvfyX+
	 IjciMHFATseMiRv3lHmNy5CAQCbOT9zQw7MKI9lObudX8XPT7dFFzL6rJDLh6G+0Jm
	 fDZtG0SJVtHQwkaFBsXgEqWX+zlxAD4crgw/hDp1AGIS55aigqOYqg0kyPvx3UyT6I
	 FB/g5V+yu+ut+H+f1RoqZKDGDk+ubkdmeQFqBghe39g5TpX37rrkJzFdHvYE4pHqFF
	 bMEanPDv8ppVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvVJf6GPhz4wnw;
	Thu, 29 Aug 2024 15:31:46 +1000 (AEST)
Date: Thu, 29 Aug 2024 15:31:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Hongbo Li <lihongbo22@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: linux-next: manual merge of the kspp tree with the mm tree
Message-ID: <20240829153145.7f768337@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k/7ifZ79PiRbl83chpaonQD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/k/7ifZ79PiRbl83chpaonQD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  include/linux/string_choices.h

between commit:

  533f2ca2a8a2 ("lib/string_choices: add str_true_false()/str_false_true() =
helper")

from the mm-nonmm-unstable branch of the mm tree and commits:

  a98ae7f045b2 ("lib/string_choices: Add str_up_down() helper")
  f5c1ca3a15fd ("string_choices: Add wrapper for str_down_up()")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/string_choices.h
index 4a2432313b8e,1320bcdcb89c..000000000000
--- a/include/linux/string_choices.h
+++ b/include/linux/string_choices.h
@@@ -42,12 -42,12 +42,18 @@@ static inline const char *str_yes_no(bo
  	return v ? "yes" : "no";
  }
 =20
 +static inline const char *str_true_false(bool v)
 +{
 +	return v ? "true" : "false";
 +}
 +#define str_false_true(v)		str_true_false(!(v))
 +
+ static inline const char *str_up_down(bool v)
+ {
+ 	return v ? "up" : "down";
+ }
+ #define str_down_up(v)		str_up_down(!(v))
+=20
  /**
   * str_plural - Return the simple pluralization based on English counts
   * @num: Number used for deciding pluralization

--Sig_/k/7ifZ79PiRbl83chpaonQD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbQB8EACgkQAVBC80lX
0Gy8Pwf/W91/0zkiny+JCo0Ve8cK7WrYsblj3YnVIIc1eAkjXqtqToGyIBA7yjxn
rMXkRc9WErbM4+5NiZ/1qyGgw9kZeEoXlEzR2qMqabYBlTn1UAWXpvYRzVz3l8KT
rvSusoi/QF2JzkWmdMmoGowd8yW/enVTwAS0pp6TrLxFbhdSPRHB9aVGzwtlAOkR
KH1+3zat4zQDPuY0CVnNIUzJ7DSi/n/yDiOL3x4/TtajfI9iiIb1UIwBi1tmhnpo
jBgQyyLzaZ8TY+DZd61SuusziRhKNj3HwNbBF4cerz1fn0pZeMMCttOW5UyOvgVx
9TeQqCbNEYqzRZRR57XUtZZl6K5VMg==
=83DQ
-----END PGP SIGNATURE-----

--Sig_/k/7ifZ79PiRbl83chpaonQD--

