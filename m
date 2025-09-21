Return-Path: <linux-next+bounces-8402-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E6B8E415
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 21:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70D9189942B
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 19:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892FC23AB90;
	Sun, 21 Sep 2025 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qbMp0ing"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B7175D53;
	Sun, 21 Sep 2025 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758482872; cv=none; b=f3PaXVisAOH2qCpomn3wc1/p5XiOdCy1Gbb1BBFBZlNf1BsWTBqvi+ahVliYpy1GWKDmzhV1k4SjVzl0o1CkVLaLyF3kfvN4v0pOAmiUoyU6lmFdaGFOynbFJdVdh0AeVsZcNFd3ooJGo85j8/eEgov6ck2tfHKiiOHHL7bAMCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758482872; c=relaxed/simple;
	bh=9et15zWXEKddFX4/2vN+y8RP9sXgR9Pu1s1DLQyqFoA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dWCeerKrYPjzL/kAIo1FMNTto4C+1JAnUBMo2EK4vWgW2uvQ1d9sYr6jjtwCuOLXN6q9EE51Y3lsVY3/sCX7dgaq7q4yC0HZBYisgkfFL9boh6D2wwys0ba3uasNvREjuxyo5RUn+R9W9jqOdMLa0PCRpX2gE6pvLnnX3TZIzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qbMp0ing; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9421740AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758482869; bh=Fbdh/N5NdiPt247VOYhUeQYHOoMRcIbSDzdgEBAWNe4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qbMp0ingnT+F8mlleUbCrkOmpF9yrkfoTy42832f2hsi+xRp9vgtwfRhvYt86P+Xd
	 4FXW3FBKJYKDeOE9sD812tIx/wP7rbvG8hM7VcG6wkNPfnLpYUva6y6VlMztbzP1XV
	 Eg3vFID+iBe8L+2OaqVFHQMyYtciR0vLAUqXzVm4f+dn0SYJYo1ae2qpp8x+QFegFS
	 YB9ttoF5pDoiVQw8PADwA0wel8cgbLhxfrFBZM7yp52hpzSIRzrDwYnpjJ96vqPSuU
	 vkuH1GN78oWhJGu2QmIopjXdaVjhOqnvnlJ8rqd1iowdqUo1JUscrtzydJzBwenlDS
	 smvWM/GnDvp1Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9421740AF9;
	Sun, 21 Sep 2025 19:27:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
In-Reply-To: <e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
 <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
 <87ldm7c382.fsf@trenco.lwn.net>
 <e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
Date: Sun, 21 Sep 2025 13:27:48 -0600
Message-ID: <87cy7jbo7f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> lrwxrwxrwx 1 root root 4 Sep 11 01:42 /usr/bin/sphinx-build -> alts*
>
> $ file  /usr/bin/alts
> /usr/bin/alts: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 4.3.0, BuildID[sha1]=17681640c9985eb36ae6d9eca0f08159509386c4, stripped

That is clearly the problem, when combined with this code in
sphinx-build-wrapper:

>             if self.venv:
>                 cmd = ["python"]
>             else:
>                 cmd = [sys.executable,]
> 
>             cmd += [sphinx_build]

Mauro, what is the reason for explicitly interposing the interpreter
there rather than just invoking the sphinx-build binary directly?  It
seems like we could take that out and make this problem go away?

Thanks,

jon

