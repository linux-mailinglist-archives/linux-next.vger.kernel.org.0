Return-Path: <linux-next+bounces-3596-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D896C8F1
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 22:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67599281126
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 20:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36CF14D2A7;
	Wed,  4 Sep 2024 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB2JHrzz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24914A62A;
	Wed,  4 Sep 2024 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725482922; cv=none; b=UfnTeSuk5OT2h8Xk0MyuzJtn0+YOXUsMOePMf3GZt/qPeel1LYas61Di4r3cRWzwv6dNpvs6bPihfcORAmIMB810G5HpvDABt9A1Ll1aBT/ek/zFXIx1OaCpgbQlwR6tiGTm0wMEBIHRPFPIgbvJF7OYQbmIhtp2NMFiV7oOSbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725482922; c=relaxed/simple;
	bh=auWVEqFce+8X3QCOIsAmmjTPExsNK+VOLUhNFp/tZCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVNebyh3w7civF6uxJXlyaWsmDmJWsMRizsecsfGIzpGkzrITVIypQd6RQ1BnnjPy2EwvkDEfoCUikAZM2mW80WKHxn/LDGkXnXWzEFlGen8RwHM4QCzqnnBNRBislTLP2B76R9T770Q2eM6jcusa38lClSDaflGMLAVkUpv24Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB2JHrzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF42CC4CEC2;
	Wed,  4 Sep 2024 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725482922;
	bh=auWVEqFce+8X3QCOIsAmmjTPExsNK+VOLUhNFp/tZCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OB2JHrzzpQ646Wp3dLCxpWrGQ0xLuGsC69xfVtJn9D57Rz0J9u1pFfJP/FjFI0TjY
	 8SlDv2BUO1ua8daZRDzD8u2Ztn73zZ5Nvmuk9x6Ci4iWARQHKqvaqo9II9fXCwF0Ct
	 xzd8ILpTWayJoqgHndKWWx1k23sTQPnDzHOGaGFwA2+ly+FqZnm/cU69iCiqm31LzB
	 Lg/q6Ldr5IQiI5CkqaS5KppjjlT3++J3hvHOGqQIqdOhvQBZGLd40yVZsFgZyfCcjr
	 NNaWqWA32IOrzaoY2EBp7jmVQej2XLKayjX1cfJAm28IEwLrjZKqZ7iRZVPbKNb6LK
	 kPyqRiKfNxPyA==
Date: Wed, 4 Sep 2024 10:48:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the cgroup tree
Message-ID: <ZtjHqB32gzZGyZGd@slm.duckdns.org>
References: <20240902081125.4467945f@canb.auug.org.au>
 <c4c802fb-90d7-4971-9bb6-a37a3f799d59@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4c802fb-90d7-4971-9bb6-a37a3f799d59@redhat.com>

On Sun, Sep 01, 2024 at 08:52:13PM -0400, Waiman Long wrote:
> On 9/1/24 18:11, Stephen Rothwell wrote:
...
> Commit dd46bd00ab4c does exist in the cgroup tree, but it is missing Tejun's
> Signed-off. So it is probably in a dead branch. Commit 047b83097448 should

Hmm... I probably force pushed to fix up something?

> be the right hash for the for-6.12 branch. I don't know how I got the other
> commit hash though.
> 
> Tejun, could you update the commit hash in my patch?

Anyways, fixed up.

Thanks.

-- 
tejun

