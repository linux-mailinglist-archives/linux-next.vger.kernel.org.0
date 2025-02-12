Return-Path: <linux-next+bounces-5430-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE4A332CA
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 23:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD14016739E
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 22:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C57B204086;
	Wed, 12 Feb 2025 22:42:50 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F4202C38;
	Wed, 12 Feb 2025 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400169; cv=none; b=Kl6ZsNhcY72y1Nk8me5WGjWaGkVlT6+7S/I6lhNYHB6fh+mP2nmasX/mK7vsD+cpGbbUQ3ZFZDOPy6uFR5ESqY+A9NGXYyHWDiodk9U5jzY/P3ZcRQY2PSnLXEpX2AulL6nCwkulfCKIDa7GeAZniRCpepClOdruiB+xdJDB9tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400169; c=relaxed/simple;
	bh=UJRNSg0xOknt2QjDapDb+m51hZY83jePbaMI05sIB00=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qSvKFvUR8oZGG026JyyBJ7uLGSfeMvR4HQDnzk1fZKNeV3Mf2FxzjpoZFGo6GkVDVxwXNVTYtwTSmvBDwMeIEMoet7eCJzA+CNowEBiA4yWhmsLhEBsvF0jaHGCh1BZpy7jfWocYF9OaLWo1BJ/A8b9hkn7rY/ryBeWA+yjrOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A4D672E612C;
	Wed, 12 Feb 2025 23:42:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id TsfXs2ZccM_K; Wed, 12 Feb 2025 23:42:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EBC562E6143;
	Wed, 12 Feb 2025 23:42:38 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X0VATKV9FldJ; Wed, 12 Feb 2025 23:42:38 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D19C42E612C;
	Wed, 12 Feb 2025 23:42:38 +0100 (CET)
Date: Wed, 12 Feb 2025 23:42:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <2038149484.28376811.1739400158648.JavaMail.zimbra@nod.at>
In-Reply-To: <20250213092427.4f149099@canb.auug.org.au>
References: <20250213092427.4f149099@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the uml-fixes
 tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF135 (Linux)/8.8.12_GA_3809)
Thread-Topic: linux-next: Signed-off-by missing for commits in the uml-fixes tree
Thread-Index: huwBEsz2g38tcL/ysH97Lyk86Phb5w==

----- Urspr=C3=BCngliche Mail -----
> Von: "Stephen Rothwell" <sfr@canb.auug.org.au>
> Hi all,
>=20
> Commits
>=20
>  fb4cc5f19d36 ("um: convert irq_lock to raw spinlock")
>  4e9b8ce9f58f ("um: virtio_uml: use raw spinlock")
>  cafe54dc8e56 ("um: virt-pci: don't use kmalloc()")
>  acc4521e845b ("um: fix execve stub execution on old host OSs")
>  02fef369f75a ("um: properly align signal stack on x86_64")
>  cfaa0ff6e035 ("um: avoid copying FP state from init_task")
>  05c322fb75a4 ("um: add back support for FXSAVE registers")
>=20
> are missing a Signed-off-by from their committer.
>=20
> They appear to have all been rebased but not had SOB's for the new
> commiter added.

That was fast. :D

The branch was prepared by Johannes before the merge window and now
I have rebased it to v6.14-rc2.
So, I'll add my SOB too, ok?

Thanks,
//richard

