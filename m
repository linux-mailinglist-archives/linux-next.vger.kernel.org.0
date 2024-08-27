Return-Path: <linux-next+bounces-3443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD896014C
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 08:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D474F1C21791
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 06:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA546542;
	Tue, 27 Aug 2024 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dmbSsA9b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2B20E6;
	Tue, 27 Aug 2024 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724738800; cv=none; b=rIGwz53ulE8hpm7IEPMt+xGN4BE2U5VLfSfIS7meowoFKr/h5XT2ZjT7rxvTYgy7ffoQA02pS2n4vynAQb8eUMdqqfRuy9AW5aOHkQANtmwZwUT6t8zdO26aaHzn/Q9L+aUSm5Sxq2s+xA0nDw1dAEr3BPk+jrFlmOkgwCALvWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724738800; c=relaxed/simple;
	bh=n0IWWBLdLgvxk6pf1IdfZhWz6LYfFUSohTzhGQ9oxzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kC9CIqjK6DGOBVHmxZ8m2UKT3WZYFBdklxttVEre9/JleX5lX2OP8lFPpkGdX2WHjNe7YX4dckFGNpu7BGR2L0WJ/5euOVaj+zOCmWaUS2Q4tT/IRYAAAIjFCCqYzgeAdZgRfqjZd2eWGFmI90h/EcmaOazLnsyJk/+B2exhBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dmbSsA9b; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724738792;
	bh=uvIAVwjdsEu3ewtqUCbhJwa0D68arXBmD4oV46YD1rM=;
	h=Date:From:To:Cc:Subject:From;
	b=dmbSsA9bFZOU4N0/+K7jRkKTmtNOknJSkb3rKu0w5yblT6OzQ7hHNcFB8wj3f56e7
	 PLEy631msD5dY3XRgaDIcdeiZjDYYkKScD0tADgTkxmng1Qq2mjaZEBx6uEvnRLIKW
	 cUC0nQ8Oga4LeEees8xefc+DnH395UWQ6Z+iVAbmeBajgJk39kCVE6k0BOfvcKQtZU
	 E8tjRPEmlxN7kY9X53xDRmtdPFYLImlFuJM60TwOL+IoJAQ0jHCV3mP7TKXk8yYk5c
	 gL3FKZW2WPlRrwSIZqM1kziSX2FYJ83kJAmmNYT9TAzC/+Tu4YVD73s4DIBU40xsX2
	 GmvjCnkJ8rb9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtH9g6kW1z4w2Q;
	Tue, 27 Aug 2024 16:06:31 +1000 (AEST)
Date: Tue, 27 Aug 2024 16:06:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>
Cc: David Gow <davidgow@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kunit-fixes tree
Message-ID: <20240827160631.67e121ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/76suHVo/xYAMpGBrAPoy/5V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/76suHVo/xYAMpGBrAPoy/5V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-fixes tree, today's linux-next build (htmldocs)
produced this warning:

include/kunit/test.h:492: warning: Function parameter or struct member 'tes=
t' not described in 'kunit_kfree_const'

Introduced by commit

  f2c6dbd22017 ("kunit: Device wrappers should also manage driver name")

--=20
Cheers,
Stephen Rothwell

--Sig_/76suHVo/xYAMpGBrAPoy/5V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNbOcACgkQAVBC80lX
0GyPjwf7B/+m4agwYwhaDl12srhf4qtobqyLod4+XLMz4H2jdlkXeI1r377VPLWk
X4Z1/9sldbh6UOAYiOR7YPxbyjnfAXsEit/gEIp1gEj/hEJ79dSMUBjK9zJHIbsN
4IpGrGQbRDJG19xZCdqcxS/X/Xa6dgxgDpGSspbo3aDQxvX8ktoCMFr3fw1qrqve
MOuW9iSy5jCSQoX/0W8nswMVoy0usjknD+WexstE5ktaXoAjbheNo1sHw0l54iMV
Qa7WP2GHsS/Y+9jptbEsnBnRsnulDrolKr47LO3+I4f2708UE0DQ3FLxhca6tgGR
ABM0KczzlMGw8434zUlmHVmsCTWB3A==
=oC4M
-----END PGP SIGNATURE-----

--Sig_/76suHVo/xYAMpGBrAPoy/5V--

