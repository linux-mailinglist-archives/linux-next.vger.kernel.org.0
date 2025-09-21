Return-Path: <linux-next+bounces-8407-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD3B8E7E4
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 23:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3D3116B622
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 21:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C652472AA;
	Sun, 21 Sep 2025 21:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hiinDJhk"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D102D0C8F;
	Sun, 21 Sep 2025 21:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758491801; cv=none; b=owCCIhvqlWvnGG95M0xU/faL8cFB3LSJvByYM5b/Eyl1f1kQuyU1izVbVYxG4Ilqx729vZQJHkNF8KU7Ohj47zKA06WeKndg+qA6h9+7K6W3CS6Ra+DO/L6AG/XNtMwY+QlSmT38ajGB7rTtzzh95KVbdA91mytSc3eT79z4QlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758491801; c=relaxed/simple;
	bh=traPmwsZR7eiQJi6yFmKFtjTOxCpbDAgJO4/zZdpQ54=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MKNcbI5zE3nIqvdUFTbo5cqNeuuXYBcgsrimNkMeacNosux0sQxgdUgoc9g6n6eXFtk+tkNe6SNXaDd6UwniqO8mefnPuHiRIDurGotCkRw+ieUTot7Ds07HW1q+NEWYRe52keRttnjqpT39tglZLj9+JPM5wI3Yu579/2oFAFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hiinDJhk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AEB640AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758491798; bh=Y8yVgxKjQHj5EERyq5tPeJ6Cwh7VvXI9VdhRG9pAbwA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hiinDJhkHWE4iEzOdq6rQ07cYgrl+gmsP3ByNjEkko6ILX2MviNKTjp+BiBV3oY9V
	 LIPTFPRFcIZu/JhWeGnVBQkdY5wS1Bxz89UEK7fo0q+Dz0ZJeIbanpKkKYgOJPZ2nR
	 +zLqWfZtAlY2dNTc/6MW+/PQ+O1A7XR/68OxKHfT874afEDq+0c7WwkHsyfXwKOUwv
	 zARYh7axvorOPdt8xNsuFLiSO8iCXAxxwijkjRZL2p5rWS2KAEtj970FSjqEsCj3bp
	 2EcbXTUsSFlqLg8+zwyTDcNeG8qmiwXs9Sd/STJwfkXoAYSLVCD/fl+kgKDbr1FYYW
	 AzyjCMHTk55+g==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::824])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AEB640AF9;
	Sun, 21 Sep 2025 21:56:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
In-Reply-To: <20250921234301.0110130d@foz.lan>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
 <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
 <87ldm7c382.fsf@trenco.lwn.net>
 <e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
 <87cy7jbo7f.fsf@trenco.lwn.net> <20250921223250.7af92f98@foz.lan>
 <87qzvza62n.fsf@trenco.lwn.net> <20250921234301.0110130d@foz.lan>
Date: Sun, 21 Sep 2025 15:56:37 -0600
Message-ID: <87bjn3a2qy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

>> I have no idea why
>> they felt the need to employ it for Sphinx, but they did, so we need to
>> work with that kind of configuration.  Meaning, really, I think we have
>> to just invoke sphinx-build directly rather than trying to control which
>> version of Python it may ultimately get.
>
> True, but if we ignore PYTHON3 env completely, this will break on
> other setups where sphinx is installed with a different python version
> (with includes OpenSUSE non-thumbleweed).

How do those setups work prior to your changes?  We didn't have to do
that dance before, right?  What makes it necessary now?

Thanks,

jon

