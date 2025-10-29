Return-Path: <linux-next+bounces-8754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD66C1D945
	for <lists+linux-next@lfdr.de>; Wed, 29 Oct 2025 23:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B8404E169A
	for <lists+linux-next@lfdr.de>; Wed, 29 Oct 2025 22:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9792B29B216;
	Wed, 29 Oct 2025 22:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="V4INLZaB"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A8B2DC32E;
	Wed, 29 Oct 2025 22:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761776582; cv=none; b=j5nyZLm3vleCkrFnlTXt2cGzCnqWU/XD7f6FwEeSTtf2sbEA6I4KbfpnKWDDTc+SXpBYu4QAhUw1+z82BxgY98FkGIN/OVwZeFXA4gxIlcxWiPszwSYFEsTteAHN90/INAPKzSwB/ejJkLsmIlT1E5HpjUeImK1TGNXVSRkzEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761776582; c=relaxed/simple;
	bh=/JJ4eWhU2NJtysIL6pvhPHf/EaOJKo1ecN2UGEuYUF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bfnFh/f+uWhR3ZQ5DkmoeLq3oyEMR7w7EXCmRzuIucAA70H63fWpyu+pSTz+P+QDHoC0Yieo4ypjItUjo18UaopnwXAgMTgXywI0ZxDhHrkUUyYlv4l+vJLSMceepwgB6rH6wakXN2BEZisHeQNT6vyPLYMBJ9dBFkkBcHtpfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=V4INLZaB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D147A40AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1761776574; bh=HvWY8jWznZyhCYX572LrF/H6qVaifHtnmvXlLo5QC6I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V4INLZaBkGdxmwR4wMmyYAn3wEFzK/gG4lEyhXfIGpzaa/zireEy4R+fBdkk54iJv
	 qn9VDfJb4jFzZskcKbGentpeMif8YD8l5G3CQUPtg3k9JMYwmfP/uEt+ECoTHZACN8
	 ndgUPJDpsJuTrVMlns3qPObGhgcu/iGUX7FJtkLCKgZNENRfpPqTDERF0q1sulGIeM
	 HQL3dgqKTDI2H9a2yiEWzkZB6iiNGurtSRwuWC5bn8ONeC5nP0T3dEZ7DVL2F+s7WF
	 OKV7hRDMyPjkulF+369HzZrMHLyCoiE48Z9WuCkAT5lUW+4wg/1UbRnO6CVHXcxP2j
	 Mw3i8dhk2f3NA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D147A40AED;
	Wed, 29 Oct 2025 22:22:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alex Shi <alexs@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs tree
In-Reply-To: <20251030085146.37ab6bd4@canb.auug.org.au>
References: <20251030085146.37ab6bd4@canb.auug.org.au>
Date: Wed, 29 Oct 2025 16:22:53 -0600
Message-ID: <87ecqlny9u.fsf@trenco.lwn.net>
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
> Commits
>
>   564f84128bd2 ("docs/zh_CN: Add translation of rust/testing.rst")
>   6d4a6d623098 ("docs/zh_CN: Add secrets coco Chinese translation")
>   344657696e9a ("docs/zh_CN: Add sd-parameters.rst translation")
>   989a716b1677 ("docs/zh_CN: Add link_power_management_policy.rst translation")
>   6c07193cb80f ("docs/zh_CN: Add scsi-parameters.rst translation")
>   cfd923323d14 ("docs/zh_CN: Add scsi_eh.rst translation")
>   da6572ec7105 ("docs/zh_CN: Add scsi_mid_low_api.rst translation")
>   16dfba1581b5 ("docs/zh_CN: Add scsi.rst translation")
>   9162cb790b42 ("docs/zh_CN: Add scsi/index.rst translation")
>   fe67964dd6e2 ("docs/zh_CN: Update Rust index translation and add reference label")
>   1e108599ebfe ("docs/zh_CN: Add security SCTP Chinese translation")
>   b12bb7728152 ("Docs/zh_CN: Translate timestamping.rst to Simplified Chinese")
>   4d926084ce6d ("docs/zh_CN: Add security lsm-development Chinese translation")
>   6d624576ca3f ("Docs/zh_CN: fix the format of proofreader")
>   25cf7924b579 ("Docs/zh_CN: align title underline for ubifs.rst")
>   e3f873992cc4 ("Docs/zh_CN: add fixed format for the header of gfs2-glocks.rst")
>   37b1e0d4ab11 ("docs/zh_CN: Add security ipe Chinese translation")
>   ab530c5fca9b ("Docs/zh_CN: Translate generic-hdlc.rst to Simplified Chinese")
>   d3e7609c6e5e ("Docs/zh_CN: Translate skbuff.rst to Simplified Chinese")
>   6d35e61606d0 ("Docs/zh_CN: Translate mptcp-sysctl.rst to Simplified Chinese")
>   0694113d49b5 ("Docs/zh_CN: Translate inotify.rst to Simplified Chinese")
>   f4121e639fd3 ("Docs/zh_CN: Translate dnotify.rst to Simplified Chinese")
>   250fc3d68a90 ("Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Chinese")
>   a502ffe48523 ("Docs/zh_CN: Translate gfs2-uevents.rst to Simplified Chinese")
>   46ea6a90b59d ("Docs/zh_CN: Translate gfs2.rst to Simplified Chinese")
>   e0bb4c3524df ("Docs/zh_CN: Translate ubifs-authentication.rst to Simplified Chinese")
>   fe460c3ec8b1 ("Docs/zh_CN: Translate ubifs.rst to Simplified Chinese")
>
> are missing a Signed-off-by from their committers.

Argh.  Thanks for the heads-up.

Alex, I have dropped the Chinese pull from docs-next ... needless to
say, you need to pay attention to details like this if I am to be able
to pull your tree.  Please fix these up, and we'll try again.

Thanks,

jon

