Return-Path: <linux-next+bounces-2195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5CE8BD8C9
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 03:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0242833BA
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 01:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608BF15A4;
	Tue,  7 May 2024 01:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nzU9jBxE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2340138E;
	Tue,  7 May 2024 01:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715044025; cv=none; b=a3dChIm1HnuIX9MG7WE6w8k7KqnR8TTTw4LXCgtsIZoP+WNCC6XneIsCj9dHbyIic8VPqWx6jbCRBkGlT6lhfW33seaAAp3wjdivyJlY0eaqnBaamjmJR4TGNU5z3I6nED02H3mrBF2cEe8D0IvWY3KRZKje5bRngJtjRZDd5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715044025; c=relaxed/simple;
	bh=B7jqzV0l3wpHhVmjsMKQrYjL/dbUdsToLOprDJ3FUgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QdGQM6pw+MNFEtCj+raBRd/S9c07etTExXOCKPDIAiJ52/3bU8g6pz2NC6Wfc9tEY+csNN1S3hJFvsc9fSrRnGggqpi/0Mn7Exr6Yzej+e3N8HmapqpqFZT2DiEd/M/FswT1jYSG6gl/1SJW9Gu03my+AX9R0S8GgIlo3VV8K1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nzU9jBxE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715044013;
	bh=pcDpfkTEfC+t6wAbmY82xwQ9omO3AYT8uhiY0i8M2pI=;
	h=Date:From:To:Cc:Subject:From;
	b=nzU9jBxEr/5SArMv30ZsQe1f+srKQD8Sn7k3TfBOPmPMJPf5WvgS/GqTvTm64qS/j
	 NaD6J0t+UlDJCFBkPMDOEcgD7CYJkWUTfYGY3EQUb6m5kX0Cnl8SVOuPufJdGPoIdc
	 sqO5tpuSPJJUBMiP6kxeK8bs8kZYR5yuqI3F67+xt2s4Lvze3eFxxnt5yDeucXyP4H
	 ScefrMeQaa+5pcQd6FsJV3rggHBIF5ThSg1XUwevgfPIQGyxwg7ARbuFUZgG0lVnpl
	 DqILUOX8KstHWyE41fpup0KfHybt3whsERpnjVlZOk7xCL9Hcevfu3fMCcLznKr8L5
	 xaNyTeCVoK4aA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYKqd322cz4wny;
	Tue,  7 May 2024 11:06:53 +1000 (AEST)
Date: Tue, 7 May 2024 11:06:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Jiri Kosina <jkosina@suse.com>, Kenny Levinsen <kl@kl.wtf>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <20240507110652.7478cdf9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aYDliuamAB3.qI/DN0tJ6ZS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aYDliuamAB3.qI/DN0tJ6ZS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/hid/i2c-hid/i2c-hid-core.c: In function 'i2c_hid_set_power':
drivers/hid/i2c-hid/i2c-hid-core.c:410:1: error: label 'set_pwr_exit' defin=
ed but not used [-Werror=3Dunused-label]
  410 | set_pwr_exit:
      | ^~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  7d6f065de37c ("HID: i2c-hid: Use address probe to wake on resume")

I have used the hid tree from next-20240506 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/aYDliuamAB3.qI/DN0tJ6ZS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY5fqwACgkQAVBC80lX
0GwvSAgAlS7aUp8gYjOgR/j8DpbTws8pEn5Zujzxdvjtpm7i9IWspoI5il378KdY
jAgarlHt7nAYmovhFnZfxhmCtyQyWa+wmj0HkfzWq3MWAtmYQqkUDbCftouhUUBn
OKg15wvA3Jvy3J3npxU/sihItgMn5XBRiFu7A+HXJCugTsPwZggrYiW2YjHWwUHS
hDSLzezGKH8b3yQ+z1VkLqCwDuTnUkqeevJXgBmCLGw+bKtl3od01/KxBd/rpLIk
oYWi1TEStLPwXlgFiEONxk8YlkyS5dtNmO4Q5GhK0wA7qINC3cUGQdPXtC9kmNWZ
pIsjk1fbUm4zdrsrRTvVreVIQMIMww==
=mG1S
-----END PGP SIGNATURE-----

--Sig_/aYDliuamAB3.qI/DN0tJ6ZS--

