Return-Path: <linux-next+bounces-5062-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3402A02FD9
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 19:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559331885F05
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 18:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FBD1DF756;
	Mon,  6 Jan 2025 18:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDW7p7b/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694811DF740;
	Mon,  6 Jan 2025 18:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736188788; cv=none; b=icnIel6WioOQBESzX5lWJ/FuMYtgdVDiFTAC2arHTAP96Wd68f9z13KDm6W1SK1n0AWxLqV/NV/n+bxsZhwaNwgNuLjHL7FgqX9HbyoVXw3lRjrRcZIIJ+fFOUw0ZdxyPK7ewdRgHcEsAO6FCPPTPWfbis5Wa8p/FZmu9ubtmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736188788; c=relaxed/simple;
	bh=pDwJYnWqtFxci1lUkgSkH+dSLY9gifSzbC/2yA43U/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bWwB2AkiPswTRXrGCNdGH20YfKxPZfKUhUjX/EdP2T0joxR5LidWR5Qg2Orv0BJSepb9QxW0dx+G3QWWr4Bekhsigz/2FKiuijDemkMTr9H9uD6ltEAUGheDNfwIfdbjMCwXBiuQ+agie44/ubZuDYUly48IFjbOADlAZGGIq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDW7p7b/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89DEC4CED6;
	Mon,  6 Jan 2025 18:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736188787;
	bh=pDwJYnWqtFxci1lUkgSkH+dSLY9gifSzbC/2yA43U/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aDW7p7b/tAVDQC0G1J04V5Q8Z3IAoMeds9VQ9Dxm3ASAiBYTN+9iuLXDnXRqhFs/N
	 AaFE+jQ2UXG8sHpuNMpTCAPmA56uobHkUU0CpTMW/rmpMCHW+uZJJKonhdzVi6hk8/
	 +B3xlE83FWju0j6lYN4sreCTpS9ho3o9C/OhrGaesEDvHzFH0v+eHthuuK0RazD9Ex
	 +0SDuegwWzhu6K9lsK+U8Y/8sDg0F531Hf1eZKyAObLe1s45Q+Rtzyfmg4SmrSzaI0
	 3t72gAmg6NZIiiV98jiPFhz+fcCYPU4XaJy2LZphIXgAxXQi1ILkPA2sxnmhcfSo7K
	 mAeDv6W1/w6cA==
From: SeongJae Park <sj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	damon@lists.linux.dev
Subject: Re: linux-next: build warning after merge of the mm tree
Date: Mon,  6 Jan 2025 10:39:44 -0800
Message-Id: <20250106183944.103569-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106173733.5da765ac@canb.auug.org.au>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 6 Jan 2025 17:37:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/admin-guide/mm/damon/usage.rst:440: WARNING: undefined label: 'damos_stats'
> 
> Introduced by commit
> 
>   78d2a4747a44 ("Docs/admin-guide/mm/damon/usage: remove DAMON debugfs interface documentation")

Thank you for this nice report, Stephen!  The problem comes from the
translation documents because those references the removed sections of debugfs
interface documentation.  That is, I didn't take care of the translations for
the change, sorry.

Simply removing the references could be a quick and small fix that can be
melded into the document removal commit.  But I think the entire DAMON debugfs
section from the translations should also be removed.  Since it is not a tiny
change, I think it is better to be a separate patch that comes before the main
debugfs section removal.  This might make Andrew's work unnecessarily
complicated.  I will hence post the entire patch sereis as v2.


Thanks,
SJ

> 
> -- 
> Cheers,
> Stephen Rothwell
> 

