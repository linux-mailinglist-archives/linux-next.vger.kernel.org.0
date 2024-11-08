Return-Path: <linux-next+bounces-4696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D251D9C135E
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 01:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 102DD1C21A85
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 00:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA455610D;
	Fri,  8 Nov 2024 00:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="YtT1ZH+r";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="WA1rXCkO"
X-Original-To: linux-next@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE61C36;
	Fri,  8 Nov 2024 00:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731027390; cv=none; b=hiGBFDA69jltqcoSY8Cx/YzVLrtbjtpfCaYDYwfPgCgYohn3XWubAExlkp94tyG0SKrEWtwWSql4eMRnGdN8dmPX1sJIXVY1B+mItxfEtsnt+SXlb9tWLdmKw0HmCEcBPSF+bHkxAYlH14Or051I1e0e9pD9K/Yktyz2SrAH9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731027390; c=relaxed/simple;
	bh=ypJveB/zzCk8lIMnicpPadK/Z2mjgdeaAKWk8bvBgZQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CwEpl9aMF+5kaRRebsntxgnB+dNlo0vdqz7G8zkmTRSjSGaRZbRdmN/XPJsI9V5LDJId8dNl3uNuRHerXZooRxnVr6nRk3ILyjFHKf09N2j1xMljitGKbBzUUW8WwGn0W5q/xx5QFrf83cepajvNBRxlxTMwgLd1rKaMWsDGrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=YtT1ZH+r; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=WA1rXCkO; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1731027388;
	bh=ypJveB/zzCk8lIMnicpPadK/Z2mjgdeaAKWk8bvBgZQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=YtT1ZH+rSt9x8dWKw3nrehmaxPhvTBKQS4uF5kSSD5/Z3HjhFzqs2USnNVG3W+/IF
	 VbNRsYmhvbixWc8YzcT6e3+i76SjQHXc1orlvZfQBFA8Nf6vR69kwdSmWG/neREArX
	 8nsk/FB3Pg67YvEa1CfQbFtmwN5/xygQ7DKhL7RI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2BDFE1286888;
	Thu, 07 Nov 2024 19:56:28 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id iuge9mXjQ0Ss; Thu,  7 Nov 2024 19:56:28 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1731027387;
	bh=ypJveB/zzCk8lIMnicpPadK/Z2mjgdeaAKWk8bvBgZQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=WA1rXCkOl62sJj5yI7azLYoN3ZTYm6qthef5L+DbpK3Z1kq4z1s6XIRI5Sz15rXwm
	 0Ty+VM9cYo24K36zVR79rLSdFvBv+udpPx9wB6FPE+T39JXcIpJl/EXkMAYYi+TF23
	 3qcbxO4Zal8+w9adELYU5ttGuMTLpg/kaiOwlTEM=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 90669128182B;
	Thu, 07 Nov 2024 19:56:27 -0500 (EST)
Message-ID: <c59b1a708980de24e94cd5f8d43799338d3235ec.camel@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Thu, 07 Nov 2024 19:56:25 -0500
In-Reply-To: <yq1fro2ycyp.fsf@ca-mkp.ca.oracle.com>
References: <20241107212954.4da462cf@canb.auug.org.au>
	 <yq1r07mye85.fsf@ca-mkp.ca.oracle.com>
	 <75eb024e36162cc3a1007ff6b4ca4a3d8d0caa02.camel@HansenPartnership.com>
	 <yq1fro2ycyp.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2024-11-07 at 16:31 -0500, Martin K. Petersen wrote:
> 
> James,
> 
> > No, my tree builds ... or at least the ufs-mcq.c part of it (I
> > checked
> > after I got the merge conflict ... although only with the default
> > configuration).
> 
> I am not questioning that your tree builds. But your for-next branch
> contains UFS code not present in the SCSI tree, effectively reverting
> my conflict resolution.

OK, I figured it out.  We both did the conflict resolution for "scsi:
ufs: core: Fix another deadlock during RTC update" slightly
differently.  I kept the rtc variable introduced in that commit and you
removed it leading to the conflict.  Since it's only in a print, I
don't think it matters, so I followed your resolution.

James




