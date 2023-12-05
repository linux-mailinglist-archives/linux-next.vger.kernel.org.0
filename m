Return-Path: <linux-next+bounces-239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34526806182
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 23:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B9D2821D6
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 22:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41F46E2A2;
	Tue,  5 Dec 2023 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZXI4V/6F"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0C0181;
	Tue,  5 Dec 2023 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701814476;
	bh=uOaBs+kWO/sOLE9amZDuORxsp2qLOuH+HgrCM6jvykA=;
	h=Date:From:To:Cc:Subject:From;
	b=ZXI4V/6FYLZ1QPRybqm0qBmm8wDQ+CGfpkFS07XtoenTVunoPDTKNQ3NC3jr/BUiK
	 +00SCZ7kr11uOwqKXqQYAwNxN5hw6syiwLwNzsRFxDQXlQkx/lkdUEyGjnRhsIRI9O
	 OJglRvWap9uTkBPTOobks047/TVXBVvIQquBA4rtRmKIClE4NFeVwfb/8tMzciA6wc
	 z7b9MP3spFRgJsxrOzZkNUv8mrWNS4C/XkiOiouWwe6jGEL7dMyW7envZhd+Uqv0mK
	 H6xFBTvK5hujhYedRURWgu56ftxgtXSkZHuI/W57C4l7Jcjbb6u/MBsp2rvLim+0uF
	 U+dBwjId3MkNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlFFR6yTGz4wc8;
	Wed,  6 Dec 2023 09:14:35 +1100 (AEDT)
Date: Wed, 6 Dec 2023 09:14:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <20231206091433.68f59ba1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=HjMo4b4111kPLcIX.Ak._";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J=HjMo4b4111kPLcIX.Ak._
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  08b953508560 ("perf evsel: Fallback to "task-clock" when not system wide")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/J=HjMo4b4111kPLcIX.Ak._
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVvoMkACgkQAVBC80lX
0Gz0gwf5AZwiWwR7Xnldg3RPTJ61m3GLX4cLj7XZgW1LrVtSU4DcfmWGd3Jlv1GM
mridS5ksdTKPFfnsYk05D1qviRiz2dUmH+ilsX7bo0MoWWWjO2qix0hSbQBHzhcT
GABTnNwSAo0XNkIzBUu+5reYzEEKT3BexgFmyEy4oMCH6FTG5wBnnWZ49w/7pqd4
CYunVMOszPbDxFUKyj+ZGdA8M2ZLb8PFHYTDVHrCFYeMwKhOvWfZUSrsQIUWlo3P
l39Y/bqOiLMocK9Ndyhh4cRTL3W3McFLRpcm+g4HDrMk1ha9rPMTNCdri8mmr6O0
jfGHE2yL3fSSKX77c5r1pTfYA5wGWw==
=i0Q4
-----END PGP SIGNATURE-----

--Sig_/J=HjMo4b4111kPLcIX.Ak._--

