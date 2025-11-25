Return-Path: <linux-next+bounces-9197-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AEC835BC
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 05:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAC673AD0D5
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 04:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE381A9FBA;
	Tue, 25 Nov 2025 04:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iilclu1F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8289F22068D;
	Tue, 25 Nov 2025 04:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764046505; cv=none; b=C2tJVqEtOWjuzYsDbaO/W7WvUGgJ4pLwhmmAG5XLm9DKvDQKvpbu8/P2j2yVhQ6sakw2kAFQrT1YAbNPfauLcEv0h4at6y82ErbT8PEZMZVtOPmX5K1wBpIldeTYsd2QY4XFd47yEm8WV7HkFp77GVAT4/ja+ZlKZ2W08W975X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764046505; c=relaxed/simple;
	bh=dnFthM/jGgpQ5/BMV06lgxaf2NU2B7BXXXG1gAR7zuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=osxgn8XMXj2dErS/yEfy2D1ReBCanTX3KS6As9KajHoS7/cR7fK6Iu8/NvHQMuEhfnhQmCZqLhOq8yATaL9mwUrHwtnEtIUAtd2QC8wNVfXpQHHdpT/o9+ET+Nh/HXw+MoYNiSLXJ8gSPnr/54kNqXlsZ0dKXogUZ3WAYAqvXso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iilclu1F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764046496;
	bh=i7MEsXf/8onSjlmXFFiXDTCgmSjqGjzyHJcnpMAoTQs=;
	h=Date:From:To:Cc:Subject:From;
	b=iilclu1FrXIZab33gMc0Kxuq65FQfSkX4LfTuCKWoZx38gNcctSJjI5XKVlfh9yXv
	 LOm++YJN/hbGaOsZ5uzMu0Mqk1bQ7LaTWs/4VlW95dGF3KmmZJC7K8FX/PjSw5xuIY
	 LgoAWEY5ZXIRYuc3iMWTPqg+0ZGiFoOeV9XSfJrd0y7j9Hkx71+VeikJ4o1PvvW0E6
	 J7nWoN06EUVfjHpQIkBGJ0L6OYQKqc8TBJ2UDGdmTOXgSb8z5yx+OSoUNqdpzZqPhf
	 fmz+T9rGLS9hAuOYsFYhzCYBm1wZ3VxL6BNqnqmWCmy+BAtQLcsSlbM8UeJxvq1vFg
	 0GDVxx/gk0V5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFr345Slhz4w8x;
	Tue, 25 Nov 2025 15:54:56 +1100 (AEDT)
Date: Tue, 25 Nov 2025 15:54:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>, Christian Brauner
 <brauner@kernel.org>
Cc: Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Shivank Garg <shivankg@amd.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the vfs-brauner
 tree
Message-ID: <20251125155455.31c53cf9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZLHHL.ymlCQamqYgXTzwNDU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZLHHL.ymlCQamqYgXTzwNDU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  virt/kvm/guest_memfd.c

between commit:

  ca3f437d9769 ("kvm: convert kvm_arch_supports_gmem_init_shared() to FD_PR=
EPARE()")

from the vfs-brauner tree and commits:

  497b1dfbcacf ("KVM: guest_memfd: Rename "struct kvm_gmem" to "struct gmem=
_file"")
  a63ca4236e67 ("KVM: guest_memfd: Use guest mem inodes instead of anonymou=
s inodes")
  e66438bb81c4 ("KVM: guest_memfd: Add gmem_inode.flags field instead of us=
ing i_private")

from the kvm-x86 tree.

I fixed it up (I just used the latter version as the conflict is a bit
difficult) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

If somone can provide a better resolution, that would be nice.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZLHHL.ymlCQamqYgXTzwNDU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklNp8ACgkQAVBC80lX
0GwWgQgAot3686cp1/lQfy2X5jalN3BgNEFf3ovCBZgz4UAQTAxO17DMexOs6lB7
3uNXNK+4MfCCZhVNxdwRS3ko1aemlSSGHgiEjxv6yz9vVYo/S0DNWJja5EWlVS2k
5z270qm4FLa37/mmdJYIL6LLL6QSSU8tKCIuQIrb2UUtoBYe6KtbnhNs1gVUgZO2
SvKP6n5PeaYSZAbR7fPf2qUm8FVfu9HQSB8vlhicAd2TdryzqULpztm1hElw5jy4
YwQJ2xE9jPKP4VxlEikItOMF129gBqkwtZbc6sVPBzvEBZe+ECyUpfXfamdYm4gA
XeVScoPi+VOXgGk4uhQH1HRsTTsZGQ==
=MmIM
-----END PGP SIGNATURE-----

--Sig_/ZLHHL.ymlCQamqYgXTzwNDU--

