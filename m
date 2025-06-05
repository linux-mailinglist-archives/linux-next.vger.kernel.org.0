Return-Path: <linux-next+bounces-7082-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C40ACF962
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 00:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72827178CFE
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 22:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD1F27B4F8;
	Thu,  5 Jun 2025 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQyL4/rZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D402798FF;
	Thu,  5 Jun 2025 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160821; cv=none; b=DvNOybEGb8pvPDYsidnvLZ/z3kktWrC5DkmRh0XOD9UgHf6rTUY5K/k2NT3vuG+2+dDy0uUZdm46VeuqUZGpW8a2kYocxAUdOJvCA8unZgu3qbM6qqlO2rltb+Qh2hAQ3qbQZuJ1IODG6OioGvb/wiRjHVArCNobEOjbs08MQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160821; c=relaxed/simple;
	bh=fSv5LxJHz+pAz1a6urKJjp0z40L5qoyfwoJaFcV/MPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fW1+9l6m95REksRXWAQlI05n9t4+dqP9jReYJdUTVd7lsC4KMUbLr3YkmhLn1YU94bY1xWS7wFhZIR1YPDCXVirnbQ+lAV8DXWGlQKXskDNUK5cpiTRcm7rn1PRdyCANe3kUIlxl+pgy4xC+Mx8IMq0WkCYsR4Fizsl/9B1/yOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQyL4/rZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E84C4CEE7;
	Thu,  5 Jun 2025 22:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749160821;
	bh=fSv5LxJHz+pAz1a6urKJjp0z40L5qoyfwoJaFcV/MPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQyL4/rZb4sT8FwKFBE9R1kW+Iz2+p7oi0DLQNGWfTGU91tA+eXCL7XxnOLUYZdgu
	 tsq4JNlurDVtamAhAVZWznngcuCPI68alO23qAZsBHesWKJe0vDT4p+tcE3yiHM57z
	 wuVxx6hMdd/yotddiOsiwR0NqwUfsBFbnjmc93qut3MohLMMJyxigi4kJ/kkqvysXs
	 W69MqRCihSRyQqiFYtuQ3uGFVGpMAzgd34gQ2jVGnbXnTg8GhlHybqLV/ucx9VIdmr
	 InK5KwkqITMKzh5tkJGxXuAtlf8OuPLsAYRTwFturWc9ljDFPXKuuq+mDuQp52ahRA
	 viw5OrE+lAmMg==
Date: Thu, 5 Jun 2025 16:00:18 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <aEITcpq6tEAHegEN@kbusch-mbp>
References: <20250606075230.6a13c53d@canb.auug.org.au>
 <ddea36e4-4e89-459d-aa60-3d3c05a9b688@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddea36e4-4e89-459d-aa60-3d3c05a9b688@kernel.dk>

On Thu, Jun 05, 2025 at 03:55:35PM -0600, Jens Axboe wrote:
> On 6/5/25 3:52 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   10f4a7cd724e ("nvme: fix command limits status code")
> > 
> > is missing a Signed-off-by from its author.
> 
> Sigh... That came from Christoph's pull today. Keith, can you just
> verbally sign off in here for that patch, at least then there's some
> sort of trail publicly available.

Sure thing:

Signed-off-by: Keith Busch <kbusch@kernel.org>

Again for the record, it was in the original posting:

  https://lore.kernel.org/linux-nvme/20250520202037.2751433-1-kbusch@meta.com/

