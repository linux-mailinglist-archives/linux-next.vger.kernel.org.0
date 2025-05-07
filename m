Return-Path: <linux-next+bounces-6564-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C602DAAD552
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 07:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A2554E673F
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 05:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00A81E231F;
	Wed,  7 May 2025 05:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="BHfPGJrK"
X-Original-To: linux-next@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF3199237;
	Wed,  7 May 2025 05:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596274; cv=none; b=WGFceekX4VL7QXbHFky5w59U5cxQ9qReA2SSFOECtIHWqwsyxaFbl+10xh616sBVZvMObV69mASG3RahkEGOjrC6oaVxo5mfmw7nIsWUl76jRVmJR9I58xNOkqOqvPrhXLDCBWEGbTBC0fgwtNT5PVUq4whRHoGaM0rUAw+VQnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596274; c=relaxed/simple;
	bh=epUotceriFayl2KRwR/6cGHPh/IbcUINvT74zVjiTdc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JohLLlABCi/1OOlYFqE5JF1+HbdjwERt2BETk1X0AsquognhAvOrJJIrzkyYaj3ZbAPh3XVdwA7HVYuZntRlNOSTZ9fgNs0hb1eOB1nvcBOjyK7jpEcoZ9xx/bxnQkw+OrOBFIlCGIbjZXowr+Pbv2qdbLeTONG3llFESAIXioQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=BHfPGJrK; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bTMBnDXFwFEWdde4XzBcc7TO6vn/umtsjshEGsk3wys=;
	t=1746596273; x=1747805873; b=BHfPGJrKHhYp+mteWbKXS7BCZNmtxLDDLnAvZ7T5jgDybJS
	3s5q+WdSIU10WfN1QHweHOoP9QYFdbZS1PgN0cuqhUzIYcpKDeqG0Cw0WFdSVzHJylfuDDhoGKCAO
	Q/d6tQANQCTeY0SJXg9adNGewUu25piZkO0rYpSo5Z3vscFzoBozLp+Bhd3A89aPlgdFYne/q1Yb+
	YUkgsEzkORKItRlJhHAIKxFR3MAANK4WEQ8Xl3C0Xj10LE1jv89eqLdMLNMQCF5LvbFnUiI0Q1Qok
	t7w3C3rFmYP8HldhGPFBiLR+2HqJkRhwl9Gg1y82EEKNGD7uoTLmnqYmvgutxIYA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uCXTX-00000007Kp5-0eiw;
	Wed, 07 May 2025 07:37:47 +0200
Message-ID: <3d5761da40d0ddf4109d10d6f3c3d2538c4d89d4.camel@sipsolutions.net>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with Linus'
 tree
From: Johannes Berg <johannes@sipsolutions.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Wed, 07 May 2025 07:37:46 +0200
In-Reply-To: <20250507111026.4700e392@canb.auug.org.au>
References: <20250506114402.2f440664@canb.auug.org.au>
		<f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
	 <20250507111026.4700e392@canb.auug.org.au>
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

Thanks!

> So, at your suggestion, I just used the latter versions of these files,
> but I then got the following build failure:

Ouch, sorry about that. That sounds like it's due to the duplicate
commits you had pointed out, which Miri dropped from iwlwifi-next now.

On the plus side, I'm going to be the one who has to resolve these
conflicts (soon) :)

> So, today I have merged the iwlwifi-next tree from next-20250505 (which
> was effectively empty).  You may want to try merging the iwlwifi tree
> into the iwlwifi-next tree and resolve any conflicts yourself (now that
> the iwlwifi tree has been merged into Linus' tree).

Not sure what you mean by "iwlwifi tree", I think iwlwifi-next/fixes was
empty, so perhaps you meant "wireless tree" instead?

But yeah, I know what all the code is and what's going on, though
evidently less than I thought after the recent updates.

johannes

