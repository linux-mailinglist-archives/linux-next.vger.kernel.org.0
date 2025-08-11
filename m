Return-Path: <linux-next+bounces-7886-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67751B202B5
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 11:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF3A17DF3F
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 09:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE53B2DD5E0;
	Mon, 11 Aug 2025 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="WoC74Z0A"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE852DE1E0
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903345; cv=none; b=CMHwSigVWHedsIHKv6YB6Uou7FFquUIMIlO/NxbS03ngWwBn1EllC+jiP0FvOkWCOVCYAlArIp3pJPb8wyxTLKI8+hzomPfNYf8SNPs9nSrRkTT3D3lFNeZ3UjHetRtVHHHhXocsFdz2UZMnn1XQfYdid/UY4pa/Tt8IdUzNY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903345; c=relaxed/simple;
	bh=coIfsvzaxszwpbh55uwWRaTV7jCJld2Dkslol0IVNwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KP+RQ4qlkfOsAnUCz5iI08lMjEb0TpU2KNKmIT3zJbuXrYn4VK0TeGj3npmb+F+favsgkZpSO8Na/yK4auAITNkyr1ndfR4ZTd3T4wsVSRBWAzaom/aYVHGNtyJPgoljFagHMvOKfbrsthZskGPCi6GgO3bAFvYI33Le0pOsr0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=WoC74Z0A; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c0pj62jwWz9t2V;
	Mon, 11 Aug 2025 11:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754903338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tH1hpIMu3ktWLNOXWlau3JPmcpfEHZwfM1ioDAqpgb4=;
	b=WoC74Z0A3Fa/+KeAiSZMTPb3357soBYCKpKgWuWX41oct7VVPzSHkhDu0UGsKDlO4fAoN+
	+JsTaRdBd2mBNUMyMi2kfb13ox1fftRD3JrdHGUjNE02FkOxBRL3qOJCntY2SgSrTD68et
	/7BLu36NPSbpdXH/K+0W13zlMLeIq1n6sKpAovwD/XGwPsgKIOm9Yrn+RiU9f1pfTlVQLv
	V2AnnKUSeuR+pp74vcb+A9jHJcasMLNgEMAXoc+etcH2yITR7rc+MA13zgBxGO+CTV/83f
	9fEeOKibtEpzCgR4R9Q+buE0DLicHvoP3np5OPJ3okprtQkORAKCAU7dpU3CKg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=listout@listout.xyz
Date: Mon, 11 Aug 2025 14:38:47 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	alexander.deucher@amd.com, airlied@redhat.com
Subject: Re: drm/radeon/r600_cs: Build failures with GCC 16
Message-ID: <e7hzkdghjyo73wdfcql6agfmjrgo3j2eb5nsoff5ix5246zhdw@hypc6t6uilbp>
References: <pqpvdwxmqler2mg4ou665v56g6qe36vwi5jeavqeszj2mrk5m7@io6dy7jsvuhe>
 <smpcrwsua5kwutn5ynzz4eiupocvw5c7b4tmk3xugynvmnr53d@zxyraythnybm>
 <9846b386-87c4-4f86-ae11-6361470cbce7@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9846b386-87c4-4f86-ae11-6361470cbce7@amd.com>
X-Rspamd-Queue-Id: 4c0pj62jwWz9t2V

On 11.08.2025 10:48, Christian König wrote:
...snip...
> 
> Looks valid to me. Potentially just copy&pasted from some older HW generation and not correctly adjusted for r600.
> 
> But the HW handled here is >15 years and the code easily >10 years old. I'm really wondering why gcc only complains now?
> 
> Regards,
> Christian.
> 
> > 
> > Would really appreciate some feedback.
> > (CC-ed Dave)
> > 
> 
That option -Werror=unused-but-set-variable= is new in GCC 16, maybe
that's why it was never caught before?

Would you like me to send a patch?
-- 
Regards,
listout

