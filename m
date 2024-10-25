Return-Path: <linux-next+bounces-4436-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11139AFD2C
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 10:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2CD31C22CF8
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 08:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E811D1E9C;
	Fri, 25 Oct 2024 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hg8pQSEJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C5156F30;
	Fri, 25 Oct 2024 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846311; cv=none; b=KO1FfxCqlDNVa/A7FV6RQDsMlkwnt88CZiFuFrUa5pnWfan3r7SsR3UA/g6+xJr63VTRsrWviLpjNaLxpCP4gG/qMrnzubFRo+hFMArDqyzBFq/pxZqdAujDvxppim3cb+MH0NAmh140jzMA0e8xS9iM5YWsInqbkHIM8bhkTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846311; c=relaxed/simple;
	bh=+I1Z0ZbwCy3mJpUOf2ihWxBa6X9VoHu5PfyQ96IQ/xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUz15J0c57Og2RqCQwCmvlo/cKmBoknNQTclmrTB6FfJ6nWchapxvYsAyH34dv1vtQFkKGZ4LjqA9M17Cl5EpwL1759VVpqI/22AFHGQsqEI3edIOdb4gzl3h86NgzNihyduvNAcZGQTU5soYXySe11aMoGdK2mO8bQXirOxIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hg8pQSEJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314EBC4CEC3;
	Fri, 25 Oct 2024 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729846310;
	bh=+I1Z0ZbwCy3mJpUOf2ihWxBa6X9VoHu5PfyQ96IQ/xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hg8pQSEJcfmkz2TtOJ06SNurTweJmKo8iLpvF2Qw+HNlswG1m708Wdej5uNOUxI9G
	 SfEXlh/Lq4EXoXKAY0cqmmqdvgFI+QrjHxz0qkHZrSTpUGK3TtQ2eoVA9kSmxfcyWr
	 LUUlPpAtUasaLOxrlVzjfQHU5xeVyARJzZyWnqtbswW0CI159tYEGe3RL72NoMfnIM
	 IZZDbJxugmgA/4z4ZC+L2QGb+PdgpUOgiUosWUcomPWCmTgZ3OOQUjwl0PRzCFf40G
	 F5/5TI1aiXxMNUHdtBVfSDvX7N/CFRv6ezIoF9Nll3Y1XfZTccxkk1v7nFSt74UeWp
	 0k+saF48uFudw==
Date: Fri, 25 Oct 2024 09:51:46 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the regulator tree
Message-ID: <20241025085146.GB10824@google.com>
References: <20241016135943.24e1fab0@canb.auug.org.au>
 <20241016075510.GL8348@google.com>
 <4bb56093-5358-4d3b-aba8-f8815d2347a6@sirena.org.uk>
 <20241016130924.GB1152434@google.com>
 <ef8697e9-9eb1-459f-8c5d-197019029fbc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef8697e9-9eb1-459f-8c5d-197019029fbc@sirena.org.uk>

On Tue, 22 Oct 2024, Mark Brown wrote:

> On Wed, Oct 16, 2024 at 02:09:24PM +0100, Lee Jones wrote:
> 
> > I said to apply the regulator patch because it looked like it didn't
> > have any dependencies.  The latter part was my mistake as now I see that
> > it did have deps.
> 
> I've now dropped those patches.

Thanks Mark, I appreciate that.

-- 
Lee Jones [李琼斯]

