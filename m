Return-Path: <linux-next+bounces-6411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B904A9EB80
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 11:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1379F1895D4A
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B666C25DD1C;
	Mon, 28 Apr 2025 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oY+VVALh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEDC623;
	Mon, 28 Apr 2025 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831391; cv=none; b=mphsys6V72iqODYE+U1xY3/do4mRRNQi+a1Vm6gX0MBcY3/Y5LCPxtvxLg4Wl0jqM9RwkVts461nBq0ovz+fjRzXnoh9ejwH5Vbi1d0/6lxL8dYtgwXwduznVQtPST/8ckgnzKlTdqRPLdNSvDrzrS63tzqxbR5E2iZUYZQkSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831391; c=relaxed/simple;
	bh=rY+UFh2mz9StRqBuhvYZkB1m2wM/4EduU8ucCaIo+mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeCe877B+7lIWrxBMPfznPdk//iTmnoEHPtuMzdt5wOI9m9aO6BefjBaKSF/DRGbOkB67S7mvo4f38SWEuOouQ7QbUFRT9ejuGt5AKr84CevC+1PvWGFkwEtOsHc0TCgRTiitHFT6gUE3bH71OJciZlO8hBsoHVfzlTA7pD7lY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oY+VVALh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097B2C4CEE4;
	Mon, 28 Apr 2025 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745831391;
	bh=rY+UFh2mz9StRqBuhvYZkB1m2wM/4EduU8ucCaIo+mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oY+VVALhFod+AQ+no6rO6ikw6g5zDhGyRf07asd8wnHfvSNxE8XrGSzvw5kasWWY/
	 M1BEoJn3FcsxI4EPh9+7qvgBBwRyBKIqKmVoTWHq/EPsfV6pFQVA9wxcd4O7pqj1e/
	 MQspdB/0keW3RtFflUKKG/0J21KD5VlrSLyWb+Njlst5X876ofWM5iktW5CE5zpeWc
	 Sd8L6JH/NZ3BrYcbUtKhg2Ql7RgGJYKpzXvyxSVoe4bYiLnNFqPEG7JLBuUene72Io
	 PwV6m6iDAVDDgj0oovuEFB/qEljn32oMLH8Rvwxy1PCpXClY5MOboE1yWoXy0OXmwo
	 RLRrLWkIXPPsQ==
Date: Mon, 28 Apr 2025 11:09:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Asahi Lina <lina+kernel@asahilina.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-nova tree
Message-ID: <aA9F2_yyIGqLFWKU@cassiopeiae>
References: <20250428142436.4579b115@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428142436.4579b115@canb.auug.org.au>

Hi Stephen,

On Mon, Apr 28, 2025 at 02:24:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-nova tree, today's linux-next build (KCONFIG_NAME)
> failed like this:
> 
> x86_64-linux-gnu-ld: vmlinux.o: in function `rust_helper_drm_gem_object_put':
> (.text+0x1b6cd15): undefined reference to `drm_gem_object_free'
> 
> Caused by commit
> 
>   be8d1a24798f ("rust: drm: gem: Add GEM object abstraction")
> 
> I have used the drm-nova tree from next-20250414 for today.

This issue was caused by rust/helpers/drm.c not having the required CONFIG_DRM
guards.

This is now fixed in nova-next; sorry for the inconvenience.

- Danilo

