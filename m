Return-Path: <linux-next+bounces-6768-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69375AB64CD
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 09:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B0743A4D1A
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 07:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBAC1EB19E;
	Wed, 14 May 2025 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McF38jzi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1F1E503C;
	Wed, 14 May 2025 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208931; cv=none; b=C++XYaxEeJHV65JUc1e6CpeJR2jRoxL9RTLZaoLFZ2X88DlP929tS1YSTkZWz3Og7Yen9edSVi+/wKakkJtpUP3FXqHNAZ7mUXQJrJgHqtIMgutrUAy7+SiIGoOPLwSNj7+3e+sIvQd8LVCRuUJLaT7GojXFy/hrFNT2Xq80WVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208931; c=relaxed/simple;
	bh=kx/o7c++YZe5/Fu+F/D2gMG8MyY9k68n5y75A7ZQrew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOsFEtrcA3rq11wF22Vo9Ne+tn+Qn4s2+HpEYwgAxnIlhvgMJIewvcqCzO4huTeE8BkK7V0uVRvLAmqQW8TogAlAs8Or5wu048yPDEYHR8BwA2anq1b0QMUz3qEe6RzegTH2kzrkjUOzCasSTVsA6rpX7GoprgeVYCz+RJm5qsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McF38jzi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AAEC4CEE9;
	Wed, 14 May 2025 07:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747208931;
	bh=kx/o7c++YZe5/Fu+F/D2gMG8MyY9k68n5y75A7ZQrew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McF38jziSXRG9GsJB4IIHne7GoCpjkr2MbXajZyGBbT9ujioLoM2Z/7VstGgJMHyr
	 lSQXCu1vBifTF2orsdDvPhzYc9wrSZyl76398vR4Mh/u14QduRQpsj2QuO8pSJ6AF4
	 3XwF4JJ/qNWVMnqyL9c6Ceh4yx2VxcQObg/fH2/ZQzkjnROZXm/HEOvjT1TfGQ2yxr
	 ym/P6rNygvggT1EUVtFWIZmdYgFu4VcZdkIzOWUJkpVeRJZosWLI7niwcpDxcldRvU
	 Pjndg68XvpSBFqNvTO1x7R+/bLqJpE+9KlQWBn9oYQcKs3XvOU/v2A+8AWYFxxH4J5
	 l572FY3brjR7A==
Date: Wed, 14 May 2025 08:48:47 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the gpio-brgl tree
Message-ID: <20250514074847.GX2936510@google.com>
References: <20250514173428.46a24083@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514173428.46a24083@canb.auug.org.au>

On Wed, 14 May 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commits are also in the mfd tree as different commits
> (but the same patches):
> 
>   81fec13be953 ("dt-bindings: mfd: Add max77759 binding")
>   ee71546b8120 ("dt-bindings: nvmem: Add max77759 binding")
>   190b565788ed ("dt-bindings: gpio: Add max77759 binding")
> 
> These are commits
> 
>   f63a2ff5372e ("dt-bindings: mfd: add max77759 binding")
>   3f29432ca3d3 ("dt-bindings: nvmem: add max77759 binding")
>   8ba821d3c314 ("dt-bindings: gpio: add max77759 binding")
> 
> in the mfd tree.

This is probably my fault.  It should now be fixed.

Let's check again tomorrow.

-- 
Lee Jones [李琼斯]

