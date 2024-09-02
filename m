Return-Path: <linux-next+bounces-3531-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A423967F79
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 08:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA3E1C217E3
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 06:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0596A14D6E9;
	Mon,  2 Sep 2024 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cnI6BEC8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A887DA7D;
	Mon,  2 Sep 2024 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258619; cv=none; b=XWTOztY62uODVXq6LjNcX/th3Z7Lmk4xy9FusQ2bJIvYvAjhwlyHGsDHejlvz53FU3ifLytnJjBKr7x+QjdDKiMA9Q5fEducom/617awTNjLWEVL/xg4bCO7EkV6Y/0gllhHz/zQIAGROW3hp+YtbL5MkjDpqC8RWrxxxlaZ+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258619; c=relaxed/simple;
	bh=puB799wvAVd7RQYw+X4H9d2P42JLFPdld6ZPAvaPCqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YKegcsAQl4fQ93CEDv8rCZpNvDGrcVXx7y5NTKpBfJGwmqgGTjFF4x9BybvbQjnc/n2YNoJ5QlrF3X5+oMBaXHXzYiFKeP7HD5GqwzfH1g6cyViIyuO7hDWJCgGctEzoe50V2l7peiqe0HdbdxEBlGn3twxhSMKmIW1I89A0uAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cnI6BEC8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725258615;
	bh=ylCh68oQ1qq4hJDW9VPsgpKJ4yknB9PpXynm1F/tuug=;
	h=Date:From:To:Cc:Subject:From;
	b=cnI6BEC8xWKnPLLu/jficoI8GLbOaVqjgo2hUcA85d43xbWPR7NFaUqVlPepnxiyK
	 DFhSMQMDNEsEJX2/9UsKaJ2DqYxGSkvwdWKImbRvzi0/zfUg6/iTrfW/ydMUFGdS+w
	 OZ2A8RlK2wnMltBDIAy5bZk9GYDtC5T0HnWgOqfXEX4FBDrQUuWU7DJ2PO6kXYR2OO
	 ETdkPbFxv1JhPT18A3av7eGlyHzXTZdhZFgyyqzFaOwSzUdxSTSzIm5Uu+1LI0Iy7T
	 jhiw9rqNu6DSC+eBZAmauARlbq7fM211M+lsPJeeVtPUyRhetHms1KvoG3/HykiC00
	 N1jKYecqHe/5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxzQD6mXJz4wcF;
	Mon,  2 Sep 2024 16:30:12 +1000 (AEST)
Date: Mon, 2 Sep 2024 16:30:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20240902163012.03392550@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MwoQbQROJO1SB29hi0gwya_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MwoQbQROJO1SB29hi0gwya_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs)
produced this warning:

mm/migrate.c:70: warning: Function parameter or struct member 'mode' not de=
scribed in 'folio_isolate_movable'

Introduced by commit

  29619a2209ee ("mm: migrate: add folio_isolate_movable()")

--=20
Cheers,
Stephen Rothwell

--Sig_/MwoQbQROJO1SB29hi0gwya_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVW3QACgkQAVBC80lX
0GzI8Af+PfRg89tB2yuo3zq7r1cQdd3wMr67DXvY05Evir3FJn4JNXHxurW1l9kj
bXCiSr3kWQIO1MaGByv0iIjqNDxpHhYUswwKx/3dcksyuopdp0ni/dR56O/EsU7Z
rCEL7C7r+RFkbMjsY3U65HJJTmDyb/ARpxKER+fby+stQR+MUqze5wU6QlOiDUiu
9VBZds8jn7EajVyAjkY23PJTKPBaPjH9eMfxQzJZTc2TjcDONExeneVByDIk/suq
x96PWLPKQmesHVuTsiIaX1DW/pFzCt+HdZqiVFEKKOi3s7a61pomnwVDzndieLW5
Zo9YYXfy09SoCRMJTNWHorVQ1P7flw==
=yzqD
-----END PGP SIGNATURE-----

--Sig_/MwoQbQROJO1SB29hi0gwya_--

