Return-Path: <linux-next+bounces-4343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34E9A58D8
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 04:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2307E1C21119
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 02:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB6314263;
	Mon, 21 Oct 2024 02:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JOQT2Vhn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC4826AD4;
	Mon, 21 Oct 2024 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729477605; cv=none; b=ZNOAWvbUTthx7QWn8yXN1ihFrP3RR2Iu5PZoonRRlNcq5aD4qgYMcDW8eZuw562mabWAzor4WzoKODU7fVILTi80620PXjSFwKsJm16U6MMTQNyWW6c9eD89NDEw2hBHsnHOi7EuCtTDhnswT09EEJYRdltH2ZsGkPiF10QueyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729477605; c=relaxed/simple;
	bh=8NLqK3AVMeZiXQChdve8JYeLasiVdjP+6oz/9UzqccU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TBjAhqb1LTc0jaR21Z5X09ql722OFKuxorlRQ0aJ8LKqYA3/Oa0zmt+cXxYfi0AxKXs4Z23a9oFYxK8bvxmk+KEjLAY+IsEm47+lFH5j/0MwBKWMyb3Glx/4yC7DoXXNFEsowPdlfBNfXVSid04MjGUeUVMH8HENu+kkZ2rq8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JOQT2Vhn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729477597;
	bh=UASnbxobhGG6DSLgORQp5BbAH2KEC3TdJk6N+I+qWrw=;
	h=Date:From:To:Cc:Subject:From;
	b=JOQT2VhnXjOYr4T8vjEqynn3Pi75XzUkzaU7Fiv5mVz+3rad0jGIVSmvWrwH5Xvaj
	 WXNplJor0ZVxg9Lr63eGHQpbFwMu3uz/iK6CO2ItsjgR9kX10kePFxa0ZeeUcDs2eY
	 vIuM/VbWKvNkNDqhDZ+Im0EUDielU9cWbQ+nOQnLqkDUOkRKiAZPgXzBb53BsaSukE
	 CkW1j3T/jVZlAlOxo1e9zbfyXbKh5gfKRw6pJHRNfB5vW3iTMzPww9lfAmk06nlGPL
	 VFuv7w8qtcfwLT/DV0XI4zLqwS2HJCEgP3YdCEgmqNB9Ur7nr4F0WPSIM3s0D/Dp0u
	 z/49IxkG/fsbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XWzhY36btz4wc1;
	Mon, 21 Oct 2024 13:26:36 +1100 (AEDT)
Date: Mon, 21 Oct 2024 13:26:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20241021132636.39d409f8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8qU8ZLy.=gn/pMmWq3ajouZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8qU8ZLy.=gn/pMmWq3ajouZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/ring_buffer.c

between commit:

  09661f75e75c ("ring-buffer: Fix reader locking when changing the sub buff=
er order")

from Linus' tree and commit:

  1f1c2bc9d075 ("ring-buffer: Limit time with disabled interrupts in rb_che=
ck_pages()")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/trace/ring_buffer.c
index 3ea4f7bb1837,696d422d5b35..000000000000
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@@ -6757,9 -6800,14 +6803,10 @@@ int ring_buffer_subbuf_order_set(struc
  						     struct buffer_page, list);
  		list_del_init(&cpu_buffer->reader_page->list);
 =20
 -		/* The cpu_buffer pages are a link list with no head */
 +		/* Install the new pages, remove the head from the list */
  		cpu_buffer->pages =3D cpu_buffer->new_pages.next;
 -		cpu_buffer->new_pages.next->prev =3D cpu_buffer->new_pages.prev;
 -		cpu_buffer->new_pages.prev->next =3D cpu_buffer->new_pages.next;
+ 		cpu_buffer->cnt++;
 -
 -		/* Clear the new_pages list */
 -		INIT_LIST_HEAD(&cpu_buffer->new_pages);
 +		list_del_init(&cpu_buffer->new_pages);
 =20
  		cpu_buffer->head_page
  			=3D list_entry(cpu_buffer->pages, struct buffer_page, list);

--Sig_/8qU8ZLy.=gn/pMmWq3ajouZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcVu9wACgkQAVBC80lX
0Gw24gf+POIQmLhrGdGaCvlGHVHPnY1n4LL4CFcr5HE3i6zDU65G6Y6PtxVWjS1F
t8TuMNM0DqQY4A4tTPKu0W34lAdKS+lultEerPxHseGfrLBvkept/DdJ41JZ9z8U
fFVboKfehDdgN9mWB1HO8RGztx2MwqLwcO1lN2U+XNWp7Z5fCsVJu8z/YIvvChfB
jnYerHhAucVtSff9OsPGhmuN7uk916c9zJroHIHOlxSiX4CUUvSZPZ6h7SdDzmTx
m0D8ZEBNP1OrWazQDWD1AWf8rKR3UamD4UZ2+5pZT/wdRi21oxwv3bcaJ+CNlwUx
owy+DKnFyjhS58bl80ajO9zZqTwGrA==
=X0Jx
-----END PGP SIGNATURE-----

--Sig_/8qU8ZLy.=gn/pMmWq3ajouZ--

