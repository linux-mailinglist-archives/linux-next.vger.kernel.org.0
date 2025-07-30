Return-Path: <linux-next+bounces-7765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515CB15906
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 08:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EE0D18A135E
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 06:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F61F1EFF9F;
	Wed, 30 Jul 2025 06:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I4v/35pX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B5199BC;
	Wed, 30 Jul 2025 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753857654; cv=none; b=tP5apb3C/Y0G3ZtbN8WGCE5g/VAPY0g/i63XMWAZnOu85RIj9lp9+g6aBZ9yAqR4E3sUy+oMp7njco1t14m1IQhLiDM8QPWjwog0weFcxAMiOGjfnBvs0xycSuM9R9vJO9pA8+pF3pjH3rk7EGgwtdLS+izQLHrmcSN4HYn2Pq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753857654; c=relaxed/simple;
	bh=awj8/NHPS85HdZnYwAKBZ27TWIFeKMqgPXkZmuK7/Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nDWG1Tq0KCn6DfvY9Vl0UwxWN6kUrl3RVdoikjEWvEt0w1KiU8B5S0o6iK3UvNpFK9QrQrgEIl1OtyiAMZA52ZKhtbR0qnJ8b52ms1Ra0axWph5xMUWVZvnNAa5RoIdVzhbKWpcEXJfgNy5EkvJNwpjRe8yHavzyHlQY5k2lR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I4v/35pX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753857432;
	bh=awj8/NHPS85HdZnYwAKBZ27TWIFeKMqgPXkZmuK7/Xs=;
	h=Date:From:To:Cc:Subject:From;
	b=I4v/35pX5BPVY1eYio6b+7z9AYOkVVFUO7KJseXINDvTyyx2Y4Pnkom2+vo5hrXjy
	 PKkF2J/ujaqzrWR9lXc5Pfc3gTW5NJiT99c0x9YDhzwwzKI69terI+cXMU2t4yodIb
	 6YRCEpRVPBpEWW9eGtMRkMf2CrHjR+QiWx+S+Oir+u7b3Dr5X43RjUGZUOhzmw5uRD
	 D+ULH/uGlegzVyk/Z8AZ+cWPX2+nXpjS8+PC08k3sfnXIFC4iHJd0erpWEmHPkAhAp
	 XuyQjYZKWmvFMzc0WrHWj0mgSGjYRv9VqpRVm8rwXBnKrL2ldXsCRVHJ8q0O6iHqxS
	 G9QSbrvCLUw2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsMvX3lpSz4x5Z;
	Wed, 30 Jul 2025 16:37:12 +1000 (AEST)
Date: Wed, 30 Jul 2025 16:40:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kbuild tree
Message-ID: <20250730164047.7c4a731a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/argN=GS7Mm23mkIjWNzFyuD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/argN=GS7Mm23mkIjWNzFyuD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (arm64 defconfig)
produced this warning:

aarch64-linux-gnu-objcopy: vmlinux.unstripped: warning: empty loadable segm=
ent detected at vaddr=3D0xffff800082750000, is this intentional?

I am guessing this is caused by something added to the kbuild tree today.

--=20
Cheers,
Stephen Rothwell

--Sig_/argN=GS7Mm23mkIjWNzFyuD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJvm8ACgkQAVBC80lX
0GxMsgf/TYjwU0h3h8ERAutJOvPgEf9HT57Ei1EMr7Wt7ugKaakk76qcKezVJcsS
5QhpYj2vtrEJZNnOfqW0Pd+u3r6A3bQ7XzVBocL+10F1nEYHzKCk3B4CIeym7nlY
uHubL0ky41LCVSjJTB4WK5PuYbc0Ku6zVK8vmO5gh0DRlu4cJbeGiYPMn8AZ4E4f
tjmzVpTcQIZsrSUcjgO+zSfnc0KOS3cW16p+zsfRRxvOi0h+gHGLylqaHHxYZD0v
regY0JnsCGL5KqWIkjWsunoe2dnGQ1ivsZCP6Uu7FUsgSmVif66+5MvRnOrAO1+U
Gqra2brXY+1knF0KpDQJGUWz0vsHug==
=jE5r
-----END PGP SIGNATURE-----

--Sig_/argN=GS7Mm23mkIjWNzFyuD--

