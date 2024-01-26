Return-Path: <linux-next+bounces-867-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6683D49D
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 09:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C458A284381
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 08:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3943420B35;
	Fri, 26 Jan 2024 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUkzPvW5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E6020B20
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706252044; cv=none; b=VyW1baF/d9ZSJJUhV+0BqdfQntv4y/nQPhukRCgmP0QJUz+dw9ztbuvA/EHHFli37+V/PUF1tNjt4ugtIK5BMQHviPoxltmdZytKgc09i4VsGVK6d1AT/q7QR0cNw6rQPtLWfbxlGd59zDokyapHOn/UolB4gCiA+c5bkPM5m/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706252044; c=relaxed/simple;
	bh=cK4DrdPn+eMOFdhZS1WsIk3GAsN1Yd0ZH5aqaUS8VOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drChg/ziETuyuD/ndIB06YPN9NjVJi8OHfRvti6JfO/wtra7i8FacBvMyrpITQgicNY1HFjq8oWuCLthMjIm36m1LA1GRt3WXNVrwdtMhn8Ca2mNc6rJ/ilqpm5wWztvWKxJUfbIts+umULWM7BuwG7lQv1YSLJ1pO9v64vmphk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUkzPvW5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE408C433C7;
	Fri, 26 Jan 2024 06:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706252043;
	bh=cK4DrdPn+eMOFdhZS1WsIk3GAsN1Yd0ZH5aqaUS8VOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUkzPvW5/AdqF1K1UJNnDExxgRR0eHviuvxht4es9LHhp1wjQ9wDkF6QF2PqnZI3F
	 b1R5WLVovhFXKQx1qV9dgZsnfw/Ak5sg0o7h9c+XuRDXQaWrAg4LSYyH+aH4DSo8sw
	 2areQN7kENELI1jWnAqq2ilxs+C1JphFbFJHWdCFmyirfVcHY8Z/pm2agF1LXEMriS
	 bPyP48CR5S/D6qAYSE5U1h5RvSaaEQ7GNA40HgcWETkOkbUVZx852Q2yDqnMUBEzda
	 T8ujP7HyZYbHIA1tIIKOInzzb44k/BRFlj6RWlZm055J39fxA3peKckmIytqhXzvoF
	 LmIYsTPWKvAJA==
Date: Fri, 26 Jan 2024 07:53:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@kernel.org>, linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126115011.55da6838@canb.auug.org.au>

Hi Stephen,

> > could you please include in the linux-next i2c related branches
> > from my repository:
> > 
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git
> > 
> > the following branches:
> > 
> > for next:       i2c/for-next
> > fixes:          i2c/for-current
> > 
> > I have requested this branch to be the main repository for
> > collecting i2c host patches[*].
> > 
> > Thank you,
> > Andi
> > 
> > [*] https://lore.kernel.org/all/20240124225031.3152667-1-andi.shyti@kernel.org/
> 
> OK, I currently have an i2c tree from Wolfram who is listed as the
> maintainer, so I need to hear from him (and do you meant to replace his
> tree, or add another one?). 

Yes, I'm going to replace Wolfram's tree. We've been agreeing
together on this change.

> Also, above you list a git tree from
> kernel.googlesource.com, but in the patch above, you use
> git.kernel.org.  The latter is preferred.  And currently, they do *not*
> have the same i2c/for-next and i2c/for-current head commits.

Oh! You are right! I have done a lazy replacement
/wsa/andi\.shyti/. Will update with the correct git.kernel.org
repository.

Thanks,
Andi

