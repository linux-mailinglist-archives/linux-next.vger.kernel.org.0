Return-Path: <linux-next+bounces-5327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6635A1CF9E
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 03:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 262513A6BB8
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 02:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57DD22339;
	Mon, 27 Jan 2025 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g26MeMGM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCD2200A3;
	Mon, 27 Jan 2025 02:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737946780; cv=none; b=lB7pY4UHFCL3XsB7ghgjgzddTGvs89nzQ1QB9U+dpLquga+3v7M+5vajWzGrOWbW0kA+NCPBZ4ZEeeARvwsfvnDZ8++yAJU1XXqwsGYaAHfsxuWXqYUwnu+faoMW1THwA8rl7PwggmTzvNWbFO48JhnghZ5v8IgY4pXCST1rOfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737946780; c=relaxed/simple;
	bh=moDTB2uxKiauIJC8SaHAzWTNL+Jv4wTpm+WqvjR7ymM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KmRhk9ZZYw9BoyS3Z5D9eWDPaML3ZSBOFXNCRTUvc/wgi5cajGMDkUG7wgk2csWZGgLTx/BSiaY3AQ5A9Bx9XtokjykXhz5wfjk6XH7Mr4wgj63RAU7/WEfA19jyIf/msbjCYqmm4VCX3aVmyD31H2Fvm1OXCMDQoAIuCWEXDqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g26MeMGM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737946767;
	bh=Y4lg3qHWmbCdXv7O3BbgMhjIAhN2PjAjRA+mFOCjqZE=;
	h=Date:From:To:Cc:Subject:From;
	b=g26MeMGMHImUTfQEOvvW4XzLZFNO2HbT2rK306Nly8aUl811hFdmjEj+BBHhsoUp+
	 2pYdhSiWyH9IvFUCCzVz5kWu9dH+ImnXc6A71infTc3f/s1novXTeUQTUjviptHNHj
	 TvAya4l+hoKNMnmUkkTDzJJco3xwSTh9/DOFwr0ZHscUCWY3E3itDy56pD5ae9GSMN
	 AHEoXIrEKTGNeJ6nJscpMMLZ9Ny9IOefe99Cg5DT3sanXp0aXxCuwN1nS19PJeOvYL
	 Z9ryWCchcYzpVsZ4bcW+QJwpcIMahS4aRkGGP63V6qb10ZZzQr6eC53qQ7vzEx0NuS
	 tRxvpAIURbwGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhCnC28WJz4wbn;
	Mon, 27 Jan 2025 13:59:27 +1100 (AEDT)
Date: Mon, 27 Jan 2025 13:59:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the modules tree
Message-ID: <20250127135935.0195bc68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_Q7qQEC3iEIyxyd4bDIhcCg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_Q7qQEC3iEIyxyd4bDIhcCg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0217859ce172 ("module: sign with sha512 instead of sha1 by default")
  0dea980a17a3 ("module: sysfs: Drop member 'module_sect_attrs::nsections'")
  0e436d14d0b9 ("module: Put known GPL offenders in an array")
  25aa76116052 ("module: Constify 'struct module_attribute'")
  570f7776db9c ("module: Split module_enable_rodata_ro()")
  75b519abc918 ("module: sysfs: Simplify section attribute allocation")
  8c82fb5240f7 ("module: Extend the preempt disabled section in dereference=
_symbol_descriptor().")
  993026197341 ("params: Prepare for 'const struct module_attribute *'")
  9b894ee43337 ("module: Don't fail module loading when setting ro_after_in=
it section RO failed")
  c027a83a0375 ("module: sysfs: Drop member 'module_sect_attr::address'")
  cb80af8451df ("module: Handle 'struct module_version_attribute' as const")
  cd8026d4bda8 ("module: sysfs: Drop 'struct module_sect_attr'")
  e6ea40687ff0 ("module: sysfs: Use const 'struct bin_attribute'")
  fc15d675bc49 ("module: sysfs: Add notes attributes through attribute_grou=
p")

Presumably rebased before asking Linus to merge them :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/_Q7qQEC3iEIyxyd4bDIhcCg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeW9pcACgkQAVBC80lX
0GwNywf/V3odLsCnKbJcEseaG6ypAWN0tpVjTxn8n5NoUxKqlnh8f+Oz/5fu8rOQ
HP9e0Qmt354hoCUNOvwOJA74httL+QuQI4fyAxT3IMryldGMnc+EcVn94C+OpyiO
2UmEazrpfpH8S+5q1FlDmtfk/EJItep2kyyEcgi2K+/XFARC8Vp3DL2qgO1LshRz
gslvgdyU6CecFiVbx82J/+qceQ5c5CoVj2/swLHgbZ3rSJ0xfWZVphFK7CO5xbLq
o+tedTIySQ87mxH/7+7cJu334CGTfy5DGEPYWpM+WQ00v3wEw96vuxmjgpQP6Bls
+o8DhGJScNADON9BjMEW5V1y105ksA==
=3FVe
-----END PGP SIGNATURE-----

--Sig_/_Q7qQEC3iEIyxyd4bDIhcCg--

