Return-Path: <linux-next+bounces-6764-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C17A7AB6356
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 08:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0714E3B373C
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 06:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018E01FECAF;
	Wed, 14 May 2025 06:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="mZS/91Ua"
X-Original-To: linux-next@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451BCC2F2;
	Wed, 14 May 2025 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204902; cv=none; b=KiciNAnZpuoTm8fTFh/aTKmgu0xIRUvvXIIYJC+be9MAJVU6Eqew0ZgSgvKS+f31RK3cvImfApAxn6fUf8ELePQH1NZhL2W3/ae0+vJ9MRefrnd8GFZmTE8+IdkSeZ5Tu0C38JFoDUGwkmVs4kXSNNTeF44ElxFYbNVBx/9vmyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204902; c=relaxed/simple;
	bh=pXpGTTsBM5hN6UrpUhonUG+zxf3mvGi7XQK2dwi2KE4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JfhftNJmAc6nzwW7TfE/clVbKNf4wpCSwD1hHs/zVbpk18CddEmwL53PZqBGCGqIuwhBpKsHgAJ12Ijut5bLZsmhMjfbOhOecw7Q+/liF+ck6Qe5DDEszWEvleBLRvbFFnEpaLk35Mi9cr2O3g3FIjlLvLD7myQfXIFcpenjrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=mZS/91Ua; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=WpBd/LWCyMZR8JEkg8orJSH16WPBwgpXbBt/9i1YTMQ=;
	t=1747204901; x=1748414501; b=mZS/91Uatkw5oIjjd7ITwfy98Svh937VyGeP9acovRCnX53
	P5UT0kDOzk69YiMRmLaPcgEAiutpo2zrjP/cuamgv+JgUFF1eGPiJp36jmpHJWOvP/5/cwzJ6uyoR
	Fookh7iJG5hGISgZzxAlakyQetB5jMNLZqyShfAQhFg9PFR39ndCncfpWH2x0zZOcCrwTR5MRUdwT
	fbapaT/jjB/ucxEdk1uCZWnO8jAH2wAldzx5HWnXMM7PFl78/aoPxNgjcJjo7FD2yByROqEu5m6Cm
	6svBAbiRmkLrgoANZKG0d/i2JgKhCOr4KePdlGzX3mt2WSzJeAxkl/XchtqlugDw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uF5o8-00000007V8p-3r6F;
	Wed, 14 May 2025 08:41:37 +0200
Message-ID: <958ec4672d9263d23b1f47d8acd1047037e7ff25.camel@sipsolutions.net>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with Linus'
 tree
From: Johannes Berg <johannes@sipsolutions.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Wed, 14 May 2025 08:41:35 +0200
In-Reply-To: <20250514125524.1528467f@canb.auug.org.au>
References: <20250506114402.2f440664@canb.auug.org.au>
		<f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
		<20250507111026.4700e392@canb.auug.org.au>
		<3d5761da40d0ddf4109d10d6f3c3d2538c4d89d4.camel@sipsolutions.net>
		<20250508132459.04bd8e70@canb.auug.org.au>
		<20250514124131.15d0117f@canb.auug.org.au>
	 <20250514125524.1528467f@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi Stephen,

> > I keep getting more conflicts in the above files (each time one of them
> > get modified in the iwlwifi-next tree.  Could you please merge commit
> >=20
> >  ebedf8b7f05b ("wifi: iwlwifi: add support for Killer on MTL")
> >=20
> > or the current net tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git#main)
> > into the iwlwifi-next tree and fix up the conflicts.  I believe that
> > will clean up all the conflicts - that are really just between bug
> > fixes for iwlwifi and the new development).
>=20
> Or, of course, I assume the iwlwifi-next tree will be merged into the
> net-next tree at some point soon ...
>=20

Yes, should be really soon now, though into wireless-next. But that's
up-to-date with net, so would resolve all of these issues. In fact that
was the plan all along, it's just been taking a bit longer than
expected, sorry about that.

johannes

