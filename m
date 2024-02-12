Return-Path: <linux-next+bounces-1132-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697658522AF
	for <lists+linux-next@lfdr.de>; Tue, 13 Feb 2024 00:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E542858B0
	for <lists+linux-next@lfdr.de>; Mon, 12 Feb 2024 23:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E5051011;
	Mon, 12 Feb 2024 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GDKaHoY2"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE251008;
	Mon, 12 Feb 2024 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707781295; cv=none; b=eXB1wsZ3XwoFyK/5H5pqjfAJnt+1spr/A1+i7rnQbCjbpfYuL8I5xtUyQdDZbQbDjvU9BDROyb4jzZu0YwgtqMnpPgqrJPNz38Ap/QgEyNwh5qUbnsELEm4p+GWviWoP6fymRtqa8bmZRi0Qb+GDAd0xzxcBvkv6OFWuEWKWA7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707781295; c=relaxed/simple;
	bh=jphPZfTrtfxfmMk/JmaeA38T6mjMtoAeY6uw0CBcYfo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q3dwA6llChlQrGQC8MSkso6jxJZmMmbHa2oHH5YqzU+Al5UnfpnXOWBqzJ/WFScjNd10yWQdQWnApe+Gx5lAA76XBJ3bN1DE0H5d+LiuHgQnYMJU6RHdGAry7jS+PwQvmA8gDU1iACLf9mjARv6Z63Ypz6eLiZnZ6++gsDAvOw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GDKaHoY2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 683DC4584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707781292; bh=n6qnBgMNosqf9bO6Z5F1cxE3y22AUxeo5bm/TflqpiI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GDKaHoY2XKM0PgnvB5/VYEEAkF4gzIsrQ9Mr6HSmLQP9gCsKF0FBGItb9/yAhCgRT
	 yfg9QUeFcZENI9olkrZAM1ST2IQAVHxmqP/Zj1j3za2+erZj28QzMk9A8/fjslYaMA
	 YKQ9BeiXFocL6xcxQM32HdNqx3wha9rlSPiIr2TTw0eiaIenyt6NResAM6Vdl4XD9c
	 UFWM2mZ6gq59YDRx69o0aVfm4uozFNKw2CHrTtuYG+bDoXj/VNNScivNYfr7QoAvrv
	 ubWaLIXCUoaLfDtibqN6t5k3t0TI0xC2AIaWMMR552Jn6w9dAM0Bd5BF6K0sKOe89I
	 JaNQ1WHXtKtfw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 683DC4584A;
	Mon, 12 Feb 2024 23:41:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the jc_docs tree
In-Reply-To: <20240213103719.7784020d@canb.auug.org.au>
References: <20240213103719.7784020d@canb.auug.org.au>
Date: Mon, 12 Feb 2024 16:41:31 -0700
Message-ID: <87o7cl6yj8.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> The following commit is also in the vfs-brauner tree as a different commit
> (but the same patch):
>
>   b66140d8e43f ("docs: filesystems: fix typo in docs")
>
> This is commit
>
>   f1d1f00279f6 ("docs: filesystems: fix typo in docs")

Yeah, I'd already told Christian I'd drop the dupe, just haven't gotten
around to actually doing it...guess I'll go do that now.

Thanks,

jon

