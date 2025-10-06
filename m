Return-Path: <linux-next+bounces-8559-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72848BBDECC
	for <lists+linux-next@lfdr.de>; Mon, 06 Oct 2025 13:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 540271896388
	for <lists+linux-next@lfdr.de>; Mon,  6 Oct 2025 11:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20797270EBF;
	Mon,  6 Oct 2025 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdcWn/gA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DD526A0F8;
	Mon,  6 Oct 2025 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751658; cv=none; b=R4j5ous1mdAE1Cam6w8UJ8L/tkRLF3xD6fstz5IVZorlm9KA+TBDVM+c7RbmUneT7Xf9w2I4ws5Wiq5sQD+PpbW8w+0cPZMXuw7ceHqE3YWQNPabQ4heeAPPgLjB0TWDQYPbpl2WKUYuGM5rKHxLBTenjpp6e0okc9wray+nAKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751658; c=relaxed/simple;
	bh=zAlIHE6x1M34eEodphiC58UODS3SZhqAITFtTCAHeM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsvOMgYhS/8KwO05md0uVH+Mzo1y/7Tl4LKrVh2/0y4ic68wR/1gdSH8ZngS30XWTAGUwV+FXVe7uUK1ABM5yVkEh1RGMATdFR1XD8yglWbaFgNb5oiYZVlDM+JRMMljYriWyNf9Rl/oUhjPWgpuu7AdHPsS/rWM85a2CaMxgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdcWn/gA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A8DC4CEF5;
	Mon,  6 Oct 2025 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759751657;
	bh=zAlIHE6x1M34eEodphiC58UODS3SZhqAITFtTCAHeM0=;
	h=Date:From:To:Cc:Subject:From;
	b=kdcWn/gATu/E0RWcVx6r/whmu9AjQuCJQNeDB1zMHsdCi2GF4yA2Ke1bha+jYgXKe
	 12fRD1X2w7G7yrj/3fY3RCX+ErrQjrH/6wweP7475rnP8cNZdZWhKNhfpXzSRpqhqP
	 KSGZmf+5/HCLKCi7uJUVoOkLl5BnLf8QbRVF4VG5gBVtgQN/uj4VN88uyUruWRJjpL
	 XQeR3ExLVeQVMNx5xNjIxrCbP+M0KB/ayF8kWjNNMJ4EeBspShb63PDwukY05MhWzg
	 mtXz1h1JgaW0zWxlv2nnEDc0UvbX8IROhdmKD8immVP3L3vXeTrwqNGU1dOhGKPNjO
	 w7/2AADZPdi7w==
Date: Mon, 6 Oct 2025 12:54:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Joonwon Kang <joonwonkang@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mailbox tree
Message-ID: <aOOt32hRRt-obb5w@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O0XO5ZDUQRd+y9EN"
Content-Disposition: inline


--O0XO5ZDUQRd+y9EN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mailbox tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/tmp/next/build/drivers/mailbox/mailbox.c: In function 'fw_mbox_index_xlate':
/tmp/next/build/drivers/mailbox/mailbox.c:494:15: error: 'const struct fwnode_reference_args' has no member named 'args_count'
  494 |         if (sp->args_count < 1 || ind >= mbox->num_chans)
      |               ^~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:287: drivers/mailbox/mailbox.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers/mailbox] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/tmp/next/build/Makefile:2011: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Command exited with non-zero status 2
2388.97user 520.10system 0:21.52elapsed 13514%CPU (0avgtext+0avgdata 323276maxresident)k
0inputs+0outputs (1008major+37863234minor)pagefaults 0swaps

Caused by commit

  c889daa5a773 ("mailbox: Prevent out-of-bounds access in of_mbox_index_xlate()")

I have used the version from 20251003 instead.

--O0XO5ZDUQRd+y9EN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjjrd4ACgkQJNaLcl1U
h9Ckiwf+NJPOPsh+nkFrEJZYUDlX5dpO/CF03X6h/7g4WUAIN4YtbW+vuYzYTruN
7y3cBxjmaSVjl2761Wmb3zt4oSusKKmbs6sucTBN+Wm9kS7ERjA87q1Vc/syezMh
hlh6xCq8RX/eHBEjEP7ElbSuzSeqATKywDLA/mpWvSjuE66Y8m/9khkL8Z4ft0Gm
Cxa2mwRQ13uVgR8pRx4YgQBm6WvKUG1DukrLM/K2WURRYzPLOBY0rbvfz29mropl
VCZ/Szc25584uQJok4U+N14cqujfQQ/o/tN7QMAYaq35d6TCllhAdWBrL3/prwin
gxGb24PiowKvrs3yYYY08gTGBpTWGw==
=DRpM
-----END PGP SIGNATURE-----

--O0XO5ZDUQRd+y9EN--

