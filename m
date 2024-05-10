Return-Path: <linux-next+bounces-2263-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F48C2013
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 10:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7401F21C45
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 08:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7D9152790;
	Fri, 10 May 2024 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFgdHYl7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA67E14BFA8;
	Fri, 10 May 2024 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715331184; cv=none; b=mh0MdRh92cSqK22uJop1tHQl25VzRt8NZ34l7tLNc3yPZinBLgeQDhVwxtEvxJeEv7Z9G/JZmXJ1kBGzgZXERhZaCsthLS4ffd5E9mcGAHajzo38lcntLdXgjar1TocFb8VoXZrOeipawCU6ADdJwUX2cQXkNKaRmsyqx86tI4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715331184; c=relaxed/simple;
	bh=+PNcsO6Ni934axDjqBAqTDt2AqZrfHIbxM13+Oij6BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3TLDvsU6MNGlMJcWvwggHvPHJ8VcwbWH4svzs2PECd4ruxH61nV5Qm2bXUnKgGoSMTUu0he36eDWbFQMiQ2spVswUrBm17J0dKZx4Ju9LQ4f+hYlIcskoOCsXIHmSiSpClFxqwGmvUhbE+oISORzBNN8i6OmvAv2e2dCoVHlYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFgdHYl7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6CBC113CC;
	Fri, 10 May 2024 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715331182;
	bh=+PNcsO6Ni934axDjqBAqTDt2AqZrfHIbxM13+Oij6BY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFgdHYl7KEOpY7DPaM6X16IPQz6/nTT/Dw1iyBYMmhOSQJLK7yIWLc9SZ9K/Z7xXZ
	 jk6Yld/YoNsnsDZXj8CYZATYJVoNMWQtc04W8a9gLOuYy+z5D7ojtWuYzksUbZqLdp
	 Mtki5g9qDJzFTqzYrgiUhJqEVtwI9QIjGzAsHqSTgqz9FfRQy9D03+jDETvbzgwhP4
	 x/GIVdN9oFawIfL90CsMlCMnXIbxeSxneFrwm3Lvn3Z1RcL+LpRNE5bNhOfTZ6OC0h
	 4l1gI9D6iQsFnB9sGandivVCPtfQhzV8GR9QbRPKIAKXR/Bn5jNaESAYWO9jrV5cfR
	 SnHxs6Ni72vvA==
Date: Fri, 10 May 2024 10:52:58 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240510-gasversorger-mathematik-6ff9f077a014@brauner>
References: <20240509081957.0668da75@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509081957.0668da75@canb.auug.org.au>

On Thu, May 09, 2024 at 08:19:57AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   21965b764cec ("afs: Fix fileserver rotation getting stuck")
> 
> is missing a Signed-off-by from its author.
> 
> Everything below the first "---" was dropped ...

Fixed now. The reason was that the patch was sent with the mail on top
instead of below the commit message with meant that the commit message
got cut off instead of the mail content.

