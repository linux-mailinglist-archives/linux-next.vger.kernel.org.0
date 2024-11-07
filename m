Return-Path: <linux-next+bounces-4691-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8919C109A
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 22:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C01F1C22741
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 21:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0B3219CBB;
	Thu,  7 Nov 2024 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="G1vcEhfD";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="G1vcEhfD"
X-Original-To: linux-next@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA82219CBA;
	Thu,  7 Nov 2024 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731013229; cv=none; b=qvgkz5Qve+XaMbcvYbdaDRKD2F0d3tjQ76RGJ5IgUBmW/mqZWuc2wQ5pA6twv65q59T0Sd8VO87Z+mDCDlXH9SDjvEKs1GVBdlAVYsLo7itvnhO4v0WIXzpwiEJYWb7VQzU+IT6fsSLLrJKh2VpqnHUdHHwtArCTOB657eyzuaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731013229; c=relaxed/simple;
	bh=79k+aX0p8z0mGwxAgCU9izteZfEBeNkpAy0qyfkgnTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nFjr8tNQvmjNSLwPfDtK9jZVtRwZQikg3ySidERMauwE0o+1Uh4AM+t2ZZFxspj8AYyCecOYTCQG11tIXW3qX3a9kHukr69daOpV8bkYRIBtzfKuSYebSTfaKSPPEKDjp0yVKhr0/AxJjLygU1jZsXfLuZ3SoaGSSuaK75g1dWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=G1vcEhfD; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=G1vcEhfD; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1731013226;
	bh=79k+aX0p8z0mGwxAgCU9izteZfEBeNkpAy0qyfkgnTA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=G1vcEhfDhrIfG7m7E1ap+SJ+vPAND71JQ0Nfu/M8lxkwBKb9TKr5o6Wha6qKiVsQj
	 HvysjhZzW8h+FYNINI3kbbzXO8orKS7Dy98pi95ge86h0Ba2DvkkqYQFZkMhQcxNW7
	 UXQng9hQ3lLpc5MiwE2/tb1jn8UziXxeqz5BxR1g=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 914B61286D3E;
	Thu, 07 Nov 2024 16:00:26 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id JpYJ0mJYC36e; Thu,  7 Nov 2024 16:00:26 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1731013226;
	bh=79k+aX0p8z0mGwxAgCU9izteZfEBeNkpAy0qyfkgnTA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=G1vcEhfDhrIfG7m7E1ap+SJ+vPAND71JQ0Nfu/M8lxkwBKb9TKr5o6Wha6qKiVsQj
	 HvysjhZzW8h+FYNINI3kbbzXO8orKS7Dy98pi95ge86h0Ba2DvkkqYQFZkMhQcxNW7
	 UXQng9hQ3lLpc5MiwE2/tb1jn8UziXxeqz5BxR1g=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EFE581286D38;
	Thu, 07 Nov 2024 16:00:25 -0500 (EST)
Message-ID: <75eb024e36162cc3a1007ff6b4ca4a3d8d0caa02.camel@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Stephen Rothwell
	 <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
	Mailing List <linux-next@vger.kernel.org>
Date: Thu, 07 Nov 2024 16:00:24 -0500
In-Reply-To: <yq1r07mye85.fsf@ca-mkp.ca.oracle.com>
References: <20241107212954.4da462cf@canb.auug.org.au>
	 <yq1r07mye85.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2024-11-07 at 15:47 -0500, Martin K. Petersen wrote:
> 
> Hi Stephen!
> 
> > After merging the scsi-mkp tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/ufs/core/ufs-mcq.c: In function 'ufshcd_mcq_sq_cleanup':
> > drivers/ufs/core/ufs-mcq.c:580:9: error: 'rtc' undeclared (first
> > use in this function)
> >   580 |         rtc = FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg));
> >       |         ^~~
> > drivers/ufs/core/ufs-mcq.c:580:9: note: each undeclared identifier
> > is reported only once for each function it appears in
> 
> Hrm, I believe I already addressed this conflict in the SCSI tree.
> 
> Maybe James' repo has stale bits?

No, my tree builds ... or at least the ufs-mcq.c part of it (I checked
after I got the merge conflict ... although only with the default
configuration).  I'm still worried about the resolution I flagged on
the list, though.

Regards,

James


