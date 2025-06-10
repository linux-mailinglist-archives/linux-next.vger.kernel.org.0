Return-Path: <linux-next+bounces-7116-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18622AD2C91
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 06:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2653188FC33
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 04:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF15725DAEA;
	Tue, 10 Jun 2025 04:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P7o5hAOA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906DC25DB0A;
	Tue, 10 Jun 2025 04:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529354; cv=none; b=hsMUrrr8gaxBVAtXjd+wnFbS9b3Q5+W1Z0+U3+iogZ8JWo7nCWQQNu5KuOrda/Udqqmw60dUrFde/O+GS1fXxfjAZuNqwKNXj3HaySLOxJ9kaeme5QJwd23y38tNO5J67Uw70wfZlxdZfoUtS7gXwfXVY2Dq4d9Q56dxPKKZVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529354; c=relaxed/simple;
	bh=bTdKQ7Yu5BtdMp1M+Otes8MQvVaDSZQZkDlh+6jk8q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kR2FFW+6W9WtjbK+/KT+r4WHPPN6oN9iA9i7QR3hmm7ZmURuQY++dhTuMaplnivuKlC2tC1Kp3KydgQhYJjl2tN1dJ3iarQUS+HCOMDnzGlfRA8A5qgZ8eEPh58DT0q2Fi9wSbYOL+EQjRh1dob8gBPMheWje5X21nQROsNOOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P7o5hAOA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749529351;
	bh=bsaPcay13ZFyYtQXgCKHSrRqn1piIVWfq9+PQ1EGLMA=;
	h=Date:From:To:Cc:Subject:From;
	b=P7o5hAOAnwumJr2jHQ6PhGr44b24oXvLeE41Rj50EL8fee72c+yE4t9Intx9ypi+Z
	 5tpTrXsZVJLpu0UhFRrFNLgeQvTnOougc5qinUTn8jJX6diieMCY3x5a1JJlxqUGUv
	 F0M/67xmZiRw+Hvel9RR5JhfCKTwu3ca7AM3yrt2RQLCIk93unY8M1LA7lKB3CGB72
	 F1ZHJ2j9ubh8nd977W1nwhLQdNjRlrV+wKP6mDpUprHOoYoaO4HZ+DjT16vdknCZID
	 Uao989oT2yRsVG2+8fmlOipEX+OdrZRZCG+lTaiYKvmxebMVd75QenXUA0JO4mRYfA
	 taooxr9xS/9lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGbHB6ZN1z4wnp;
	Tue, 10 Jun 2025 14:22:30 +1000 (AEST)
Date: Tue, 10 Jun 2025 14:22:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Benno Lossin <lossin@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust-pin-init tree
Message-ID: <20250610142230.001af1d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2VpUJvJAOEhyBNG0f+OR1S1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2VpUJvJAOEhyBNG0f+OR1S1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust-pin-init tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0282]: type annotations needed
   --> rust/kernel/configfs.rs:154:26
    |
154 |             subsystem <- pin_init::zeroed().chain(
    |                          ^^^^^^^^^^^^^^^^ cannot infer type of the ty=
pe parameter `T` declared on the function `zeroed`
    |
help: consider specifying the generic argument
    |
154 |             subsystem <- pin_init::zeroed::<T>().chain(
    |                                          +++++

error[E0282]: type annotations needed
   --> rust/kernel/configfs.rs:264:22
    |
264 |             group <- pin_init::zeroed().chain(|v: &mut Opaque<binding=
s::config_group>| {
    |                      ^^^^^^^^^^^^^^^^ cannot infer type of the type p=
arameter `T` declared on the function `zeroed`
    |
help: consider specifying the generic argument
    |
264 |             group <- pin_init::zeroed::<T>().chain(|v: &mut Opaque<bi=
ndings::config_group>| {
    |                                      +++++

error: aborting due to 2 previous errors

For more information about this error, try `rustc --explain E0282`.

Caused by commit

  0bcaea04244b ("rust: pin-init: rename `zeroed` to `init_zeroed`")

I have used the rust-pin-init tree from next-20250606 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/2VpUJvJAOEhyBNG0f+OR1S1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHswYACgkQAVBC80lX
0GwVDwf8DLcyY0+Xy+wQsnAu3Qio5blq1F8obO+xmTpnW2c9Dam/V5nqjbmTMNOH
y7O2ITgD2XMOpLTLj+AOP6L8u1r1UbydRc0QJ3GZWEddQ/nR3QlPmczneiQwlLjq
M17XUOKSC9lBPw7h+8L+Z27JnB6Uv8KVLcM4RiTMEAM0P0pALqe9Iz4nMjnAb0ln
SnHHBPeErKkLsAbFeX7vG9HPnd2wCZFVQDQEMqxOat5Edhwfxf25J8ZquhaPTxHE
BbUVOF5ZrFL01ESnALNknJHwSjLXK0pySMCgqQvafX1ScqnHD1QMQ/lGxInpoLg/
rfL+g90aceMAgCV6yw25SUF3IXvkZQ==
=IkyT
-----END PGP SIGNATURE-----

--Sig_/2VpUJvJAOEhyBNG0f+OR1S1--

