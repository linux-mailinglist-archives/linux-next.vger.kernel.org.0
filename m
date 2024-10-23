Return-Path: <linux-next+bounces-4385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283989ABDEB
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 07:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 573B81C222CA
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 05:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D0113D8B0;
	Wed, 23 Oct 2024 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slJIByWC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB920323;
	Wed, 23 Oct 2024 05:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661791; cv=none; b=BSi9pSq9EYZyYFwf4ZNA5VwPz7VUkOg/pq2FtKfBtLtFJtIC+SdQixFbzRlkTp/ppUNLVfLDCUU5EHjjk9nlUIUdZP00jGDVKWKgWpgJTOc/k3suYxT3Eo8OaWcOj59XLI78EWHXmB3CkfMX8RAmYCvWxhCqqjo9waozn8mTCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661791; c=relaxed/simple;
	bh=1iZwpMUcg4IM/XBZxnspxbkbtoVw1OUF9gHEtwXZJmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2GC8ZQ7UaQFCVx9wh92/6GvUX8NgciNRZvnOGW9kp6kccfjOAq8/OpdECwCC9fb5bez5YO7W510rywRL4SvGDJGVncU4yOUpLOeBzmCipA6oYqYD1hsXBJ+GY4N0n8bZAdgYPyC6VXdLoyvH0b6IoLrrOVfsjKHohr8082WR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slJIByWC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C7BC4CEC6;
	Wed, 23 Oct 2024 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729661790;
	bh=1iZwpMUcg4IM/XBZxnspxbkbtoVw1OUF9gHEtwXZJmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slJIByWC4EjqjzVEvkUJEGfoj/r/QqScijDF41vkFcKRhk5nu+tLcvWjEbtB/Bk6A
	 3fMT7Qr7lk1cJ/m3nQ+30xE8+E1fQx8DtgVqTkiy5QXQ9IBdaClO6hsTIWEF2EADTx
	 5+VGheeu8WCArm+FWiThpEoXpMfZDPG4y08m6nvVA0K8757huMEufq0vqgd8fBjVb6
	 BGERxqEB7tFfcRzNXQXQX0VlS7Rc4YBRYTfE0aLlXUNnAbmMlNW0CCtlv1XivZ9FhR
	 BBfM57pnHOQvkTNhcSc9zrUgn6VFu8zwHqNgbUYYV8M3lxXNelmrgy798Fm3gQE2xO
	 YKU3C2qCX7vhQ==
Date: Wed, 23 Oct 2024 11:06:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the dmaengine tree
Message-ID: <ZxiLWoL/kkds7PWd@vaman>
References: <20241023150813.416aafd7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023150813.416aafd7@canb.auug.org.au>


Hi Stephen,

On 23-10-24, 15:08, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the devicetree tree as a different commit
> (but the same patch):
> 
>   72c65390c61f ("dt-bindings: Fix array property constraints")
> 
> This is commit
> 
>   a6fa1f9e32f5 ("dt-bindings: Fix array property constraints")
> 
> in the devicetree tree.

Okay let this go thru dt tree, I have dropped it now
Thanks for letting me know

-- 
~Vinod

