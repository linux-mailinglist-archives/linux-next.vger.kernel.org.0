Return-Path: <linux-next+bounces-4762-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C5B9C6224
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 21:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BD202836AF
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 20:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3938218D7B;
	Tue, 12 Nov 2024 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bM22XmXE"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0FB217472;
	Tue, 12 Nov 2024 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442037; cv=none; b=mR3PJfFJxNRRQO5Vl25LdhXB9/H++/nAJ5bxpIPmH7JN9Cvnrdp2Td9FFUVHTcjh8iT4ZwQVmNNiHq7XjRU6WITPBaLOGyOO6cZptW5Xy4qgai0boMnbVy+obK2XDPfyPtYnajtJXIS5NIWyKNmxTBqtchQweAGVdY55Nz5liXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442037; c=relaxed/simple;
	bh=VN4DPZ/Ubeh3yRvty7vLKSmzphCNXMsWhZKtu8onML8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NjvHHsOkyA3zbVolDvN+vTvfwzmLyD8IOusea/ZmaA3BN9yTlb+7DodklxpGrTvnCWswJwZdBZtERxYpwhB2DQ7r9HxH+0Jp3wdi3A3+lXWwL6aVzdGl9X2aRDjN0tM/tTrngNlpfFnG/5nR49vo5/EDZRhLgqqJUya6CYZFRvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bM22XmXE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3E66403E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731442029; bh=u02gc8HT0igfeDobZAawC06098CdEuav8BmYMyCYA70=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bM22XmXEfD+b/s4fGla3r+FP9+37fjjLLmC3Jv9po3J7gvVjV2VcKaOIVIGSzQ2fz
	 scZDvVLPZ9+pE4lP1qedM12m9uK3WjDZks0AWQes/XqF2cV8LypoXvzO0n8nhM4auy
	 ZxmVlqKsCgbPRqdTo3Q8ZX+BP/O+d/+qsq9Rw8hBf0t0NbX/lJvDX2auOpDWQ41YHp
	 2XWPA/j1TX4MGm+3j5tlMnQGYGS+KL6ZEuHTNx0xshP6G8o55oYgkVCxMH5OGD7HiF
	 TxGdC62h16ShwQpSqtkC8BgnDqYjNQfHurT965EhCC/Cq6YK5X+3kM1DtpOkAK6Tj/
	 AmaCjMFJ7PFoA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D3E66403E4;
	Tue, 12 Nov 2024 20:07:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] docs: bug-bisect: add a note about bisecting -next
In-Reply-To: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>
References: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>
Date: Tue, 12 Nov 2024 13:07:08 -0700
Message-ID: <87v7wsqkr7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Explicitly mention how to bisect -next, as nothing in the kernel tree
> currently explains that bisects between -next versions won't work well
> and it's better to bisect between mainline and -next.
>
> Co-developed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
> v3
> - add a optional 'that' for readability/understandability
>
> v2:
> - slightly change patch descption
> - make the text more how-toish to better match the rest of the document
>
> v1: https://lore.kernel.org/all/20241022-doc-bisect-next-v1-1-196c0a60d554@kernel.org/
> - initial release
> ---
>  Documentation/admin-guide/bug-bisect.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Applied, thanks.

jon

