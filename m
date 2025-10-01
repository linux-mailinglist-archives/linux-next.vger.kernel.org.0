Return-Path: <linux-next+bounces-8530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98277BB0614
	for <lists+linux-next@lfdr.de>; Wed, 01 Oct 2025 14:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4BE97B0F6A
	for <lists+linux-next@lfdr.de>; Wed,  1 Oct 2025 12:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FBE2EBDD0;
	Wed,  1 Oct 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBewT8F2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584F1547F2;
	Wed,  1 Oct 2025 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759323032; cv=none; b=gS8PbBZISKI4BjA2ttUIifJkuK4gvo4VisyiTXjjjS7eaDY+PVJ7slHEhn7Itb0vYx86Cu1sfBHyaPy6m8lU6ZCjkFig4oAUg/I05g7cSECRg7wm/a5xIC3YHxh5Li/dytxh0EyA9nCJ8oQM5R2ppVvObR0YlPwSme/EDsrl538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759323032; c=relaxed/simple;
	bh=uHq8wYDUhs4uc88I55ik1um76kTHQDHbX/YMjgz3fX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt0aB0bieEIfDtep7UOw9L9ESzmNlRuN+l5ObmN83Ohej9gPK9JflzsK39j8vneIhyahYxPs1Wdyqi3U/YnwKUmNu5aSPvJuMm3aIzrWX9lrRzhQDuABhNJYhFnxBYdtZIgMnrV5KkzZJSgpkr8jdHEQVhmEuD9z12hjx+JodIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBewT8F2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30850C4CEF4;
	Wed,  1 Oct 2025 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759323032;
	bh=uHq8wYDUhs4uc88I55ik1um76kTHQDHbX/YMjgz3fX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBewT8F2lnM4XtQyAV5NvgtiDLxcjTHbj8o6Er2yKDj0md1iKW3npsGVq3QnDX0Ek
	 GfxhNwG8ygfjlTKazugwymkOi9Jhz0ZA4FN3BFtiGuSPaDb2IkG7VWtM9kq4EFd99I
	 pVQXgpUtvmgyfaPSO0xZKt9h/z+yIvwXhOY1Nl7p46Ly/UpnnQAUVO3MD2EzHCNXTf
	 QlPuDMESYAe/E4zOwfDAw0Jy1RD4py+RfMqOS+OecQdC5abp4eNk9FZ1uWPSF+1Y4q
	 4W9J/XwnFLKlxdr8nXer8MfuSqbFa+d1qalm3H3ltblDbPqo71PdoNmoUaFA+2PTmE
	 WnPUV6iwOi31A==
Date: Wed, 1 Oct 2025 13:50:28 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20251001125028.GS8757@google.com>
References: <aMqxWGx0asGTWZ2V@sirena.org.uk>
 <20251001095108.GO8757@google.com>
 <aN0CkwO7vxzpp30I@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN0CkwO7vxzpp30I@finisterre.sirena.org.uk>

On Wed, 01 Oct 2025, Mark Brown wrote:

> On Wed, Oct 01, 2025 at 10:51:08AM +0100, Lee Jones wrote:
> > On Wed, 17 Sep 2025, Mark Brown wrote:
> 
> > > After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> 
> > > Caused by commit
> 
> > >    df6a44003953f ("mfd: stmpe: Allow building as module")
> 
> > > which needs commit
> 
> > >    03db20aaa3ba3 ("gpio: stmpe: Allow to compile as a module")
> 
> > > from the gpio tree.  I have used the version from yesterday instead.
> 
> > Isn't the later already in -next?
> 
> Your tree gets merged first so we get a build failure when your tree is
> merged, it would get sorted out eventually when the gpio trees are added
> but all the intermediate builds are broken.

Interesting.

I thought the point of -next was to test everything integrated.

Thanks for the heads-up though.  I'll wait until this has been merged
before sending out my own PR to Linus.

-- 
Lee Jones [李琼斯]

