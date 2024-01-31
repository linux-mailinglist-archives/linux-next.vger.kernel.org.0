Return-Path: <linux-next+bounces-932-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E6844A5C
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 22:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A58951F21B45
	for <lists+linux-next@lfdr.de>; Wed, 31 Jan 2024 21:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B237E39AC7;
	Wed, 31 Jan 2024 21:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGjgx3Gz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5DB39AD7
	for <linux-next@vger.kernel.org>; Wed, 31 Jan 2024 21:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706737753; cv=none; b=udIadjnmes8S8b9oIQ2KyrC3P2iCn5CyegpCwIdRhMO/k9P9skEg+ljbIIIH61ZsHbiZYLCB2u9UxAnCt7zQsFISyHme1M1ZUpK33aA8GfkekgyWGWM1Ba2dlHZ4jomawruPNMhPQmUfg8RZP+HoYZOqo6jtWatXWAcDjUplSfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706737753; c=relaxed/simple;
	bh=Rkx3SI++5WgBpXN1FZD0sNTrJ1XmYsk0llRCozkGgK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9HprE5z98/T2ztihef1xzZeBCTVyAp6doyPqSFZlgKqnpBRpDuK+9VIKTlys1CzxYC8Be9W48dpyO0kmSskICJCE8IWyI445mTmhu5b1gY0WS3phRFR99xQZUNuWeXjWm5g+x7fdbS+vkN1k73CvMJ9br5NhUYuwNKvG/onbDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGjgx3Gz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD8CC433C7;
	Wed, 31 Jan 2024 21:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706737753;
	bh=Rkx3SI++5WgBpXN1FZD0sNTrJ1XmYsk0llRCozkGgK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGjgx3GzyOy8iXpo3o/aCowbrgOXwdnr9p/Mhx8ZEKbh0HRZCQkQNjLY26dBN1xRq
	 KoazCpN9AeqlcitG/A3DTeTdnLzJ1WthH3UgRtkrVT/ERZAXZ6aOZ5CkOug8zZiFkM
	 kbzA6BQLtqXr947Psfap9mWM3Wc4zDgdcxUbAJ1MD46ItVjcU7KoYv2c+4H4micL4k
	 Tb00wXbjXEFLm6r6gvwGXNxoqkFqIO0bLU97yUc0FBSfDMpSXtu0KWBo3H7gMMal/e
	 9z/TckVh4zvYZMqhj+YiYxe/sfnLR1De3wQ/jLcQvrye64gukt/o3GBxIco9e2LGMH
	 d9Jtz/bC4Y+ug==
Date: Wed, 31 Jan 2024 22:49:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <nmrjm4edxqh4e7bzmktjbpmz5al4wv47aew52f2dwzh4pgbeip@n4bddtmsb6pb>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240128142804.21d49045@canb.auug.org.au>
 <xewyobkwecyhluztyrpwzhnuv3f25eq56iwkh3obfzxgqghe7p@2agb275csehd>
 <20240201075605.5db74042@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201075605.5db74042@canb.auug.org.au>

Hi Stephen,

On Thu, Feb 01, 2024 at 07:56:05AM +1100, Stephen Rothwell wrote:
> Hi Andi,
> 
> On Tue, 30 Jan 2024 13:35:35 +0100 Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Thanks! I have renamed them in my repo as i2c-host and
> > i2c-host-fixes to be aligned with your naming. I'll keep both
> > naming for a while until you decide to update.
> 
> I have updated my end.

Thanks!

Andi

